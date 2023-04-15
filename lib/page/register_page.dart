import 'package:flutter/material.dart';
import 'package:tugaspbm1/theme.dart';
import 'package:tugaspbm1/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {

  final username = TextEditingController();
  final password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
     var loginkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
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
          padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  child: Text(
                    'Register BMI',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  ),
                ],
              ),
              SizedBox(height: 80,),
              Form(
                key: loginkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: 'username',
                          hintStyle: heading6,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                            }
                            return null;
                            },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                            }
                            return null;
                            },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: heading6,
                          border: OutlineInputBorder(borderSide: BorderSide.none)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                            }
                            return null;
                            },
                      ),
                    )
                  ],
                )
              ),
             
              SizedBox(height: 32,),
              CustomPrimaryButton(
                buttonColor: Color.fromARGB(255, 124, 0, 110),
                textValue: 'Register',
                textColor: Colors.white, 
                onTap: () { 
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                    arguments: {
                      "username": username.text,
                      "password": password.text,  
                    },);
                 },
                 child: Text('Back'),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: regular16pt.copyWith(color: textBlack),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: regular16pt.copyWith(color: primaryBlue),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}