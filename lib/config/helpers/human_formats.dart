import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    return NumberFormat.compactCurrency(
            decimalDigits: decimals, symbol: '', locale: 'en')
        .format(number);
  }

  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd('es_Es');
    return format.format(date);
  }
}
