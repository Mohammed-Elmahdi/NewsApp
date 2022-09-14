import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/myProvider.dart';
import '../setting/settings.dart';
import 'package:provider/provider.dart';


class HomeDrawer extends StatelessWidget {
 Function onMenuItemClicked;
 HomeDrawer(this.onMenuItemClicked);
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    var size=MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width*.7,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 70),
            width: double.infinity,
            child:
            Center(
                child: Text(AppLocalizations.of(context)!.news_app,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 28,
                  color: Colors.white
            ),)) ,
          ),
          InkWell(
            onTap: (){
              onMenuItemClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 5,),
                  Text(AppLocalizations.of(context)!.categories,style: TextStyle(fontSize: 21),)
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                Icon(Icons.settings,),
                SizedBox(width: 5,),
                Text(AppLocalizations.of(context)!.settings,style: TextStyle(fontSize: 21),)
              ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
