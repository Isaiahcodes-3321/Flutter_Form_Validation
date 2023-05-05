import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool passwordchk = true;
  // get the name of user
  String name = '';
  // send message username is required
  String rQuiredusername = '';
  // to check if password Textfield is empty and username
  var passwordEmpty = TextEditingController();
  var username = TextEditingController();
  // i used the static to gain acces on dailog class
  static var eRROMessage = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Welcom',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(
                      text: ' $name',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      TextField(
                        controller: username,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'User name'),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                            rQuiredusername = '';
                          });
                        },
                      ),
                       Align(
                          alignment: Alignment.centerLeft,
                          // ignore: unnecessary_string_interpolations
                          child: Text(
                            rQuiredusername,
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 0, 0)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: passwordchk,
                        onChanged: (value) {
                          setState(() {
                            eRROMessage = '';
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: ' Password',
                          // icons to set the visibilityof password seen and unseen
                          suffixIcon: IconButton(
                            icon: passwordchk
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color: const Color.fromARGB(255, 28, 27, 27),

                            onPressed: () {
                              setState(() {
                                passwordchk = !passwordchk;
                              });
                            },
                          ),
                        ),
                        // to control and see if input field is empty i used the controller: properties,
                        controller: passwordEmpty,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          // ignore: unnecessary_string_interpolations
                          child: Text(
                            eRROMessage,
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 0, 0)),
                          )),
                      // this is to show dialog message
                      Container(
                        child: DialogExample(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            MaterialButton(
                              // checking for form input conditions if they are ment
                              onPressed: () {
                                setState(() {
                                  // checking password erro message if condition is not ment
                                  var messageText = passwordEmpty.text;
                                  // checking username input erro message if condition is not ment
                                  var messageTextUsername = username.text;
                                  var passwordLength = passwordEmpty.text.length;
                                  if (messageTextUsername.isEmpty) {
                                    rQuiredusername = 'Username is required';
                                  } else if (messageText.isEmpty) {
                                    eRROMessage = 'Password is required';
                                  } else if (passwordLength < 4) {
                                    eRROMessage =
                                        'Password must exceed 4 Numbers';
                                  }
                                });
                              },
                              color: const Color.fromARGB(255, 57, 41, 175),
                              child: const Text('Login',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}


// My dialog box class
class DialogExample extends StatefulWidget {
  DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  int? resetpassword = Random().nextInt(5000);
  bool chkbox = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text('Remember password'),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Color.fromARGB(255, 8, 0, 250),
                value: chkbox,
                // set the value of Checkbox to false when the app is been launch
                onChanged: (bool? value) {
                  setState(() {
                    chkbox = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              barrierColor: Color.fromARGB(38, 106, 106, 210),
              builder: (BuildContext context) => Dialog(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('New password\n'),
                      Text('$resetpassword',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextButton(
                          // this pop out the dialogbox out when okey is click
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                              // set the erro message to password input
                              // and alse change the random initial value
                              _MyAppState.eRROMessage = '';
                              resetpassword = Random().nextInt(5000);
                            });
                          },
                          child: Text('Okey'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const Text(
              'Forgot password',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
