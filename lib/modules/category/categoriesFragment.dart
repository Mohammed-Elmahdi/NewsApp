import 'package:flutter/material.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/modules/category/categoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/myProvider.dart';
import 'package:provider/provider.dart';

class CategoriesFragment extends StatelessWidget {
  // var categories=Category.getCategories();
  //list from category model
  late var categories;
  Function onCategoryClicked; //Function callback***************
  CategoriesFragment(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    categories=
       [
        Category(
            'sports',
            AppLocalizations.of(context)!.sports,
            'assets/images/sports.png',
            Color(0xFFC91C22)),
        Category(
            'technology',
            AppLocalizations.of(context)!.technology,
            'assets/images/Politics.png', Color(0xFF003E90)),
        Category(
            'health',
            AppLocalizations.of(context)!.health,
            'assets/images/health.png', Color(0xFFED1E79)),
        Category(
            'business',
            AppLocalizations.of(context)!.business,
            'assets/images/bussines.png', Color(0xFFCF7E48)),
        Category(
            'science',
            AppLocalizations.of(context)!.science,
            'assets/images/science.png', Color(0xFFF2D352)),
        Category(
            'entertainment',
            AppLocalizations.of(context)!.entertainment,
            'assets/images/environment.png', Color(0xFF4882CF)),

      ];
     var pro=Provider.of<MyProvider>(context);
    return
      Stack(
        children: [
          Image.asset('assets/images/pattern.png',fit: BoxFit.cover,height: double.infinity),
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 8,),
                Text(pro.AppLanguage=='en'?'Choose category':'اختر الفئة',
                style:Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: 25
                ) ,
                ),
                SizedBox(height: 5,),
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
          ),
        ],
      );
  }
}
