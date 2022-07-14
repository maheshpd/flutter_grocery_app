import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/services/utils.dart';
import 'package:flutter_grocery_app/widget/on_sale_widget.dart';
import 'package:flutter_grocery_app/widget/text_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";

  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = true;

    final Color color = Utils(context).color;
    Size size = Utils(context).getscreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Product on sale',
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("assets/images/box.png"),
            ),
            Text(
              'No Products on sale yet!,\n stay tuned',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: color, fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )
          : GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.45),
        children: List.generate(16, (index) {
          return const OnSaleWidget();
        }),
      ),
    );
  }
}
