import 'package:flutter/material.dart';
import 'package:sports_matching/states/firebase_auth_state.dart';
import 'package:sports_matching/states/user_notifier.dart';
import 'package:sports_matching/widgets/sign_up_form.dart';
import '../screens/home_screen.dart';
import '../utils/logger.dart';
import 'package:provider/provider.dart';
class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailContriller = TextEditingController();
  TextEditingController _pwContriller = TextEditingController();

  //VerificationStatus

  @override
  void dispose() {
    _emailContriller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 16.0,),
              SizedBox(
                width: 300,
                  height: 350,
                  child: Image.asset('assets/imgs/ronnie.png')),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _emailContriller,
                decoration: textInputDecor('Email'),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (text){
                  if(text!.isNotEmpty && text.contains("@")){
                    return null;
                  }else{
                    return '정확한 이메일을 전달해 주세요';
                  }
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _pwContriller,
                decoration: textInputDecor('Password'),
                obscuringCharacter: '*',
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (text){
                  if(text!.isNotEmpty && text.length > 5){
                    return null;
                  }else{
                    return '정확한 비밀번호를 입력해 주세요';
                  }
                },
              ),
              FlatButton(onPressed:(){}, child: Align(alignment: Alignment.centerRight,child: Text('비밀번호를 잊으셨나요?', style: TextStyle(color: Colors.red, fontSize: 10)))),
              SizedBox(height: 4.0,),
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                    logger.d('Validation success');
                    Provider.of<FirebaseAuthState>(context, listen: false).login(context, _emailContriller.text, _pwContriller.text);
                  }
                },
                child: Text('Sign in', style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              )

            ],
          ),
        ),
      ),
    );
  }
}
