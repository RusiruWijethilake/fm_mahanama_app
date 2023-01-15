import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fm_mahanama_app/utils/firebase_options.dart';
import 'package:fm_mahanama_app/pages/home_page.dart';
import 'package:fm_mahanama_app/theme/color_schemes.g.dart';
import 'package:fm_mahanama_app/utils/shared_prefs_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Set UI orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  /*
  * Set UI overlay style
  * Set status bar color to transparent
  * Set navigation bar color to transparent
  * Set navigation bar divider color to transparent
  * Do not change any of these values
  */
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // Creates a static instance of the app to accessed from anywhere
  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // variable to check the state of the internet connection
  bool _networkAvailable = false;

  @override
  void initState() {
    super.initState();

    // Initialize network state listener
    initNetworkState();

    // Get the theme mode from shared preferences
    SharedPrefManager().getThemeMode().then((value) {
      setState(() {
        _themeMode = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FM Mahanama',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      // here the animations for app is initialized
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 520,
        minWidth: 440,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(620, name: TABLET),
          const ResponsiveBreakpoint.resize(880, name: DESKTOP),
        ],
        background: Container(
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }

  // Method to change app theme from anywhere
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
    SharedPrefManager().setThemeMode(themeMode);
  }

  // Network state listener
  void initNetworkState() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        setState(() {
          _networkAvailable = false;
        });
      } else {
        setState(() {
          _networkAvailable = true;
        });
      }
    });
  }
}
