import 'package:dieto/services/apimanager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipebyNutrients extends StatefulWidget {
  @override
  _RecipebyNutrientsState createState() => _RecipebyNutrientsState();
}

class _RecipebyNutrientsState extends State<RecipebyNutrients> {

  Future _nut;

//  @override
//  void initState() {
//    _nut=API_Manager().getRecipe_Nut();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {

    _nut=API_Manager().getRecipe_Nut();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Your Recipes',
        style: TextStyle(
          color: Colors.indigo
        ),),
      ),

      body: Container(
        child: FutureBuilder(
            future: _nut,
            builder: (context,snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {

                    var object=snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network(object['image']),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(object['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Values(object: object,name: "Carbs : ",value: "carbs",),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Values(object: object,name: "Fat : ",value: "fat",),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Values(object: object,name: "Protein : ",value: "protein",),

                                ],
                              ),
                            ),
                    ),
                          SizedBox(
                            height: 20,
                          )
                        ],
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

    );
  }
}

class Values extends StatelessWidget {
  const Values( {
    Key key,
    this.object,
    this.name,
    this.value
  }) : super(key: key);

  final  object;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        Text( (object[value]) ),
      ],
    );
  }
}
