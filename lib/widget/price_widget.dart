import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/services/utils.dart';
import 'package:flutter_grocery_app/widget/text_widget.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '1.59\$',
            color: Colors.green,
            textSize: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '2.59\$',
            style: TextStyle(
              fontSize: 15,
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          )
        ],
      ),
    );
  }
}
