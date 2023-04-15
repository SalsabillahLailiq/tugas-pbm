import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tugaspbm1/theme.dart';
import 'package:tugaspbm1/widgets/button.dart';


class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // menerima data dari named route
    final args = ModalRoute.of(context)!.settings.arguments as Map?;

    final username= TextEditingController();
    final password = TextEditingController();
    if (args != null){
      print(args['username']);
      print(args['password']);
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                Color.fromARGB(255, 130, 35, 111),
                Color.fromARGB(255, 255, 255, 255),
              ],
                ),
                ),
          padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                children: [
                  SizedBox(height: 80,),
                  Center(
                    child: 
                    Text('Hello,\nWelcome to BMI Check',
                    style: heading2.copyWith(color: Colors.white),),
                  ),
                    SizedBox(height: 50,),
                    Container(
                        decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),      
                      ),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: heading6,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),      
                      ),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          
                          hintText: 'Password',
                          hintStyle: heading6,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25,),
              CustomPrimaryButton(
                onTap:()  {
                   if (args != null){
                      if (username.text.trim().isEmpty || password.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data perlu diisi"),),);
                      } else {
                        if (username.text == args['username'] && password.text == args['password']){
                          Navigator.pushNamed(context, '/homepage', arguments: {
                            "username": args['username'],
                            "password": args['password']
                          });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password atau email salah"),),);
                      }}
              };
                  // Route route = MaterialPageRoute(builder: (context) => RegisterPage());
                  
                },
                child: Text('Login'),
                buttonColor: Color.fromARGB(255, 117, 33, 112),
                textValue: 'Login',
                textColor: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: regular16pt.copyWith(color: textBlack)
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Register',
                          style: regular16pt.copyWith(color: primaryBlue)
                        ),
                      ],
                    ),
                  )
                ],
              )
                ],
              ),
              
            
          ),
        ),
          
        );

    // TODO: implement build
  }
}