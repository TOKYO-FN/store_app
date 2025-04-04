import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateItemScreen extends StatefulWidget {
  const UpdateItemScreen({super.key});
  static String id = 'update item screen';

  @override
  State<UpdateItemScreen> createState() => _UpdateItemScreenState();
}

class _UpdateItemScreenState extends State<UpdateItemScreen> {
  String? price;

  String? productName;

  String? description;

  String? image;

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Update Item", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 12,
            children: [
              CustomTextField(
                label: 'Product Name',
                onChanged: (data) => productName = data,
              ),
              CustomTextField(
                label: 'Description',
                onChanged: (data) => description = data,
              ),
              CustomTextField(
                label: 'Price',
                textInputType: TextInputType.number,
                onChanged: (data) => price = data,
              ),
              CustomTextField(
                label: 'image',
                onChanged: (data) => image = data,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Update Product',
                fun: () {
                  isloading = true;
                  setState(() {});
                  ProductModel productModel =
                      ModalRoute.of(context)!.settings.arguments
                          as ProductModel;

                  try {
                    updateProduct(productModel);
                    print('Success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isloading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel productModel) {
    UpdateProductService().updateProduct(
      title: productName == null ? productModel.title : productName!,
      price: price == null ? productModel.price.toString() : price!,
      description:
          description == null ? productModel.description : description!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
