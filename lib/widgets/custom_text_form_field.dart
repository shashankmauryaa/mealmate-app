import 'package:flutter/material.dart';
import 'package:mealmate/core/app_export.dart';

class CustomTextFormField extends StatefulWidget {
  final Alignment? alignment;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
      alignment: widget.alignment!,
      child: textFormFieldWidget,
    )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
    width: widget.width ?? double.maxFinite,
    child: TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode ?? FocusNode(),
      autofocus: widget.autofocus!,
      style: widget.textStyle ?? CustomTextStyles.headlineSmallRegular,
      obscureText: widget.obscureText!,
      textInputAction: widget.textInputAction!,
      keyboardType: widget.textInputType!,
      maxLines: widget.maxLines ?? 1,
      onChanged: widget.onChanged,
      decoration: decoration,
      validator: widget.validator,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: widget.hintText ?? "",
    hintStyle: widget.hintStyle ?? CustomTextStyles.headlineSmallGray600,
    prefixIcon: widget.prefix,
    prefixIconConstraints: widget.prefixConstraints,
    suffixIcon: widget.suffix,
    suffixIconConstraints: widget.suffixConstraints,
    isDense: true,
    contentPadding: widget.contentPadding ?? EdgeInsets.all(14.h),
    fillColor: widget.fillColor ?? appTheme.whiteA700,
    filled: widget.filled!,
    border: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.h),
          borderSide: BorderSide.none,
        ),
    enabledBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.h),
          borderSide: BorderSide.none,
        ),
    focusedBorder: widget.borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.h),
          borderSide: BorderSide.none,
        ),
  );
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillSecondaryContainer => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.h),
    borderSide: BorderSide.none,
  );
}
