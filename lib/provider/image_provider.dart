import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/api/service/image_service.dart';
import 'package:riverpod_demo/provider/dio_provider.dart';

final imageProvider = FutureProvider.family((ref, String category) async{
  final dio = ref.read(dioProvider);
  final apiService = await ImageService(dio).fetchImages(category);
  return apiService;
});