import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/error/custom_exception.dart';
import '../../../dtos/add_release.dto.dart';
import '../../../models/release.model.dart';
import '../../../services/releases.service.dart';

part 'add_release.store.g.dart';

class AddReleaseStore = AddReleaseStoreBase with _$AddReleaseStore;

abstract class AddReleaseStoreBase with Store {
  final _service = ReleasesService(GetIt.I.get());

  @observable
  bool isLoading = false;

  String? error;

  @observable
  bool isInflow = true;

  @action
  void setisInflow(bool isInflow) => this.isInflow = isInflow;

  @action
  Future<Release?> addRelease({
    required String description,
    required DateTime date,
    required double value,
  }) async {
    try {
      error = null;
      isLoading = true;

      final dto = AddReleaseDto(
        value: value,
        description: description,
        date: date,
        isInflow: isInflow,
      );

      await Future.delayed(
        const Duration(seconds: 5),
      );

      final result = await _service.addNewRelease(dto);
      return result;
    } on CustomException catch (e) {
      error = e.message;
      return null;
    } finally {
      isLoading = false;
    }
  }
}
