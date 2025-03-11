import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemple_firebase/auth/servei_auth.dart';
import 'package:exemple_firebase/chat/servei_chat.dart';
import 'package:exemple_firebase/components/bombolla_missatge.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaginaChat extends StatefulWidget {
  final String idReceptor;

  const PaginaChat({
    super.key,
    required this.idReceptor,
  });

  @override
  State<PaginaChat> createState() => _PaginaChatState();
}

class _PaginaChatState extends State<PaginaChat> {
  final TextEditingController tecMensaje = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Sala chat"),
      ),
      body: Column(
        children: [
          //zona mensajes
          _crearZonaMostrarMensajes(),

          //zona enviar mensaje
          _crearZonaEnviarMensaje(),
        ],
      ),
    );
  }

  Widget _crearZonaMostrarMensajes() {
    return Expanded(
        child: StreamBuilder(
            stream: ServeiChat().getMissatges(
                ServeiAuth().getUsuariActual()!.uid, widget.idReceptor),
            builder: (context, snapshot) {

              // Cas que hi hagi error.
              if (snapshot.hasError) {
                return const Text("Error carregant missatges");
              }
                // Cas carregant dades.
                if(snapshot.connectionState == ConnectionState.waiting){
                return const Text("Carregant missatges");
                }
                //Retornar dades.
                return ListView(
                  children: snapshot.data!.docs.map((document) => _construirItemMissatge(document)).toList(),
                );
              
            }));
  }

  Widget _construirItemMissatge(DocumentSnapshot documentSnapshot) {

    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return BombollaMissatge(missatge: data["mensaje"]);
  }


  Widget _crearZonaEnviarMensaje() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: tecMensaje,
            decoration: InputDecoration(
              hintText: "Escribe un mensaje...",
              filled: true,
              fillColor: Colors.yellow,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: enviarMensaje,
          icon: Icon(Icons.send),
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green)),
        )
      ]),
    );
  }

  void enviarMensaje() {
    if (tecMensaje.text.isNotEmpty) {
      ServeiChat().enviarMensaje(
        widget.idReceptor,
        tecMensaje.text,
      );

      tecMensaje.clear();
    }
  }
}
