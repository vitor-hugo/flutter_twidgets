// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class TTextFieldAction extends StatelessWidget {
  const TTextFieldAction({
    required this.onTap,
    required this.icon,
    this.iconSize = 24,
    this.color,
    this.disabled = false,
    super.key,
  });

  final VoidCallback onTap;
  final IconData icon;
  final double iconSize;
  final bool disabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final baseColor = color ?? colorScheme.onSurface;

    return IgnorePointer(
      ignoring: disabled,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: double.infinity,
          maxHeight: double.infinity,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Material(
            color: Colors.transparent,
            type: MaterialType.button,
            child: InkWell(
              onTap: onTap,
              highlightColor: baseColor.withValues(alpha: 0.1),
              splashColor: baseColor.withValues(alpha: 0.2),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: baseColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
