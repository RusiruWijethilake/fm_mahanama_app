import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fm_mahanama_app/main.dart';

class SettingsDialog extends StatefulWidget {
  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {

  final List<bool> _selectedTheme = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text('App Settings'),
      icon: const Icon(Icons.settings),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ToggleButtons(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.brightness_4),
                    const SizedBox(width: 8),
                    const Text('Auto'),
                    const SizedBox(width: 8),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.light_mode_rounded),
                    const SizedBox(width: 8),
                    const Text('Light'),
                    const SizedBox(width: 8),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.dark_mode_rounded),
                    const SizedBox(width: 8),
                    const Text('Dark'),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
              isSelected: [
                Theme.of(context) == ThemeMode.system,
                Theme.of(context) == ThemeMode.light,
                Theme.of(context) == ThemeMode.dark,
              ],
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < _selectedTheme.length; i++) {
                    _selectedTheme[i] = i == index;
                  }
                });
                if (index == 0) {
                  MyApp.of(context).changeTheme(ThemeMode.system);
                } else if (index == 1) {
                  MyApp.of(context).changeTheme(ThemeMode.light);
                } else if (index == 2) {
                  MyApp.of(context).changeTheme(ThemeMode.dark);
                }
              },
              borderRadius: BorderRadius.circular(15),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
            ),
          ),

        ],
      )
    );
  }
}