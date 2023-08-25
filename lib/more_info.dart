import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  const MoreInfo(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          widget.icon,
          size: 32,
        ),
        SizedBox(height: 8),
        Text(widget.label),
        SizedBox(height: 8),
        Text(
          widget.value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
