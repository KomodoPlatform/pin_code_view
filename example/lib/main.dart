import 'package:flutter/material.dart';
import 'package:pin_code_view/pin_code_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PinCode(
      title: Text(
        "Lock Screen",
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),

      subTitle: Text(
        "Enter the pin code",
        style: TextStyle(color: Colors.white),
      ),
      codeLength: 6,
      // you may skip correctPin and plugin will give you pin as
      // call back of [onCodeFail] before it clears pin
      correctPin: "123456",
      onCodeSuccess: (code) {
        print(code);
      },
      onCodeFail: (code) {
        print(code);
      },
      showLetters: true,
    ));
  }
}
