import 'package:easy_integration_api_products_type/screen/home.dart';
import 'package:easy_integration_api_products_type/service/auth_services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginkey = GlobalKey();
  String? username, password;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SafeArea(child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Authentication', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.deepPurpleAccent),),
            SizedBox(height: height * .30, width: width * .90, child: Form(
              key: _loginkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(initialValue: 'kminchelle', validator: (value) {
                    if (value!.isNotEmpty && value.length < 4){
                      return "Error Name";
                    }
                  }, onSaved: (value) {
                    setState(() {
                      username = value;
                    });
                  }, decoration: InputDecoration(hintText: 'User name'),),
                  TextFormField(initialValue: '0lelplR',validator: (value){
                    if(value!.length < 3 && value.isNotEmpty){
                      return "ERROR PASSWORD";
                    }
                  }, onSaved: (value) {
                    setState(() {
                      password = value;
                    });
                  }, decoration: const InputDecoration(hintText: 'Password'),),
                  FilledButton(onPressed: () async{
                    if(_loginkey.currentState?.validate() ?? false){
                      _loginkey.currentState!.save();
                      bool result= await AuthService().login(username!, password!);
                      if(result){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Home()), (route) => false);
                      } else {
                        print('Error');
                      }

                    }
                  }, child: Text('Login'))
                ],
              ),
            ),)
          ],
        ),
      )),
    );
  }
}
