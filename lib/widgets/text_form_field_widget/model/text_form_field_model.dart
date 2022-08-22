import 'package:flutter/material.dart';

class TextFormFieldModel {
  final String? hintText;
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final bool? obscureText;
  bool? autofocus=false;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextInputType? textInputType;
  final BorderRadius? borderRadius;
  final Color? colorBorder;

  final Color? backgroundColor;

  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  String? initialValue = '';

  TextFormFieldModel({
    required this.hintText,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.textInputType,
    this.borderRadius,
    this.colorBorder = Colors.black,
    this.contentPadding,
    this.backgroundColor,
    this.textStyle,
    this.initialValue,
    this.autofocus,
  });
}
