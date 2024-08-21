import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/error/custom_exception.dart';
import '../models/release.model.dart';
import '../services/releases.service.dart';

part 'releases.store.g.dart';

class ReleasesStore = ReleasesStoreBase with _$ReleasesStore;

abstract class ReleasesStoreBase with Store {
  final _service = ReleasesService(GetIt.I.get());
  @observable
  bool isLoadingBalance = false;

  @observable
  bool isLoadingReleases = false;

  String? errorBalance;
  String? errorReleases;
  String? errorRemoveRelease;

  @observable
  double walletBalance = 0;

  @observable
  ObservableList<Release> releases = <Release>[].asObservable();

  @computed
  List<Release> get inFlowReleases =>
      releases.where((release) => release.isInflow).toList();

  @computed
  List<Release> get outFlowReleases =>
      releases.where((release) => !release.isInflow).toList();

  @action
  void sortReleases() => releases.sort((a, b) => b.date.compareTo(a.date));

  @action
  Future<void> loadWalletBalance() async {
    try {
      errorBalance = null;
      isLoadingBalance = true;
      await Future.delayed(
        const Duration(seconds: 5),
      );

      final result = await _service.getWalletBalance();
      walletBalance = result;
    } on CustomException catch (e) {
      errorBalance = e.message;
    } finally {
      isLoadingBalance = false;
    }
  }

  @action
  Future<void> getAllReleases() async {
    try {
      errorReleases = null;
      isLoadingReleases = true;
      final result = await _service.getAllRelease();
      releases = result.asObservable();
      sortReleases();
    } on CustomException catch (e) {
      errorReleases = e.message;
    } finally {
      isLoadingReleases = false;
    }
  }

  @action
  void addNewRelease(Release release) {
    final tempList = List.of(releases.toList());
    tempList.add(release);
    releases = tempList.asObservable();
    sortReleases();
    loadWalletBalance();
  }

  @action
  Future<void> removeRelease(int id) async {
    try {
      errorRemoveRelease = null;
      await _service.removeRelease(id);
      final tempList = List.of(releases.toList());
      tempList.removeWhere((release) => release.id == id);
      releases = tempList.asObservable();
      loadWalletBalance();
    } on CustomException catch (e) {
      errorRemoveRelease = e.message;
    }
  }
}
