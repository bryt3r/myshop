// import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // const ProductsOverviewScreen({ Key? key }) : super(key: key);
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    const PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<Cart>(
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            builder: (ctx, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: ch!,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
