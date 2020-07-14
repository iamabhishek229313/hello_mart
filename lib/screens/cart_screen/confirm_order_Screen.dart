import 'package:flutter/material.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ConfirmOrderScreen extends StatefulWidget {
  @override
  _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  bool _checkBoxValue = false;
  int _tipSelected = -1; // None of them.
  @override
  Widget build(BuildContext context) {
    List<String> _choiceChips = [
      "₹ 7",
      "₹ 10",
      "₹ 15",
      "₹ 20",
      "₹ 45",
      "Custom tip",
    ];
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Confirm Order",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28.0, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: List.generate(
                2,
                (index) => Container(
                      height: screenHeight * 0.12,
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// Store name
                                        Text(
                                          "PALOODA CREAMS AND PASTRIES",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            color: kGreyDark,
                                          ),
                                        ),

                                        /// Product name.
                                        Text(
                                          "Pineapple Cake",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: kGreyDark,
                                          ),
                                        ),

                                        /// Qunatitiy
                                        Text(
                                          1.toString() + " Kg",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: kGreyDark,
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: screenHeight * 0.03,
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade800,
                                                  borderRadius: BorderRadius.circular(30.0)),
                                            ),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "INR 800",
                                                  style: TextStyle(fontSize: 8.0, color: kGreyDark),
                                                ),
                                                SizedBox(
                                                  height: 4.0,
                                                ),
                                                Text(
                                                  "INR 700",
                                                  style: TextStyle(
                                                      fontSize: 14.0, color: kGreyDark, fontWeight: FontWeight.bold),
                                                )
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey.shade500,
                          )
                        ],
                      ),
                    )),
          ),
          Container(
            height: screenHeight * 0.06,
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            color: Colors.grey.shade300,
            child: Container(
              color: Colors.white,
              width: double.maxFinite,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(Icons.border_color, color: Colors.grey.shade300),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Any instructions?",
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.06,
            padding: const EdgeInsets.only(bottom: 6.0),
            color: Colors.grey.shade300,
            child: Container(
              color: Colors.white,
              width: double.maxFinite,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    Image.asset(
                      'assets/icons/sale.png',
                      width: screenHeight * 0.03,
                      height: screenHeight * 0.03,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Apply Coupon",
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.12,
            width: double.minPositive,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.grey.shade300,
            child: Container(
              color: Colors.grey.shade50,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.02,
                    child: Checkbox(
                        value: _checkBoxValue,
                        activeColor: Colors.green,
                        onChanged: (bool newValue) {
                          setState(() {
                            _checkBoxValue = newValue;
                          });
                        }),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "No Contact Delivery",
                        style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Partner will check with you and leave the order\noutside your door.",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.15,
            width: double.minPositive,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.grey.shade300,
            child: Container(
              color: Colors.grey.shade50,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.0 + screenHeight * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thank your partner with a tip",
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: kGreyDark),
                      ),
                      Expanded(
                        child: Wrap(
                            runSpacing: 0.0,
                            runAlignment: WrapAlignment.start,
                            alignment: WrapAlignment.start,
                            children: List.generate(
                                _choiceChips.length,
                                (index) => SizedBox(
                                    height: screenHeight * 0.05,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: ChoiceChip(
                                        onSelected: (val) {
                                          setState(() {
                                            _tipSelected = index;
                                          });
                                        },
                                        selectedColor: Colors.green.shade500,
                                        backgroundColor: Colors.grey.shade200,
                                        label: Text(
                                          _choiceChips[index],
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                        ),
                                        selected: _tipSelected == index ? true : false,
                                      ),
                                    )))
                            // .map((e) =>
                            // .toList(),
                            ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "PAYMENT DETAILS",
                  style: TextStyle(fontWeight: FontWeight.w600, color: kGreyDark, fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // Item Total
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Total",
                          style: TextStyle(fontSize: 13.0, color: kGreyDark, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "INR 700",
                          style: TextStyle(fontSize: 13.0, color: kGreyDark, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),

                    /// Delivery Fee
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dilevery Free",
                          style: TextStyle(fontSize: 13.0, color: kGreyDark, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "INR 50",
                          style: TextStyle(fontSize: 13.0, color: kGreyDark, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),

                    //
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Discount",
                          style: TextStyle(fontSize: 15.0, color: kPrimaryDark, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "- INR 100",
                          style: TextStyle(fontSize: 13.0, color: kPrimaryDark, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5.0,
                thickness: 1.1,
              ),
              Container(
                height: screenHeight * 0.05,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grand Total",
                      style: TextStyle(fontWeight: FontWeight.w600, color: kGreyDark, fontSize: 28.0),
                    ),
                    Text(
                      "₹ 650",
                      style: TextStyle(fontWeight: FontWeight.w600, color: kGreyDark, fontSize: 28.0),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 5.0,
                thickness: 1.1,
              ),
              Container(
                height: screenHeight * 0.135,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Deliver to Home",
                                  style: TextStyle(color: kGreyDark, fontSize: 16.0, fontWeight: FontWeight.w600)),
                              Text("Address -- -- --",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  )),
                              Text("Time Duration",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹ 650",
                                style: TextStyle(color: kGreyDark, fontSize: 18.0, fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "VIEW DETAILED BILL",
                                      style:
                                          TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // child: Text(
                      //   "Grand Total",
                      //   style: TextStyle(fontWeight: FontWeight.w600, color: kGreyDark, fontSize: 28.0),
                      // ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          Text(
                            "CHANGE",
                            style: TextStyle(color: Colors.orange.shade800, fontSize: 10.0, shadows: [
                              Shadow(color: Colors.orange.shade300, blurRadius: 5.0, offset: Offset(1.0, 1.0))
                            ]),
                          ),
                          Spacer(),
                          Container(
                            height: screenHeight * 0.035,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentOptionsScreen()));
                              },
                              elevation: 0.0,
                              color: kPrimaryDark,
                              child: Text(
                                "MAKE PAYMENT",
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.black),
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.2,
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaymentOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        elevation: 0.0,
        title: Text(
          "Payment Options",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight * 0.05,
            width: double.maxFinite,
            color: Colors.grey.shade300,
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "CREDIT/DEBIT CARDS",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: kGreyDark),
                )
              ],
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.07,
                    width: double.maxFinite,
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/rupay.png',
                          width: screenHeight * 0.06,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "4451-XXXXXXXXXX-6266",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
                        ),
                        Spacer(),
                        Icon(
                          Icons.assignment_turned_in,
                          color: Colors.grey.shade200,
                        ),
                        SizedBox(
                          width: 20.0,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.1,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.07,
                    width: double.maxFinite,
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/mastercard.png',
                          width: screenHeight * 0.06,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "4451-XXXXXXXXXX-6266",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
                        ),
                        Spacer(),
                        Icon(
                          Icons.assignment_turned_in,
                          color: Colors.grey.shade200,
                        ),
                        SizedBox(
                          width: 20.0,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.1,
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: screenHeight * 0.05,
            width: double.maxFinite,
            color: Colors.grey.shade300,
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "UPI",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: kGreyDark),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: screenHeight * 0.07,
                width: double.maxFinite,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/bhim.jpg',
                      width: screenHeight * 0.06,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "4451-XXXXXXXXXX-6266",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(
                      Icons.assignment_turned_in,
                      color: Colors.grey.shade200,
                    ),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              ),
              Divider(
                height: 2.0,
                thickness: 1.1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
