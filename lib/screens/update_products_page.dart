import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/products_model.dart';

import '../services/update_product_service.dart';
import '../widgets/Custom_Button.dart';
import '../widgets/Custom_textField.dart';

class UpdateProductsPage extends StatefulWidget {
   UpdateProductsPage({super.key});

  static String id = 'UpdateProductsPage';

  @override
  State<UpdateProductsPage> createState() => _UpdateProductsPageState();
}

class _UpdateProductsPageState extends State<UpdateProductsPage> {
  String? productName,desc,image;

  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel = ModalRoute.of(context)!.settings.arguments as ProductsModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChange: (data){
                    productName= data;
                  },
                  hintText: 'Product Name',),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data){
                    desc= data;
                  },
                  hintText: 'description',),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data){
                    price= data;
                  },
                  inputType: TextInputType.number,
                  hintText: 'price',),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data){
                    image= data;
                  },
                  hintText: 'image',),
                SizedBox(
                  height: 50,
                ),
                CustomButton(text: 'UPDATE',
                onPressed: () async{
                  isLoading = true;
                  setState(() {});
                  try{
                   await UpdateProduct(productsModel);
                    print('sccess');
                  }catch (e){
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductsModel productsModel) async{
   await UpdateProductService().UpdateProduct(
        id: productsModel.id,
        title: productName == null ? productsModel.title : productName!,
        price: price == null ? productsModel.price.toString() : price!,
        description: desc == null ? productsModel.description : price!,
        image: image == null ? productsModel.image : image!,
        category: productsModel.category
    );
  }
}

