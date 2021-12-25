import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_bill/textStyles/text_styles.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKeyUserForm = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  double? screenWidth;

  @override
  void initState() {
    super.initState();
    dateController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKeyUserForm,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Signup for something exciting !',
                style: secondaryTextStyle,
              ),
              const Divider(
                
                color: Color(0xffff3838),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Color(0xff484848),
                  ),
                  hintText: 'What do people call you?',
                  hintStyle: secondaryTextStyle,
                  labelText: 'Name',
                  labelStyle: primaryTextStyle,
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'What is your phone number ?',
                  hintStyle: secondaryTextStyle,
                  labelText: 'Phone Number',
                  labelStyle: primaryTextStyle,
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: validateMobile,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'Mention your Date of Birth.',
                  hintStyle: secondaryTextStyle,
                  labelText: 'D.O.B',
                  labelStyle: primaryTextStyle,

                  icon: const Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    debugPrint(formattedDate);

                    setState(() {
                      dateController.text = formattedDate;
                      // addExpenseRequestModel
                      //         .invoice_date =
                      //     pickedDate.toIso8601String();
                    });
                  } else {
                    debugPrint("Date is not selected");
                  }
                },
                validator: (value) {
                  if (value == '') {
                    return 'Please enter the Date';
                  } else {
                    return null;
                  }
                },
                onSaved: (input) {
                  // addExpenseRequestModel.invoice_date =
                  //     input;
                },
              ),
              const SizedBox(
                height: 30,
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
                            'REGISTER',
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
            ],
          ),
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    if (value != null) {
      String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
      RegExp regExp = RegExp(pattern);
      if (value.isEmpty) {
        return 'Please enter mobile number';
      } else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
    }
    return null;
  }

  double checkScreenSize() {
    if (screenWidth! > 768) {
      return MediaQuery.of(context).size.width * 0.20;
    } else {
      return double.infinity;
    }
  }
}
