// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TButtonType {
  filled,
  tonal,
  outlined,
  elevated,
}

class TButton extends StatelessWidget {
  final TButtonType _type;

  // MARK: Filled
  const TButton({
    super.key,
    required this.onPress,
    this.onLongPress,
    this.label = '',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.iconSize = 22,
    this.iconAlignment = IconAlignment.start,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.elevation = 0,
    this.disabled = false,
    this.loading = false,
    this.loadingLabel = '',
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.disabledIconColor,
    this.focusNode,
    this.canRequestFocus = true,
    this.autofocus = false,
  })  : _type = TButtonType.filled,
        borderThickness = 0,
        borderColor = Colors.transparent,
        disabledBorderColor = Colors.transparent;

  // MARK: Tonal
  const TButton.tonal({
    super.key,
    required this.onPress,
    this.onLongPress,
    this.label = '',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.iconSize = 22,
    this.iconAlignment = IconAlignment.start,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.elevation = 0,
    this.disabled = false,
    this.loading = false,
    this.loadingLabel = '',
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.disabledIconColor,
    this.focusNode,
    this.canRequestFocus = true,
    this.autofocus = false,
  })  : _type = TButtonType.tonal,
        borderThickness = 0,
        borderColor = Colors.transparent,
        disabledBorderColor = Colors.transparent;

  // MARK: Outlined
  const TButton.outlined({
    super.key,
    required this.onPress,
    this.onLongPress,
    this.label = '',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.iconSize = 22,
    this.iconAlignment = IconAlignment.start,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.borderThickness = 1,
    this.disabled = false,
    this.loading = false,
    this.loadingLabel = '',
    this.foregroundColor,
    this.iconColor,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.borderColor,
    this.disabledForegroundColor,
    this.disabledIconColor,
    this.disabledBorderColor,
    this.focusNode,
    this.canRequestFocus = true,
    this.autofocus = false,
  })  : _type = TButtonType.outlined,
        backgroundColor = Colors.transparent,
        disabledBackgroundColor = Colors.transparent,
        elevation = 0;

  // MARK: Elevated
  const TButton.elevated({
    super.key,
    required this.onPress,
    this.onLongPress,
    this.label = '',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.icon,
    this.iconSize = 22,
    this.iconAlignment = IconAlignment.start,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.elevation = 1,
    this.disabled = false,
    this.loading = false,
    this.loadingLabel = '',
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.disabledIconColor,
    this.focusNode,
    this.canRequestFocus = true,
    this.autofocus = false,
  })  : _type = TButtonType.elevated,
        borderThickness = 0,
        borderColor = Colors.transparent,
        disabledBorderColor = Colors.transparent;

  // MARK: Properties

  final VoidCallback onPress;
  final VoidCallback? onLongPress;

  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final double iconSize;
  final IconAlignment iconAlignment;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  final double borderThickness;
  final BorderRadiusGeometry borderRadius;
  final double elevation;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? hoverColor;

  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? disabledIconColor;
  final Color? disabledBorderColor;

  final bool disabled;
  final bool loading;
  final String loadingLabel;

  final FocusNode? focusNode;
  final bool canRequestFocus;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final double minHeight = height ?? 40;
    final double minWidth = width ?? 64;

    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      ignoring: disabled || loading,
      child: Padding(
        //MARK: Margin
        padding: margin,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: width ?? double.infinity,
            minHeight: minHeight,
            maxHeight: height ?? double.infinity,
          ),
          child: Container(
            // MARK: Border
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(
                color: _resolveBorderColor(colorScheme),
                width: _resolveBorderThickness(colorScheme),
              ),
            ),
            child: Material(
              type: MaterialType.button,
              borderRadius: borderRadius,
              clipBehavior: Clip.antiAlias,
              elevation: disabled ? 0 : elevation,
              color: _resolveBackgroundColor(colorScheme),
              child: InkWell(
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 124));
                  onPress();
                },
                onLongPress: onLongPress,
                splashColor: _resolveSplashColor(colorScheme),
                highlightColor: _resolveHighlightColor(colorScheme),
                focusNode: focusNode,
                canRequestFocus: (disabled || loading) ? false : canRequestFocus,
                autofocus: autofocus,
                focusColor: _resolveForegroundColor(colorScheme).withValues(alpha: 0.13),
                hoverColor: hoverColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // MARK: Icon + Label
                    Positioned(
                      child: AnimatedOpacity(
                        opacity: loading && !disabled ? 0 : 1,
                        duration: const Duration(milliseconds: 80),
                        child: Padding(
                          padding: padding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            textDirection: _resolveIconAlighment(),
                            children: [
                              // Icon
                              if (icon != null)
                                Icon(
                                  icon,
                                  size: iconSize,
                                  color: _resolveIconColor(colorScheme),
                                ),

                              if (icon != null && label.isNotEmpty) const SizedBox(width: 8),

                              // Label
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: fontWeight,
                                  color: _resolveForegroundColor(colorScheme),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // MARK: Loading indicator
                    Positioned(
                      child: AnimatedOpacity(
                        opacity: loading && !disabled ? 1 : 0,
                        duration: const Duration(milliseconds: 80),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            textDirection: _resolveIconAlighment(),
                            children: [
                              _resolveLoadingIndicator(colorScheme),
                              if (loadingLabel.isNotEmpty) const SizedBox(width: 8),
                              if (loadingLabel.isNotEmpty)
                                Text(
                                  loadingLabel,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: fontWeight,
                                    color: _resolveForegroundColor(colorScheme),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // MARK: Resolvers

  Color _resolveBorderColor(ColorScheme colorScheme) {
    if (_type != TButtonType.outlined) return Colors.transparent;

    if (disabled) {
      return disabledBorderColor ?? colorScheme.outlineVariant.withValues(alpha: 0.5);
    }
    return borderColor ?? colorScheme.outline;
  }

  double _resolveBorderThickness(ColorScheme colorScheme) {
    if (_type != TButtonType.outlined) return 0;
    return borderThickness > 0 ? borderThickness : 1;
  }

  Color _resolveSplashColor(ColorScheme colorScheme) {
    return splashColor ?? _resolveForegroundColor(colorScheme).withValues(alpha: 0.1);
  }

  Color _resolveHighlightColor(ColorScheme colorScheme) {
    return highlightColor ?? _resolveForegroundColor(colorScheme).withValues(alpha: 0.1);
  }

  Color _resolveBackgroundColor(ColorScheme colorScheme) {
    if (disabled) {
      return _resolveDisabledBackgroundColor(colorScheme);
    }

    switch (_type) {
      case TButtonType.outlined:
        return Colors.transparent;

      case TButtonType.tonal:
        return backgroundColor ?? colorScheme.secondaryContainer;

      case TButtonType.elevated:
        return backgroundColor ?? colorScheme.surfaceContainer;

      case TButtonType.filled:
        return backgroundColor ?? colorScheme.primary;
    }
  }

  Color _resolveDisabledBackgroundColor(ColorScheme colorScheme) {
    switch (_type) {
      case TButtonType.outlined:
        return Colors.transparent;

      case TButtonType.tonal:
      case TButtonType.elevated:
      case TButtonType.filled:
        return disabledBackgroundColor ?? colorScheme.surfaceContainerLow;
    }
  }

  Color _resolveForegroundColor(ColorScheme colorScheme) {
    if (disabled) {
      return disabledForegroundColor ?? colorScheme.onSurface.withValues(alpha: 0.4);
    }

    switch (_type) {
      case TButtonType.outlined:
      case TButtonType.elevated:
        return foregroundColor ?? colorScheme.primary;

      case TButtonType.tonal:
        return foregroundColor ?? colorScheme.onSecondaryContainer;

      case TButtonType.filled:
        return foregroundColor ?? colorScheme.onPrimary;
    }
  }

  Color _resolveIconColor(ColorScheme colorScheme) {
    if (disabled) {
      return disabledIconColor ?? _resolveForegroundColor(colorScheme).withValues(alpha: 0.14);
    }
    return iconColor ?? _resolveForegroundColor(colorScheme).withValues(alpha: 0.5);
  }

  TextDirection _resolveIconAlighment() {
    if (iconAlignment == IconAlignment.start) {
      return TextDirection.ltr;
    } else {
      return TextDirection.rtl;
    }
  }

  Widget _resolveLoadingIndicator(ColorScheme colorScheme) {
    final color = _resolveIconColor(colorScheme);

    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(color: color)
          : CircularProgressIndicator(
              strokeWidth: 2.5,
              color: color,
              strokeAlign: BorderSide.strokeAlignInside,
              strokeCap: StrokeCap.round,
            ),
    );
  }
}
