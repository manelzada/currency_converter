import 'package:conversor/homepage.dart';
import 'package:conversor/slide.dart';
import 'package:flutter/material.dart';

import 'detalhes.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      //home: LoginPage(),
      initialRoute: '/slide',
      routes: {
        '/slide': (context) => SlideAnimation(),
        '/home': (context) => HomePage(),
        '/detalhes': (context) => DetalhesPage()
      },
    );
  }
}
