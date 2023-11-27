import 'package:flutter/material.dart';
import 'package:helloworld02102023/product.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product Navigation demo home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key});
  MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String type="Laptop";
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          print("the item is "+items[index].name+"the index now is "+index.toString());
          if(items[index].type==this.type) {
            return GestureDetector(
              child: ProductBox(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index]),
                  ),
                );
              },
            );
            //
          }else{
            return Text("");
          }

        },
        //
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Laptops'),
              onTap: () {
                setState(() {
                  type="Laptop";
                });
                Navigator.pop(context);

              },
            ),ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Books'),
              onTap: () {
                setState(() {
                  type="Book";
                });
                Navigator.pop(context);

              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Mobiles'),
              onTap: () {
                setState(() {
                  type="Mobile";
                });
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}


