import 'package:flutter/material.dart';
class Product {
  final String name;
  final String type;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.type, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product(
            "Pixel",
            "Mobile",
            "Pixel is the most featureful phone ever",
            800,
            "pixel.png"
        )
    );
    items.add(
        Product(
            "Toshiba laptop 1",
            "Laptop",
            "Toshiba Laptop with core i7 processor",
            2000,
            "laptop.png"
        )
    );
    items.add(
        Product(
            "Dell laptop D5500",
            "Laptop",
            "Dell Laptop with core i7 processor and 16 Gb RAM",
            1500,
            "tablet.png"
        )
    );
    items.add(
        Product(
            "Rich Dad Poor Dad",
            "Book",
            "is a 1997 book written by Robert T. Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy, financial independence and building wealth through investing in assets, real estate investing, starting and owning businesses, as well as increasing one's financial intelligence.",
            100,
            "pendrive.png"
        )
    );
    items.add(
        Product(
            "HP laptop ZBOOK",
            "Laptop",
            "high quality ZBook Laptop with core i7 processor and 16 Gb RAM",
            20,
            "floppy.png"
        )
    );
    items.add(
        Product(
            "Redmi note 11",
            "Mobile",
            "Redmi is the stylist note phone ever with high capabilities",
            1000,
            "iphone.png"
        )
    );items.add(
        Product(
            "Redmi  11",
            "Mobile",
            "Redmi is the latest phone  with high capabilities",
            800,
            "pixel.png"
        )
    );
    items.add(
        Product(
            "Toshiba laptop 2",
            "Laptop",
            "Toshiba Laptop with core i5 processor",
            2000,
            "laptop.png"
        )
    );
    items.add(
        Product(
            "Dell laptop D5500",
            "Laptop",
            "Dell Laptop with core i5 processor and 8 Gb RAM",
            1500,
            "tablet.png"
        )
    );
    items.add(
        Product(
            "Men Are from Mars, Women Are from Venus ",
            "Book",
            "(1992) is a book written by American author and relationship counselor John Gray. The book states that most common ...",
            100,
            "pendrive.png"
        )
    );
    items.add(
        Product(
            "HP laptop ZBOOK",
            "Laptop",
            "iPhone is the stylist phone ever",
            20,
            "floppy.png"
        )
    );
    items.add(
        Product(
            "Redmi note 11",
            "Mobile",
            "iPhone is the stylist phone ever",
            1000,
            "iphone.png"
        )
    );
    return items;
  }
}
class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description),
                            Text("Price: " + this.item.price.toString()),
                            RatingBox(),
                            ElevatedButton(onPressed:(){ Navigator.pop(context);},    child: Text("Back"))
                          ],
                        )
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 1 ? Icon(
                  Icons.star,
                  size: _size,
                )
                    : Icon(
                  Icons.star_border,
                  size: _size,
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 2 ?
                Icon(
                  Icons.star,
                  size: _size,
                )
                    : Icon(
                  Icons.star_border,
                  size: _size,
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                _rating >= 3 ?
                Icon(
                  Icons.star,
                  size: _size,
                )
                    : Icon(
                  Icons.star_border,
                  size: _size,
                )
            ),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}
class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)), Text(this.item.description, overflow: TextOverflow.ellipsis,),
                            Text("Price: " + this.item.price.toString()),
                            RatingBox(),
                          ],
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}