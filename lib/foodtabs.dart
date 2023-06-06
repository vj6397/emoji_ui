import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem(
              'Delcious hot dog', 4.0, '6', '18', 'assets/hotdog.png'),
          _buildListItem('Cheese pizza', 5.0, '12', '25', 'assets/pizza.png'),
        ],
      ),
    );
  }
}

_buildListItem(
    String foodName, rating, String prize, String oldPrize, String imgPath) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 210.0,
          child: Row(
            children: <Widget>[
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xffffe3df),
                ),
                child: Center(
                  child: Image.asset(
                    imgPath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    foodName,
                    style: GoogleFonts.notoSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                      rating = v;
                    },
                    starCount: rating.toInt(),
                    rating: rating,
                    size: 15.0,
                    color: Color(0xffffd143),
                    borderColor: Color(0xffffd143),
                    spacing: 0.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '\$' + prize,
                        style: GoogleFonts.notoSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfff68d7f),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '\$' + oldPrize,
                        style: GoogleFonts.notoSans(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        FloatingActionButton(
          heroTag: foodName,
          mini: true,
          onPressed: () {},
          child: Center(child: Icon(Icons.add, color: Colors.white)),
          backgroundColor: Color(0xFFFE7D6A),
        ),
      ],
    ),
  );
}
