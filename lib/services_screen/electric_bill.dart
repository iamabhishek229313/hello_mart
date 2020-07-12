import 'package:flutter/material.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ElectricBillServiceProviderScreen extends StatelessWidget {
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _validate = false;
  TextEditingController _consumernoController = TextEditingController();
  TextEditingController _doctorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Form(
        key: _fromKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Consumer No.",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, color: kGreyDark, fontSize: 28.0),
                ),
              ),
            ),
            Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Select Hospital",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: kGreyDark),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextFormField(
                      controller: _consumernoController,
                      validator: (value) => value.isEmpty ? "Enter Consumer No." : null,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                  child: RaisedButton(
                    onPressed: () {},
                    color: kPrimaryDark,
                    child: Text(
                      "Upload Bill",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: kGreyDark),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                  child: RaisedButton(
                    onPressed: () {},
                    color: kPrimaryDark,
                    child: Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: kGreyDark),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Want to track your Bill?",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.grey.shade400),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Click Here",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
