import 'package:flutter/material.dart';
import 'package:online_shop/core/widgets/product_details.dart';
import 'package:online_shop/model/product.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, provider,_) {
              return IconButton(onPressed: () {
                provider.toggleFavorite();
              },
                icon: provider.isFavorite ? const Icon(
                  Icons.favorite, color: Colors.red,) : const Icon(
                    Icons.favorite),);
            },
          ),
          title: Text(product.title),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context, ProductDetails.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(product.imageUrl, fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
