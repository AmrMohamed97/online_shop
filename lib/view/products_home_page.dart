import 'package:flutter/material.dart';
import 'package:online_shop/core/utiles/enum.dart';
import 'package:online_shop/core/widgets/product_item.dart';
import 'package:online_shop/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class ProductsHomePage extends StatelessWidget {
  const ProductsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App',style:TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected:(value){
              switch(value){
                case FilterOptions.all:
                  context.read<HomeProvider>().showState(false);
                  break;
                case FilterOptions.favorites:
                  context.read<HomeProvider>().showState(true);
                  break;
              }
            },
            itemBuilder:(context)=>[
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All Products'),
              ),
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Favorites'),
              ),
            ] ,
          ),
        ],
      ),
      body: const ProductItem(),
    );
  }
}
