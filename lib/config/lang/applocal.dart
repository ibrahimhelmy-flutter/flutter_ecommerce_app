import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;
  AppLocale(this.locale);

  Map<String, String>? _loadedloalizedvalue;

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future loadLang() async {
    //الحصول على  ملف الترجمه كامل
    String _langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    //تحويله الى ماب
    Map<String, dynamic> _loadedvalues = jsonDecode(_langFile);
    //convert dynamic value to String
    _loadedloalizedvalue =
        _loadedvalues.map((key, value) => MapEntry(key, value.toString()));
  }

//to get value by key from map
  String? getTranslated(String key) {
    return _loadedloalizedvalue![key];
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  //نسخة واحده
  const _AppLocalDelegate();

  //يسال هل اللغه مدعومه
  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.loadLang();
    return appLocale;
  }

//if there are more one delgate
  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}

String trans(BuildContext context, String key) {
  return AppLocale.of(context).getTranslated(key)!;
}
