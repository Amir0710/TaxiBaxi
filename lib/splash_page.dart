import 'package:baxi/signup_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const Guidance();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 68, left: 8, right: 8, bottom: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/image/splash.png',
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
              ),
              Text(
                'Baxi Taxi',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: SpinKitCubeGrid(
                  color: Theme.of(context).textTheme.headlineLarge!.color,
                  size: 28,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
