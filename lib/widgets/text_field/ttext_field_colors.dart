// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:twidgets/widgets/models/tbase_colors.dart';

class TTextFieldColors extends TBaseColors {
  TTextFieldColors({
    super.background,
    super.foreground,
    super.icon,
    super.border,
    super.shadow,
    this.placeholder,
    this.hint,
    this.progressBackground,
    this.progressForeground,
    this.cursor,
  });

  final Color? hint;
  final Color? placeholder;
  final Color? progressForeground;
  final Color? progressBackground;
  final Color? cursor;
}
