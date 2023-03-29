import 'package:flutter/material.dart';
import '../Components/parking_spot.dart';

class ParkingLot extends StatelessWidget {
  final List<bool> isOccupiedList;

  ParkingLot({required this.isOccupiedList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.8,
        shrinkWrap: true,
        children: [
          ParkingSpot(isOccupied: isOccupiedList[0], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[1], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[2], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[3], isSelected: true),
          ParkingSpot(isOccupied: isOccupiedList[4], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[5], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[6], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[7], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[8], isSelected: false),
          ParkingSpot(isOccupied: isOccupiedList[9], isSelected: false),
        ],
      ),
    );
  }
}
