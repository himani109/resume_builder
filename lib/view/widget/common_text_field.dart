// ignore_for_file: prefer_const_constructors, avoid_print, use_super_parameters


import 'package:resume_builder/utils/text_style.dart';

import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'common_space_divider_widget.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final FocusNode? focusNode;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final bool? autocorrect;
  final Function(String v)? validator;
  final bool? readOnly;
  final String? labelText;
  final String? hintText;
  final String? prefix;
  final Widget? suffix;
  final String? obscuringCharacter;
  final int? maxLines;
  final int? maxLength;
  final Color? bColor;
  final Color? textColor;
  final Color? filledColor;
  final bool? isFilledColor;

  const CommonTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.onChanged,
    this.obscuringCharacter,
    this.onTap,
    this.validator,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.maxLines = 1,
    this.maxLength,
    this.bColor,
    this.filledColor,
    this.isFilledColor,
    this.textColor,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final TextAlign textAlign = TextAlign.start;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    setState(() {});
  }

  String err = '';
  double radius = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.labelText == '' || widget.labelText == null
            ? verticalSpace(0)
            : Text(
                widget.labelText!,
                style: pMedium12.copyWith(color: AppColor.cBlack),
              ),
        widget.labelText == '' || widget.labelText == null ? verticalSpace(0) : verticalSpace(8),
        Center(
          child: SizedBox(
            height: widget.maxLines != 1
                ? null
                : err == ''
                    ? 40
                    : 45,
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColor.cBlack,
              autofocus: widget.autofocus ?? false,
              focusNode: _focus,
              readOnly: widget.readOnly ?? false,
              validator: (v) {
                print("vv======= $v");

                setState(() {
                  err = widget.validator!(v!);
                });
                print("======= $err");
                if (err == '') {
                  return null;
                } else {
                  return err;
                }
              },
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText ?? false,
              maxLines: widget.maxLines ?? 1,
              maxLength: widget.maxLength,
              obscuringCharacter: widget.obscuringCharacter ?? ' ',
              keyboardType: widget.keyboardType,
              style: pMedium14.copyWith(color: widget.textColor ?? AppColor.cBlack),
              decoration: InputDecoration(
                fillColor: widget.filledColor,
                filled: widget.isFilledColor,
                hintText: widget.hintText,
                hintStyle: pMedium12.copyWith(color: widget.textColor ?? AppColor.cBlack),
                counterText: '',
                errorStyle: TextStyle(
                  height: 0,
                  fontSize: 0,
                  decorationThickness: 0,
                ),
                counterStyle: TextStyle(
                  height: 0,
                  fontSize: 0,
                  decorationThickness: 0,
                ),

                suffixIcon: widget.suffix,
                prefixIconConstraints: BoxConstraints(maxWidth: widget.prefix == null ? 15 : 45, minWidth: widget.prefix == null ? 15 : 43),
                suffixIconConstraints: BoxConstraints(maxWidth: 45, minWidth: 42),
                contentPadding: EdgeInsets.symmetric(vertical: widget.maxLines == 1 ? 0 : 16),
                prefixText: '  ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColor.cBlack, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColor.cBlack, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColor.cRedText),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColor.cBlack, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColor.cBlack, width: 1),
                ),
              ),
            ),
          ),
        ),
        err == '' ? SizedBox() : Text(err, style: pMedium12.copyWith(color: AppColor.cRedText)),
      ],
    );
  }
}
