import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_cost_calculator_flutter/calculation/bloc.dart';

//import 'cost_factors_repository/cost_factor.dart';

class CalculateForm extends StatelessWidget {
  final _distanceController = TextEditingController();
  final _fuelPriceController = TextEditingController();
  final _fuelEconomyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CalculationBloc calculationBloc =
        BlocProvider.of<CalculationBloc>(context);
    final double _formDistance = 5.0;
    final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Journey Details",
                        style: _biggerFont,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Distance (miles)',
                            hintText: "How many miles do you drive?",
                            icon: Icon(Icons.add_location),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: _distanceController,
                        keyboardType: TextInputType.number),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Fuel Price (p/L)',
                            hintText: "How much is the fuel per Litre?",
                            icon: Icon(Icons.local_gas_station),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: _fuelPriceController,
                        keyboardType: TextInputType.number),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Car Fuel Economy (MPG)',
                            hintText: "What's the car's economy?",
                            icon: Icon(Icons.directions_car),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: _fuelEconomyController,
                        keyboardType: TextInputType.number),
                  ),
                  RaisedButton(
                    onPressed: () {
                      calculationBloc.add(CalculationButtonPressed(
                        distance: double.parse(_distanceController.text),
                        fuelPrice: double.parse(_fuelPriceController.text),
                        fuelEconomy: double.parse(_fuelEconomyController.text),
                      ));
                      print(calculationBloc.costFactor.cost());
                    },
                    child: Text('Calculate'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cost Details",
                        style: _biggerFont,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: _formDistance,
                        bottom: _formDistance,
                      ),
                      child: BlocBuilder<CalculationBloc, CalculationState>(
                          bloc: calculationBloc,
                          builder: (context, calculationCalculated) {
                            return Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text("Journey Cost(£)"),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    calculationCalculated.cost
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),

                                  ),
                                ),
                              ],
                            );
                          })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
