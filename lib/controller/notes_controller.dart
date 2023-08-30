import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_getx/model/note.dart';
import 'package:sample_getx/services/remote_services.dart';

class NoteController extends GetxController {
  var noteList = <NoteModel>[].obs;
  final titleController = TextEditingController().obs;
  final subTitleController = TextEditingController().obs;

  Future<void> fetchNotes() async {
    noteList.value = await RemoteService().fetchNotes();
    // log(noteList.toString());
  }

  Future<void> postNotes() async {
    RemoteService()
        .postNotes(titleController.value.text, subTitleController.value.text);
    // log(noteList.toString());
  }
}
