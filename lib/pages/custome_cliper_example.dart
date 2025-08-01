import 'package:flutter/material.dart';

class CustomeCliperExample extends StatelessWidget {
  const CustomeCliperExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: Cliper(),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: NetworkImage(
                "https://thumbs.dreamstime.com/b/assorted-indian-recipes-food-various-spices-rice-wooden-table-92742528.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class Cliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.65);

    path.quadraticBezierTo(
      size.width * .75,
      size.height,
      size.width,
      size.height * .65,
    );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
