import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme.store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.system;

  @action
  void changeTheme(ThemeMode theme) {
    // atualizado
    themeMode = theme; // atualizado
  }
}
