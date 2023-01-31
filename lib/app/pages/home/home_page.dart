import '../../models/product_model.dart';
import 'widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    id: 0,
                    name: 'Lanche X',
                    description: 'Lanche acompanha pão, hambúrguer, mussarela e maionese',
                    price: 15.0,
                    image: 'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
