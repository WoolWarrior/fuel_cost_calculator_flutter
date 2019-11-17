class CostFactor {
  double distance;
  double fuelPrice;
  double fuelEconomy;

  CostFactor({this.distance, this.fuelPrice, this.fuelEconomy});

  double cost() {
    if (distance != null && fuelEconomy != null && fuelPrice != null) {
      return distance / fuelEconomy * fuelPrice * 4.54609;
    } else {
      return 0;
    }
  }

  @override
  String toString() =>
      'CostFactorRepository { distance: $distance, fuelPrice: $fuelPrice, fuelEconomy: $fuelEconomy}';
}
