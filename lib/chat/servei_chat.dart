import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ServeiChat {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsuaris(){

    return _firestore.collection("usuaris").snapshots().map((event){

      return event.docs.map((document){

        return document.data();
      }).toList();
    });
  }
}