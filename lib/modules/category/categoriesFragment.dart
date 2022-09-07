import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/modules/category/categoryItem.dart';

class CategoriesFragment extends StatelessWidget {
  var categories=Category.getCategories();//list from category model
  Function onCategoryClicked; //Function callback***************
  CategoriesFragment(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Choose your category',
          style:Theme.of(context).textTheme.headline1?.copyWith(
            fontSize: 25
          ) ,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: categories.length,
                itemBuilder: (c,index){
                  return
                    InkWell(
                      onTap: (){
                        onCategoryClicked(categories[index]);//*******
                      },
                        child: CategoryItem(categories[index],index));
            }
            ),
          ),
        ],
      ),
    );
  }
}
