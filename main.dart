import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = '';
  void _onClick(String value) => setState(() => _value = value);
  int currentIndex = 0;
  final screens = [
    Center(child: Text('Home', style: TextStyle(fontSize: 60))),
    Center(child: Text('Search', style: TextStyle(fontSize: 60))),
    Center(child: Text('Add', style: TextStyle(fontSize: 60))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Icon Button Click');
          },
        ),*/
        title: const Text('Welcome'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.camera,
            color: Colors.white,
            size: 23.0,
          ),
        ),
      ),
      /*body: screens[currentIndex],*/
      /* body: Center(child: new Text(_value)),*/
      /*body: Center(child: new Text('Have a nice day')),*/
      /*body: Center(
        child: new Text('Hello'),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          print('Have a nice day');
        },
        elevation: 10.0,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Saranya'),
              accountEmail: Text(' pd4844242.@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('KJ'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('kj'),
                ),
              ],
            ),
            ListTile(
              title: Text('All Inbox'),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('All Primary'),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Promotion'),
              leading: Icon(Icons.local_offer),
            ),
            Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        RaisedButton(
          elevation: 10.0,
          onPressed: () {
            _onClick('ok');
            print('ok');
          },
          color: Colors.green,
          child: Icon(Icons.add),
        ),
        RaisedButton(
          elevation: 10.0,
          onPressed: () {
            _onClick('cancel');
            print('cancel');
          },
          color: Colors.red,
          child: Icon(Icons.cancel),
        ),
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
      endDrawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Saranya'),
              accountEmail: Text(' pd4844242.@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('KJ'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('kj'),
                ),
              ],
            ),
            ListTile(
              title: Text('All Inbox'),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('All Primary'),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Promotion'),
              leading: Icon(Icons.local_offer),
            ),
            Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'India',
    'USA',
    'UK',
    'Russia',
    'Japan',
    'China',
    'Singapore',
    'Malaysia'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query:
          '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
