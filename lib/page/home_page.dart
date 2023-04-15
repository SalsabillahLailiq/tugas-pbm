import 'package:flutter/material.dart';
import 'package:tugaspbm1/widgets/button.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _bmiCategory = '';
  int tinggi = 0;
  int berat = 0;
  
void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      _bmiResult = bmi;
      if (_bmiResult < 18.5) {
        _bmiCategory = 'kurus';
      } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
        _bmiCategory = 'Normal';
      } else if (_bmiResult >= 25 && _bmiResult < 30) {
        _bmiCategory = 'Gemuk';
      } else {
        _bmiCategory = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final username = (args != null ) ? args['username'] : "";

    return
        Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
            body: 
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                          // "Welcome, $username :)",
                           "Welcome, $username",
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 55, 55, 55),
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child:
                    Image.asset('images/bmi.jpg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  
                  Container(
                       margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                     // color: Colors.blue[700],
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:12,
                              ),
                              decoration: InputDecoration(
                                  suffix: Text('cm'),

                                  filled: true,
                                  hintText: 'Tinggi'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              decoration: InputDecoration(
                                  suffix: Text('kg'),
                                  filled: true,
                                  hintText: 'Berat'),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10,),
                      CustomPrimaryButton(
                        child: Text('Hitung BMI'),
                          buttonColor: Color.fromARGB(255, 117, 33, 112),
                          textValue: 'Hitung BMI',
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        onTap: () {_calculateBMI();}, 
                  ),
                     
                  Text("$_bmiResult")
                   



                ],
              ),
              
            ),
        );
     
  }
}