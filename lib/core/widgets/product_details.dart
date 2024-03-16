import 'package:flutter/material.dart';
import 'package:online_shop/model/product.dart';
import 'package:online_shop/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const routeName = '/productDetails';
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context)!.settings.arguments as String ;
    Product product=context.read<HomeProvider>().findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: LayoutBuilder(
        builder: (context,constraints){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight*.4,
                  width: constraints.maxWidth,
                  child: Image.network(product.imageUrl,fit: BoxFit.fitWidth,),
            ),
            SizedBox(
              height: constraints.maxHeight*.02,
            ),
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
