import 'package:flutter/material.dart';

class ErrorModal {
  static void show({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.warning_amber, color: Colors.red),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Tentar novamente"),
              ),
            ),
          ],
        );
      },
    );
  }
}
