import 'package:belajar_api/model/user_model.dart';
import 'package:belajar_api/ui/display_screen.dart';
import 'package:belajar_api/widget/custom_input.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  User? user;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // global state untuk form

  TextEditingController _namecontroller = TextEditingController(); // controller untuk nama
  TextEditingController _jobcontroller = TextEditingController(); // controller untuk deskripsi aktivitas


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 26),
                CustomInput(
                    label: "Nama",
                    controller: _namecontroller
                ),
                SizedBox(height: 26),
                CustomInput(
                    label: 'Pekerjaan',
                    controller: _jobcontroller),
                SizedBox(height: 26),
                ElevatedButton(
                  child: Text("POST"),
                  onPressed: (){
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    User.connectApi(_namecontroller.text, _jobcontroller.text).then((value) {
                      user = value;
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Display(user: user);
                      }));
                    });

                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
