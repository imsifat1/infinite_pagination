//------------------------------------------------------------
//        this widget is for only for you categories
//------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

var size = 180.0;
var iconSize = 15.0;

Widget products(String ImgLocation, name, price, discountPrice, discountPercent,
    reviews, BuildContext context) {
  return Container(
    height: 300,
    child: Card(
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$ImgLocation',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : Center(
                              child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ));
                      // : LinearProgressIndicator();
                    },
                    width: MediaQuery.of(context).size.width,
                    height: size,
                  ),
                ),
              ),
              Text(
                '$name',
                textAlign: TextAlign.start,
              ),
              Text(
                '৳ $price',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    // ignore: unnecessary_new
                    TextSpan(
                      text: '৳ $discountPercent',
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: ' -$discountPrice%',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  rating(),
                  Text(
                    '($reviews)',
                    style: TextStyle(fontSize: iconSize),
                  )
                ],
              )
            ],
          )),
    ),
  );
}

rating() {
  return RatingBar.builder(
    initialRating: 3.5,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: iconSize,
    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
  );
}
