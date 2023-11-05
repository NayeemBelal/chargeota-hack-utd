import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chargeota',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 16, 69, 77),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CarDropDown(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 10,
            ),
            CircularPercentIndicator(
              radius: 200,
              lineWidth: 15.0,
              percent: 0.5,
              center: Image.asset(
                'images/EvCar.png',
                height: 100,
              ),
              progressColor: const Color.fromARGB(255, 41, 143, 158),
            ),
            Container(
              height: 10,
            ),
            Container(
              width: 700,
              height: 327,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), // Adjust the radius as needed
                  topRight: Radius.circular(20), // Adjust the radius as needed
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(54, 0, 0, 0),
                    //Offset
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarDropDown extends StatefulWidget {
  const CarDropDown({super.key});

  @override
  State<CarDropDown> createState() => CarDropDownState();
}

class CarDropDownState extends State<CarDropDown> {
  final items = ['Prius', 'Frius', 'Trius'];
  String? value = 'Prius';

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: items.map(buildMenuItem).toList(),
      value: value,
      onChanged: (value) => setState(() {
        this.value = value;
      }),
      iconSize: 0,
      icon: null,
      iconEnabledColor: Colors.white,
      underline: SizedBox(),
      style: const TextStyle(
          color: Colors.black,
          letterSpacing: 3,
          fontSize: 25,
          fontWeight: FontWeight.w500),
      dropdownColor: Colors.white,
    );
  }
}
