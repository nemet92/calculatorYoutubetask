import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? firstnum;
  int? secondnum;
  String texttodisplay = " ";
  String? res;
  String? operatortoperform;
  void buttonClick(String buttonval) {
    if (buttonval == "C") {
      texttodisplay = " ";
      firstnum = 0;
      secondnum = 0;
      res = "0";
    } else if (buttonval == "+" ||
        buttonval == "-" ||
        buttonval == "X" ||
        buttonval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = buttonval;
    } else if (buttonval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum! + secondnum!).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum! - secondnum!).toString();
      }
      if (operatortoperform == "X") {
        res = (firstnum! * secondnum!).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum! / secondnum!).toString();
      }
    } else {
      res = int.parse(texttodisplay + buttonval).toString();
    }
    setState(() {
      texttodisplay = res!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              texttodisplay,
              style: const TextStyle(color: Colors.black),
            ),
          )),
          const Divider(
            height: 10,
          ),
          Row(
            children: [
              customButton('9', Colors.black12),
              customButton("8", Colors.black12),
              customButton("7", Colors.black12),
              customButton("+", Colors.amber),
            ],
          ),
          Row(
            children: [
              customButton("6", Colors.black12),
              customButton("5", Colors.black12),
              customButton("4", Colors.black12),
              customButton("-", Colors.grey),
            ],
          ),
          Row(
            children: [
              customButton("3", Colors.black12),
              customButton("2", Colors.black12),
              customButton("1", Colors.black12),
              customButton("X", Colors.yellow),
            ],
          ),
          Row(
            children: [
              customButton('C', Colors.red),
              customButton('0', Colors.black12),
              customButton('=', Colors.blue),
              customButton('/', Colors.green),
            ],
          )
        ],
      ),
    );
  }

  Widget customButton(String buttonval, Color colors) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: OutlinedButton(
            style:
                ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors)),
            onPressed: () => buttonClick(buttonval),
            child: Text(
              buttonval,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            )),
      ),
    );
  }
}
