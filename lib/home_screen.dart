import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberFirstController = TextEditingController();
  final TextEditingController _numberSecondController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var _result = 0;

  @override
  Widget build(BuildContext context) {
    double numberOne = double.tryParse(_numberFirstController.text.trim()) ?? 0;
    double numberTwo =
        double.tryParse(_numberSecondController.text.trim()) ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sum App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(

            children: [
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _numberFirstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter First Number',
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Enter Valid Number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _numberSecondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Second Number',
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Enter Valid Number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          double result = add(numberOne, numberTwo);
                          _result = result.toInt();
                          setState(() {});
                        }
                      },
                      child: Text('+',style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          double result = subt(numberOne, numberTwo);
                          _result = result.toInt();
                          setState(() {});
                        }
                      },
                      child: Text('-',style: TextStyle(fontSize: 30),),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          double result = multi(numberOne, numberTwo);
                          _result = result.toInt();
                          setState(() {});
                        }
                      },
                      child: Text('*',style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          double result = div(numberOne, numberTwo);
                          _result = result.toInt();
                          setState(() {});
                        }
                      },
                      child: Text('/',style: TextStyle(fontSize: 25),),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: clear,
                      child: Text('clear',style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Center(
                        child: Text(
                      "Result: $_result",
                      style: TextStyle(fontSize: 20),
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double add(double numberOne, double numberTwo) {
    return numberOne + numberTwo;
  }

  double multi(double numberOne, double numberTwo) {
    return numberOne * numberTwo;
  }

  double subt(double numberOne, double numberTwo) {
    return numberOne - numberTwo;
  }

  double div(double numberOne, double numberTwo) {
    return numberOne / numberTwo;
  }

  void clear() {
    _numberFirstController.clear();
    _numberSecondController.clear();
    _result = 0;
    setState(() {});
  }

  @override
  void dispose() {
    _numberFirstController.dispose();
    _numberSecondController.dispose();
    super.dispose();
  }
}
