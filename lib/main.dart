import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Counter App",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyHomePageUI();
  }
}

class MyHomePageUI extends State<MyHomePage>{
  int countNumber1 = 0;


  MyAlertDialog(context){

    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text('Counter Alert'),
                content: Text("Counter value is 5!"),
                actions: [
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK'))
                ],
              )
          );
        }

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text('Counter App'),
        ),

      body:Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(100)),
            Text('Counter Value: '+countNumber1.toString(),style: TextStyle(fontSize: 25),),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(100, 1, 19, 10)),
                SizedBox(
                  child: ElevatedButton(onPressed: (){

                  setState(() {
                    countNumber1 = countNumber1+1;
                    if(countNumber1 == 5){MyAlertDialog(context);}
                    if(countNumber1 == 10){
                      Navigator.push(context, MaterialPageRoute(builder: (context,)=>secondScreen()));
                    };
                  });

                }, child: Icon(Icons.add)
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),

                SizedBox(
                  child: ElevatedButton(onPressed: (){

                    setState(() {
                      countNumber1 = countNumber1-1;
                      if(countNumber1 == 5){MyAlertDialog(context);}
                      if(countNumber1 == 10){
                        Navigator.push(context, MaterialPageRoute(builder: (context,)=>secondScreen()));
                      };
                    });





                  }, child: Icon(Icons.remove),
                  ),
                )
              ],
            )

          ],
        ) ,

    )
    );
  }

}

class secondScreen extends StatelessWidget {//for simple navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Second Screen'),
      ),

      body: Center(
        child: Text('Congratulation! You reached 10!',style: TextStyle(fontSize: 25),),
      ),

    );
  }
}