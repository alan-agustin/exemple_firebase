import 'package:exemple_firebase/auth/servei_auth.dart';
import 'package:exemple_firebase/components/boto.dart';
import 'package:exemple_firebase/components/textofiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaginaRegistre extends StatelessWidget {

  final Function()? ferClic;
  const PaginaRegistre({super.key, required this.ferClic});

  void hacerRegistro(BuildContext context, String email, String password, String confPassword) async {

    if(email.isEmpty) {
      //Gestio del cas
      return;
    }


    if(password.isEmpty) {
      //Gestio del cas
      return;
    }

    if(password != confPassword){
      //Gestio del cas
      return;
    }

 
    String? error = await ServeiAuth().registreAmbEmailIPassword(email, password);

    if (error != null) {

      showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text("Error"),
        content: Text(error),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassw = TextEditingController();
    final TextEditingController tectConfPassw = TextEditingController();
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                //Logo.
                const Icon(Icons.fireplace,
                size: 120,
                color: Colors.grey,),
            
                const SizedBox(height: 25,),
                //Frase.
                const Text("Crea un compte nou",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
          
               const SizedBox(height: 25,),
                //Text divisori.
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 5, color: Colors.black,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text("Registre",
                      style: TextStyle(
                        color: Colors.blue
                      ),),
                    ),
                    Expanded(child: Divider(thickness: 5, color: Colors.black,)),
                  ],
                ),
              ),
                // Textfield email.
                Textofiel(controller: tecEmail, hint: "Correu", obscureText: false),
                // Textfield password.
                Textofiel(controller: tecPassw, hint: "Contrasenya", obscureText: true),
                // Textfield confirmar password.
                Textofiel(controller:tectConfPassw 
                , hint: "Confirmar contrasenya", obscureText: true),
                // No estas registrat.
                 Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Ja ets membre?"),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap:ferClic ,
                        child: Text("Inicia sessió"))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // Botó registrat.
                Boto(
                  text: "Registrarse", 
                  onTap: () => hacerRegistro(context, tecEmail.text, tectConfPassw.text, tecPassw.text)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}