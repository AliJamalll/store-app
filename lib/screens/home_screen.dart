import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_all_prouducts_service.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(FontAwesomeIcons.cartPlus)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 95,left: 16.0,right: 16),
        child: FutureBuilder<List<ProductsModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<ProductsModel> products = snapshot.data!;
              return GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100
                  ),
                  itemBuilder: (context,index){
                    return CustomCard(productsModel: products[index],);
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      )
    );
  }
}

