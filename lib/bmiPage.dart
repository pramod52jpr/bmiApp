import 'package:flutter/material.dart';

class bmiPage extends StatefulWidget {
  String val;
  bmiPage(this.val);
  @override
  State<StatefulWidget> createState() {
    return bmi(val);
  }
}

class bmi extends State {
  var ht = 100.0;
  var wd = 100.0;
  var colo = Colors.yellow;
  var opa = 1.0;
  var cf = true;

  String bmiValue = "";
  String result = "";
  bmi(this.bmiValue) {
    if (double.parse(bmiValue) < 18) {
      result = "Under Weight";
    } else if (double.parse(bmiValue) < 25) {
      result = "Normal Weight";
    } else {
      result = "Over Weight";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        children: [
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey),
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Your BMI is : ${bmiValue}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: double.parse(bmiValue) < 18
                    ? Colors.blueGrey
                    : double.parse(bmiValue) < 25
                        ? Colors.blue
                        : Colors.red),
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Result : ${result}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
