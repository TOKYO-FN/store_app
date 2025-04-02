import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateItemScreen extends StatelessWidget {
  const UpdateItemScreen({super.key});
  static String id = 'update item screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Update Item", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [CustomTextField.CustomTextFormField(label: 'label')],
      ),
    );
  }
}
