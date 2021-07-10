import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = 0.0;
  String bmi = "";

  void Calculate() {
    setState(() {
      int age = int.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      if ((_ageController.toString().isNotEmpty && age > 0) ||
          (_weightController.toString().isNotEmpty && weight > 0) ||
          (_heightController.toString().isNotEmpty && height > 0)) {
        _result = ( weight*10000) /( height*height);
      }
      if (_result >= 25.0 && _result < 29.9) {
        bmi = "Overweight";
      } else if (_result >= 18.5 && _result < 25.0) {
        Text(
          "congrasts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        );
      } else if (_result >= 29.9) {


      } else {

        bmi='underweight';
      ),
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI_calculator",
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[

            Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "Enter your age",
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Height",
                          hintText: "In CM",
                          icon: Icon(Icons.insert_chart)),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight",
                          hintText: "In Kg",
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        color: Colors.white30,
                        onPressed: Calculate,
                      ),
                    ),
                  ],
                )),
            Center(
              child: Text(
                "Your BMI is ${_result.toStringAsFixed(1)}",
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,

                ),
              ),
            ),
            Center(
              child: Text(
                "$bmi",style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color:Colors.red
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}