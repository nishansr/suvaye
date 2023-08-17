import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'See more',
          style: TextStyle(
            color: Color(0xff027A48),
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.arrow_forward_ios, color: Color(0xff027A48), size: 15),
      ],
    );
  }
}
