import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_1/widgets/circular_button.dart';
import 'package:projeto_1/widgets/product_color_selector.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
   double rating = 4.0;

  final String desc = "Ea anim veniam consectetur incididunt duis qui non deserunt qui magna laboris" 
                      "mollit sit laboris. Qui est fugiat sunt consequat laboris aute consequat eiusmod.";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);


    return Scaffold(
      backgroundColor: Color(0xFFF9F9F7),

      body: Stack(
        children: <Widget>[

          Positioned(
              top: 30, left: 20, right: 20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: (){}
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    color: Colors.black,
                    onPressed: (){}
                  )
                ],
              ),

            ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(
              child: Image.asset(
                "lib/assets/model.jpg",
                width: double.infinity,
                height: height * .7,
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffdad9d5),
                  Color(0xffdcd9d2).withOpacity(.2)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops:  [ 0.0, 0.5 ],
                tileMode: TileMode.clamp
              )
            ),
          ),

          Column(

            children: <Widget>[

              Expanded(
                child: Container(),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height:  ScreenUtil().setHeight(580),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget> [

                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(400),
                          ),
                          child: Text(
                            "Vestido Preto",
                            style: GoogleFonts.montserrat(
                              fontSize: ScreenUtil().setSp(54),
                              fontWeight: FontWeight.w700,
                            )
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: <Widget>[

                            CustomPaint(
                              painter: LinePainter(),
                              child: Text(
                                '\$239',
                                style: GoogleFonts.montserrat(
                                  fontSize: ScreenUtil().setSp(34),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            SizedBox(height : 12),

                            Text(
                              '\$208.99',
                              style: GoogleFonts.montserrat(
                                fontSize: ScreenUtil().setSp(36),
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                          ],
                        )

                      ]
                    ),
                    
                    SizedBox( height: ScreenUtil().setHeight(14) ),

                    SmoothStarRating(
                      allowHalfRating: true,
                      starCount: 5,
                      rating: rating,
                      size: 22,
                      color: Colors.black,
                      borderColor: Colors.white,
                      spacing: 0.0,
                    ),

                    SizedBox(
                      height: ScreenUtil().setHeight(24),
                    ),

                    Text(
                      "Color",
                      style: GoogleFonts.montserrat(
                        fontSize: ScreenUtil().setSp(36),
                        fontWeight: FontWeight.w700
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColorSelector(
                          colors: [
                            Color(0xff201e1f),
                            Color(0xff919191),
                            Color(0xffe3d4bf),
                          ],
                        ),
                        CircularButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )
                      ]
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(460)
                          ),
                          child: Text(
                            desc,
                            style: GoogleFonts.montserrat(
                              fontSize: ScreenUtil().setSp(30),
                            ),
                          ),
                        ),
                        CircularButton(
                          color: Colors.black,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white
                          ),
                          onPressed: () {},
                        )
                      ],
                    )
                    
                  ],
                ),
              )
            ],
          )  
        ]
      ),
    
    );
  }
}

class LinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2.4;

    canvas.drawLine(
      Offset( 0, size.height -4 ), Offset( size.width, 4 ), linePaint
    );

  }
  
  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;
  
  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;


  
}