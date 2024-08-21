import 'package:dio/dio.dart';

import '../../../shared/error/custom_exception.dart';
import '../../../shared/utils/constants.dart';
import '../dtos/add_release.dto.dart';
import '../models/release.model.dart';

class ReleasesService {
  final Dio _dio;

  ReleasesService(this._dio);

  Future<double> getWalletBalance() async {
    try {
      final response = await _dio.get(
        '/releases/wallet-balance',
        options: Constants.dioOptions,
      );

      return double.parse(response.data.toString());
    } on DioException catch (e) {
      throw CustomException(e.response!.data['error']);
    }
  }

  Future<List<Release>> getAllRelease() async {
    try {
      final response = await _dio.get(
        '/releases',
        options: Constants.dioOptions,
      );

      return (response.data as List)
          .map<Release>((release) => Release.fromMap(release))
          .toList();
    } on DioException catch (e) {
      throw CustomException(e.response!.data['error']);
    }
  }

  Future<Release> addNewRelease(AddReleaseDto dto) async {
    try {
      final response = await _dio.post(
        '/releases',
        data: dto.toMap(),
        options: Constants.dioOptions,
      );

      return Release.fromMap(response.data);
    } on DioException catch (e) {
      throw CustomException(e.response!.data['error']);
    }
  }

  Future<void> removeRelease(int id) async {
    try {
      await _dio.delete(
        '/releases/$id',
        options: Constants.dioOptions,
      );
    } on DioException catch (e) {
      throw CustomException(e.response!.data['error']);
    }
  }
}
