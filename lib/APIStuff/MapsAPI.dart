import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_KEY = 'AIzaSyC9FYH4eKyZhWq3Rr2E3H4FpU4kSZqz0uQ';

class ChargingStation {
  final String name;
  final double latitude;
  final double longitude;
  final String formattedAddress; // New property for formatted address

  ChargingStation({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.formattedAddress,
  });
}

Future<List<ChargingStation>> fetchChargingStations(
    double lat, double lng) async {
  final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?key=$API_KEY&query=ev%20charging%20stations&location=$lat,$lng&radius=50000'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];

    List<ChargingStation> chargingStations = [];
    for (var result in results) {
      chargingStations.add(ChargingStation(
        name: result['name'],
        latitude: result['geometry']['location']['lat'],
        longitude: result['geometry']['location']['lng'],
        formattedAddress: result['formatted_address'], // Add formatted address
      ));
    }
    return chargingStations;
  } else {
    throw Exception('Failed to load charging stations');
  }
}

class ClosestChargingStationMapPage extends StatefulWidget {
  @override
  _ClosestChargingStationMapPageState createState() =>
      _ClosestChargingStationMapPageState();
}

class _ClosestChargingStationMapPageState
    extends State<ClosestChargingStationMapPage> {
  late Future<List<ChargingStation>> chargingStations;

  @override
  void initState() {
    super.initState();
    // Replace the coordinates below with the desired latitude and longitude values
    chargingStations =
        fetchChargingStations(32.8140, -96.9489); // Irving coordinates
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Closest Charging Station Page'),
      ),
      body: Center(
        child: FutureBuilder<List<ChargingStation>>(
          future: chargingStations,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<ChargingStation> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name),
                    subtitle: Text(data[index]
                        .formattedAddress), // Display formatted address
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ClosestChargingStationMapPage()));
