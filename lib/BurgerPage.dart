import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;

  BurgerPage({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netprize = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.menu, color: Colors.black),
            Stack(
              children: [
                Container(height: 45.0, width: 45.0, color: Colors.transparent),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xfffe7d6a),
                        spreadRadius: 6.0,
                        offset: Offset(0.0, 4.0))
                  ], shape: BoxShape.circle),
                  child: Center(
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 1.0,
                  right: 4.0,
                  child: Container(
                    height: 12.0,
                    width: 12.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Text('1',
                            style: GoogleFonts.notoSans(
                                fontSize: 7.0,
                                textStyle: TextStyle(color: Colors.red)))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 15.0),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          'SUPER',
          style: GoogleFonts.notoSans(
              fontSize: 27.0, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          widget.foodName,
          style: GoogleFonts.notoSans(
              fontSize: 27.0, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      SizedBox(height: 40.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(
            tag: widget.foodName,
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 45.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffe7d6a),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                            offset: Offset(5.0, 11.0)),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xfffe7d6a),
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.0),
              Stack(
                children: <Widget>[
                  Container(
                    height: 45.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffe7d6a),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                            offset: Offset(5.0, 11.0)),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.restore,
                        color: Color(0xfffe7d6a),
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: 75.0,
              width: 125.0,
              color: Colors.white,
              child: Center(
                  child: Text(
                '\$' + (int.parse(widget.pricePerItem) * quantity).toString(),
                style: GoogleFonts.notoSans(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff5e6166)),
              ))),
          Container(
            height: 75.0,
            width: 225.0,
            decoration: BoxDecoration(
                color: Color(0xfffe7d6a),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 45.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            adjustQuantity('minus');
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.red,
                          )),
                      Text(quantity.toString(),
                          style: GoogleFonts.notoSans(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xfffe7d6a))),
                      IconButton(
                          onPressed: () {
                            adjustQuantity('plus');
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
                Text(
                  'Add to cart',
                  style: GoogleFonts.notoSans(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('FEATURED',
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ))),
      Container(
        height: 225.0,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildListItem('1'),
            _buildListItem('2'),
          ],
        ),
      ),
    ]));
  }

  _buildListItem(String columnNum) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          if (columnNum == '1')
            _buildColumnItem(
                'assets/cheese.png', 'sweet cheese', '11', Color(0xfffbd6f5)),
          if (columnNum == '1') SizedBox(height: 15.0),
          if (columnNum == '1')
            _buildColumnItem('assets/popcorn.png', 'sweet pop corn', '11',
                Color(0xfffbd6f5)),
          if (columnNum == '2')
            _buildColumnItem(
                'assets/taco.png', 'Tacos', '6', Color(0xFFC2E3FE)),
          if (columnNum == '2') SizedBox(height: 15.0),
          if (columnNum == '2')
            _buildColumnItem(
                'assets/sandwich.png', 'Sandwich', '6', Color(0xFFD7FADA)),
        ],
      ),
    );
  }

  _buildColumnItem(
      String imgPath, String foodName, String Prize, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 210.0,
          child: Row(
            children: [
              Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0), color: bgColor),
                  child: Center(
                    child: Image.asset(imgPath, height: 50.0, width: 50.0),
                  )),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodName,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      )),
                  Text(
                    '\$' + Prize,
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFFF68D7F)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'plus':
        setState(() {
          quantity += 1;
        });
        break;
      case 'minus':
        if (quantity > 0) {
          setState(() {
            quantity -= 1;
          });
        }
        break;
    }
  }
}
