import 'package:code_academy_5/controllers/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int value = 500;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.homePage),
        actions: [
          // condition to view widget or not
          if(BlocProvider.of<LangCubit>(context).langCode == 'en')
          TextButton(
            onPressed: (){
              //change language code by changing langCode vairable in cubit
              BlocProvider.of<LangCubit>(context).changeLanguage('ar');
            }, 
            child: Text(
              "Arabic",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          if(BlocProvider.of<LangCubit>(context).langCode == 'ar')
          TextButton(
            onPressed: (){
              //change language code by changing langCode vairable in cubit
              BlocProvider.of<LangCubit>(context).changeLanguage('en');
            }, 
            child: Text(
              "English",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.hello,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.currency(value),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}