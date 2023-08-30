import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sample_getx/controller/notes_controller.dart';
import 'package:sample_getx/controller/theme_controller.dart';
import 'package:sample_getx/services/remote_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ThemeController themeController = Get.put(ThemeController());
  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    noteController.fetchNotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                themeController.isDarkMode == false
                    ? themeController.changeTheme(true)
                    : themeController.changeTheme(false);
              },
              icon: Icon(themeController.isDarkMode == true
                  ? Icons.light_mode
                  : Icons.dark_mode),
            );
          })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return noteController.fetchNotes();
        },
        child: Obx(() {
          return ListView.separated(
            itemBuilder: (context, index) {
              final notes = noteController.noteList[index];
              return Card(
                child: ListTile(
                  title: Text("${notes.title}"),
                  subtitle: Text("${notes.desc}"),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: noteController.noteList.length,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(BottomSheet(
            onClosing: () {},
            builder: (context) {
              return SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: noteController.titleController.value,
                        decoration:
                            const InputDecoration(hintText: "Enter Title"),
                      ),
                      TextFormField(
                        controller: noteController.subTitleController.value,
                        decoration:
                            const InputDecoration(hintText: "Enter Subtitle"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            await noteController.postNotes();
                            noteController.fetchNotes();
                            Get.back();
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              );
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
