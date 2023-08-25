import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final Widget icon;
  const ForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              icon,
              SizedBox(height: 8),
              Text(
                temperature,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
