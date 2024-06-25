import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

class TextFieldEntity {
  TextEditingController textController;
  String hint;
  String label;
  bool isEnabled;
  bool isPassword;
  TextInputType keyboardType;
  bool? isAutofocus;

  TextInputAction? textInputAction;
  FocusNode? focusNode;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  TextFieldEntity({
    required this.textController,
    required this.hint,
    this.label = "",
    this.isPassword = false,
    this.isEnabled = true,
    this.isAutofocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.validator,
    this.inputFormatters,
  }) {
    ValidationBuilder.setLocale('id');
  }

  static final List<TextFieldEntity> authLogin = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Email Address",
      hint: "Email",
      keyboardType: TextInputType.emailAddress,
      isPassword: false,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        } else if (!EmailValidator.validate(value.trim())) {
          return 'Invalid email format';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      label: "Password",
      hint: "Password",
      isPassword: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
  ];

  static final List<TextFieldEntity> authRegister = [
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Username",
      keyboardType: TextInputType.text,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your username';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Email Adress",
      keyboardType: TextInputType.emailAddress,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email';
        } else if (!EmailValidator.validate(value.trim())) {
          return 'Invalid email format';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Password",
      isPassword: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
    TextFieldEntity(
      textController: TextEditingController(text: ''),
      hint: "Repeat Password",
      isPassword: true,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: FocusNode(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },
    ),
  ];
}
