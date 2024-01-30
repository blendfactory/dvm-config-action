import 'dart:io';

import 'package:extract/app.dart' as app;

Future<void> main(List<String> arguments) async {
  final exitCode = await app.runApp(arguments);
  return Future.wait([
    stdout.close(),
    stderr.close(),
  ]).then((_) => exitCode);
}
