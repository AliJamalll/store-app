import 'dart:convert';
import 'package:store_app/helper/api.dart';
import '../models/products_model.dart';
import 'package:http/http.dart' as http; // Corrected import

class AllProductsService{
   Future<List<ProductsModel>> getAllProducts() async{
      List<dynamic> data = await Api().getRequest(url: 'https://fakestoreapi.com/products',);

     List<ProductsModel> productsList = [];

     for(int i= 0;i < data.length; i++){
        productsList.add(ProductsModel.fromJson(data[i]));
     }
     return productsList;
  }

}