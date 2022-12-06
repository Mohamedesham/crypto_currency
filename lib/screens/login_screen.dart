import 'package:crypto_currency/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/them_provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _fromkey=GlobalKey<FormState>();

  var _email=TextEditingController();
  var _password =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:const EdgeInsets.all(8.0),
      child: Form(
        key:_fromkey ,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign in ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              Text("Welcome back",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value!.isEmpty || !value.contains("@")){
                    return "please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'enter email',
                  label:Text('Email'),
                  prefixIcon:Icon(Icons.email),
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value!.isEmpty||value.length<3){
                    return "please enter your password";
                  }
                  return null;
                },
                decoration:InputDecoration(
                  hintText: "Enter your Password",
                  label: Text("Password"),
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10)
                  ),
                  prefixIcon:Icon(Icons.lock),
                  suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: () {
                    Provider.of<AuthProvider>(context,listen: false).password();
                  },),


                ),
                //obscureText:Provider.of<HomeProvider>(context). ,
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if(_fromkey.currentState!.validate()){
                      Provider.of<AuthProvider>(context,listen: false).Login(_email.text, _password.text);
                    }
                  },
                  child: Text("Login",style: TextStyle(fontSize: 20),),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("if you don`t have an Account? "),
                  TextButton(onPressed: (){
                    Get.to(RegisterScreen());
                  }, child: Text("Sign Up"))
                ],
              ),
              SizedBox(height: 40,),
              GestureDetector(
                  onTap: (){
                    Provider.of<AuthProvider>(context,listen: false).SignIn();

                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Image.asset('assets/google.png',height: 20,)),
                        SizedBox(width: 10,),
                        Text('Sign in with Google'),
                      ],
                    ),
                  )
              )


            ],

          ),
        ) ,

      ),
      ),
    );
  }
}
