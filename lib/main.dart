import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/page._route_names.dart';
import 'package:news_app/core/route_generator.dart';
import 'package:news_app/core/settings_provider.dart';
import 'package:news_app/core/theme/application_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      theme: ApplicationThemeManager.lightTheme,
      themeMode: provider.currentThemeMode,
      darkTheme: ApplicationThemeManager.darkTheme,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: PageRouteNames.initial,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
