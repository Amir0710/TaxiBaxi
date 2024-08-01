import 'package:baxi/user_page.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({
    super.key,
  });

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 260,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Theme.of(context).textTheme.displayMedium!.color ??
                    //     Colors.transparent,
                    color: Theme.of(context).textTheme.displaySmall?.color ??
                        Colors.transparent,
                    spreadRadius: 20,
                    blurRadius: 20,
                  )
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(140)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).textTheme.displayMedium?.color ??
                        Colors.transparent,
                    Theme.of(context).appBarTheme.backgroundColor ??
                        Colors.transparent
                  ],
                ),
              ),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Good luck in Baxi',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Image.asset(
                      'assets/image/splash.png',
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _lastname,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _firstname,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade50,
                  labelText: 'fmaily',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _phoneNumber,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade50,
                  labelText: 'phone',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade50,
                  labelText: 'email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _age,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade50,
                  labelText: 'age',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _sex,
                decoration: InputDecoration(
                  hintText: 'M/F',
                  filled: true,
                  fillColor: Colors.blueGrey.shade50,
                  labelText: 'sex',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 24),
                  child: ElevatedButton(
                    onPressed: () {}, // to save data
                    child: Text('save',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 24, left: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const UserHomePage();
                            },
                          ));
                        },
                      );
                    },
                    child: Text('Go baxi',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
