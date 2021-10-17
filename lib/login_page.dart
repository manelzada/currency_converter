import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '';
    String senha = '';
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            TextFormField(
              onChanged: (text) {
                email = text;
              },
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (text) {
                senha = text;
              },
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child:
                  TextButton(onPressed: () {}, child: Text('Recuperar Senha')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('Entrar'),
                onPressed: () {
                  if (email == 'emmanoel' && senha == '123') {
                    print("funcionando");
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    print("falha");
                  }
                })
          ],
        ),
      ),
    );
  }
}
