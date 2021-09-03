import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demoo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.red,
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple))),

        //home: MyHomePage(title: 'Pop Cat'),
        initialRoute: '/5',
        routes: <String, WidgetBuilder>{
          '/1': (context) => FirstPage(),
          '/2': (context) => SecoundPage(),
          '/3': (context) => ThridPage(),
          '/4': (context) => FourthPage(),
          '/5': (context) => fifthPage(),
          '/6': (context) => SixthPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );
  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );
  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      // เอาตัวแปรไปเก็บไว้ ละคืนค่าที่เก็บไว้มา หลังจาก reset แล้ว ต้องใส่เสมอเวลามีค่าเปลี่ยนแปลง
      cat = cat2;
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
      // เอาตัวแปรไปเก็บไว้ ละคืนค่าที่เก็บไว้มา หลังจาก reset แล้ว ต้องใส่เสมอเวลามีค่าเปลี่ยนแปลง
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //start , end
          children: <Widget>[
            Container(
              height: 150.0,
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(10.0)),
              child: cat,
            ),

            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            //,SubmitButton("Firstbutton"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decreaseCounter,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.access_alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {
        print("presse");
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {}, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
    );
  }
}

class SecoundPage extends StatelessWidget {
  const SecoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secound Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_circle_sharp),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ssss"),
            Table(
              children: [
                TableRow(children: [
                  Container(
                      child: Center(child: Text("No")),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0))),
                  Container(
                      child: Center(child: Text("Name")),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0))),

                  ///Text("Name"),
                ]),
                TableRow(children: [
                  Text("1"),
                  Text("A"),
                ]),
                TableRow(children: [
                  Text("2"),
                  Text("B"),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ThridPage extends StatelessWidget {
  const ThridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ThridPage"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.cloud)),
              Tab(icon: Icon(Icons.beach_access)),
              Tab(icon: Icon(Icons.brightness_1_outlined))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloud'),
            ),
            Center(
              child: Text('Umbrella'),
            ),
            Center(
              child: Text('Sunny'),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> enties = <String>['A','B','C','D','E','F','G','H','I','J','K','L'];
    final List<int> colorCodes = <int>[600,500,100];
    return Scaffold(
appBar: AppBar(
  title: Text("Listview Example"),


),
body: ListView.separated(
  padding: EdgeInsets.all(8.0),
  itemCount: enties.length,
  itemBuilder: (context, index) {
    return Container(
      height: 100,
      color: Colors.amber[colorCodes[index % 3]],
      child: Center(
       child: Text('Entry ${enties[index]}'),),);
    
  }, 
  separatorBuilder: (context, index) => Divider(), 
    
  ), 
  
    
      
    );
  }
}
class fifthPage extends StatelessWidget {
  const fifthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View"),),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index){
          return InkWell(
            onTap: (){
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content:Text('Tap at $index'),
              // ));
              Navigator.pushNamed(context, '/${index+1}');
              },
              child: Container(
                margin: EdgeInsets.all(20.0),
            
            decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text('Item ${index+1}',
            style: Theme.of(context).textTheme.headline5,
            )
            )));
        }),
    )
    );
  }
}
class SixthPage extends StatelessWidget {
  const SixthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Form'),
      ),
    body: MyCustomForm(),
    );
    
  }
}
class MyCustomForm extends StatefulWidget {
  

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your firstname'
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter something';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your lastname'
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter something';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your age'
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter something';
              }
              if(int.parse(value)<18){
                 return 'Please enter valid age';
              }
              return null;})
            ,
          
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate())
           {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hoorayyyy')));
           } }, 
            child: Text('Validate'))
        ],
      ),
    );
      
    
  }
}