import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'bloc/locale_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocaleBloc, LocaleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
          title: Text('${AppLocalizations.of(context)?.login}'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                context.read<LocaleBloc>().add(LocalechangeEvent(value));
              },
              itemBuilder: (context) => AppLocalizations.supportedLocales
                  .map((e) => PopupMenuItem(value: e, child: Text('${e}')))
                  .toList(),
            )
          ],
        ));
      },
    );
  }
}
