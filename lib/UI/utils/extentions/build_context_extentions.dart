import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtentios on BuildContext{
  AppLocalizations get local{
    return AppLocalizations.of(this)!;
  }
}