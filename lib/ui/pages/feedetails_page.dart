import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:krucetfeetracker/logic/cubit/fee_cubit.dart';

import 'package:krucetfeetracker/ui/components/my_textfield.dart';

import '../components/suggestion_text.dart';

class FeeDetails extends StatefulWidget {

  const FeeDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<FeeDetails> createState() => _FeeDetailsState();
}

class _FeeDetailsState extends State<FeeDetails> {
  String? referenceID;

  final TextEditingController referenceIDController = TextEditingController();

  List<Widget> detailsRow = [];

  List<String>? title;

  List<String>? content;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      Map<String, String> routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      if (routeArgs.containsKey("referenceID")) {
        referenceID = routeArgs["referenceID"];
      }
    }

    return BlocProvider(
      create: (context) => FeeCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF3B58A1),
            title: const Text(
              'Fee Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: 600,
                                child: MyTextField(
                                  controller: referenceIDController,
                                  hintText: "ReferenceID",
                                  obscureText: false,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            BlocBuilder<FeeCubit, FeeState>(
                              builder: (context, state) {
                                if (state is FeeLoading) {
                                  return const MaterialButton(
                                    onPressed: null,
                                    disabledColor:
                                        Color.fromARGB(255, 59, 88, 161),
                                    color: Color.fromARGB(255, 59, 88, 161),
                                    padding: EdgeInsets.all(20),
                                    minWidth: 50,
                                    child: Icon(
                                      Icons.search,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                                if (state is FeeError) {
                                  return MaterialButton(
                                    onPressed: () {
                                      BlocProvider.of<FeeCubit>(context)
                                          .validate(
                                              referenceID:
                                                  referenceIDController.text);
                                    },
                                    disabledColor:
                                        const Color.fromARGB(255, 59, 88, 161),
                                    color:
                                        const Color.fromARGB(255, 59, 88, 161),
                                    padding: const EdgeInsets.all(20),
                                    minWidth: 50,
                                    child: const Icon(
                                      Icons.search_rounded,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                                return MaterialButton(
                                  onPressed: () {
                                    BlocProvider.of<FeeCubit>(context).validate(
                                        referenceID:
                                            referenceIDController.text);
                                  },
                                  disabledColor:
                                      const Color.fromARGB(255, 59, 88, 161),
                                  color: const Color.fromARGB(255, 59, 88, 161),
                                  padding: const EdgeInsets.all(20),
                                  minWidth: 50,
                                  child: const Icon(
                                    Icons.search,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<FeeCubit, FeeState>(
                          builder: (context, state) {
                            if (state is FeeError) {
                              return SuggestionText(
                                suggestionText: state.error,
                                color: Colors.red,
                              );
                            }
                            return SuggestionText(
                              suggestionText:
                                  "Enter Reference ID to get Fee's Details",
                              color: Colors.grey,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<FeeCubit, FeeState>(
                          builder: (context, state) {
                            if (state is FeeLoading) {
                              return const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: SpinKitDoubleBounce(
                                    color: Colors.blue,
                                    size: 40.0,
                                  ));
                            }
                            if (state is FeeLoaded) {
                              title = state.title;
                              content = state.content;
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        top: BorderSide(
                                            width: 8, color: Colors.blue))),
                                constraints:
                                    const BoxConstraints(maxWidth: 800),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: title!.length,
                                  itemBuilder: (context, index) {
                                    return Details(
                                        content: content![index],
                                        title: title![index]);
                                  },
                                ),
                              );
                            }
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ]),
                ),
              )),
            ),
          ),
        );
      }),
    );
  }
}

class Details extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final String title;
  final String content;
  const Details(
      {super.key,
      this.icon,
      required this.content,
      required this.title,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget DetailIcon = icon != null
        ? Icon(
            icon,
            size: 19,
            color: color,
          )
        : const SizedBox(
            width: 0,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                textAlign: TextAlign.end,
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(flex: 1, child: Container()),
          DetailIcon,
          const SizedBox(
            width: 5,
          ),
          Flexible(
              flex: 9,
              child: Text(
                content,
                style: const TextStyle(
                    color: Color(0xFF38486f),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
