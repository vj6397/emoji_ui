import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BurgerPage.dart';

class ListTileCard extends StatefulWidget {
  final String foodName;
  final String imgPath;
  final String prize;
  final Color bgcolor;
  final Color textcolor;
  ListTileCard(
      this.foodName, this.imgPath, this.prize, this.bgcolor, this.textcolor);

  @override
  State<ListTileCard> createState() => _ListTileCardState();
}

class _ListTileCardState extends State<ListTileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BurgerPage(
                  heroTag: widget.foodName,
                  foodName: widget.foodName,
                  pricePerItem: widget.prize,
                  imgPath: widget.imgPath)));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.bgcolor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: widget.foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:
                        Image.asset(widget.imgPath, height: 50.0, width: 50.0),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                widget.foodName,
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: widget.textcolor,
                ),
              ),
              Text(
                '\$${widget.prize}',
                style: GoogleFonts.notoSans(
                  fontSize: 17.0,
                  color: widget.textcolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
