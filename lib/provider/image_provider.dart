import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/api/service/image_service.dart';
import 'package:riverpod_demo/provider/dio_provider.dart';

final imageProvider = FutureProvider((ref) async{
  final dio = ref.read(dioProvider);
  final apiService = await ImageService(dio).fetchImages();
  return apiService;
});