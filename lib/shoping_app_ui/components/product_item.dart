import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  String? Title, Image, Rating, Price, Discount;
  ProductItem({
    super.key,
    required this.Title,
    required this.Image,
    required this.Price,
    required this.Discount,
    required this.Rating,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isLovedPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // for overlap we need stack widget
            Stack(
              children: [
                //for image

                ClipRRect(
                  child: Image.asset(
                    widget.Image!,
                    height: 200,
                    fit: BoxFit.cover,
                  ), //this image cant be null
                ),
                // for favourite
                Positioned(
                  bottom: 5,
                  right: 3,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isLovedPressed = !isLovedPressed;
                        });
                      },
                      child: Icon(Icons.favorite,
                      color: isLovedPressed ? Colors.red : Colors.black38,
                      ),
                    ),
                  ),
                ),
                //for discount
                Positioned(
                  top: 1,
                  right: 1,
                  child: Container(

                    height: 10,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      widget.Discount!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            //for item name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(widget.Title! , style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //for item price
                Text(widget.Price!, style: TextStyle(fontWeight: FontWeight.bold),),
                Row(

                  children: [
                    //for item rate
                    Icon(Icons.star,size: 15,color: Colors.yellow,),
                    Text(widget.Rating!,style: TextStyle(color: Colors.yellow ),)
                  ],
                )
              ],
            )




          ],
        ),
      ),
    );
  }
}
