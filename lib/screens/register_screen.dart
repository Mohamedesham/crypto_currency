import 'package:crypto_currency/auth/auth_provider.dart';
import 'package:crypto_currency/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final _fromkey=GlobalKey<FormState>();

  var _name=TextEditingController();
  var _password=TextEditingController();
  var _email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(key: _fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Sign Up",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                TextFormField(
                  controller:_name ,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please enter your name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("name"),
                    hintText:"name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),

                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller:_email ,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value!.isEmpty || !value.contains("@")){
                      return "Please enter your email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("email"),
                      hintText:"email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),

                ),
                SizedBox(height:20 ,),
                TextFormField(
                  controller:_password ,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if(value!.isEmpty ||value.length<3 ){
                      return "Please enter your password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("password"),
                      hintText:"password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                Container(
                 child:ElevatedButton(
                   onPressed: () {
                     if(_fromkey.currentState!.validate()){
                       Provider.of<AuthProvider>(context,listen: false).Register(_email.text, _password.text, _name.text);
                     }
                   },
                   child: Text("Sign Up",style: TextStyle(fontSize: 20),),
                 ) ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: () {
                      Get.to(LoginScreen());
                    }, child: Text("Login"))
                  ],
                ),
              ],

            )
        )
      ),
    );
  }
}
