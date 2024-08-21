import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nikel_app/features/releases/dtos/add_release.dto.dart';
import 'package:nikel_app/features/releases/models/release.model.dart';
import 'package:nikel_app/features/releases/services/releases.service.dart';
import 'package:nikel_app/shared/error/custom_exception.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final mockDio = MockDio();
  final sut = ReleasesService(mockDio);

  tearDown(() => reset(mockDio));

  group('ReleasesService -', () {
    group('getWalletBalance -', () {
      test('Deve buscar a lista de lançamentos na API e retornar o mesmo',
          () async {
        when(
          () => mockDio.get(
            '/releases/wallet-balance',
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: 20.99,
            ),
          ),
        );

        final result = await sut.getWalletBalance();
        expect(result, 20.99);
      });

      test('Deve retornar um CustomException quando a requisição falhar',
          () async {
        //dado

        when(
          () => mockDio.get(
            '/releases/wallet-balance',
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              data: {
                'error': 'ANY_ERROR',
              },
            ),
          ),
        );

        //quando
        final future = sut.getWalletBalance();
        //entao

        expect(
          future,
          throwsA(
            isA<CustomException>().having(
              (error) => error.message,
              'mensagem de erro',
              'ANY_ERROR',
            ),
          ),
        );
      });
    });

    group('getAllReleases -', () {
      test('Deve buscar o valor consolidado na API e retornar o mesmo',
          () async {
        when(
          () => mockDio.get(
            '/releases',
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [
                {
                  'id': 1,
                  'value': 10.99,
                  'description': 'Compra no mercado',
                  'date': '2024-12-24',
                  'isInflow': true,
                },
                {
                  'id': 2,
                  'value': 15.99,
                  'description': 'Compra no mercado 2',
                  'date': '2024-12-25',
                  'isInflow': false,
                }
              ],
            ),
          ),
        );

        final result = await sut.getAllRelease();
        expect(
          result,
          [
            Release(
              id: 1,
              value: 10.99,
              description: 'Compra no mercado',
              date: DateTime(2024, 12, 24),
              isInflow: true,
            ),
            Release(
              id: 2,
              value: 15.99,
              description: 'Compra no mercado 2',
              date: DateTime(2024, 12, 25),
              isInflow: false,
            )
          ],
        );
      });

      test('Deve retornar uma lista vazia e não dar erro', () async {
        when(
          () => mockDio.get(
            '/releases',
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: [],
            ),
          ),
        );

        final result = await sut.getAllRelease();
        expect(result, []);
      });

      test('Deve retornar um CustomException quando a requisição falhar',
          () async {
        //dado

        when(
          () => mockDio.get(
            '/releases',
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              data: {
                'error': 'ANY_ERROR',
              },
            ),
          ),
        );

        //quando
        final future = sut.getAllRelease();
        //entao

        expect(
          future,
          throwsA(
            isA<CustomException>().having(
              (error) => error.message,
              'mensagem de erro',
              'ANY_ERROR',
            ),
          ),
        );
      });
    });

    group('addNewRelease -', () {
      final dto = AddReleaseDto(
        value: 10,
        description: 'any',
        date: DateTime(2024, 10, 10),
        isInflow: true,
      );
      test('Deve criar o lançamento na API e retornar o mesmo', () async {
        when(
          () => mockDio.post(
            '/releases',
            options: any(named: 'options'),
            data: dto.toMap(),
          ),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'id': 1,
                'value': 10.0,
                'description': 'any',
                'date': '2024-10-10',
                'isInflow': true,
              },
            ),
          ),
        );

        final result = await sut.addNewRelease(dto);
        expect(
          result,
          Release(
            id: 1,
            value: 10,
            description: 'any',
            date: DateTime(2024, 10, 10),
            isInflow: true,
          ),
        );
      });

      test('Deve retornar um CustomException quando a requisição falhar',
          () async {
        //dado

        when(
          () => mockDio.post(
            '/releases',
            options: any(named: 'options'),
            data: dto.toMap(),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              data: {
                'error': 'ANY_ERROR',
              },
            ),
          ),
        );

        //quando
        final future = sut.addNewRelease(dto);
        //entao

        expect(
          future,
          throwsA(
            isA<CustomException>().having(
              (error) => error.message,
              'mensagem de erro',
              'ANY_ERROR',
            ),
          ),
        );
      });
    });

    group('removeRelease -', () {
      test('Deve remover o lançamento na API', () async {
        when(
          () => mockDio.delete(
            '/releases/1',
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
            ),
          ),
        );

        final result = sut.removeRelease(1);
        expect(
          result,
          isA<void>(),
        );
      });

      test('Deve retornar um CustomException quando a requisição falhar',
          () async {
        //dado

        when(
          () => mockDio.delete(
            '/releases/1',
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              data: {
                'error': 'ANY_ERROR',
              },
            ),
          ),
        );

        //quando
        final future = sut.removeRelease(1);
        //entao

        expect(
          future,
          throwsA(
            isA<CustomException>().having(
              (error) => error.message,
              'mensagem de erro',
              'ANY_ERROR',
            ),
          ),
        );
      });
    });
  });
}
