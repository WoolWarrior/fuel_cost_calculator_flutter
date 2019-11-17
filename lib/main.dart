import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_cost_calculator_flutter/calculation/bloc.dart';
import 'package:fuel_cost_calculator_flutter/cost_factors_repository/cost_factor.dart';
import 'package:fuel_cost_calculator_flutter/calculate_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fuel Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fuel Cost Calculator'),
      ),
      body: //CalculateForm(),
          BlocProvider<CalculationBloc>(
            builder: (context) => CalculationBloc(costFactor: CostFactor()),
            child: CalculateForm(),
      ),
    );
  }
}
