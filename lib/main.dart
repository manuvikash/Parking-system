import 'dart:convert';
import 'Screens/parking_lot.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isOccupied = false;

  Future<void> _getParkingSpaceAvailability() async {
    final url = Uri.parse(
        'https://api.thingspeak.com/channels/2074514/feeds.json?api_key=N9EPUWBQWZ9C656P&results=2');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final feed = json['feeds'][1];
        final isAvailable = feed['field1'] == '1';
        print(_isOccupied);
        setState(() {
          _isOccupied = isAvailable;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _refreshParkingSpaceAvailability() async {
    await _getParkingSpaceAvailability();
  }

  @override
  Widget build(BuildContext context) {
    _getParkingSpaceAvailability();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Space Availability',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Parking Space Availability'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              ParkingLot(
                isOccupiedList: _isOccupied
                    ? [
                        true,
                        false,
                        false,
                        true,
                        false,
                        true,
                        false,
                        false,
                        true,
                        false
                      ]
                    : [
                        true,
                        false,
                        false,
                        false,
                        false,
                        true,
                        false,
                        false,
                        true,
                        false
                      ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _isOccupied ? 'Available spots: 6' : 'Available spots: 7',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
