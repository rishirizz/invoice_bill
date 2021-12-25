import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_bill/constants/app_theme.dart';
import 'package:invoice_bill/form/user_form.dart';
import 'package:invoice_bill/form/ux_form.dart';
import 'package:invoice_bill/textStyles/text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import './constants/constants.dart' as global;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffff3838),
  ));
  // configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myLightTheme.copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            const Color(0xff2C061F),
          ),
        ),
      ),
      home: OpenBill(),
    );
  }
}

class OpenBill extends StatefulWidget {
  @override
  State<OpenBill> createState() => _OpenBillState();
}

class _OpenBillState extends State<OpenBill> {
  bool _customTileExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Screen width is ======>');
    debugPrint(MediaQuery.of(context).size.width.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (MediaQuery.of(context).size.width >= 500)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QrImage(
                              foregroundColor: Color(0xff2C061F),
                              data: '',
                              version: QrVersions.auto,
                              size: 100,
                              gapless: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    '# ' + '61bad9a2bf8d040c65abc7c6',
                                    style: secondaryTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'October 17th, 2021',
                                    style: secondaryTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: (!global.isSmallDevice(context)) ? 0 : 10,
                      ),
                      if (MediaQuery.of(context).size.width < 500)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QrImage(
                              foregroundColor: Color(0xff2C061F),
                              data: '',
                              version: QrVersions.auto,
                              size: 100,
                              gapless: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '#' + '61bad9a2bf8d040c65abc7c6',
                              style: secondaryTextStyle,
                              overflow:
                                  (MediaQuery.of(context).size.width < 500)
                                      ? TextOverflow.ellipsis
                                      : null,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'October 17th, 2021',
                              style: secondaryTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      if (MediaQuery.of(context).size.width < 500)
                        SizedBox(
                          height: (!global.isSmallDevice(context)) ? 10 : 25,
                        ),
                      Image.asset(
                        'images/store.png',
                        height: (global.isSmallDevice(context)) ? 60 : 80,
                        alignment: Alignment.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Next Gen Solutions'
                                ', ' +
                            'Ranchi',
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Address Line One',
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Address Line 2',
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'GSTIN : 09AAACH7409R1ZZ',
                        style: headerTextStyle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Greetings John Doe',
                        style: secondaryTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: itemInfoHeading(),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: productInfo(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xff2C061F),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Total Items : ',
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  '4',
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Bill Amount : ',
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  '\u{20B9} 1200',
                                  // bill!.total_price!.toStringAsFixed(2),
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'You Paid : ',
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  '\u{20B9} 1000',
                                  // bill!.total_price!.toStringAsFixed(2),
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                            // if (bill!['paid_amount'] < bill!['net_price'])
                            //   const SizedBox(
                            //     height: 10,
                            //   ),
                            // if (bill!['paid_amount'] < bill!['net_price'])
                            //   Row(
                            //     children: <Widget>[
                            //       Text(
                            //         'Credit : ',
                            //         style: primaryTextStyle,
                            //       ),
                            //       Text(
                            //         '\u{20B9} ${(bill!['net_price'] - bill!['paid_amount']).toStringAsFixed(2)}',
                            //         style: primaryTextStyle.copyWith(
                            //           color: const Color(0xffff3838),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // if (bill!['discount'] != 0)
                            //   const SizedBox(
                            //     height: 20,
                            //   ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     if (bill!['discount'] != 0)
                            //       Row(
                            //         children: [
                            //           Text(
                            //             'You saved : ',
                            //             style: headerTextStyle,
                            //           ),
                            //           Text(
                            //             '\u{20B9}'
                            //             '${bill!['discount'].toStringAsFixed(2)}',
                            //             style: headerTextStyle.copyWith(
                            //               color: const Color(0xffff3838),
                            //               fontSize: 15,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              child: ExpansionTile(
                                collapsedBackgroundColor:
                                    const Color(0xff2C061F),
                                iconColor: (_customTileExpanded == false)
                                    ? const Color(0xff2C061F)
                                    : Colors.white,
                                title: Text(
                                  'View Exciting Offers',
                                  style: (_customTileExpanded == false)
                                      ? primaryTextStyle.copyWith(
                                          color: Colors.white)
                                      : primaryTextStyle,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    '(Something\'s exciting is in the store for you !)',
                                    style: (_customTileExpanded == false)
                                        ? secondaryTextStyle.copyWith(
                                            color: Colors.white)
                                        : secondaryTextStyle,
                                  ),
                                ),
                                trailing: Icon(
                                  _customTileExpanded
                                      ? Icons.arrow_drop_down_circle
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Oops, there seems to be nothing as of now. Please come back later and check again')
                                    ],
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(
                                      () => _customTileExpanded = expanded);
                                },
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   margin: const EdgeInsets.symmetric(
                            //     horizontal: 4.0,
                            //     vertical: 8.0,
                            //   ),
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 8.0,
                            //     vertical: 12.0,
                            //   ),
                            //   decoration: const BoxDecoration(
                            //     gradient: LinearGradient(
                            //       stops: [0.006, 0.006],
                            //       colors: [
                            //         Color(0xffff3838),
                            //         Colors.white,
                            //       ],
                            //     ),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(5.0),
                            //     ),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: 4.0,
                            //         offset: Offset(0.0, 1.5),
                            //       ),
                            //     ],
                            //   ),
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           'Mode of Payment',
                            //           style: primaryTextStyle,
                            //         ),
                            //         const Divider(
                            //           color: Color(0xffff3838),
                            //         ),
                            //         const SizedBox(height: 10),
                            //         Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //               'CASH',
                            //               style: secondaryTextStyle,
                            //             ),
                            //             Text(
                            //               '\u{20B9} '
                            //               '1200',
                            //               style: primaryTextStyle,
                            //             ),
                            //           ],
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            const UserForm(),
                            const SizedBox(
                              height: 20,
                            ),
                            const UserRating(),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Connect with us !',
                                      style: primaryTextStyle,
                                    ),
                                    const Divider(
                                      color: Color(0xff2C061F),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: _launchWhatsApp,
                                            child: Card(
                                              elevation: 4,
                                              child: Column(
                                                children: [
                                                  if (global
                                                      .isSmallDevice(context))
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  Image.asset(
                                                    'images/whstp.png',
                                                    height:
                                                        (global.isSmallDevice(
                                                                context))
                                                            ? 50
                                                            : 90,
                                                  ),
                                                  Text(
                                                    'Chat now.',
                                                    style: secondaryTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: _launchPhoneCalls,
                                            child: Card(
                                              elevation: 4,
                                              child: Column(
                                                children: [
                                                  if (global
                                                      .isSmallDevice(context))
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  Image.asset(
                                                    'images/phone.png',
                                                    height:
                                                        (global.isSmallDevice(
                                                                context))
                                                            ? 50
                                                            : 90,
                                                  ),
                                                  Text(
                                                    'Call us.',
                                                    style: secondaryTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: _launchEmailURL,
                                            child: Card(
                                              elevation: 4,
                                              child: Column(
                                                children: [
                                                  if (global
                                                      .isSmallDevice(context))
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  Image.asset(
                                                    'images/email.png',
                                                    height:
                                                        (global.isSmallDevice(
                                                                context))
                                                            ? 50
                                                            : 90,
                                                  ),
                                                  Text(
                                                    'Write us.',
                                                    style: secondaryTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Thank you for shopping. Visit again.',
                              style: secondaryTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Email : ',
                                  style: primaryTextStyle.copyWith(
                                    color: const Color(0xff2C061F),
                                  ),
                                ),
                                Text(
                                  'adminbill@shop.org',
                                  style: secondaryTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Phone : ',
                                  style: primaryTextStyle.copyWith(
                                    color: const Color(0xff2C061F),
                                  ),
                                ),
                                Text(
                                  '9876543210',
                                  style: secondaryTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  (!global.isSmallDevice(context)) ? 40 : 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Powered by ',
                          style: headerTextStyle.copyWith(fontSize: 20),
                        ),
                        InkWell(
                          onTap: _launchSboxPlayStore,
                          child: Image.asset(
                            'images/sbox_login.png',
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemInfoHeading() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 35,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Product Name',
                    style: (!global.isSmallDevice(context))
                        ? headerTextStyle
                        : headerTextStyle.copyWith(fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Qty',
                    style: (!global.isSmallDevice(context))
                        ? headerTextStyle
                        : headerTextStyle.copyWith(fontSize: 15),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'MRP',
                    style: (!global.isSmallDevice(context))
                        ? headerTextStyle
                        : headerTextStyle.copyWith(fontSize: 15),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Amount',
                    style: (!global.isSmallDevice(context))
                        ? headerTextStyle
                        : headerTextStyle.copyWith(fontSize: 15),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Divider(thickness: 2),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget productInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => Row(
              children: <Widget>[
                Expanded(
                  flex: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sample Product',
                      style: secondaryTextStyle,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1',
                      style: (!global.isSmallDevice(context))
                          ? primaryTextStyle
                          : primaryTextStyle.copyWith(
                              fontSize: 13,
                            ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '300',
                      style: (!global.isSmallDevice(context))
                          ? primaryTextStyle
                          : primaryTextStyle.copyWith(
                              fontSize: 13,
                            ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '300',
                      style: (!global.isSmallDevice(context))
                          ? primaryTextStyle
                          : primaryTextStyle.copyWith(
                              fontSize: 13,
                            ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }

  _launchSboxPlayStore() async {
    const sboxUrl =
        'https://play.google.com/store/apps/dev?id=8033316410804140766';
    if (await canLaunch(sboxUrl)) {
      await launch(sboxUrl);
    } else {
      throw 'Could not launch $sboxUrl';
    }
  }

  _launchWhatsApp() async {
    String text = 'Hi, Thanks for stopping by.';
    String whatsAppUrl = 'https://wa.me/91'
            '9876543210'
            '?text=' +
        Uri.encodeComponent(text);
    if (await canLaunch(whatsAppUrl)) {
      await launch(whatsAppUrl);
    } else {
      throw 'Could not launch $whatsAppUrl';
    }
  }

  _launchPhoneCalls() async {
    String telephoneNo = 'tel:+911234567890';
    if (await canLaunch(telephoneNo)) {
      await launch(telephoneNo);
    } else {
      throw 'Could not launch $telephoneNo';
    }
  }

  void _launchEmailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'johndoe@org.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
