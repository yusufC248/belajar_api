import 'package:belajar_api/model/user_model.dart';
import 'package:flutter/material.dart';


class Display extends StatefulWidget {
  final User? user;
  const Display({Key? key, this.user}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  String nama = "nama kosong";
  String job = "Job Kosong";
  String id = "Id kosong";

  @override
  void initState() {
    super.initState();
    if(widget.user != null){
      nama = widget.user!.name.toString();
      job = widget.user!.job.toString();
      id = widget.user!.id.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(id),
                    Text(nama),
                    Text(job),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Kembali")
            ),
          ],
        )
      )
    );
  }
}
