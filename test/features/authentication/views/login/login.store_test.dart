import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nikel_app/shared/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDio extends Mock implements Dio {}

class Dio {}

void main() {
  final mockDio = MockDio();

  setUpAll(() {
    GetIt.I.registerSingleton<Dio>(mockDio);
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() {
    Constants.userToken = '';
    SharedPreferences.setMockInitialValues({});
  });

  tearDownAll(() {
    GetIt.I.unregister<Dio>();
  });

  group('LoginStore -', () {
    // test('Deve requisitar a API, fazer o login e salvar o token', () async {
    //   when(
    //     () => mockDio.post(
    //       '/login',
    //       data: {'email': 'any_email', 'password': 'any_pass'},
    //     ),
    //   ).thenAnswer(
    //     (_) => Future.value(
    //       Response(
    //           requestOptions: RequestOptions(),
    //           statusCode: 200,
    //           data: 'any_token'),
    //     ),
    //   );
    // });
  });
}
