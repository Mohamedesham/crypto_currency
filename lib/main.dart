


import 'package:crypto_currency/auth/auth_provider.dart';
import 'package:crypto_currency/provider/contol_provider.dart';
import 'package:crypto_currency/provider/home_provider.dart';
import 'package:crypto_currency/provider/photo_provider.dart';
import 'package:crypto_currency/provider/search_provider.dart';
import 'package:crypto_currency/provider/them.dart';
import 'package:crypto_currency/screens/check_login.dart';
import 'package:crypto_currency/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'provider/detail_provider.dart';
import 'provider/them_provider.dart';
import 'screens/login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
HomeProvider().getAllCoin();
runApp(MultiProvider(providers: [
ChangeNotifierProvider(create: (context) => HomeProvider(),),
ChangeNotifierProvider(create: (context) => AuthProvider(),),
ChangeNotifierProvider(create: (context) => DetailProvider(),),
ChangeNotifierProvider(create: (context) => ThemeProvider(),),
  ChangeNotifierProvider(create: (context) => SearchProvider(),),
  ChangeNotifierProvider(create: (context) => PhotoProvider(),),
  ChangeNotifierProvider(create: (context) => ControlProvider(),),
],child: MyApp(),
)
);
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context,listen: false).getThemeModeFromSharedPref();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        home:CheckLogin()
    );
  }
}


