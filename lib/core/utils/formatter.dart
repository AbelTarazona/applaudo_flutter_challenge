import 'package:intl/intl.dart';

enum TypeFormat { mainDate }

enum LocationFormat { es, en }

class Formatter {
  Formatter._internal();

  static final Formatter _instance = Formatter._internal();

  static Formatter get instance => _instance;

  String dateFormatUtil({
    required DateTime dateTime,
    required TypeFormat typeFormat,
    LocationFormat locationFormat = LocationFormat.es,
  }) {
    var formatter = _generateFormat(typeFormat, locationFormat);
    String formatted = formatter.format(dateTime);
    return formatted;
  }

  DateFormat _generateFormat(
    TypeFormat typeFormat,
    LocationFormat locationFormat,
  ) {
    switch (typeFormat) {
      case TypeFormat.mainDate:
        return DateFormat('MMM dd, yyyy');
    }
  }
}
