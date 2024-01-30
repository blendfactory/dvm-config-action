// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectConfig _$ProjectConfigFromJson(Map<String, dynamic> json) =>
    ProjectConfig(
      version: _fromJson(json['dartSdkVersion'] as String),
    );

Map<String, dynamic> _$ProjectConfigToJson(ProjectConfig instance) =>
    <String, dynamic>{
      'dartSdkVersion': _toJson(instance.version),
    };
