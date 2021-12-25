import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:invoice_bill/textStyles/text_styles.dart';

class UserRating extends StatefulWidget {
  const UserRating({Key? key}) : super(key: key);

  @override
  _UserRatingState createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 8.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us about your overall experience.',
              style: primaryTextStyle,
            ),
            const Divider(
              color: Color(0xff2C061F),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Billing Experience',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                size: 1,
                color: Color(0xff2C061F),
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Staff Helpfulness',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                size: 1,
                color: Color(0xff2C061F),
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Product Availability',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                size: 1,
                color: Color(0xff2C061F),
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Store Ambience',
                style: secondaryTextStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                size: 1,
                color: Color(0xff2C061F),
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  labelStyle: primaryTextStyle,
                  hintText: 'Please help us improve.',
                  hintStyle: secondaryTextStyle,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                // onSaved: (input) => addExpenseRequestModel.note = input,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: checkScreenSize(),
              child: ElevatedButton(
                onPressed: () {
                  // _submitCommand();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.006, 0.006],
          colors: [
            Color(0xff2C061F),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
            offset: Offset(0.0, 1.5),
          ),
        ],
      ),
    );
  }

  double checkScreenSize() {
    if (screenWidth! > 768) {
      return MediaQuery.of(context).size.width * 0.20;
    } else {
      return double.infinity;
    }
  }
}
