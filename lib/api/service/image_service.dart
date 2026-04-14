import 'package:dio/dio.dart';
import 'package:riverpod_demo/api/model/image_model.dart';
import 'package:riverpod_demo/core/error/app_exception.dart';

class ImageService {
  const ImageService(this._dio);
  final Dio _dio;

  Future<List<ImageModel>> fetchImages(String category, int page) async{
    try{
      final response = await _dio.get(
          'search',
          queryParameters: {
            'query' : category,
            'per_page' : 15,
            'page' : page
          }
      );

      final List<dynamic> data = response.data['photos'];
      return data.map((e) => ImageModel.fromJson(e as Map<String, dynamic>)).toList();

    } on DioException catch(e){
      throw AppException(e.message!);
    }
  }
}