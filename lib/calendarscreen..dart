import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void loadModel() async {
  var interpreter = await Interpreter.fromAsset('assets/models/model.tflite');
  interpreter.allocateTensors();
}

// Define the HomeScreen as a StatefulWidget
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

// Define the _HomeScreenState as a State of HomeScreen
class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDate = DateTime.now();

  void _goToNextDay() {
    setState(() {
      _currentDate = _currentDate.add(Duration(days: 1));
    });
  }

  void _goToPreviousDay() {
    setState(() {
      _currentDate = _currentDate.subtract(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Format the date as 'Day, Month Date' e.g., 'Sun, Nov 5'
    String formattedDate = DateFormat('EEE, MMM d').format(_currentDate);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: _goToPreviousDay,
            ),
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: _goToNextDay,
            ),
          ],
        ),
      ),
      body: SfCalendar(
        view: CalendarView.day,
        initialDisplayDate: _currentDate,
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

// ... The rest of your code (MeetingDataSource and getAppointments) remains the same ...

List<Appointment> getAppointments() {
  List<Appointment> charging_time = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  charging_time.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Charging Time!',
      color: Colors.green,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: false));

  return charging_time;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
