import 'package:flutter/material.dart';


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width, this.heigth , this.tag}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double heigth;
  final String tag;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
              
            ),
          ),
        ),
      ),
    );
  }
}