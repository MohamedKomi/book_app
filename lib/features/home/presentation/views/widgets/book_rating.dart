import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {Key? key,
      required this.mainAxisAlignment,
      required this.rate,
      required this.count})
      : super(key: key);
  final num rate;
  final int count;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rate.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text('($count)', style: Styles.textStyle14),
        ),
      ],
    );
  }
}
