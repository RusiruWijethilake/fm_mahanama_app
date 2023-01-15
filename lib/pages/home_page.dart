import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fm_mahanama_app/main.dart';
import 'package:fm_mahanama_app/pages/dialogs/settings_dialog.dart';
import 'package:fm_mahanama_app/pages/news_feed_page.dart';
import 'package:fm_mahanama_app/theme/color_schemes.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedBottomIndex = 0;

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FM Mahanama'),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
            systemNavigationBarIconBrightness: Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('App Settings'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('About App'),
                  value: 1,
                ),
              ],
              icon: const Icon(Icons.short_text),
              onSelected: (value) {
                if (value == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => SettingsDialog(),
                    barrierDismissible: true,
                  );
                }
              },
            ),
          ],
        ),
        body: <Widget>[
          // NewsFeedPage(), // This feature is under development for now
          Container(
            alignment: Alignment.center,
            child: const Text('Under Construction'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Under Construction'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Under Construction'),
          ),
        ][_selectedBottomIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedBottomIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedBottomIndex = index;
            });
          },
          destinations: const [
            /* NavigationDestination(
              icon: Icon(Icons.newspaper_outlined),
              label: "Newsfeed",
              selectedIcon: Icon(Icons.newspaper),
            ), */
            NavigationDestination(
              icon: Icon(Icons.radio_outlined),
              label: "Radio",
              selectedIcon: Icon(Icons.radio),
            ),
            NavigationDestination(
              icon: Icon(Icons.live_tv_outlined),
              label: "TV",
              selectedIcon: Icon(Icons.live_tv),
            ),
            NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: "Global Chat",
              selectedIcon: Icon(Icons.message),
            ),
          ],
          animationDuration: const Duration(milliseconds: 500),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          surfaceTintColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black54,
        extendBody: true,
        extendBodyBehindAppBar: true,
      ),
    );
  }
}