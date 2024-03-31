import 'package:airlinesk3/Box/Grid_views.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class TopPicksCell extends StatelessWidget {
  final Map iObj;
  TopPicksCell({super.key, required this.iObj});
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.transparent,
                    blurRadius: 1)
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => grid_view()));
                  },
                  child: Image.asset(iObj['img'].toString(),
                      height: media.height * 0.2,
                      width: media.width,
                      fit: BoxFit.cover),
                ),
              )),
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              child: LikeButton(
                size: 20,
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.white,
                    size: 20,
                  );
                },
                likeCount: 665,
              ),
            )
          ],
        )
      ]),
    );
  }
}
