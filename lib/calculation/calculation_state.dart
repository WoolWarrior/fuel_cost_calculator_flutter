abstract class CalculationState  {

  double cost;

  CalculationState(this.cost);

  List<Object> get props => [];
}

class CalculationUnCalculated extends CalculationState {
  CalculationUnCalculated(double cost) : super(cost);

//  CalculationUnCalculated(CostFactor costFactor) : super(costFactor);

  @override
  String toString() => 'CalculationUnCalculated { costFactor: unCalculated }';
}

class CalculationCalculated extends CalculationState {
  CalculationCalculated(double cost) : super(cost);

//  CalculationCalculated(CostFactor costFactor) : super(costFactor);


  @override
  List<Object> get props => [cost];

  @override
  String toString() => 'CalculationCalculated { costFactor: $cost }';
}

