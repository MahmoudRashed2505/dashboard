import 'package:dashbaord/constants/controllers.dart';
import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode textFocusNodeEmail;
  FocusNode textFocusNodePassword;

  bool _value = true;
  bool _isEditingEmail = false;
  bool _gettingUser = false;

  @override
  void initState() {
    authController.getUser();
    if (authController.uid != null) {
      menuController.changeActivePageTo(OverViewPageDisplayName);
      Get.offAllNamed(RootRoute);
    }
    emailController.text = '';
    textFocusNodeEmail = FocusNode();
    super.initState();
  }

  String _validateEmail(String value) {
    value = value.trim();

    if (emailController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _gettingUser
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset("assets/icons/logo.png"),
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        CustomText(
                          text: "Welcome back to the admin panel",
                          color: lightGrey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          _isEditingEmail = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeEmail.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: active,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: active,
                        ),
                        hintText: "admin@domain.com",
                        errorText: _isEditingEmail
                            ? _validateEmail(emailController.text)
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: active,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Passwrod",
                        labelStyle: TextStyle(color: active),
                        hintText: "*************",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: _value,
                                onChanged: (_) {
                                  setState(() {
                                    _value = !_value;
                                  });
                                }),
                            CustomText(text: "Remember Me"),
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: CustomText(
                              text: "Forgot password?",
                              color: active,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          if (_validateEmail(emailController.text) == null &&
                              passwordController.text.isNotEmpty) {
                            _gettingUser = true;
                          }
                        });
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          await authController
                              .signInWithEmailPassword(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                _gettingUser = false;
                                menuController.changeActivePageTo(
                                    OverViewPageDisplayName);
                                Get.offAllNamed(RootRoute);
                              });
                            }
                          });
                        }
                      },
                      hoverColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(4, 6),
                                color: lightGrey.withOpacity(.5),
                                blurRadius: 0)
                          ],
                        ),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomText(
                          text: "Login",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Don't have an admin credentials?",
                          color: lightGrey,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            child: CustomText(
                              text: "Request Credintials!",
                              color: active,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
