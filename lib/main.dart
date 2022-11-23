import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'bloc/locale_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleBloc(),
      child: BlocConsumer<LocaleBloc, LocaleState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
