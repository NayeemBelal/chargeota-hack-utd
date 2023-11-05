import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';

void downloadModelFromDrive() async {
  var url =
      'https://drive.google.com/uc?export=download&id=1XO3yBVM3rvZHR1s8tJjveS0hLyIJy5Qh';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var modelFile = File('local_path_to_save_model_file');
    await modelFile.writeAsBytes(response.bodyBytes);

    var interpreter = await Interpreter.fromBuffer(response.bodyBytes);
    interpreter.allocateTensors();

    // Now you can perform inference with the interpreter
  } else {
    print('Failed to download the model. Status code: ${response.statusCode}');
  }
}
