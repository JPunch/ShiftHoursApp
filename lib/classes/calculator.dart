class Calculator {
  double totalHours;
  int shiftCount;
  double payPerHour;
  double grossPay;
  double takeHomePay;
  double tax;
  double ni;

  Calculator({double totalHours, int shiftCount, double payPerHour}) {
    this.totalHours = totalHours;
    this.shiftCount = shiftCount;
    this.payPerHour = payPerHour;
    this.grossPay = totalHours * payPerHour;
  }

  static double yearTotalPay() {}
}
// have all the shifts as an argument for the clss and thenuse them
// to get the init values
