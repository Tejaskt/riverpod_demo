import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/api/api_client.dart';

final dioProvider = Provider<Dio>((ref) {
  final client = ApiClient().dio;
  ref.onDispose(() => client.close());
  return client;
});