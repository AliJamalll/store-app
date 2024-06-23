import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';

import '../screens/update_products_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key, required this.productsModel});

  ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductsPage.id,arguments: productsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 0,
                      offset: const Offset(10,10)
                  )
                ]
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsModel.title.substring(0,6),
                      style: const TextStyle(color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${productsModel.price.toString()}",
                          style: const TextStyle(color: Colors.black87,
                              fontSize: 16
                          ),
                        ),
                        const Icon(Icons.favorite,color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 75,
            bottom: 90,
            child: Image.network(
              productsModel.image
              ,height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
