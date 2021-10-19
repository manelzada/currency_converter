import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  const DetalhesPage({Key? key}) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes'),
          centerTitle: true,
        ),
      ),
    );
  }
}
