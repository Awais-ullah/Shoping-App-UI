import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String? Title, Image, Rating, Price, Discount, Description;
  DetailScreen({
    super.key,
    required this.Title,
    required this.Image,
    required this.Price,
    required this.Discount,
    required this.Rating,
    required this.Description,
  });

  @override
  State<DetailScreen> createState() => _ProductItemState();
}

class _ProductItemState extends State<DetailScreen> {
  int selectedIndex = -1; //-1 mean default value, assume non is selected
  int selectecColorIncdx = -1; //same
  //for size
  List<String> size = [
    'XS',
    'M',
    'L',
    'XL',
    'XXL',
    '3XL',
  ];
  //for color
  List<MaterialColor> colorItem = [
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(bottom: 50,left: 10,right: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
               backgroundColor: Colors.black
            ),
            onPressed: (){},
            child: Text('Add to Cart',style: TextStyle(
                color: Colors.white,
                fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: h / 2,
                    width: w / 1.01,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(11),
                        bottomLeft: Radius.circular(11),
                      ),
                      image: DecorationImage(
                        image:
                        AssetImage(widget.Image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Positioned(child: Icon(Icons.arrow_back, size: 25)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.Title!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Row(
                      children: [
                        //for item price
                        Text(
                          widget.Price!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            //for item rate
                            Icon(Icons.star, size: 15, color: Colors.yellow),
                            Text(
                              widget.Rating!,
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.Description!,
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 10),
                    //for Size
                    selectedSize(h),
                    //for colors
                    Row(
                      children: [
                        Text(
                          'Available size',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: h/4,
                          child: Center(
                            child: ListView.builder(
                              itemCount: colorItem.length,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,

                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectecColorIncdx = index;
                                      });
                                    },

                                   child: Container(
                                     width: 50,
                                     decoration: BoxDecoration(
                                       color: selectecColorIncdx == index?
                                           Colors.blue[300] : Colors.white
                                     ),
                                     child: CircleAvatar(
                                       backgroundColor: colorItem[index],
                                     ),
                                   ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row selectedSize(double h) {
    return Row(
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: h/3,
                        child: Center(
                          child: ListView.builder(
                            itemCount: size.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,

                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 8),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black54,
                                    backgroundColor: selectedIndex == index ? Colors.blue[300] : Colors.white
                                  ),
                                  child: Text(
                                    size[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
  }
}
