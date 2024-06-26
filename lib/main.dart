import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whisper_offline/core/services/whisper_downloader.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';

import 'generated/l10n.dart';
import 'presentation/views/views.dart';
import 'presentation/providers/providers.dart';
import 'data/repositories/repositories.dart';
import 'app/di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(
                  prefs: sl<SharedPreferences>()
              )
          ),
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(
                modelDownloader: sl<WhisperDownloader>(),
                whisperInf: sl<WhisperInferencer>()
              )
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: Intl.message("appTitle"),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: themeProvider.attrs.colors,
              home: const MyHomePage(),
            );
          },
        )
    );
  }
}

