import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_currency/models/user_model.dart';
import 'package:crypto_currency/screens/home_screen.dart';
import 'package:crypto_currency/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore database = FirebaseFirestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  UserModel user = UserModel(name: '', email: "", userId: "",image: "");
  bool obscure_text = true;



  void Login(String email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(HomeScreen());
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Login error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange
      );
    }
  }

  void SignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAll(LoginScreen());
  }

  void Register(String email, password, name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((user) async {
        Saveuser(user, name);
      });
      Get.offAll(HomeScreen());
    }catch(e){
      Get.snackbar("Signout error", e.toString(),
        snackPosition:SnackPosition.BOTTOM,
        backgroundColor:Colors.orange
      );


    }
  }

  void SignIn()async {
  final GoogleSignInAccount? googleuser=await _googleSignIn.signIn();
  print(googleuser);

  GoogleSignInAuthentication googleSignInAuthentication=
      await googleuser!.authentication;
  final AuthCredential credential=GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,
accessToken:googleSignInAuthentication.accessToken);

  await _auth.signInWithCredential(credential).then((value){
    Saveuser(value,"");
    Get.offAll(HomeScreen());
  });
  }

  Saveuser(UserCredential user, String name)async{
    UserModel usermodel=UserModel(name: name==""?user.user!.displayName! :name
    ,email:"",image: "",userId: user.user!.uid);
    await _firestore.collection("users").doc(user.user!.uid).set(usermodel.toJson());
  }
  getuser()async{
    await database.collection('users').doc(_auth.currentUser!.uid).get().then((value) {
      user = UserModel.fromJson(value.data()!);
      notifyListeners();
    });
  }

  void password(){
    obscure_text=!obscure_text;
    notifyListeners();
  }


}