import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/update_item_screen.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String id = 'HomeScreen';

  bool isLoading = true;
  // Add a loading state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("New Trend", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart_fill)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: FutureBuilder(
          future: AllProductsService().GetAllProductList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 10,
                ),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            UpdateItemScreen.id,
                            arguments: snapshot.data![index],
                          ),
                      child: Item(productModel: snapshot.data![index]),
                    ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        radius: 25,
        child: IconButton(
          onPressed: () async {
            var we = await AddProductService().addProduct(
              title: 'test product',
              price: '13.5',
              description: 'lorem ipsum set',
              image: 'https://i.pravatar.cc',
              category: 'electronic',
            );
            print(we);
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
