import 'dart:convert';
import 'dart:io';

import 'package:extract/src/app_exeption.dart';
import 'package:extract/src/project_config.dart';
import 'package:file/local.dart';
import 'package:recase/recase.dart';

Future<int> runApp(List<String> arguments) async {
  final projectConfigFilePath = arguments.firstOrNull;
  if (projectConfigFilePath == null) {
    stderr.writeln('Usage: extract <path>');
    return 1;
  }

  try {
    await _extract(projectConfigFilePath);
    stdout.writeln(r'Successfully extracted project config to $GITHUB_OUTPUT');
    return 0;
  } on AppException catch (e) {
    stderr.writeln(e.message);
    return 1;
  }
}

Future<void> _extract(String projectConfigFilePath) async {
  final fileSystem = LocalFileSystem();
  final projectConfigFile = fileSystem.file(projectConfigFilePath);
  if (!projectConfigFile.existsSync()) {
    throw AppException(
      'Project config file not found at $projectConfigFilePath',
    );
  }

  final projectConfigContent = projectConfigFile.readAsStringSync();

  final Map<String, dynamic> json;
  try {
    json = jsonDecode(projectConfigContent) as Map<String, dynamic>;
  } on FormatException catch (e) {
    throw AppException(
      'Invalid project config file at $projectConfigFilePath: $e',
    );
  }

  final ProjectConfig projectConfig;
  try {
    projectConfig = ProjectConfig.fromJson(json);
  } on FormatException catch (e) {
    throw AppException(
      'Invalid project config file at $projectConfigFilePath: $e',
    );
  }

  final githubOutput = Platform.environment['GITHUB_OUTPUT'];
  if (githubOutput == null) {
    throw AppException(r'Environment variable $GITHUB_OUTPUT is not set');
  }

  final githubOutputFile = fileSystem.file(githubOutput);
  if (!githubOutputFile.existsSync()) {
    // ignore: do_not_use_environment
    const isDebug = bool.fromEnvironment('DEBUG');
    if (isDebug) {
      await githubOutputFile.create(recursive: true);
    } else {
      throw AppException(r'Environment variable $GITHUB_OUTPUT is not a file');
    }
  }

  final projectConfigJson = projectConfig.toJson();
  final ioSink = githubOutputFile.openWrite(mode: FileMode.append);
  try {
    for (final entry in projectConfigJson.entries) {
      final key = entry.key.paramCase;
      final value = entry.value;
      ioSink.writeln('$key=$value');
    }
  } finally {
    await ioSink.close();
  }
}
