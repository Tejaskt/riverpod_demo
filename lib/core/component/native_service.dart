import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeService {

  static const plateform = MethodChannel('com.example.riverpod/native_code');
  
  static Future<void> callKotlinMethod(BuildContext context) async{
    try{
      final String result = await plateform.invokeMethod('getKotlinMessage');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
      print(result);
    } on PlatformException catch(e){
      print('failed to call native: ${e.message}');
    }
  }
}