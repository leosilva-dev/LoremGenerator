//import 'package:poc_dart/poc_dart.dart' as poc_dart;
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  print("Quantos parágrafos você deseja?");
  String qtdParag = stdin.readLineSync();

  print("1 - short | 2 - long");
  String lenght = stdin.readLineSync();
  if(lenght == '1'){
    lenght = 'short';
  }else if(lenght == '2'){
    lenght = 'long';
  }else{
    print("You typed wrong, man!");
    lenght = '1';
  }

  fetch(qtdParag, lenght);
}

// ignore: always_declare_return_types
fetch(String qtdParag, String lenght) async{
   var dados = await getDados(qtdParag, lenght);
  print("############# LOREM #############");
  print(dados);
}


Future getDados(String qtdParag, String lenght) async{
  String url = 'http://loripsum.net/api/'+qtdParag+'/'+lenght;
  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    var dados = response.body;
    return dados;
  }

  return 'falhou!';
}