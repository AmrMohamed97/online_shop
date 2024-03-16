import 'package:flutter/material.dart';
import 'package:online_shop/core/widgets/product_details.dart';
import 'package:online_shop/view/products_home_page.dart';
import 'package:online_shop/view_model/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>HomeProvider(),
      child: MaterialApp(
        theme: ThemeData(
          popupMenuTheme: const PopupMenuThemeData(
            iconColor:Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
          ),
          scaffoldBackgroundColor: Colors.grey[200],
          fontFamily: 'ReggaeOne',
        ),
        debugShowCheckedModeBanner: false,
        home: const ProductsHomePage(),
        routes: {
          ProductDetails.routeName:(context)=> const ProductDetails(),
        },
      ),
    );
  }
}
