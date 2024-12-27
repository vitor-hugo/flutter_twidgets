// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

class EyeIcons {
  EyeIcons._();

  static const _kFontFam = 'EyeIcons';
  static const String? _kFontPkg = null;

  static const IconData eye = IconData(
    0xE800,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  static const IconData eyeClosed = IconData(
    0xE801,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  static const IconData eyeVariant = IconData(
    0xE802,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  static const IconData eyeVariantClosed = IconData(
    0xE803,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );
}
