import 'package:flutter/material.dart';
import 'package:job_recommendation/login.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome() async{
    await Future.delayed(Duration(seconds:2),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
        Padding(
          padding:  EdgeInsets.only(top:size.height/3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/unstop.png",height: size.height*0.09,),
              Text("#BeUnstoppable",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff00008B)),),
            ],
          ),
        ),

          SizedBox(height: size.height*0.4,),
          Center(child: Text("Please wait ,while we load the app",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),))
        ],
      ),
    );
  }
}
