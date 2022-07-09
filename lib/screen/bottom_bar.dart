import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/provider/dark_theme_provider.dart';
import 'package:flutter_grocery_app/screen/cart.dart';
import 'package:flutter_grocery_app/screen/categories.dart';
import 'package:flutter_grocery_app/screen/home_screen.dart';
import 'package:flutter_grocery_app/screen/user.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _page = [
    {'page':  HomeScreen(), 'title': 'Home Screen'},
    {'page':  CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      /*appBar: AppBar(
        title: Text(_page[_selectedIndex]['title']),
      ),*/
      body: _page[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,

        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 1 ? IconlyBold.category :IconlyLight.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 2 ? IconlyBold.buy :IconlyLight.buy), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 3 ? IconlyBold.user2 :IconlyLight.user2), label: "User"),
        ],
      ),
    );
  }
}
