import 'package:flutter/material.dart';

class ParkingSpot extends StatelessWidget {
  final bool isOccupied;
  final bool isSelected;

  ParkingSpot({this.isOccupied = false, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: Color.fromARGB(255, 239, 16, 0), width: 6)
            : null,
        color: isOccupied ? Colors.grey[800] : Color.fromARGB(255, 18, 130, 6),
      ),
      child: Center(
        child: Text(
          isOccupied ? 'Occupied' : 'Available',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
