import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/provider/dark_theme_provider.dart';
import 'package:flutter_grocery_app/widget/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  final String catText, imgPath;
  final Color passedcolor;

  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {
        print('Category pressed');
      },
      child: Container(
        decoration: BoxDecoration(
            color: passedcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: passedcolor.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill)),
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
