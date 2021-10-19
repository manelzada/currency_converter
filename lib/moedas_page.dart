import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  String dropdownValue = 'BRL';
  String dropdownValue2 = 'USD';
  double convertido = 0.0;
  String code = '';
  String bid = '';

  bool isLoading = false;
  double resultado = 0.0;
  String teste = '';
  @override
  initState() {
    fetchMoedas();
    super.initState();
  }

  fetchMoedas() async {
    setState(() => {isLoading = true});

    try {
      var url = Uri.parse(
          "https://economia.awesomeapi.com.br/last/$dropdownValue2-$dropdownValue");
      var response = await http.get(url);
      var decodeResponse = jsonDecode(response.body);

      setState(() => {
            code = decodeResponse['$dropdownValue2$dropdownValue']['code'],
            bid = decodeResponse['$dropdownValue2$dropdownValue']['bid']
          });
    } catch (e) {
      throw Exception("Erro ao carregar dados a API");
    } finally {
      setState(() => {isLoading = false});
    }
  }

  void calcula(numero, numeroAPI) {
    resultado = numero *= numeroAPI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Converter Moeda')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Text(
                bid,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.attach_money_rounded),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      fetchMoedas();
                    });
                  },
                  items: <String>['BRL', 'USD', 'EUR', 'CAD']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Icons.attach_money_rounded),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                      fetchMoedas();
                    });
                  },
                  items: <String>['BRL', 'USD', 'EUR', 'CAD']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
                left: 40,
                right: 40,
              ),
              child: TextFormField(
                autofocus: true,
                onChanged: (newvalue) {
                  if (newvalue == '') newvalue = '0';
                  setState(() {
                    //double teste = double.parse(url);
                    var numeroAPI = double.parse(bid);
                    double valor = double.parse(newvalue);
                    calcula(valor, numeroAPI);
                    //converte(valor);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: dropdownValue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 60,
                left: 40,
                right: 40,
              ),
              child: Text(
                resultado.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
