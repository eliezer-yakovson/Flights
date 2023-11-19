import 'package:flutter/material.dart';
import 'package:travel/models/Flight.dart';

class CustomCard extends StatelessWidget {
  final Flight flight;

  const CustomCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
        print('Flight tapped: ${flight.flight}');
        Navigator.pushNamed(context, '/secondPage',arguments: flight);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                Text(
                  "${flight.airline} :חברת תעופה",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "${flight.flight} :מספר טיסה ",
                  style: const TextStyle(color: Colors.blue),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "${flight.arrival} :יעד ${flight.departure} :מוצא",
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
            // Add any other widgets you want to include in the row
          ],
        ),
      ),
    );
  }
}
