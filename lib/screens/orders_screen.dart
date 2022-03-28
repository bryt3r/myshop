import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
static const routeName = '/order';

  const OrdersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders'),),
      body: ListView.builder(itemBuilder: (ctx, i) {
        return OrderItem(order: orderData.orders[i]);
      }, itemCount: orderData.orders.length,),
      drawer: const AppDrawer(),
    );
  }
}