//import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:fuel_cost_calculator_flutter/cost_factors_repository/cost_factor.dart';

//@immutable
abstract class CalculationState extends Equatable {
  final CostFactor costFactor;

  CalculationState(this.costFactor);

  @override
  List<Object> get props => [];
}

class CalculationUnCalculated extends CalculationState {
  CalculationUnCalculated(CostFactor costFactor) : super(costFactor);

  @override
  String toString() => 'CalculationUnCalculated { costFactor: unCalculated }';
}

class CalculationCalculated extends CalculationState {
  CalculationCalculated(CostFactor costFactor) : super(costFactor);

  @override
  List<Object> get props => [costFactor];

  @override
  String toString() => 'CalculationCalculated { costFactor: $costFactor }';
}
//
//class CalculationError extends CalculationState {
//  const CalculationError(double cost) :super(cost);
//
//  @override
//  String toString() => 'CalculationError { cost: $cost }';
//}
