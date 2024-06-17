import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.0;
  String _result = "";

  void _calculateBMI() {
    final double? height = double.tryParse(_heightController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (height != null && weight != null) {
      setState(() {
        _bmi = weight / (height * height);
        if (_bmi < 18.5) {
          _result = "Underweight";
        } else if (_bmi < 24.9) {
          _result = "Normal weight";
        } else if (_bmi < 29.9) {
          _result = "Overweight";
        } else {
          _result = "Obesity";
        }
      });
    } else {
      setState(() {
        _result = "Please enter valid values";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (m)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            Text(
              _bmi == 0.0 ? '' : 'Your BMI: ${_bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              _result,
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
