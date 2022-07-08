import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/widget/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CategoriesWidget(),
      ),
    );
  }
}