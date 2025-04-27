// Copyright (c) 2024 Vitor Hugo de Oliveira. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:twidgets/icons/eye_icons.dart';
import 'package:twidgets/widgets/text_field/ttext_field_action.dart';
import 'package:twidgets/widgets/text_field/ttext_field_colors.dart';
import 'package:twidgets/widgets/text_field/ttext_field_style.dart';

class TTextField extends StatefulWidget {
  const TTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.placeholder = '',
    this.icon,
    this.style = const TTextFieldStyle(),
    this.disabled = false,
    this.loading = false,
    this.obscureText = false,
    this.showObscureTextToggler = false,
    this.clearable = false,
    this.onClear,

    // Hint and Error messages
    this.hint = '',
    this.error = false,
    this.errorMessage = '',
    this.clearErrorOnChange = false,

    // Actions
    this.leadingActions = const [],
    this.trailingActions = const [],

    // Input options
    this.undoController,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLength,
    this.onEditingComplete,
    this.onChanged,
    this.onTapOutside,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorOpacityAnimates = true,
    this.cursorColor,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String placeholder;
  final IconData? icon;
  final TTextFieldStyle style;
  final bool disabled;
  final bool loading;
  final bool obscureText;
  final bool showObscureTextToggler;
  final bool clearable;
  final VoidCallback? onClear;
  final String hint;
  final bool error;
  final String errorMessage;
  final bool clearErrorOnChange;
  final List<TTextFieldAction> leadingActions;
  final List<TTextFieldAction> trailingActions;
  final UndoHistoryController? undoController;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLength;
  final VoidCallback? onEditingComplete;
  final void Function(dynamic)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius cursorRadius;
  final bool cursorOpacityAnimates;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TTextField> createState() => _TTextFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty<TextEditingController>('controller', controller, defaultValue: null));
    properties.add(DiagnosticsProperty<FocusNode>('focusNOde', focusNode, defaultValue: null));
    properties.add(StringProperty('placeholder', placeholder, defaultValue: ''));
    properties.add(DiagnosticsProperty<IconData>('icon', icon, defaultValue: null));
    properties.add(DiagnosticsProperty<TTextFieldStyle>('style', style, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('disabled', disabled, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('loading', loading, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('obscureText', obscureText, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('showObscureTextToggler', showObscureTextToggler, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('clearable', clearable, defaultValue: false));
    properties.add(StringProperty('hint', hint, defaultValue: ''));
    properties.add(DiagnosticsProperty<bool>('error', error, defaultValue: false));
    properties.add(StringProperty('errorMessage', errorMessage, defaultValue: ''));
    properties.add(DiagnosticsProperty<bool>('clearErrorOnChange', clearErrorOnChange, defaultValue: false));
    properties.add(DiagnosticsProperty<List<TTextFieldAction>>('leadingActions', leadingActions, defaultValue: []));
    properties.add(DiagnosticsProperty<List<TTextFieldAction>>('trailingActions', trailingActions, defaultValue: []));
    properties.add(DiagnosticsProperty<UndoHistoryController>('undoController', undoController, defaultValue: null));
    properties.add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType, defaultValue: TextInputType.text));
    properties.add(DiagnosticsProperty<TextInputAction>('textInputAction', textInputAction, defaultValue: null));
    properties.add(DiagnosticsProperty<TextCapitalization>('textCapitalization', textCapitalization,
        defaultValue: TextCapitalization.none));
    properties.add(DiagnosticsProperty<TextAlignVertical>('textAlignVertical', textAlignVertical, defaultValue: null));
    properties.add(DiagnosticsProperty<TextDirection>('textDirection', textDirection, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('readOnly', readOnly, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('showCursor', showCursor, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus, defaultValue: false));
    properties.add(DiagnosticsProperty<String>('obscuringCharacter', obscuringCharacter, defaultValue: '•'));
    properties.add(DiagnosticsProperty<bool>('autocorrect', autocorrect, defaultValue: false));
    properties.add(DiagnosticsProperty<bool>('enableSuggestions', enableSuggestions, defaultValue: false));
    properties.add(DiagnosticsProperty<int>('maxLength', maxLength, defaultValue: null));
    properties.add(DiagnosticsProperty<VoidCallback>('onEditingComplete', onEditingComplete, defaultValue: null));
    properties.add(DiagnosticsProperty<void Function(dynamic)>('onChanged', onChanged, defaultValue: null));
    properties.add(DiagnosticsProperty<double>('cursorWidth', cursorWidth, defaultValue: 2.0));
    properties.add(DiagnosticsProperty<double>('cursorHeight', cursorHeight, defaultValue: null));
    properties.add(DiagnosticsProperty<Radius>('cursorRadius', cursorRadius, defaultValue: const Radius.circular(2.0)));
    properties.add(DiagnosticsProperty<bool>('cursorOpacityAnimates', cursorOpacityAnimates, defaultValue: true));
    properties.add(DiagnosticsProperty<Color>('cursorColor', cursorColor, defaultValue: null));
    properties
        .add(DiagnosticsProperty<List<TextInputFormatter>>('inputFormatters', inputFormatters, defaultValue: null));

    super.debugFillProperties(properties);
  }
}

class _TTextFieldState extends State<TTextField> {
  late TextEditingController _effectiveController;
  late FocusNode _focusNode;
  late ColorScheme _colorScheme;
  late bool _obscureText;
  late TTextFieldColors _colors;

  late bool _showError;
  late String _errorMessage;

  bool showPlaceholder = true;

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _obscureText = widget.obscureText;
    _showError = widget.error;
    _errorMessage = widget.errorMessage.trim();
  }

  @override
  Widget build(BuildContext context) {
    _colorScheme = Theme.of(context).colorScheme;

    final double minWidth = widget.style.width ?? double.infinity;
    final double minHeight = widget.style.height ?? 40;

    _colors = _resolveColors();

    return GestureDetector(
      onTap: () {
        if (widget.disabled || widget.loading) {
          return;
        }
        _focusNode.requestFocus();
      },
      // MARK: Main Body
      child: Padding(
        padding: widget.style.margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            // MARK: Field Container
            //
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: minWidth,
                minHeight: minHeight,
              ),
              child: AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                color: _colors.background!,
                shadowColor: _colors.shadow!,
                borderRadius: widget.style.borderRadius ?? BorderRadius.circular(minHeight / 4.6),
                clipBehavior: Clip.none,
                elevation: widget.style.elevation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: widget.style.borderRadius ?? BorderRadius.circular(minHeight / 4.6),
                    border: Border.all(
                      color: widget.style.borderWidth > 0 ? _colors.border! : Colors.transparent,
                      width: widget.style.borderWidth,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),

                  //
                  // MARK: Stack
                  //
                  child: Stack(
                    children: [
                      if (widget.loading && !widget.disabled) _linearProgressIndicator(minHeight),
                      SizedBox(
                        width: minWidth,
                        height: minHeight,
                        //
                        // MARK: Main Row
                        //
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ..._resolveCustomActions(widget.leadingActions),
                            //
                            // MARK: Icon/Field Row
                            //
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: widget.style.horizontalPadding,
                                ),
                                child: Row(
                                  children: [
                                    if (widget.icon != null)
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: _icon(minHeight),
                                      ),
                                    _textField(minHeight),
                                  ],
                                ),
                              ),
                            ),

                            // MARK: Actions
                            if (widget.obscureText && widget.showObscureTextToggler) _obscureTextToggler(),
                            if (widget.clearable) _clearTextAction(),
                            ..._resolveCustomActions(widget.trailingActions),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //
            // MARK: Messages Spot
            //
            _hintMessage(),
            _errorMessageContainer(),
          ],
        ),
      ),
    );
  }

  //
  //
  //
  // MARK: WIDGETS
  //
  //
  //

  // MARK: Icon
  Widget _icon(double size) {
    return SizedBox(
      width: widget.style.iconSize,
      height: size,
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          widget.icon,
          size: widget.style.iconSize,
          color: _colors.icon,
        ),
      ),
    );
  }

  // MARK: Text Field
  Widget _textField(double height) {
    return Flexible(
      child: SizedBox(
        height: height,
        child: CupertinoTextField(
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: !widget.disabled && !widget.loading,
          placeholder: widget.placeholder,
          maxLines: 1,
          padding: const EdgeInsets.all(0),
          onChanged: (value) {
            if (widget.clearErrorOnChange) {
              _showError = false;
            }
            setState(() {});
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onTapOutside: (pointer) {
            FocusScope.of(context).requestFocus(FocusNode());
            if (widget.onTapOutside != null) {
              widget.onTapOutside!(pointer);
            }
          },
          style: TextStyle(
            fontFamily: widget.style.fontFamily,
            fontSize: widget.style.fontSize,
            fontWeight: widget.style.fontWeight,
            letterSpacing: widget.style.letterSpacing,
            color: _colors.foreground,
          ),
          placeholderStyle: TextStyle(
            fontFamily: widget.style.fontFamily,
            fontSize: widget.style.fontSize,
            fontWeight: widget.style.fontWeight,
            letterSpacing: widget.style.letterSpacing,
            color: _colors.placeholder,
          ),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: null,
          ),
          undoController: widget.undoController,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          textAlignVertical: widget.textAlignVertical,
          textDirection: widget.textDirection,
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          autofocus: widget.autofocus,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: _obscureText,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorOpacityAnimates: widget.cursorOpacityAnimates,
          cursorColor: widget.cursorColor,
          inputFormatters: widget.inputFormatters,
        ),
      ),
    );
  }

  // MARK: Linear Progress
  Widget _linearProgressIndicator(double size) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          height: 2,
          child: LinearProgressIndicator(
            value: null,
            color: _colors.progressForeground,
            backgroundColor: _colors.progressBackground,
          ),
        ),
      ),
    );
  }

  // MARK: Hint Text
  Widget _hintMessage() {
    if (widget.hint.trim().isEmpty) {
      return const SizedBox(width: 0, height: 0);
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 2),
        child: Text(
          widget.hint,
          style: TextStyle(
            fontSize: widget.style.hintFontSize,
            fontWeight: widget.style.hintFontWeight,
            fontStyle: widget.style.hintFontStyle,
            color: _colors.hint,
          ),
        ),
      ),
    );
  }

  // MARK: Error message
  Widget _errorMessageContainer() {
    if (_showError == false || _errorMessage.isEmpty) {
      return const SizedBox(width: 0, height: 0);
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 2),
        child: Text(
          _errorMessage,
          style: TextStyle(
            fontSize: widget.style.errorFontSize,
            fontWeight: widget.style.errorFontWeight,
            fontStyle: widget.style.errorFontStyle,
            color: widget.style.errorForeground ?? _colorScheme.error,
          ),
        ),
      ),
    );
  }

  // MARK: Obscrure text toggler
  Widget _obscureTextToggler() {
    return TTextFieldAction(
      onTap: () {
        if (widget.showObscureTextToggler == false) {
          return;
        }

        _obscureText = !_obscureText;
        setState(() {});
      },
      icon: _obscureText == true ? EyeIcons.eyeVariantClosed : EyeIcons.eyeVariant,
    );
  }

  // MARK: Clear text action
  Widget _clearTextAction() {
    bool disabled = _effectiveController.text.isEmpty;
    return TTextFieldAction(
      onTap: () {
        _effectiveController.clear();
        setState(() {});
        if (widget.onClear != null) {
          widget.onClear!();
        }
      },
      icon: Icons.close,
      color: disabled ? _colorScheme.onSurfaceVariant.withValues(alpha: 0.5) : _colorScheme.onSurface,
      disabled: _effectiveController.text.isEmpty,
    );
  }

  // MARK: RESOLVERS
  TTextFieldColors _resolveColors() {
    if (widget.disabled) {
      return _disabledColors();
    }

    if (_showError) {
      return _errorColors();
    }

    if (_focusNode.hasFocus) {
      return _focusedColors();
    }

    return _normalColors();
  }

  TTextFieldColors _disabledColors() {
    final dColors = widget.style.disabledColors;
    return TTextFieldColors(
      background: dColors?.background ?? _colorScheme.surfaceContainer,
      foreground: dColors?.foreground ?? _colorScheme.onSurface.withValues(alpha: 0.5),
      icon: dColors?.icon ?? _colorScheme.onSurface.withValues(alpha: 0.13),
      border: dColors?.border ?? _colorScheme.outlineVariant,
      placeholder: dColors?.placeholder ?? _colorScheme.onSurface.withValues(alpha: 0.13),
      shadow: dColors?.shadow ?? _colorScheme.shadow,
      hint: dColors?.hint ?? _colorScheme.onSurfaceVariant,
      progressBackground: dColors?.progressBackground ?? _colorScheme.onSurfaceVariant.withValues(alpha: 0.2),
      progressForeground: dColors?.progressForeground ?? _colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
    );
  }

  TTextFieldColors _errorColors() {
    final eColors = widget.style.errorColors;
    return TTextFieldColors(
      background: eColors?.background ?? _colorScheme.surfaceContainerLowest,
      foreground: eColors?.foreground ?? _colorScheme.error,
      icon: eColors?.icon ?? _colorScheme.error.withValues(alpha: 0.8),
      border: eColors?.border ?? _colorScheme.error,
      placeholder: eColors?.placeholder ?? _colorScheme.error.withValues(alpha: 0.5),
      shadow: eColors?.shadow ?? _colorScheme.shadow,
      hint: eColors?.hint ?? _colorScheme.onSurfaceVariant,
      progressBackground: eColors?.progressBackground ?? _colorScheme.error.withValues(alpha: 0.2),
      progressForeground: eColors?.progressForeground ?? _colorScheme.error,
      cursor: eColors?.cursor ?? _colorScheme.error,
    );
  }

  TTextFieldColors _focusedColors() {
    final fColors = widget.style.focusedColors;
    return TTextFieldColors(
      background: fColors?.background ?? _colorScheme.surfaceContainerLowest,
      foreground: fColors?.foreground ?? _colorScheme.onSurface,
      icon: fColors?.icon ?? _colorScheme.primary,
      border: fColors?.border ?? _colorScheme.primary,
      placeholder: fColors?.placeholder ?? _colorScheme.onSurface.withValues(alpha: 0.5),
      shadow: fColors?.shadow ?? _colorScheme.shadow,
      hint: fColors?.hint ?? _colorScheme.onSurfaceVariant,
      progressBackground: fColors?.progressBackground ?? _colorScheme.primary.withValues(alpha: 0.2),
      progressForeground: fColors?.progressForeground ?? _colorScheme.primary,
      cursor: fColors?.cursor ?? _colorScheme.primary,
    );
  }

  TTextFieldColors _normalColors() {
    final colors = widget.style.colors;
    return TTextFieldColors(
      background: colors?.background ?? _colorScheme.surfaceContainerLowest,
      foreground: colors?.foreground ?? _colorScheme.onSurface,
      icon: colors?.icon ?? _colorScheme.onSurface.withValues(alpha: 0.5),
      border: colors?.border ?? _colorScheme.outlineVariant,
      placeholder: colors?.placeholder ?? _colorScheme.onSurface.withValues(alpha: 0.5),
      shadow: colors?.shadow ?? _colorScheme.shadow,
      hint: colors?.hint ?? _colorScheme.onSurfaceVariant,
      progressBackground: colors?.progressBackground ?? _colorScheme.primary.withValues(alpha: 0.2),
      progressForeground: colors?.progressForeground ?? _colorScheme.primary,
      cursor: colors?.cursor ?? _colorScheme.primary,
    );
  }

  List<Widget> _resolveCustomActions(List<TTextFieldAction> actions) {
    List<Widget> list = [];

    for (TTextFieldAction action in actions) {
      list.add(
        Opacity(
          opacity: widget.disabled ? 0.5 : 1,
          child: action,
        ),
      );
    }

    return list;
  }
}
