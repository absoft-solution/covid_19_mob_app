import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
