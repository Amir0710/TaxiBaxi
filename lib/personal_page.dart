import 'package:flutter/material.dart';

final List<String> information = [
  'name',
  'family',
  'phone number',
  'email',
  'age',
  'sex'
];

class Personal extends StatelessWidget {
  const Personal({super.key});

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
