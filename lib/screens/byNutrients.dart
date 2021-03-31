import 'package:dieto/screens/RecipePage.dart';
import 'package:dieto/services/apimanager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecipebyNutrients extends StatefulWidget {
  @override
  _RecipebyNutrientsState createState() => _RecipebyNutrientsState();
}

class _RecipebyNutrientsState extends State<RecipebyNutrients> {


  Future _nut;


  GetRecipe(BuildContext context){
    _nut=API_Manager().getRecipe_Nut(context);
  }

  @override
  Widget build(BuildContext context) {

    GetRecipe(context);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Your Recipes',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),

      body:
//      Padding(
//        padding: const EdgeInsets.fromLTRB(0,100, 0,0),
//        child:
        FutureBuilder(
            future: _nut,
            builder: (context,snapshot) {
              if(snapshot.hasData) {
                return Swiper(
                  itemHeight: MediaQuery.of(context).size.height,
                  itemWidth: MediaQuery.of(context).size.width,
                  layout: SwiperLayout.TINDER ,
                  pagination: new SwiperPagination(),
                  //control: new SwiperControl(),
                  itemCount: 10,
                  itemBuilder: (context, index) {

                    var object=snapshot.data[index];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            onTap: (){
                              print(object['id'].toString());
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipePage(object['id'].toString(),object['title'],object['image'])));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
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
                          ),
                    ),
//                            SizedBox(
//                              height: 20,
//                            )
                      ],
                    );
                  },
                );
              }
              else{
                return  SpinKitChasingDots(
                  color: Colors.white,
                  size: 80.0,
                );

              }
            }
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