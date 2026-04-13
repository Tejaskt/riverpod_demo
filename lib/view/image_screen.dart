import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/api/model/image_model.dart';
import 'package:riverpod_demo/api/service/image_service.dart';
import 'package:riverpod_demo/provider/dio_provider.dart';

class ImageScreen extends ConsumerStatefulWidget {
  const ImageScreen({super.key});

  @override
  ConsumerState createState() => _ImageScreenState();
}

class _ImageScreenState extends ConsumerState<ImageScreen> {

  Future<List<ImageModel>> get fetchImages => ImageService(ref.watch(dioProvider)).fetchImages();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Text(''),
                  ),
                );
              },
            )
          ],
        )
      ),
    );
  }
}
