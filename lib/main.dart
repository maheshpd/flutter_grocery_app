import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/const/theme_data.dart';
import 'package:flutter_grocery_app/provider/dark_theme_provider.dart';
import 'package:flutter_grocery_app/screen/bottom_bar.dart';
import 'package:flutter_grocery_app/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themChangeProvider.setDarkTheme = await themChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_){
        return themChangeProvider;
      })

      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themChangeProvider.getDarkTheme, context),
            home: const BottomBarScreen(),
          );
        }
      ),
    );
  }
}

