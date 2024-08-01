import 'package:flutter/material.dart';

final List<String> information = [
  'name',
  'family',
  'phone number',
  'personal ID',
  'credit code'
  'Registration Date',
  'car tag',
  'email',
  'ege',
  'sex'
];

class Driver extends StatelessWidget {
  const Driver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: information[index] ,
                    ),
                  ),
                );
              },
              itemCount: information.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ),
    );
  }
}
