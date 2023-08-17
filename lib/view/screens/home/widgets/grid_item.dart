import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final index;
  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List _title = ['Apps', 'Websites', 'Designs', 'Consultant'];

    List _color = [
      Color(0xffF9F5FF),
      Color(0xffFDF2FA),
      Color(0xffFFFAF5),
      Color(0xffF0F9FF),
    ];

    List _images = [
      'assets/images/Mobile Social Networking.png',
      'assets/images/Web.png',
      'assets/images/Vector.png',
      'assets/images/Consultation.png',
    ];

    final w = MediaQuery.of(context).size.width;
    return GridTile(
        child: Container(
      padding: EdgeInsets.all(8.0),
      height: 50,
      width: w / 2.5,
      decoration: BoxDecoration(
        color: _color[index],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Image.asset(_images[index], height: 45),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _title[index],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ]),
    ));
  }
}
