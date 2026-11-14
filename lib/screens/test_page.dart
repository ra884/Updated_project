import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({super.key});
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isEnabled = false;
  String selectedValue = "Male";
  double sliderValue = 20;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Switch(
            value: isEnabled,
            activeColor: Colors.greenAccent,
            inactiveThumbColor: Colors.redAccent,
            onChanged: (value) {
              setState(() {
                isEnabled = value;
              });
            },
          ),
          RadioListTile(
            title: Text("Male"),
            value: "Male",
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
          RadioListTile(
            title: Text("Female"),
            value: "Female",
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            onChanged: ((value) {
              setState(() {
                sliderValue = value;
              });
            }),
          ),
          CheckboxListTile(
            title: Text("Remember me"),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
