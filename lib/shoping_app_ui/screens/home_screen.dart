import 'package:flutter/material.dart';
import 'package:shoping_app/shoping_app_ui/Models/product_model.dart';
import 'package:shoping_app/shoping_app_ui/components/category_selection.dart';
import 'package:shoping_app/shoping_app_ui/components/product_item.dart';
import 'package:shoping_app/shoping_app_ui/components/search_bar.dart';
import 'package:shoping_app/shoping_app_ui/screens/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: SafeArea(
          top: true ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for search bar
              TopSearchBar(),
              // for Carefory Selection
              CategorySelection(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    ...ourProducts.map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                Title: e['title'].toString(),
                                Image: e['image'].toString(),
                                Price: e['price'].toString(),
                                Discount: e['discount'].toString(),
                                Rating: e['rating'].toString(),
                                Description: e['description'],
                              ),
                            ),
                          );
                        },
                        child: ProductItem(
                          Title: e['title'].toString(),
                          Image: e['image'].toString(),
                          Price: e['price'].toString(),
                          Discount: e['discount'].toString(),
                          Rating: e['rating'].toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Trending Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    ...trendingProducts.map(
                          (e) => GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder:(context) => DetailScreen(
                                Title: e['title'].toString(),
                                Image:e['image'].toString(),
                                Price: e['price'].toString(),
                                Discount: e['discount'].toString(),
                                Rating: e['rating'].toString(),
                                Description: e['description'],
                              )));
                        },
                        child: ProductItem(
                          Title: e['title'].toString(),
                          Image:e['image'].toString(),
                          Price: e['price'].toString(),
                          Discount: e['discount'].toString(),
                          Rating: e['rating'].toString(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
