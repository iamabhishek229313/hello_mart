import 'package:flutter/material.dart';
import 'package:hello_mart/utils/const_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 5.0, color: kGreyDark)),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/face.png',
                        color: kGreyDark,
                        height: screenHeight * 0.08,
                        width: screenHeight * 0.08,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Abhishek kumar",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: kGreyDark, fontSize: 36.0, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "iamabhihsek229313@gmail.com".toLowerCase(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: kGreyDark, fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "+91 9999999999",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: kGreyDark, fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Edit",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: kGreyDark, fontSize: 16.0, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.create,
                              size: 14.0,
                              color: kGreyDark,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: tiles.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return index < tiles.length
                          ? InkWell(
                              onTap: () {
                                // Will do something.
                              },
                              child: Container(
                                height: screenHeight * 0.05,
                                child: Row(
                                  children: [
                                    tiles[index].iconUrl == null
                                        ? SizedBox(
                                            width: screenHeight * 0.03,
                                          )
                                        : Image.asset(
                                            tiles[index].iconUrl,
                                            height: screenHeight * 0.03,
                                            width: screenHeight * 0.03,
                                          ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.03,
                                    ),
                                    Text(
                                      tiles[index].title,
                                      style: TextStyle(color: kGreyDark, fontSize: 17.0, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: screenHeight * 0.05,
                              child: Column(
                                children: [
                                  Text(
                                    "Hello Market V.1.1",
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: kGreyDark),
                                  ),
                                  Text(
                                    "Developed by A.S Designs",
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0, color: kGreyDark),
                                  )
                                ],
                              ),
                            );
                    })),
          ],
        ),
      ),
    );
  }
}

class ProfileTiles {
  @required
  final String title;
  @required
  final String iconUrl;

  ProfileTiles(this.title, this.iconUrl);
}

List<ProfileTiles> tiles = [
  ProfileTiles('Your Orders', 'assets/icons/bookmark.png'),
  ProfileTiles('Offer Zone', 'assets/icons/sale.png'),
  ProfileTiles('Payments', 'assets/icons/mail.png'),
  ProfileTiles('Address Book', 'assets/icons/bookmark.png'),
  ProfileTiles('Send Feedback', 'assets/icons/success.png'),
  ProfileTiles('Rate Us', 'assets/icons/bookmark.png'),
  ProfileTiles('Terms Of Use', null),
  ProfileTiles('Privacy Policy', null),
  ProfileTiles('Refund & Cancellation', null),
  ProfileTiles('FAQ', null),
  ProfileTiles('About Us', null),
  ProfileTiles('Contact Us', null),
  ProfileTiles('Log Out', null),
];
