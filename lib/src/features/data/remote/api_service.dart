import 'dart:io';
import 'package:dio/dio.dart';
import 'package:udevs_task/src/core/resourses/data_state.dart';
import 'package:udevs_task/src/features/data/remote/dio_exceptions.dart';
import 'package:udevs_task/src/features/data/remote/end_points.dart';
import 'package:udevs_task/src/features/data/remote/interceptors/logger.dart';

class ApiService {
  late final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: EndPoints.baseUrl,
            connectTimeout:
                const Duration(seconds: EndPoints.connectionTimeout),
            sendTimeout: const Duration(seconds: EndPoints.recieveTimeOut),
          ),
        )..interceptors.add(LoggerInterceptor());

  Future<DataSate> getLocationName({
    required double lat,
    required double lon,
  }) async {
    try {
      Response response = await _dio.get('reverse', queryParameters: {
        'format': 'jsonv2',
        'lat': lat,
        'lon': lon,
      });
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: response.data);
      } else {
        return DataFailure(
          dioException: DioCustomException.fromDioError(
            DioException(
              requestOptions: RequestOptions(data: response.data),
            ),
          ),
        );
      }
    } on DioException catch (error) {
      return DataFailure(dioException: DioCustomException.fromDioError(error));
    }
  }
}
