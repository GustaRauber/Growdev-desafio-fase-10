// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_release.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddReleaseStore on AddReleaseStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AddReleaseStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isInflowAtom =
      Atom(name: 'AddReleaseStoreBase.isInflow', context: context);

  @override
  bool get isInflow {
    _$isInflowAtom.reportRead();
    return super.isInflow;
  }

  @override
  set isInflow(bool value) {
    _$isInflowAtom.reportWrite(value, super.isInflow, () {
      super.isInflow = value;
    });
  }

  late final _$addReleaseAsyncAction =
      AsyncAction('AddReleaseStoreBase.addRelease', context: context);

  @override
  Future<Release?> addRelease(
      {required String description,
      required DateTime date,
      required double value}) {
    return _$addReleaseAsyncAction.run(() =>
        super.addRelease(description: description, date: date, value: value));
  }

  late final _$AddReleaseStoreBaseActionController =
      ActionController(name: 'AddReleaseStoreBase', context: context);

  @override
  void setisInflow(bool isInflow) {
    final _$actionInfo = _$AddReleaseStoreBaseActionController.startAction(
        name: 'AddReleaseStoreBase.setisInflow');
    try {
      return super.setisInflow(isInflow);
    } finally {
      _$AddReleaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isInflow: ${isInflow}
    ''';
  }
}
