// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'releases.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReleasesStore on ReleasesStoreBase, Store {
  Computed<List<Release>>? _$inFlowReleasesComputed;

  @override
  List<Release> get inFlowReleases => (_$inFlowReleasesComputed ??=
          Computed<List<Release>>(() => super.inFlowReleases,
              name: 'ReleasesStoreBase.inFlowReleases'))
      .value;
  Computed<List<Release>>? _$outFlowReleasesComputed;

  @override
  List<Release> get outFlowReleases => (_$outFlowReleasesComputed ??=
          Computed<List<Release>>(() => super.outFlowReleases,
              name: 'ReleasesStoreBase.outFlowReleases'))
      .value;

  late final _$isLoadingBalanceAtom =
      Atom(name: 'ReleasesStoreBase.isLoadingBalance', context: context);

  @override
  bool get isLoadingBalance {
    _$isLoadingBalanceAtom.reportRead();
    return super.isLoadingBalance;
  }

  @override
  set isLoadingBalance(bool value) {
    _$isLoadingBalanceAtom.reportWrite(value, super.isLoadingBalance, () {
      super.isLoadingBalance = value;
    });
  }

  late final _$isLoadingReleasesAtom =
      Atom(name: 'ReleasesStoreBase.isLoadingReleases', context: context);

  @override
  bool get isLoadingReleases {
    _$isLoadingReleasesAtom.reportRead();
    return super.isLoadingReleases;
  }

  @override
  set isLoadingReleases(bool value) {
    _$isLoadingReleasesAtom.reportWrite(value, super.isLoadingReleases, () {
      super.isLoadingReleases = value;
    });
  }

  late final _$walletBalanceAtom =
      Atom(name: 'ReleasesStoreBase.walletBalance', context: context);

  @override
  double get walletBalance {
    _$walletBalanceAtom.reportRead();
    return super.walletBalance;
  }

  @override
  set walletBalance(double value) {
    _$walletBalanceAtom.reportWrite(value, super.walletBalance, () {
      super.walletBalance = value;
    });
  }

  late final _$releasesAtom =
      Atom(name: 'ReleasesStoreBase.releases', context: context);

  @override
  ObservableList<Release> get releases {
    _$releasesAtom.reportRead();
    return super.releases;
  }

  @override
  set releases(ObservableList<Release> value) {
    _$releasesAtom.reportWrite(value, super.releases, () {
      super.releases = value;
    });
  }

  late final _$loadWalletBalanceAsyncAction =
      AsyncAction('ReleasesStoreBase.loadWalletBalance', context: context);

  @override
  Future<void> loadWalletBalance() {
    return _$loadWalletBalanceAsyncAction.run(() => super.loadWalletBalance());
  }

  late final _$getAllReleasesAsyncAction =
      AsyncAction('ReleasesStoreBase.getAllReleases', context: context);

  @override
  Future<void> getAllReleases() {
    return _$getAllReleasesAsyncAction.run(() => super.getAllReleases());
  }

  late final _$removeReleaseAsyncAction =
      AsyncAction('ReleasesStoreBase.removeRelease', context: context);

  @override
  Future<void> removeRelease(int id) {
    return _$removeReleaseAsyncAction.run(() => super.removeRelease(id));
  }

  late final _$ReleasesStoreBaseActionController =
      ActionController(name: 'ReleasesStoreBase', context: context);

  @override
  void sortReleases() {
    final _$actionInfo = _$ReleasesStoreBaseActionController.startAction(
        name: 'ReleasesStoreBase.sortReleases');
    try {
      return super.sortReleases();
    } finally {
      _$ReleasesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewRelease(Release release) {
    final _$actionInfo = _$ReleasesStoreBaseActionController.startAction(
        name: 'ReleasesStoreBase.addNewRelease');
    try {
      return super.addNewRelease(release);
    } finally {
      _$ReleasesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingBalance: ${isLoadingBalance},
isLoadingReleases: ${isLoadingReleases},
walletBalance: ${walletBalance},
releases: ${releases},
inFlowReleases: ${inFlowReleases},
outFlowReleases: ${outFlowReleases}
    ''';
  }
}
