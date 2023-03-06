import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(top:40, left: 24, right:24,),
                 child: FittedBox(
                   fit: BoxFit.contain,
                   child: CircleAvatar(
                     backgroundImage: NetworkImage("https://picsum.photos/200"),
                   ),
                 ),
               ),
             ),
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                  // Container(),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              const Text(
                  "Don't have an account? Create One",
              ),
              Container(
                height: size.height * 0.05,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _authButton(Size size) => Positioned(
      left: size.width*0.15,
      right: size.width*0.15,
      bottom: 0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
        ),
        child: const Text(
            "Login",
      ),
    ),
  );

  Widget _inputForm(Size size){
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right:12, top: 12, bottom: 30),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "Email",
                      ),
                      validator: (String? value) {
                        if(value!=null && value.isEmpty) {
                          return "please input correctly";
                        }
                        return null;
                      }
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password"
                    ),
                    validator: (String? value) {
                      if(value!=null && value.isEmpty) {
                        return "please input correctly";
                      }
                      return null;
                    },
                  ),
                  Container(height: 8,),
                  const Text(
                      "Forgot Password",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
