
import 'package:dieto/services/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecipePage extends StatefulWidget {

  RecipePage(this.id,this.name,this.image);

  String id;
  String name;
  String image;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  Future recipe;
  var object;


  @override
  void initState() {
    recipe=API_Manager().getRecipebyId(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.teal
        ),
        backgroundColor: Colors.white,
        title: Text(
          '${widget.name}',
          style: TextStyle(
              color: Colors.teal
          )
          ,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(child: Image.network(widget.image)),
            Expanded(
              child: FutureBuilder(
                  future: recipe,
                  builder: (context,snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context,index) {

                           object=snapshot.data[0]['steps'];

                          //int number=object[0]['steps'].length();
                          //print(number);
                           return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    leading: Text('${object[index]['number']}'),
                                    title: Text(object[index]['step']),
                                  )
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          );
                        },
                        //itemCount: ,
                      );
                    }
                    else{
                      return SpinKitChasingDots(
                        color: Colors.teal,
                        size: 40.0,
                      );;
                    }
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
