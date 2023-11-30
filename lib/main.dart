import 'package:code_academy_5/controllers/lang_cubit.dart';
import 'package:code_academy_5/controllers/lang_state.dart';
import 'package:code_academy_5/local/cache.dart';
import 'package:code_academy_5/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LangCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LangCubit>(context).getFromCache();
  }

  @override
  Widget build(BuildContext context) {
    // bloc builder here so if language changed it rebuilds whole app
    return BlocBuilder<LangCubit, LangStates>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(BlocProvider.of<LangCubit>(context).langCode),
        );
      }
    );
  }
}