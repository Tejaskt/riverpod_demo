import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/api/model/image_model.dart';
import 'package:riverpod_demo/api/service/image_service.dart';
import 'package:riverpod_demo/provider/dio_provider.dart';

part 'image_provider.g.dart';

@riverpod
Future<List<ImageModel>> fetchImage(Ref ref, String category, int page){
  final dio = ref.watch(dioProvider);
  final apiService = ImageService(dio).fetchImages(category, page);
  return apiService;
}
