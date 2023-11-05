// geocoding_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_KEY = 'AIzaSyC9FYH4eKyZhWq3Rr2E3H4FpU4kSZqz0uQ';

Future<Map<String, dynamic>> getLatLngFromCity(String city) async {
  final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?address=$city&key=$API_KEY'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final results = data['results'];

    if (results.isNotEmpty) {
      final location = results[0]['geometry']['location'];
      double latitude = location['lat'];
      double longitude = location['lng'];

      return {'latitude': latitude, 'longitude': longitude};
    } else {
      throw Exception('No results found for the provided city name.');
    }
  } else {
    throw Exception('Failed to fetch data');
  }
}
