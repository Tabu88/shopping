import 'package:flutter/material.dart';

import 'package:shopping/product_list.dart';

import 'cart_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPage = 0;

  List<Widget> pages = [
    ProductList(),
    CartPage()

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items:const [
          BottomNavigationBarItem(
            label: '',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: '',
              icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
    );
  }
}
