import 'package:dieto/models/dietapi.dart';
import 'package:dieto/services/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future _nut;

  @override
  void initState() {
    _nut=API_Manager().getRecipe_Nut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: FutureBuilder(
              future: _nut,
              builder: (context,snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {

                      var article=snapshot.data[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.teal[300],
                          ),

                          child: ListTile(
                            onTap: (){
                             // launch(article.url);
                              //print(article.url);
                            },
                            leading: CircleAvatar(child: Image.network(article['image']),
                              backgroundColor: Colors.black,
                              radius: 35,),
                            title: Text(article['title'],
                              style: TextStyle(

                              ),),
//                          subtitle: Text(article.content,
//                            style: TextStyle(
//                                color: Colors.teal[900],
//                                fontFamily: 'Dancing'
//                            ),),
                          ),
                        ),
                      );
                    },
                  );
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }
              }
          ),
        ),

      )
    );
  }
}