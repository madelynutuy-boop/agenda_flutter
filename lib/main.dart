import 'package:flutter/material.dart';
import 'package:flutter_agenda/database_helper.dart';
import 'package:flutter_agenda/pantallas/agenda_pantalla.dart';
import 'package:flutter_agenda/pantallas/lista_citas_pantalla.dart';


void main()  async{
WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListaCitasPantalla()
    );
  }
}

