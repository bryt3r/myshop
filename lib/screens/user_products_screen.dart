import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return Column(
              children: [
                UserProductItem(
                  id: productsData.items[i].id,
                  title: productsData.items[i].title,
                  imageUrl: productsData.items[i].imageUrl,
                ),
                const Divider()
              ],
            );
          },
          itemCount: productsData.items.length,
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
