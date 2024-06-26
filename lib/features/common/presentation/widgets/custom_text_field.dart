import 'package:finance_ui/features/features.dart';
import 'package:flutter/material.dart';
import '../../../../lib.dart';

/// Custom Widget for Text Form Field
/// This text field has validator to check the user input
/// An error will be shown below the text field if the input doesn't meet the validator
///
/// This text field border will change dynamically according to user interaction & input
///
/// This text field can be used for typing password and has a trigger for visibility
/// An icon will be shown if the type of input is password
/// The icon will be the visibility trigger
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    int? maxLength,
    Widget? widgetSuffix,
    Widget? widgetPrefix,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _widgetSuffix = widgetSuffix,
        _widgetPrefix = widgetPrefix,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final int? _maxLength;
  final Widget? _widgetSuffix;
  final Widget? _widgetPrefix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: Text(
            widget._textFieldEntity.label,
            style: AppTextStyle.semiBold,
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: const Gap(),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._textFieldEntity.textController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: widget._textFieldEntity.textInputAction,
                enabled: widget._textFieldEntity.isEnabled,
                keyboardType: widget._textFieldEntity.keyboardType,
                inputFormatters: widget._textFieldEntity.inputFormatters,
                maxLines: widget._maxLines,
                onChanged: widget._onChanged,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: widget._textFieldEntity.hint,
                  counterText: "",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.grey,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  filled: true,
                  fillColor: widget._textFieldEntity.isEnabled
                      ? const Color.fromRGBO(
                          243,
                          244,
                          246,
                          1,
                        ) //TextFieldColors.backgroundEnable
                      : widget._backgroundDisable,
                  suffixIcon: Visibility(
                    visible: widget._textFieldEntity.isPassword,
                    child: IconButton(
                      color: AppColors.grey,
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    ),
                  ),
                  prefixIcon: widget._widgetPrefix,
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                maxLength: widget._maxLength,
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.black,
                ),
                obscureText: _isObscureText,
                validator:
                    widget._validator ?? widget._textFieldEntity.validator,
              ),
            ),
            widget._widgetSuffix ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}

class CustomTextFormFieldAuth extends StatefulWidget {
  const CustomTextFormFieldAuth({
    Key? key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    int? maxLength,
    Widget? widgetSuffix,
    Widget? widgetPrefix,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _widgetSuffix = widgetSuffix,
        _widgetPrefix = widgetPrefix,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final int? _maxLength;
  final Widget? _widgetSuffix;
  final Widget? _widgetPrefix;

  @override
  State<CustomTextFormFieldAuth> createState() =>
      _CustomTextFormFieldAuthState();
}

class _CustomTextFormFieldAuthState extends State<CustomTextFormFieldAuth> {
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            // color: const Color.fromRGBO(243, 244, 246, 1),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: Text(
              widget._textFieldEntity.label,
              style: AppTextStyle.semiBold.copyWith(
                color: AppColors.grey,
                fontSize: AppFontSize.small,
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: const Gap(),
        ),
        RowPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._textFieldEntity.textController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: widget._textFieldEntity.textInputAction,
                enabled: widget._textFieldEntity.isEnabled,
                keyboardType: widget._textFieldEntity.keyboardType,
                inputFormatters: widget._textFieldEntity.inputFormatters,
                maxLines: widget._maxLines,
                onChanged: widget._onChanged,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: widget._textFieldEntity.hint,
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.grey,
                    fontSize: AppFontSize.small,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  filled: true,
                  fillColor: widget._textFieldEntity.isEnabled
                      ? Colors.transparent //TextFieldColors.backgroundEnable
                      : widget._backgroundDisable,
                  suffixIcon: Visibility(
                    visible: widget._textFieldEntity.isPassword,
                    child: IconButton(
                      color: AppColors.grey,
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    ),
                  ),
                  prefixIcon: widget._widgetPrefix,
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: AppFontSize.extraSmall,
                  ),
                ),
                maxLength: widget._maxLength,
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.black,
                ),
                obscureText: _isObscureText,
                validator:
                    widget._validator ?? widget._textFieldEntity.validator,
              ),
            ),
            widget._widgetSuffix ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}

class CustomTextFormFieldOtp extends StatefulWidget {
  const CustomTextFormFieldOtp({
    Key? key,
    required TextFieldEntity textFieldEntity,
    required Function(String)? onChanged,
  })  : _textFieldEntity = textFieldEntity,
        _onChanged = onChanged,
        super(key: key);

  final TextFieldEntity _textFieldEntity;
  final Function(String)? _onChanged;

  @override
  State<CustomTextFormFieldOtp> createState() => _CustomTextFormFieldOtpState();
}

class _CustomTextFormFieldOtpState extends State<CustomTextFormFieldOtp> {
  bool _isFocused = false;

  @override
  void initState() {
    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
        setState(() {
          _isFocused = true;
        });
      } else {
        setState(() {
          _isFocused = false;
        });
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      child: TextFormField(
        controller: widget._textFieldEntity.textController,
        keyboardType: widget._textFieldEntity.keyboardType,
        inputFormatters: widget._textFieldEntity.inputFormatters,
        style: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.medium,
          color: _isFocused ? AppColors.secondary : AppColors.black,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: _isFocused ? AppColors.white : AppColors.grey,
          hintText: "-",
          hintStyle: AppTextStyle.regular.copyWith(
            color: AppColors.grey,
            fontSize: AppFontSize.medium,
          ),
          contentPadding: const EdgeInsets.all(12.0),
          focusedErrorBorder: _border(),
          enabledBorder: _border(),
          focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
            borderSide: BorderSide(
              color: AppColors.secondary,
              width: 1,
            ),
          ),
          border: _border(),
          errorBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
            borderSide: BorderSide(color: AppColors.secondary, width: 2),
          ),
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: widget._onChanged,
        focusNode: widget._textFieldEntity.focusNode,
        validator: widget._textFieldEntity.validator,
      ),
    );
  }

  InputBorder _border() {
    return const OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(AppBorderRadius.large / 2)),
      borderSide: BorderSide(
        color: Color(0xFFF4F0ED),
        width: 2,
      ),
    );
  }
}

class CustomTextFormFieldSearch extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String)? _onSubmitted;
  final Function()? _onPressed;
  final String? _hint;
  const CustomTextFormFieldSearch({
    Key? key,
    required TextEditingController controller,
    required Function(String)? onSubmitted,
    required Function()? onPressed,
    String? hint,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _onPressed = onPressed,
        _hint = hint,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: _onPressed,
              icon:
                  const Icon(Icons.search, color: Color(0xFFA5A3A3), size: 20),
            ),
            filled: true,
            fillColor: AppColors.grey,
            hintText: _hint ?? "Search",
            hintStyle: AppTextStyle.regular.copyWith(
              color: AppColors.grey,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            )),
        onSubmitted: _onSubmitted,
      ),
    );
  }
}

class NewCustomTextFormFieldSearch extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String)? _onSubmitted;
  final Function()? _onPressed;
  final String? _hint;
  final FocusNode? _focusNode;
  const NewCustomTextFormFieldSearch({
    Key? key,
    required TextEditingController controller,
    required Function(String)? onSubmitted,
    required Function()? onPressed,
    String? hint,
    FocusNode? focusNode,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _onPressed = onPressed,
        _hint = hint,
        _focusNode = focusNode,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: _onPressed,
              icon:
                  const Icon(Icons.search, color: Color(0xFFA5A3A3), size: 20),
            ),
            filled: true,
            fillColor: const Color(0xffF3F4F6),
            hintText: _hint ?? "Search",
            hintStyle: AppTextStyle.regular.copyWith(
              color: AppColors.grey,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF4F0ED), width: 1),
              borderRadius: BorderRadius.circular(12),
            )),
        onSubmitted: _onSubmitted,
      ),
    );
  }
}
