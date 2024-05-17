import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScaffold(),
  ));
}

class HomeScaffold extends StatefulWidget {
  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  double _height = 173;
  double _weight = 60;
  double _age = 25;
  bool _gender = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 110, 255, 1),
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _gender = true;
                    });
                  },
                  child: Container(
                    color:
                        _gender ? Colors.green.shade600 : Colors.blue.shade600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.male), Text("Male")],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _gender = false;
                    });
                  },
                  child: Container(
                    color:
                        _gender ? Colors.blue.shade600 : Colors.green.shade600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.male), Text("Female")],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Color.fromARGB(255, 6, 138, 247),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_height.round().toString()),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Slider(
                        min: 1,
                        max: 300,
                        divisions: 500,
                        value: _height,
                        onChanged: (value) {
                          setState(() {
                            _height = value;
                          });
                        }),
                  )
                ],
              ),
            ]),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade600,
                  child: Column(
                    children: [
                      Text("Weight"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_weight.round().toString(),
                              style: TextStyle(fontSize: 25)),
                          Text(
                            "KG",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: Icon(Icons.add)),
                          ),
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                child: Icon(Icons.remove)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade600,
                  child: Column(
                    children: [
                      Text("Age"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_age.round().toString(),
                              style: TextStyle(fontSize: 25)),
                          Text(
                            "YRS",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                child: Icon(Icons.add)),
                          ),
                          SizedBox(
                            width: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero)),
                                onPressed: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                                child: Icon(Icons.remove)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Container(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultsScaffold(
                                  _weight, _height, _age, _gender))));
                    },
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ResultsScaffold extends StatelessWidget {
  ResultsScaffold(this.weight, this.height, this.age, this.gender);
  double weight;
  double height;
  double age;
  bool gender;
  @override
  Widget build(BuildContext context) {
    double bmi = (weight / pow(height / 100, 2));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your results",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Color.fromARGB(122, 238, 238, 238),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Container(
            color: bmi > 25 ? Colors.red.shade700 : Colors.green.shade700,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(bmi > 25 ? Icons.dangerous : Icons.check),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI:",
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline),
                    ),
                    Text(bmi.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Status:",
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline)),
                  Text(bmi > 25 ? "Abnormal" : "Normal",
                      style: TextStyle(fontSize: 20)),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("IBW:",
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline)),
                    Text(
                        gender
                            ? (50 + ((0.09175 * height))).toStringAsFixed(2)
                            : (45.5 + ((0.11 * height)))
                                .toStringAsFixed(2), //!I MADE UP A FORMULA
                        style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
