import 'package:atomic_state/src/models/product_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../widgets/cart_drawer.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScaffoldState get scaffoldState => scaffoldKey.currentState!;

  var isLoading = true;
  var products = [
    for (var i = 0; i < 5; i++)
      ProductModel(
        id: 'dfas',
        title: 'Product name',
        image: 'https://classic.exame.com/wp-content/uploads/2020/05/mafe-studio-LV2p9Utbkbw-unsplash-1.jpg?quality=70&strip=info&w=1024',
        price: 12.1,
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[Container()],
        title: const Text('flutterGPT'),
        centerTitle: true,
      ),
      endDrawer: const CartDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                model: products[index],
                onTap: () {},
              );
            },
          ),
          if (isLoading)
            const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldState.openEndDrawer();
        },
        child: const badges.Badge(
          badgeContent: Text('3'),
          child: Icon(Icons.shopping_bag_outlined),
        ),
      ),
    );
  }
}
