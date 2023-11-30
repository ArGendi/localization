import 'package:bloc/bloc.dart';
import 'package:code_academy_5/controllers/lang_state.dart';
import 'package:code_academy_5/local/cache.dart';

class LangCubit extends Cubit<LangStates>{
  String langCode = "ar"; // Global variable that change language in main

  LangCubit() : super(InitLangState());

  // Change language in both variable and save it in shared preferences
  void changeLanguage(String code){
    langCode = code;
    Cache.saveLanguage(code);
    emit(ChangeLangState());
  }

  // read last saved value of language from shared preferences
  void getFromCache(){
    String? langFromCache = Cache.getLanguage();
    if(langFromCache != null){
      langCode = langFromCache;
      emit(ChangeLangState());
    }
  }

}