import 'package:flutter/material.dart';
import 'package:mybmiapp/bmiPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: Colors.deepPurple)),
      home: myApp(),
    );
  }
}

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mainApp();
  }
}

class mainApp extends State {
  var weight = TextEditingController();
  var heightFeet = TextEditingController();
  var heightInch = TextEditingController();
  var bmi = "";
  var error = "";
  func() {
    if (weight.text.toString() == "" ||
        heightFeet.text.toString() == "" ||
        heightInch.text.toString() == "") {
      error = "Please Fill All Inputs";
    } else {
      var updweight = double.parse(weight.text.toString());
      var updheightFeet = double.parse(heightFeet.text.toString());
      var updheightInch = double.parse(heightInch.text.toString());
      var updheight = (updheightFeet * 0.304) + (updheightInch * 0.025);
      var upbmi = (updweight / (updheight * updheight));
      bmi = upbmi.toStringAsFixed(2);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return bmiPage(bmi);
        },
      ));
      error = "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI App"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: weight,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefix: Container(
                      padding: EdgeInsets.only(right: 5),
                      child: FaIcon(
                        FontAwesomeIcons.weightHanging,
                        color: Colors.orangeAccent,
                      )),
                  suffixText: "kg",
                  hintText: "Enter Weight in KG",
                  suffixStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange, width: 2)),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: heightFeet,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefix: Container(
                      padding: EdgeInsets.only(right: 5),
                      child: FaIcon(
                        FontAwesomeIcons.textHeight,
                        color: Colors.orangeAccent,
                      )),
                  suffixText: "feet",
                  hintText: "Enter Height Feet",
                  suffixStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange, width: 2)),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: heightInch,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefix: Container(
                      padding: EdgeInsets.only(right: 5),
                      child: FaIcon(
                        FontAwesomeIcons.textHeight,
                        color: Colors.orangeAccent,
                      )),
                  suffixText: "Inch",
                  suffixStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  hintText: "Enter Height INCH",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange, width: 2)),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.deepPurple),
                ),
                onPressed: () {
                  func();
                },
                child: Text(
                  "Show BMI",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "${error}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
