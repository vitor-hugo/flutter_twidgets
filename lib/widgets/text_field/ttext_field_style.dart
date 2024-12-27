// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:twidgets/widgets/text_field/ttext_field_colors.dart';

class TTextFieldStyle {
  const TTextFieldStyle({
    this.width,
    this.height,
    this.margin = const EdgeInsets.only(bottom: 4, top: 4),
    this.horizontalPadding = 8,
    this.borderRadius,
    this.borderWidth = 0.5,
    this.elevation = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Roboto',
    this.letterSpacing = 0.25,
    this.textAlign = TextAlign.left,
    this.iconSize = 22,
    this.backdropFilter,
    this.backdropBlendMode = BlendMode.srcOver,

    // Hint Style
    this.hintForeground,
    this.hintFontSize = 12,
    this.hintFontWeight = FontWeight.normal,
    this.hintFontStyle = FontStyle.normal,

    // Error message style
    this.errorForeground,
    this.errorFontSize = 12,
    this.errorFontWeight = FontWeight.normal,
    this.errorFontStyle = FontStyle.normal,

    // Colors
    this.colors,
    this.focusedColors,
    this.disabledColors,
    this.errorColors,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry margin;
  final double horizontalPadding;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final double elevation;

  // TextStyle
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double letterSpacing;
  final TextAlign textAlign;
  final double iconSize;

  // Hint
  final Color? hintForeground;
  final double hintFontSize;
  final FontWeight hintFontWeight;
  final FontStyle hintFontStyle;

  // Error message
  final Color? errorForeground;
  final double errorFontSize;
  final FontWeight errorFontWeight;
  final FontStyle errorFontStyle;

  final TTextFieldColors? colors;
  final TTextFieldColors? focusedColors;
  final TTextFieldColors? disabledColors;
  final TTextFieldColors? errorColors;

  // Backdrop filter
  final ImageFilter? backdropFilter;
  final BlendMode backdropBlendMode;
}
