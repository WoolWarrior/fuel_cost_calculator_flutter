import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fuel_cost_calculator_flutter/cost_factors_repository/cost_factor.dart';
import './bloc.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  final CostFactor costFactor;

  CalculationBloc({@required this.costFactor});

  @override
  CalculationState get initialState => CalculationUnCalculated(costFactor);

  @override
  Stream<CalculationState> mapEventToState(
    CalculationEvent event,
  ) async* {
    if (event is CalculationButtonPressed) {
      yield* _mapCalculationButtonPressedToState(event);
    }
  }

  Stream<CalculationState> _mapCalculationButtonPressedToState(
      CalculationButtonPressed event) async* {
    costFactor.distance = event.distance;
    costFactor.fuelPrice = event.fuelPrice;
    costFactor.fuelEconomy = event.fuelEconomy;

    yield CalculationCalculated(costFactor);
  }
}
