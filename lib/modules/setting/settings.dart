import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/modules/setting/settingSheet.dart';


class SettingsScreen extends StatelessWidget {
  static const String routeName="setteng";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 18,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(50),
              bottomLeft: Radius.circular(50),

            )
        ),
        toolbarHeight: MediaQuery.of(context).size.height*.13,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.settings,
          style:TextStyle(
              fontSize: 25
          ) ,),

      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          children: [
            Image.asset("assets/images/pattern.png",fit: BoxFit.cover,height: double.infinity,),
            SettingSheet()
          ],
        ),
      ),
    );
  }
}