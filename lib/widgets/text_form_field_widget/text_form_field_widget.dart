
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/theme/text_style.dart';
import 'model/text_form_field_model.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key, required this.textFormFieldModel})
      : super(key: key);
  final TextFormFieldModel textFormFieldModel;

  @override
  Widget build(BuildContext context) {
     InputBorder _inputBorder({Color? color}){
       return  OutlineInputBorder(
           borderSide: BorderSide(
               color: color!,
               width: 2
           ),
           borderRadius: textFormFieldModel.borderRadius != null
               ? textFormFieldModel.borderRadius!
               : BorderRadius.circular(0.0));
     }
    return TextFormField(
      style: textFormFieldModel.textStyle ?? AppTextStyle.robotoTextStyle,
      initialValue: textFormFieldModel.initialValue,
      autofocus: textFormFieldModel.autofocus ?? false,
      decoration: InputDecoration(
          filled: textFormFieldModel.backgroundColor != null ? true : false,
          fillColor: textFormFieldModel.backgroundColor,
          contentPadding: textFormFieldModel.contentPadding,
          hintText: textFormFieldModel.hintText,
          hintStyle: textFormFieldModel.textStyle ?? AppTextStyle.robotoTextStyle,
          // labelStyle: textFormFieldModel.textStyle ?? AppTextStyle.robotoTextStyle,
          // labelText: textFormFieldModel.labelText,
          focusedBorder: _inputBorder(color: textFormFieldModel.colorBorder),
          enabledBorder: _inputBorder(color: textFormFieldModel.colorBorder),
          errorBorder: _inputBorder(color: Colors.red),
          focusedErrorBorder: _inputBorder(color: Colors.red),
          suffixIcon: textFormFieldModel.suffixIcon),
      obscureText: textFormFieldModel.obscureText!,
      onSaved: (v) {
        textFormFieldModel.onSaved!(v!);
      },
      // onChanged: (v) {
      //   textFormFieldModel.onChanged!(v);
      // },
      validator: (v) {
        // log('isNumericUsingRegularExpression(v!) is ${isNumericUsingRegularExpression(v!)}');
        if (v!.isEmpty) {
          return "يجب التأكد ان الرقم المكتوب صحيح وليس فارغا";
        }else if(!v.isNum){
          return 'يجب أدخال الرقم صحيح';
        }
        return null;
      },
      maxLines: textFormFieldModel.maxLines,
      keyboardType: textFormFieldModel.textInputType,
    );
  }
}

