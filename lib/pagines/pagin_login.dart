import 'package:exemple_firebase/auth/servei_auth.dart';
import 'package:exemple_firebase/components/boto.dart';
import 'package:exemple_firebase/components/textofiel.dart';
import 'package:flutter/material.dart';

class PaginLogin extends StatelessWidget {

  final Function()? ferClic;
  const PaginLogin({super.key, required this.ferClic});

  void ferLogin(BuildContext context, String email, String password) async {

    String? error = await ServeiAuth().loginAmbEmailIPassword(email, password);

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
    } else {
      print("Login fet.");
    }
  }

  @override
  Widget build(BuildContext context) {

    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassw = TextEditingController();

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
                const Text("Benvingut de nou",
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
                      child: Text("Login",
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
                // No estas registrat.
                 Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Encara no ets membre?"),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: ferClic,
                        child: Text("Registra 't"))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                // Botó registrat.
                Boto(
                  text: "Fes login", 
                  onTap: () => ferLogin(context, tecEmail.text, tecPassw.text)),
              ],
            ),
          ),
        ),
      ),
    );;
  }
  
  
}