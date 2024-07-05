// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:job_recommendation/api/loginapi.dart';
// import 'package:job_recommendation/homepage.dart';
// import 'package:job_recommendation/signup.dart';
//  // import 'package:google_fonts/google_fonts.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   @override
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//  late int userId;
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   bool _isSecurePassword=true;
//
//   Widget togglePassword(){
//     return IconButton(onPressed: (){
//       setState(() {
//         _isSecurePassword=!_isSecurePassword;
//       });
//
//     }, icon: _isSecurePassword?Icon(Icons.visibility):Icon(Icons.visibility_off));
//   }
//
//   Widget build(BuildContext context) {
//     var size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Align(alignment: Alignment.topLeft,
//                 child: Image.asset("assets/unstop.png",height: size.height*0.05,)),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: size.height*0.1,
//
//               child: Card(
//                 // color: Color(0xffEEEDFB),
//                 color: Colors.white,
//                 elevation: 0.8,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
// child: Row(children: [
//   Text("👋",style:TextStyle(fontSize: 30),),
//   SizedBox(width: size.width*0.04,),
//
//   Column(crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text("Hi, Unstoppable",style:TextStyle(fontSize: 10),),
//     Text("Welcome Back to Unstop!",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
//   ],)
// ],),
//                //child: Text("Book a consultation",style:GoogleFonts.sora(fontSize: 15,color: Colors.white),),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: size.height*0.07,
//
//               child: Card(
//                 // color: Color(0xffEEEDFB),
//                 color: Colors.white,
//                 elevation: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment:MainAxisAlignment.center,
//                     children: [
//     Image.asset("assets/google.png",height: size.height*0.1,),
//                       SizedBox(width: size.width*0.06,),
//                     Text("Login with Google",style:TextStyle(fontSize: 15,color: Color(0xff00008B),fontWeight: FontWeight.w500),),
//
//                   ],),
//
//                 ),
//               ),
//             ),
//           ),
//           Row(
//               children:
//               const[
//                 Expanded(child: Divider(
//                   indent: 20,
//                   endIndent: 10,
//                   color:Colors.grey,
//                 ),
//                 ),
//                 Text("Or Login with Email",style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.bold),),
//                 Expanded(child: Divider(
//                   indent: 10,
//                   color: Colors.grey,
//                   endIndent: 10,
//                   thickness: 1,
//                 ),
//                 ),
//               ]
//
//           ),
//           const SizedBox(height: 20),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: TextFormField(
//                   //color: Colors.black,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     hintText: 'Email id',
//                     labelText:'Email id',
//                     labelStyle:   TextStyle(fontSize: 15,color:  Colors.grey,fontWeight: FontWeight.w600),
//                     helperText: "Login via OTP",
//                     helperStyle:TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w500),
//                     hintStyle: TextStyle(color: Colors.grey),
//
//                   ),
//                   controller: _emailController,
//                   obscureText: false,
//                   keyboardType: TextInputType.text,
//                   validator: (String? value) {
//                     if (value!.isEmpty) {
//                       return 'Enter password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 5),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: TextFormField(
//                   //color: Colors.black,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     hintText: 'Password',
//                     helperText: "🔒 Forgot Password",
//                     helperStyle:TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w500),
//                     hintStyle: TextStyle(color: Colors.grey),
//                     prefixIconColor: Colors.grey,
//                     suffixIconColor: Colors.grey,
//                     suffixIcon: togglePassword(),
//
//                   ),
//                   controller: _passwordController,
//
//                   obscureText: _isSecurePassword,
//                   keyboardType: TextInputType.text,
//                   validator: (String? value) {
//                     if (value!.isEmpty) {
//                       return 'Enter password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           GestureDetector(
//             onTap: ()async{
//               print(_emailController.text);
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Center(
//                     child: CircularProgressIndicator(color: Colors.blue,),
//                   );
//                 },
//               );
//               // Simulate a delay of 3 seconds
//               await Future.delayed(Duration(seconds: 2));
//               userId = (await loginUser(_emailController.text, _passwordController.text))!;
//               print(userId);
//
//                 await Future.delayed(Duration(seconds: 2));
//
//                 // Navigate to HomePage with userId
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomePage(userID: userId),
//                   ),
//                 );
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Card(
//                 color: Colors.blue,
//                 // color: Colors.black12,
//                 elevation: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Center(child: Text("Login ",style:TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),)),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: (){
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
//               },
//               child: Container(
//               height: size.height*0.068,
//                 decoration: BoxDecoration(border: Border.all(color: Colors.grey,),borderRadius: BorderRadius.circular(25),color: Colors.white,),
//                 // color: Colors.black12,
//
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Don't have an account?",style:TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w500),),
//                       Text(" Sign Up",style:TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.w500)),
//                     ]
//                   ),
//
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_recommendation/api/loginapi.dart';
import 'package:job_recommendation/homepage.dart';
import 'package:job_recommendation/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSecurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
    );
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(color: Colors.blue),
        );
      },
    );

    try {
      int? userId = await loginUser(email, password);
      Navigator.pop(context); // Close the loading dialog

      if (userId != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(userID: userId),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      Navigator.pop(context); // Close the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/unstop.png", height: size.height * 0.05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.height * 0.1,
              child: Card(
                color: Colors.white,
                elevation: 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("👋", style: TextStyle(fontSize: 30)),
                      SizedBox(width: size.width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, Unstoppable", style: TextStyle(fontSize: 10)),
                          Text("Welcome Back to Unstop!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.height * 0.07,
              child: Card(
                color: Colors.white,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google.png", height: size.height * 0.1),
                      SizedBox(width: size.width * 0.06),
                      Text("Login with Google", style: TextStyle(fontSize: 15, color: Color(0xff00008B), fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  indent: 20,
                  endIndent: 10,
                  color: Colors.grey,
                ),
              ),
              Text("Or Login with Email", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              Expanded(
                child: Divider(
                  indent: 10,
                  color: Colors.grey,
                  endIndent: 10,
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Email id',
                    labelText: 'Email id',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w600),
                    helperText: "Login via OTP",
                    helperStyle: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Password',
                    helperText: "🔒 Forgot Password",
                    helperStyle: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIconColor: Colors.grey,
                    suffixIconColor: Colors.grey,
                    suffixIcon: togglePassword(),
                  ),
                  controller: _passwordController,
                  obscureText: _isSecurePassword,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(userID: 1000),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.blue,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Container(
                height: size.height * 0.068,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500)),
                      Text(" Sign Up", style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

