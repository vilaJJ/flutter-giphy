import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juan_giphy/src/shared/navigation/navigation_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JuanGiphy",
      locale: const Locale("pt", "BR"),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      initialRoute: NavigationRoutes.home,
      routes: NavigationRoutes.routes,
    );
  }
}
