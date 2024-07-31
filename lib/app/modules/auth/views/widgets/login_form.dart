import 'package:auth_api/app/modules/auth/views/widgets/custom_text_feild.dart';
import 'package:auth_api/app/modules/auth/views/widgets/custome_button.dart';
import 'package:auth_api/app/modules/auth/views/widgets/login_options.dart';
import 'package:auth_api/app/routes/app_pages.dart';
import 'package:auth_api/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isobsecure = true;

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Email",
            style: AppStyles.regular12,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: CustomTextFeild(
              fillColor: Colors.white,
              hintText: "Enter your email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: AppStyles.regular12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: CustomTextFeild(
              fillColor: Colors.white,
              hintText: "***********",
              suffixicon: IconButton(
                onPressed: () {
                  setState(() {
                    isobsecure = !isobsecure;
                  });
                },
                icon: isobsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              isobsecure: isobsecure,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const LoginOptions(),
          CustomButton(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sideColor: Colors.transparent,
            gradientColor: const LinearGradient(
              colors: [
                Color(0xff465C65),
                Color(0xff4B859F),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            text: "Sign in",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Get.offNamed(Routes.HOME);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
            borderRadius: BorderRadius.circular(8),
          )
        ],
      ),
    );
  }
}
