import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProducts = [
      for (var i = 0; i < 5; i++)
        ProductModel(
          id: 'dfas',
          title: 'Product name',
          image: 'https://classic.exame.com/wp-content/uploads/2020/05/mafe-studio-LV2p9Utbkbw-unsplash-1.jpg?quality=70&strip=info&w=1024',
          price: 12.12,
        ),
    ];
    return Drawer(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(
              'Sacola',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  final model = cartProducts[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    leading: ClipOval(
                      child: Image.network(
                        model.image,
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    title: Text(model.title),
                    subtitle: Text('R\$ ${model.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline_rounded),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Valor: R\$ 0.00',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Finalizar compra'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Limpar sacola'),
            ),
          ],
        ),
      ),
    );
  }
}
