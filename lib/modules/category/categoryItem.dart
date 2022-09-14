import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
 Category category;
 int index;
 CategoryItem(this.category,this.index);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: category.colorCode,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(18) ,
            topRight:Radius.circular(18) ,
            bottomLeft: Radius.circular(index%2==0?18:0),
            bottomRight: Radius.circular(index%2!=0?18:0),
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          // EdgeInsets.only(
          //   top:MediaQuery.of(context).size.height*.05 ,
          //   bottom:MediaQuery.of(context).size.height*.05 ,
          //   right: MediaQuery.of(context).size.width*.17,
          //   left: MediaQuery.of(context).size.width*.17,
          // ),
          child: Column(
            children: [
              Image.asset(category.image,
                height: MediaQuery.of(context).size.height*.17,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Center(child: Text(category.title,
                  style:Theme.of(context).textTheme.headline1 ?.copyWith(
                    color: Colors.white,
                    fontSize: 22
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
