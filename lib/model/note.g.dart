// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteModel _$$_NoteModelFromJson(Map<String, dynamic> json) => _$_NoteModel(
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      img: json['img'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_NoteModelToJson(_$_NoteModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'img': instance.img,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
