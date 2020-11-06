import 'package:intl/intl.dart';

void main() {
  DateTime now = DateTime.now();
  DateFormat outputFormat = DateFormat('yyyy-MM-dd:TEST');
  String date = outputFormat.format(now);
  print(date);
}
