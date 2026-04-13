import 'package:dio/dio.dart';
import '../core/utils/constants.dart';
import 'api_end_point.dart';

class ApiClient {
  ApiClient._init() {
    _setupDio();
  }

  static final ApiClient _instance = ApiClient._init();

  // Factory always returns the cached instance — calling `ApiClient()`
  // anywhere in the app is safe and returns the same object.
  factory ApiClient() => _instance;

  late final Dio dio;

  void _setupDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    // Order matters:
    //  1. Auth  — attach token BEFORE the request goes out.
    //  2. Log   — log the final, decorated request (with auth headers).
    dio.interceptors
      ..add(_authInterceptor())
      ..add(_errorInterceptor())
      ..add(_logInterceptor());
  }


  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
          options.headers['Authorization'] = Constants.apiKey;
        handler.next(options);
      },
    );
  }

  Interceptor _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException error, handler) {
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            response: error.response,
            type: error.type,
            message: _mapErrorMessage(error),
          ),
        );
      },
    );
  }

  Interceptor _logInterceptor() {
    return LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    );
  }

  String _mapErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Check your internet.';
      case DioExceptionType.receiveTimeout:
        return 'Server not responding. Try again.';
      case DioExceptionType.sendTimeout:
        return 'Upload timed out. Try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.badResponse:
        return switch (error.response?.statusCode) {
          400 => 'Bad request.',
          401 => 'Unauthorised. Please log in again.',
          403 => 'Access forbidden.',
          404 => 'Resource not found.',
          429 => 'Too many requests. Try later.',
          500 => 'Internal server error.',
          502 => 'Bad gateway.',
          503 => 'Service unavailable.',
          _   => 'Something went wrong.',
        };
      default:
        return 'Unexpected error. Please try again.';
    }
  }
}