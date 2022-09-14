import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/myProvider.dart';
import '../../shared/styles/my_theme.dart';

class SettingSheet extends StatefulWidget {

  @override
  State<SettingSheet> createState() => _SettingSheetState();
}

class _SettingSheetState extends State<SettingSheet> {
  bool selected=false;
  // late var provider;
  @override
  Widget build(BuildContext context) {
     var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),

              ),
              child: InkWell(
                onTap: (){
                  showChiceLanguage();
                },
                child: Row(
                  children: [
                    Text(provider.AppLanguage=="en"?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic
                    ,style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down,size: 30,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  showChiceLanguage(){
    showDialog(context: context,
        builder: (context){
          var provider=Provider.of<MyProvider>(context);
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height *.20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                      onTap: (){
                        // provider.AppLanguage('en');
                        provider.changeLanguage('en');
                      },
                      child: ShowLanguageSelected(AppLocalizations.of(context)!.english,provider.AppLanguage=="en"?true:false)),
                  SizedBox(height: 5,),
                  Divider(height: 15,thickness: 2),
                  InkWell(
                      onTap: (){
                        provider.changeLanguage("ar");
                      },
                      child: ShowLanguageSelected(
                          AppLocalizations.of(context)!.arabic,provider.AppLanguage=='ar'?true: false)),                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text(provider.AppLanguage=="en"?"OK":"حسنا"))
            ],
          );
        });
  }

  Widget ShowLanguageSelected(String text, bool selected) {
    var provider=Provider.of<MyProvider>(context);
    if (selected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$text',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: MyThemeData.primaryColor,
                  fontSize: 20
              )),
          Icon(
            Icons.check,
            color: MyThemeData.primaryColor,
          ),
        ],
      );
      //Not selected black color
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$text', style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 20
          )),
          Icon(Icons.check,
            color:
            MyThemeData.BlackColor),
        ],
      );
    }
  }
}
