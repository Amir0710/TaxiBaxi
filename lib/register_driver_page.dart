import 'package:flutter/material.dart';

import 'driver_page.dart';

class RegisterDriver extends StatefulWidget {

  const RegisterDriver({super.key});

  @override
  State<RegisterDriver> createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _nationalCode = TextEditingController();
  final TextEditingController _creditCard = TextEditingController();


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
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'fmaily',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'phone',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                controller: _nationalCode,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'National Code',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _age,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'age',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _sex,
                decoration: const InputDecoration(
                  hintText: 'M/F',
                  filled: true,
                  labelText: 'sex',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 34, left: 12, right: 12),
              child: TextField(
                controller: _creditCard,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Credit Card',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 24),
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('save',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 24, left: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const DiverHomePage(
                          );
                        },
                      ));
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
