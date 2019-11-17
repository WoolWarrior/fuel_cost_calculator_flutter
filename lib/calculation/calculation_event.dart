import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

//@immutable
abstract class CalculationEvent extends Equatable {
  const CalculationEvent();

  @override
  List<Object> get props => [];
}

class CalculationButtonPressed extends CalculationEvent {
  final double distance;
  final double fuelPrice;
  final double fuelEconomy;

  const CalculationButtonPressed({
    @required this.distance,
    @required this.fuelPrice,
    @required this.fuelEconomy,
  });

  @override
  List<Object> get props => [distance, fuelPrice, fuelEconomy];

  @override
  String toString() =>
      'CalculationButtonPressed { distance: $distance, fuelPrice: $fuelPrice, fuelEconomy: $fuelEconomy }';
}
