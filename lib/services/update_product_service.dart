import '../helper/api.dart';
import '../models/products_model.dart';

class UpdateProductService{
  Future<ProductsModel> UpdateProduct({
    required String title,
    required int id,
    required String price,
    required String description,
    required String image,
    required String category
  })async{
    print('product id = $id');
    Map<String,dynamic> data = await Api().putRequest(
      url: 'https://fakestoreapi.com/products/$id',
      body:{
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductsModel.fromJson(data);
  }
}