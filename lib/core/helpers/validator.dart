import 'package:flutter/material.dart';


extension Validator on String {

  String? noValidate() {
    return null;
  }

  String? validateEmpty(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Field Empty";
    }
    return null;
  }
  String? validateEmailOrPhone(String? value) {
    String v = value ?? "";
    int? n = int.tryParse(v);
    if (v.isEmpty) {
      return "البريد الالكترونى او رقم الهاتف مطلوب";
    }
    if (n is int) {
      if (v.length <= 9 || v.length > 15) {
        return "طول رقم الهاتف يجب ان يكون بين 9 إلى 15 ارقام فقط";
      } else {
        return null;
      }
    } else {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(v)) {
        return "من فضلك أدخل بريد الكتروني صحيح";
      }
    }
    return null;
  }

  String? validatePassword(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Field Empty";
    } else if (length < 8) {
      return message ??"Check Password is Valid or Not !";
    }
    return null;
  }

  String? validateEmail(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Field Empty";
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? "تأكد من البريد الالكتروني";
    }
    return null;
  }

  String? validateEmailORNull(BuildContext context,{String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? "تأكد من البريد الالكتروني";
      }
    }
    return null;
  }

  String? validatePhone(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Field Empty";
    } else if (!RegExp(
        r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
        .hasMatch(this) ||
        length < 10) {
      return message ?? "تأكد من رقم الهاتف";
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,{required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? "Field Empty";
    } else if (this != pass) {
      return message ?? "تأكد من كلمة السر مطابقة";
    }
    return null;
  }
}

extension ValidatorDrop<DataType> on DataType {
  String? validateDropDown(BuildContext context,{String? message}) {
    if (this == null) {
      return message ?? "Field Empty";
    }
    return null;
  }
}
