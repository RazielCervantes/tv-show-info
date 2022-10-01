import 'package:flutter/material.dart';
import 'package:new_interview/screens/home_screen.dart';
import 'package:new_interview/services/show_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(Appstate());

class Appstate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShowProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (context) => const HomeScreen()},
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Colors.red, centerTitle: true)),
    );
  }
}
