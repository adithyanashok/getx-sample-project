import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sample_getx/model/note.dart';
import 'package:dio/dio.dart';

class RemoteService {
  static var client = http.Client();

  Future<List<NoteModel>> fetchNotes() async {
    log('called');
    try {
      final response = await Dio().get('http://10.0.2.2:5000/api/post');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data as List).map((e) {
          return NoteModel.fromJson(e);
        }).toList();

        return result;
      }
      return [];
    } catch (e) {
      Get.snackbar("Exception", e.toString());
      log(e.toString());
      return [];
    }
  }

  Future<void> postNotes(String title, String subtitle) async {
    try {
      final response = await Dio().post(
        'http://10.0.2.2:5000/api/post',
        data: {
          'title': title,
          'desc': subtitle,
          'img': 'img'
        }, // 'img' key was missing
      );
      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('Response: ${response.data}');
      } else {
        print('Failed to send data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
