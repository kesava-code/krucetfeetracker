// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:krucetfeetracker/logic/cubit/sign_in_cubit.dart';
import '../components/my_textfield.dart';
import '../components/suggestion_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    width: size >= 900 ? 600 : size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),

                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/krucet.png'),
                              scale: 1.4,
                            ), //DecorationImage
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(300.0),
                              topRight: Radius.circular(300.0),
                              bottomLeft: Radius.circular(300.0),
                              bottomRight: Radius.circular(300.0),
                            ),
                            //BorderRadius.only
                            /************************************/
                            /* The BoxShadow widget  is here */
                            /************************************/
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 150, 146, 175),
                                offset: Offset(
                                  2.0,
                                  2.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ), //BoxDecoration
                        ),

                        const SizedBox(height: 50),

                        // username textfield
                        MyTextField(
                          controller: usernameController,
                          hintText: 'Register ID',
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                          return SuggestionText(
                            suggestionText: state.registerID,
                            color: state.registerIDError
                                ? Colors.red
                                : Colors.grey,
                          );
                        }),
                        const SizedBox(height: 10),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                          return SuggestionText(
                            suggestionText: state.password,
                            color:
                                state.passwordError ? Colors.red : Colors.grey,
                          );
                        }),
                        const SizedBox(height: 10),

                        // forgot password?

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 150, 146, 175)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // sign in button
                        BlocConsumer<SignInCubit, SignInState>(
                          listener: (context, state) {
                            if (state is SignInLoaded) {
                              Navigator.of(context)
                                  .pushNamed('/studentdetails');
                            }
                          },
                          builder: (context, state) {
                            if (state is SignInLoading) {
                              return MaterialButton(
                                  onPressed: null,
                                  disabledColor:
                                      const Color.fromARGB(255, 59, 88, 161),
                                  color: const Color.fromARGB(255, 59, 88, 161),
                                  padding: const EdgeInsets.all(30),
                                  minWidth: size >= 900 ? 600 : size,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SpinKitDoubleBounce(
                                          color: Colors.white,
                                          size: 19.0,
                                        ),
                                        Text(
                                          "Loading..",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            } else {
                              return MaterialButton(
                                  onPressed: () {
                                    BlocProvider.of<SignInCubit>(context)
                                        .verifyDetails(
                                            registerID: usernameController.text,
                                            password: passwordController.text);
                                  },
                                  color: const Color.fromARGB(255, 59, 88, 161),
                                  padding: const EdgeInsets.all(30),
                                  minWidth: size >= 900 ? 600 : size,
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ));
                            }
                          },
                        ),

                        const SizedBox(height: 50),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Not a member?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 150, 146, 175)),
                            ),
                            const SizedBox(width: 4),
                            RichText(
                              text: TextSpan(
                                  text: 'Register now',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed('/signup');
                                    }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
