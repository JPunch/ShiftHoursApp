import 'shift_card.dart';

class Calculator {
  List<ShiftCard> shiftls;
  int days;
  double totalHours;
  double pay;
  double totalPay;

  Calculator(
      List<ShiftCard> shiftls, Duration days, double totalHours, double pay) {
    this.shiftls = shiftls;
    this.days = days.inDays;
    this.totalHours = totalHours;
    this.pay = pay;
    this.totalPay = grossPerYear();
  }

  double grossPerYear() {
    double timePeriods = 365 / this.days;
    double totalPay = (this.totalHours * this.pay * timePeriods);
    //needs pay per hour or can add it into shifts for shifts with different pay
    return totalPay;
  }

  double taxUpper(double pay) {
    if (pay > 150000) {
      double afterTax = 150000 + ((pay - 150000) * 0.55);
      return afterTax;
    } else {
      return null;
    }
  }

  double taxMiddle(double pay) {
    if (pay > 50000) {
      double afterTax = 50000 + ((pay - 50000) * 0.6);
      return afterTax;
    } else {
      return null;
    }
  }

  double taxLower(double pay) {
    if (pay > 12500) {
      double afterTax = 12500 + ((pay - 12500) * 0.8);
      return afterTax;
    } else {
      return null;
    }
  }
}
