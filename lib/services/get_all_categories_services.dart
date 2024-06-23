import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

import '../models/products_model.dart'; // Corrected import
import 'dart:convert';


class AllCategoriesService{

  Future<List<dynamic>> getAllCategories() async{

    List<dynamic> data= await Api().getRequest(url: "https://fakestoreapi.com/products/categories");

      return data;
    }
  }