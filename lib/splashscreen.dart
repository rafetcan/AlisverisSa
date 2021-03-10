import 'dart:async';

import 'package:alisverissa/main.dart';
import 'package:alisverissa/servis.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () async {
      bool netControl = await Servis().internetControl();
      if (netControl == true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MyPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Hata()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class Hata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white12,
          child: Container(
              child: Column(
            children: [
              Spacer(),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/wifi.png',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'İnternet Yok',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'İnternet bağlantınızı kontrol ettikten sonra tekrar deneyiniz.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SplashScreen())),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    'Tekrar Dene',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
              Spacer()
            ],
          )),
        ),
      ),
    );
  }
}
