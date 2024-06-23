import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class CategoriesService{
  Future<List<ProductsModel>> getCategoriesProduct({required String categoryName})async{

    List<dynamic> data= await Api().getRequest(url: "https://fakestoreapi.com/products/category/$categoryName");

   List<ProductsModel> productsList = [];

   for(int i= 0;i < data.length; i++){
     productsList.add(ProductsModel.fromJson(data[i]));
   }
   return productsList;
 }
}
