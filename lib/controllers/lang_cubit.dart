import 'package:bloc/bloc.dart';
import 'package:code_academy_5/controllers/lang_state.dart';
import 'package:code_academy_5/local/cache.dart';

class LangCubit extends Cubit<LangStates>{
  String langCode = "ar";

  LangCubit() : super(InitLangState());

  void changeLanguage(String code){
    langCode = code;
    Cache.saveLanguage(code);
    emit(ChangeLangState());
  }

  void getFromCache(){
    String? langFromCache = Cache.getLanguage();
    if(langFromCache != null){
      langCode = langFromCache;
      emit(ChangeLangState());
    }
  }

}