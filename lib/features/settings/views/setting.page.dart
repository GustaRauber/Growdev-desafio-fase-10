import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/utils/constants.dart';
import '../../../shared/views/stores/theme.store.dart';
import '../../authentication/views/login/login.page.dart';
import 'widgets/optional_settings.widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final themeStore = GetIt.I.get<ThemeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Aparência'),
                  SizedBox(
                    width: 150,
                    child: Observer(builder: (context) {
                      return DropdownButton(
                        value: themeStore.themeMode,
                        underline: const SizedBox(),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem<ThemeMode>(
                            value: ThemeMode.dark,
                            child: Text('Dark'),
                          ),
                          DropdownMenuItem<ThemeMode>(
                            value: ThemeMode.light,
                            child: Text('Light'),
                          ),
                          DropdownMenuItem<ThemeMode>(
                            value: ThemeMode.system,
                            child: Text('System'),
                          ),
                        ],
                        onChanged: (value) => themeStore.changeTheme(value!),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          OptionalSetings(
            onPressed: () async {
              Constants.userToken = '';
              final sharedPref = await SharedPreferences.getInstance();
              if (!mounted) return;
              sharedPref.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Sair'),
                Icon(Icons.logout),
              ],
            ),
          )
        ],
      ),
    );
  }
}
