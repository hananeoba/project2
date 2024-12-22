import 'package:flutter/material.dart';
import 'package:project2/core/res/colors.dart';
import 'package:project2/core/res/fonts.dart';
import 'package:project2/core/services/injection.dart';
import 'package:project2/core/services/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      theme: ThemeData(
        fontFamily: Fonts.poppins,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colours.primaryColor,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
