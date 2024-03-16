import 'package:flutter/material.dart';
 import 'package:online_shop/model/product.dart';
import 'package:online_shop/view/product_grid.dart';
import 'package:online_shop/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products=Provider.of<HomeProvider>(context).products;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:2/4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context,index){
        return ChangeNotifierProvider.value(
          value: products[index],
          child: const ProductGrid(),
        );
      },
      itemCount: products.length,
      padding: const EdgeInsets.all(10),

    );

  }
}
