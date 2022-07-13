import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/services/utils.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;

    return GestureDetector(
      onTap: () {
        print('heart button tap');
      },
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
