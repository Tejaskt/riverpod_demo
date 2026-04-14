import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/api/api_client.dart';

part 'dio_provider.g.dart';

// @riverpod
// final dioProvider = Provider<Dio>((ref) {
//   final client = ApiClient().dio;
//   ref.onDispose(() => client.close());
//   return client;
// });

@riverpod
Dio dio(Ref ref){
  final client = ApiClient().dio;
  ref.onDispose(() => client.close());
  return client;
}