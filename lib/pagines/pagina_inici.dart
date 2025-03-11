import 'package:exemple_firebase/auth/servei_auth.dart';
import 'package:exemple_firebase/chat/servei_chat.dart';
import 'package:exemple_firebase/components/item_usuari.dart';
import 'package:exemple_firebase/pagines/pagina_chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          ServeiAuth().getUsuariActual()!.email!,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ServeiAuth().ferLogout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder(
        stream: ServeiChat().getUsarios(),
        builder: (context, snapshot) {
          //si hay un error
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error en la snapshot"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Cargando datos...");
          }

          //Devuelvo los datos
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                  (dadesUsari) => _construirItemUsario(dadesUsari, context),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Widget _construirItemUsario(Map<String, dynamic> dadesUsari, BuildContext context) {
    if (dadesUsari["email"] == ServeiAuth().getUsuariActual()!.email) {
      return Container();
    }
    return ItemUsari(
      emailUsario: dadesUsari["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaginaChat(idReceptor: dadesUsari["uid"],),
          ),
        );
      },
    );
  }
}