import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatefulWidget {
  static const routeName = '/order';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
   var _ordersFuture;

  Future _obtainOrdersFuture () {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: FutureBuilder(
          future:
              _ordersFuture,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                //handle error
                print(dataSnapshot.error);
                return const Center(child: Text('An error occured'));
              } else {
                return Consumer<Orders>(builder: (ctx, orderData, child) {
                  return ListView.builder(
                    itemBuilder: (ctx, i) {
                      return OrderItem(order: orderData.orders[i]);
                    },
                    itemCount: orderData.orders.length,
                  );
                });
              }
            }
          }),
      drawer: const AppDrawer(),
    );
  }
}
