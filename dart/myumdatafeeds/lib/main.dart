import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'dashboard.dart';
import 'customcard.dart';
import 'academicspage.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';




// https://news.miami.edu/feeds/latest-25.xml

// make a network request

Future<String> fetchXML(String url) async{
  final output = await http.get(Uri.parse(url));
  return (output.body);
}

void main() {
  runApp(const MyUm());
  // print(fetchXML());

  // fetchXML().then((data) => {
  //   print(data)
  // }).catchError((error)=>{
  //   print('error getting data: $error')
  // });

}

class MyUm extends StatelessWidget {
  const MyUm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  List<Widget> myNews = [];
  List<Widget> myNews2 = [];
  List<Widget> myNews3 = [];

  void initState() {

    super.initState();


    fetchXML('https://news.miami.edu/feeds/latest-25.xml').then((data){
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //a singular newitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        // print(img);
        var title = newsitem.getElement('title')?.innerText;
        // print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        // print(summary);
        
        myNews.add(CustomCard(img!, title!, summary!));
      });

 


      ///print(data);
    }).catchError((error){
      print('error getting data: $error');
    });


    fetchXML('https://news.miami.edu/frost/feeds/all-news-15.xml').then((data){
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //a singular newitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        // print(img);
        var title = newsitem.getElement('title')?.innerText;
        // print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        // print(summary);
        
        myNews2.add(CustomCard(img!, title!, summary!));
      });

 


      ///print(data);
    }).catchError((error){
      print('error getting data: $error');
    });

      fetchXML('https://news.miami.edu/sonhs/feeds/student-stories-feed.xml').then((data){
      final document = XmlDocument.parse(data);
      final newsitems = document.findAllElements('newsitem');

      newsitems.forEach((newsitem){
        //a singular newitem
        var img = newsitem.getElement('imageSmall')?.innerText;
        // print(img);
        var title = newsitem.getElement('title')?.innerText;
        // print(title);
        var summary = newsitem.getElement('abstract')?.innerText;
        // print(summary);
        
        myNews3.add(CustomCard(img!, title!, summary!));
      });

 


      ///print(data);
    }).catchError((error){
      print('error getting data: $error');
    });
  
  
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          Dashboard(),

          // Page 2
          ListView(children: myNews),


          // Page 3
          ListView(children: myNews2),

          ListView(children: myNews3) 
        ][currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.pages),
            label: "Page 2",
          ),
          NavigationDestination(
            icon: Icon(Icons.pages),
            label: "Page 3",
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: "Page 4",
          ),
        ],
      ),
    );
  }
}

