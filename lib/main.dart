import 'package:flutter/material.dart';
import 'package:groceryapp/const/them_data.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/dark_them_provider.dart';
import 'presentation/screen/HomePage/home_page.dart';
import 'presentation/screen/bottombar/bottom_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }




  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            //theme: Styles.themeData(true, context),
            debugShowCheckedModeBanner: false,

            home: BottomBarScreen(),
          );
        }
      ),
    );
  }
}

