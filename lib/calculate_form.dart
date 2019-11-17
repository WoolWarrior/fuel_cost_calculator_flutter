import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_cost_calculator_flutter/calculation/bloc.dart';

//import 'cost_factors_repository/cost_factor.dart';

class CalculateForm extends StatelessWidget {
  final _distanceController = TextEditingController();
  final _fuelPriceController = TextEditingController();
  final _fuelEconomyController = TextEditingController();

//  final CostFactorRepository costFactorRepository;
//
//
//  CalculateForm({Key key, @required this.costFactorRepository})

  @override
  Widget build(BuildContext context) {
    final CalculationBloc calculationBloc =
        BlocProvider.of<CalculationBloc>(context);

//    return
//      BlocProvider<CalculationBloc>(
//      builder: (context) => CalculationBloc(costFactor: CostFactor()),
//      child: CalculateForm(),
//    );

    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'distance'),
            controller: _distanceController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'fuelPrice'),
            controller: _fuelPriceController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'fuelEconomy'),
            controller: _fuelEconomyController,
          ),
          RaisedButton(
            onPressed: () {
              calculationBloc.add(CalculationButtonPressed(
                distance: double.parse(_distanceController.text),
                fuelPrice: double.parse(_fuelPriceController.text),
                fuelEconomy: double.parse(_fuelEconomyController.text),
              ));
              print(double.parse(_fuelEconomyController.text));
              print(calculationBloc.costFactor.cost());
            },
            child: Text('Calculate'),
          ),
          Container(
              child: BlocBuilder<CalculationBloc, CalculationState>(
                  bloc: calculationBloc,
                  builder: (context, calculationCalculated ) {
                    return Text(calculationCalculated.costFactor.cost().toString());
                  })),
        ],
      ),
    );
  }

}
