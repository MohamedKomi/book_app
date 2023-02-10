import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookActions extends StatelessWidget {
  const BookActions({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              backgroundColor: Colors.white,
              textColor: Colors.black,
              text:'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                Uri url = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: 'Free Preview',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
