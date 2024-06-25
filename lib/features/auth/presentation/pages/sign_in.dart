import 'package:finance_ui/features/common/presentation/widgets/button.dart';
import 'package:finance_ui/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final List<TextFieldEntity> _signIn = TextFieldEntity.authLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(height: 40),
            const Center(
              child: CustomImageWrapper(
                image: AppImageAssets.profile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                borderRadius: AppBorderRadius.big,
                isNetworkImage: false,
              ),
            ),
            const Gap(height: 40),
            CustomTextFormFieldAuth(
              textFieldEntity: _signIn[0],
              widgetPrefix: const Icon(
                Icons.email,
                size: 18,
              ),
            ),
            CustomTextFormFieldAuth(
              textFieldEntity: _signIn[1],
              widgetPrefix: const Icon(
                Icons.lock,
                size: 18,
              ),
            ),
            ButtonPrimary(
              "Sign In",
              width: double.infinity,
              borderRadius: AppBorderRadius.medium,
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: AppTextStyle.medium.copyWith(
                      fontSize: AppFontSize.small,
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: AppTextStyle.medium.copyWith(
                      fontSize: AppFontSize.small,
                      color: AppColors.black,
                    ),
                  ),
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
