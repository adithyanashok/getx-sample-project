import 'package:freezed_annotation/freezed_annotation.dart';
part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class NoteModel with _$NoteModel {
  factory NoteModel({
    String? title,
    String? desc,
    String? img,
    String? createdAt,
    String? updatedAt,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
