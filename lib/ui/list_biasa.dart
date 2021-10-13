import 'package:belajar_api/model/post_model.dart';
import 'package:belajar_api/network/api_client_gits.dart';
import 'package:flutter/material.dart';

class TampilData extends StatefulWidget {
  const TampilData({Key? key}) : super(key: key);

  @override
  _TampilDataState createState() => _TampilDataState();
}

class _TampilDataState extends State<TampilData> {
  List<Post>? _post;
  late bool _loading;

  @override
  void initState(){
    super.initState();
    _loading = true;
    ApiGITS.getData().then((value){
      setState(() {
        _post = value;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading..': 'Post'),
      ),
      body: Container(
        color: Colors.white,
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
              itemCount: null == _post ? 0 : _post!.length,
              itemBuilder: (context, index){
            Post post = _post![index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(post.title!.rendered.toString(),
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text("link: "+post.link.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("Post date: "+post.date.toString(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      )
    );
  }
}
