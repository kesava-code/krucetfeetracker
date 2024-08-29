import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krucetfeetracker/logic/cubit/registration_cubit.dart';
import 'package:krucetfeetracker/ui/components/suggestion_text.dart';
import '../components/my_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return BlocProvider<RegistrationCubit>(
      lazy: false,
      create: (_) => RegistrationCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF3B58A1),
            title: const Text(
              'SignUp',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
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

                        const SizedBox(height: 30),

                        // username textfield
                        MyTextField(
                          controller: usernameController,
                          hintText: 'Register ID',
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                          return SuggestionText(
                            suggestionText: state.registerID,
                            color: state.registerIDError
                                ? Colors.red
                                : Colors.grey,
                          );
                        }),
                        const SizedBox(height: 20),

                        // username textfield
                        MyTextField(
                          controller: aadhaarController,
                          hintText: 'Aadhaar Number',
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                          return SuggestionText(
                            suggestionText: state.aadhaar,
                            color:
                                state.aadhaarError ? Colors.red : Colors.grey,
                          );
                        }),
                        const SizedBox(height: 20),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Create Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 5),
                        BlocBuilder<RegistrationCubit, RegistrationState>(
                            builder: (context, state) {
                          return SuggestionText(
                            suggestionText: state.password,
                            color:
                                state.passwordError ? Colors.red : Colors.grey,
                          );
                        }),
                        const SizedBox(height: 25),
                        // sign in button
                        BlocConsumer<RegistrationCubit, RegistrationState>(
                          listener: (context, state) {
                            if (state is RegistrationLoaded) {
                              Navigator.of(context).pushNamed('/verifyemail',
                                  arguments: {'email': state.email});
                            }
                          },
                          builder: (context, state) {
                            if (state is RegistrationLoading) {
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
                                      children: const [
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
                                    BlocProvider.of<RegistrationCubit>(context)
                                        .verifyDetails(
                                            registerID: usernameController.text,
                                            aadhaar: aadhaarController.text,
                                            password: passwordController.text);
                                  },
                                  color: const Color.fromARGB(255, 59, 88, 161),
                                  padding: const EdgeInsets.all(30),
                                  minWidth: size >= 900 ? 600 : size,
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ));
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Have an Account?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 150, 146, 175)),
                            ),
                            const SizedBox(width: 4),
                            RichText(
                              text: TextSpan(
                                  text: 'Login now',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushNamed('/');
                                    }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
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
