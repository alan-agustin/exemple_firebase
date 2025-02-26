import 'package:exemple_firebase/auth/servei_auth.dart';
import 'package:exemple_firebase/chat/servei_chat.dart';
import 'package:exemple_firebase/components/item_usuari.dart';
import 'package:flutter/material.dart';

class PaginaInici extends StatefulWidget {
  const PaginaInici({super.key});

  @override
  State<PaginaInici> createState() => _PaginaIniciState();
}

class _PaginaIniciState extends State<PaginaInici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Pagina incici"),
        actions: [
          IconButton(
            onPressed: () {
              ServeiAuth().ferLogout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: ServeiChat().getUsuaris(),
        builder: (context, snapshot){

          // Cas que hi hagi un error.

          if(snapshot.hasError) {
           return const Text("Error en el snapshot");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Carregant dades");
          }

          // Es retornen les dades.
          return ListView(
            children: snapshot.data!.map<Widget>(
              (dadesUsuari) => _construeixItemUsuari(dadesUsuari)
            ).toList(),
          );
        },
      ),
    );
  }

  Widget _construeixItemUsuari(Map<String, dynamic> dadesUsuari){

    return ItemUsuari(emailUsuari: dadesUsuari["email"]);
  }
}
