import 'package:exemple_firebase/pagines/pagina_registre.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PaginaRegistre(),
      ),
    );
  }
}



/* 
1)Tenir el Node.js instalat.
    -En acabar, es pot comprobar fent:
        node -v
        npm -v

2)Pagina de firebase; go to console
    -cuenta de google.

3)Crear un  nuevo proyecto
    -Nombre del proyecto.

4)Ir al menu compilacion y habilitar
    Autenticacion por correo electronico y firestore database

5) En terminal de VScode:
      npm install -g firebase-tools en visual o cmd (instalar firebase tools)
      poner firebase login y usar el mismo correo de google de antes.

6)En terminal de visual
    -Flutter pub global activate flutterfire_cli
    -dart pub global activate flutterfire_cli
      -flutterfire configure.
*/