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
  String name = '';
  var passwordEmpty = TextEditingController();
  var eRROMessage = '';
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
              SizedBox(height: 70,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'User name'),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: passwordchk,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: ' Password',
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
                        controller: passwordEmpty,
                      ),
                     Align(
                        alignment: Alignment.centerLeft,
                        // ignore: unnecessary_string_interpolations
                        child: Text( eRROMessage,
                        style:  TextStyle(
                          color: Color.fromARGB(255, 236, 0, 0)),)),
                      // this is to show dialog message
                      Container(
                        child: DialogExample(),
                      ),
                      const SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            MaterialButton(onPressed: (){
                              var messageText = passwordEmpty.text;
                              var passwordLength = passwordEmpty.text.length;
                              if( messageText.isEmpty){
                                eRROMessage = 'Password is required';
                              }else if( passwordLength < 5){
                                 eRROMessage = 'Password must exceed 4 Numbers';
                              }
                            },
                            color: const Color.fromARGB(255, 57, 41, 175),
                             child: const Text('Login',style: 
                             TextStyle(color: 
                             Color.fromARGB(255, 255, 255, 255))),),
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

class DialogExample extends StatefulWidget {
  DialogExample({super.key});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  var resetpassword = Random().nextInt(5000);

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
              builder: (BuildContext context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('New password\n'),
                      Text('$resetpassword',
                      style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Okey',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: const Text('Forgot password',
            style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
