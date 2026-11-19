import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MainFull());
}

class MainFull extends StatefulWidget{

  @override
  State<MainFull> createState() => _MainApp();

}
class _MainApp extends State<MainFull>{
TextEditingController _controller = TextEditingController();
String _resultado = "";

void _buscar() async{

  String url = "https://viacep.com.br/ws/"+ _controller.text+"/json/";
  http.Response resposta= await http.get(Uri.parse(url));
  Map<String, dynamic>dados = jsonDecode(resposta.body);

  setState((){
  _resultado = dados ['logradouro']+ '\n'+dados['bairro']+ '\n'+dados['localidade']+ '\n'+dados['UF'];
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.cyan, title: Text("Consulta CEP")),
        body: Column( children: [Text('informe o cep'),
        TextField(),
        ElevatedButton(child: Text('buscar'), onPressed: _buscar,),
        Text('Local: $_resultado')]
        ),
      ),
    );
  }
}

 
 
