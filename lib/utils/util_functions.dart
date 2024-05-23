import 'package:intl/intl.dart';

class UtilFunctions {
  static String formatDate(String? date, {String pattern = 'dd MMM yyyy'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedDate = DateFormat(pattern).format(stringDateToDatetime);
      return formattedDate;
    } else {
      return '';
    }
  }
}
