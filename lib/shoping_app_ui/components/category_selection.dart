import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoping_app/shoping_app_ui/Models/categories_model.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
int selectedIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //for categories selected
        CategorySelected(context),
        //for our product sort by
        ourProducts()
      ],
    );
  }
//for our product sort by
  Padding ourProducts() {
    return Padding(
        padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Row(
          children: [
            Text('Our Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Expanded(child: Container()),
            Text('Sort by' ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
      );
  }
//for categories selected
  SizedBox CategorySelected(BuildContext context) {
    return SizedBox(
        height: 35,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: categoriesModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){

          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex= index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[ selectedIndex ==index ? BoxShadow(
                    color: Colors.black,
                    blurRadius: 9,
                    offset: Offset(1, -1))
                  : BoxShadow()
               ] ) ,

                width: 90,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset('${categoriesModel[index].image}',
                      height: 30,

                      ),
                    ),
                    SizedBox(width: 5,),
                    Text('${categoriesModel[index].title}',
                    style: TextStyle(color:
                    selectedIndex == index ? Colors.red : Colors.black,
                        fontWeight: FontWeight.bold,
                    fontSize: 12
                    ),
                    )



                  ],
                ),
              ),
            ),
          );
        }),
      );
  }
}
