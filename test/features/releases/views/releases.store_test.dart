import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nikel_app/features/releases/models/release.model.dart';
import 'package:nikel_app/features/releases/views/releases.store.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final mockDio = MockDio();

  setUpAll(() {
    GetIt.I.registerSingleton<Dio>(mockDio);
  });

  tearDown(() => reset(mockDio));

  tearDownAll(() {
    GetIt.I.unregister<Dio>();
  });

  group('ReleasesStore', () {
    group('loadWalletBalance', () {
      test('Deve popularo o estado do walletBalance corretamente', () async {
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

        final store = ReleasesStore();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        await store.loadWalletBalance();

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 20.99);
      });

      test('Deve popularo o estado de erro ao buscar o valor da carteira',
          () async {
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

        final store = ReleasesStore();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        await store.loadWalletBalance();

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        expect(store.errorBalance, 'ANY_ERROR');
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);
      });
    });

    group('getAllReleases', () {
      test('Deve popular o estado do allReleases corretamente', () async {
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

        final store = ReleasesStore();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        await store.getAllReleases();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.isLoadingReleases, isFalse);
        expect(store.errorReleases, isNull);
        expect(
          store.releases,
          [
            Release(
              id: 2,
              value: 15.99,
              description: 'Compra no mercado 2',
              date: DateTime(2024, 12, 25),
              isInflow: false,
            ),
            Release(
              id: 1,
              value: 10.99,
              description: 'Compra no mercado',
              date: DateTime(2024, 12, 24),
              isInflow: true,
            ),
          ],
        );
        expect(
          store.inFlowReleases,
          [
            Release(
              id: 1,
              value: 10.99,
              description: 'Compra no mercado',
              date: DateTime(2024, 12, 24),
              isInflow: true,
            ),
          ],
        );
        expect(
          store.outFlowReleases,
          [
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

      test('Deve popularo o estado de erro ao buscar a lista de releases',
          () async {
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

        final store = ReleasesStore();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.errorReleases, isNull);
        expect(store.isLoadingReleases, isFalse);
        expect(store.releases, isEmpty);

        await store.getAllReleases();

        expect(store.errorBalance, isNull);
        expect(store.isLoadingBalance, isFalse);
        expect(store.walletBalance, 0);

        expect(store.releases, isEmpty);
        expect(store.outFlowReleases, isEmpty);
        expect(store.inFlowReleases, isEmpty);
        expect(store.errorReleases, 'ANY_ERROR');
      });
    });
  });
}
