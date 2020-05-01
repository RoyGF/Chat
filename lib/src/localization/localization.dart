import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localization {
  /// [defaultLocaleCode] should be changed if 'en' is not default
  static const defaultLocaleCode = 'en';

  ///array of supported locale codes, default should be first
  static const localeArray = [defaultLocaleCode];

  /// get list of locales of codes
  static List<Locale> getSupportedLocales() {
    var list = new List<Locale>();
    localeArray.forEach((locale) => list.add(Locale(locale, '')));
    return list;
  }

  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  /// [localizedValues] map of code and map of values
  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'app_name': 'Simple Chat',
      'hello_world': 'hello, world!!',
      'contact_page_title': 'Contacts'
      },
    'es': {
      'app_name': 'Simple Chat',
      'hello_world': 'Hola, mundo!!',
      'contact_page_title': 'Contactos'
      }
  };

  /// get value by key in some locale
  String getValue(String key) {
    if (localizedValues.containsKey(locale.languageCode)) {
      if (localizedValues[locale.languageCode].containsKey(key)) {
        return localizedValues[locale.languageCode][key];
      } else
        throw new LocalizationException("No such key: " + key);
    } else
      throw new LocalizationException("No supported localization");
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  @override
  bool isSupported(Locale locale) =>
      Localization.localeArray.contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    // Returning a Synchronous Future here because an async "load"
    // operation isn't needed to produce an instance of Localization.
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

/// custon exception for throwing in [Localization] class
class LocalizationException implements Exception {
  final String msg;

  /// constructor of exception
  LocalizationException(this.msg);
}
