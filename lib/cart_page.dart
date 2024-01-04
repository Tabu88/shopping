import 'package:flutter/material.dart';

import 'global_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index){
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 30,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.red,),),
              title: Text(cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,),
              subtitle: Text('Size: ${cartItem['size']}'),
            );
          })
    );
  }
}
