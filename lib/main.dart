import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgcolor = Colors.indigo.shade100;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,


          title: Center(child: Text("Your Personal BMI calculator",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,

          ),)

          ),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(

              width: 300,
              height: 630,



              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(
                    fontSize: 34,fontWeight: FontWeight.w500
                  ),)
                  ,
                  SizedBox(height: 21,),
                  TextField(

                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight in kgs'),
                      prefixIcon: Icon(Icons.monitor_weight_rounded)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(

                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height in feets'),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height rest in inches'),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!=""&& ft!="" && inch!=""){
                      //Bmi calculate
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iin = int.parse(inch);

                      var tinch = (ift*12) + iin;

                      var tm = (tinch*2.54)/100;
                      var bmi = iwt/(tm*tm);
                      var msg = "";
                      if(bmi > 25){
                        msg = "You are overweight !!";
                        bgcolor = Colors.orange.shade200;

                      }
                      else if(bmi<18){
                        msg="You are skinny !! go do some bulk";
                        bgcolor=Colors.red.shade200;

                      }
                      else{
                        msg="You are healthy!! congratulations";
                        bgcolor=Colors.green.shade100;

                      }

                      setState(() {
                        result = "$msg \n Your BMI is ${bmi.toStringAsFixed(1)} ";
                      });

                    }
                    else{
                      setState(() {
                        result = "Please fill all the required fields";
                      });

                    }


                  }, child:Text('Calculate') ),
                  SizedBox(height: 11,),
                  Text(result,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          ),
        )

    );
  }
}