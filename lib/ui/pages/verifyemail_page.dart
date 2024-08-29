import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:krucetfeetracker/logic/cubit/verifyotp_cubit.dart';
import 'package:krucetfeetracker/ui/components/suggestion_text.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({
    super.key,
  });
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? email = routeArgs["email"];
    double size = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => VerifyotpCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF3B58A1),
            title: const Text(
              'Verify your Email',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
              child: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
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
                    color: Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'We have sent the code verification to your E-mail - ${email!}',
                    style: const TextStyle(
                        color: Color(0xFF38486f),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OTPField(controller: otpController1),
                      const SizedBox(width: 20),
                      OTPField(controller: otpController2),
                      const SizedBox(width: 20),
                      OTPField(controller: otpController3),
                      const SizedBox(width: 20),
                      OTPField(controller: otpController4),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<VerifyotpCubit, VerifyotpState>(
                    builder: (context, state) {
                      if (state is VerifyotpError) {
                        return const SuggestionText(
                          suggestionText:
                              "Please enter 4 digit OTP sent to your E-Mail.",
                          color: Colors.red,
                        );
                      } else {
                        return const SizedBox(
                          height: 2,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              BlocConsumer<VerifyotpCubit, VerifyotpState>(
                listener: (context, state) {
                  if (state is VerifyotpSuccess) {
                    Navigator.of(context).pushNamed(
                      '/',
                    );
                  }
                },
                builder: (context, state) {
                  if (state is VerifyotpLoading) {
                    return MaterialButton(
                      onPressed: null,
                      disabledColor: const Color.fromARGB(255, 59, 88, 161),
                      color: const Color.fromARGB(255, 59, 88, 161),
                      padding: const EdgeInsets.all(30),
                      minWidth: size >= 900 ? 600 : size,
                      child: Row(
                        children: const [
                          SizedBox(
                            height: 19,
                            child: SpinKitDoubleBounce(
                              color: Colors.white,
                              size: 19.0,
                            ),
                          ),
                          Text(
                            'VERIFYING..',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 2),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return MaterialButton(
                        onPressed: () {
                          BlocProvider.of<VerifyotpCubit>(context).verifyotp(
                              otpctrl1: otpController1.text,
                              otpctrl2: otpController2.text,
                              otpctrl3: otpController3.text,
                              otpctrl4: otpController4.text,
                              email: email);
                        },
                        color: const Color.fromARGB(255, 59, 88, 161),
                        padding: const EdgeInsets.all(30),
                        minWidth: size >= 900 ? 600 : size,
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ));
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  const OTPField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 50,
        height: 50,
        child: TextField(
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: const InputDecoration(hintText: '0'),
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ));
  }
}
