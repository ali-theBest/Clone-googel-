import 'dart:math';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:playstore_flutter/model/PSModel.dart';
import 'package:playstore_flutter/utils/PSColor.dart';
import 'package:playstore_flutter/utils/AppColors.dart';
import 'package:playstore_flutter/utils/AppWidget.dart';
import 'package:playstore_flutter/model/PSAppbarModel.dart';
import 'package:playstore_flutter/utils/PSDataProvider.dart';
import 'package:playstore_flutter/components/AppWidgets.dart';
import 'package:playstore_flutter/screens/PSAboutGameScreen.dart';
import 'package:playstore_flutter/screens/PSRatingReviewScreen.dart';
import 'package:playstore_flutter/screens/PSMoviesViewAllScreen.dart';
import 'package:playstore_flutter/components/PSMoviesForYouComponent.dart';


class PSBookDetailsScreen extends StatefulWidget {
  static String tag = '/PSBookDetalisScreen';

  final PSGameModel? data;
  final List<PSAppbarModel>? list;

  PSBookDetailsScreen({this.data, this.list});

  @override
  PSBookDetailsScreenState createState() => PSBookDetailsScreenState();
}

class PSBookDetailsScreenState extends State<PSBookDetailsScreen> {
  var randomNumber = Random();
  List<String> list2 = ['Indian Cinema', 'Offline'];
  List<PSReviews> getReviewsList = getReviewList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(Icons.search),
          12.width,
          PopupMenuButton(
            onSelected: (dynamic value) {
              if (value == 1) {
                Share.share("abc");
              }
            },
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.share_sharp),
                    8.width,
                    Text('Share'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(widget.data!.imgLogo != null ? widget.data!.imgLogo : widget.data!.imgMain, height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(15).paddingLeft(16),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data!.title!, style: boldTextStyle(size: 20)),
                    if (widget.data!.subTitle != null) Text(widget.data!.subTitle!, style: secondaryTextStyle(color: psColorGreen)),
                    if (widget.data!.subTitle1 != null) Text(widget.data!.subTitle1!),
                  ],
                ).expand(),
              ],
            ),
            24.height,
            Container(
              height: 50,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [Text('${randomNumber.nextInt(5) + 0.3}', style: boldTextStyle()), Icon(Icons.star, size: 10)],
                        ),
                        Text('${randomNumber.nextInt(153648) + 1000}K reviews', style: secondaryTextStyle(size: 12))
                      ],
                    ).paddingOnly(right: 16, left: 16),
                    Container(height: 30, width: 1, color: Colors.grey),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add_box_rounded, size: 20),
                          ],
                        ),
                        Text('Rated for 3+', style: secondaryTextStyle(size: 12))
                      ],
                    ).onTap(() {
                      accountDialogBox(context, onPressed: () {
                        finish(context);
                      });
                    }).paddingOnly(right: 16, left: 16),
                    Container(height: 30, width: 1, color: Colors.grey),
                    Column(
                      children: [
                        Text('${randomNumber.nextInt(100) + 30}K', style: boldTextStyle(size: 14)),
                        2.height,
                        Text('Downloads', style: secondaryTextStyle()),
                      ],
                    ).paddingOnly(right: 16, left: 16),
                    32.height,
                  ],
                ),
              ]),
            ),
            32.height,
            Container(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: boxDecoration(color: appDividerColor, radius: 4),
                    child: Text('Free Sample', style: primaryTextStyle(color: psColorRed)).center(),
                  ).paddingLeft(16).expand(),
                  16.width,
                  Container(
                    decoration: boxDecoration(bgColor: psColorRed, radius: 4),
                    child: Text('Buy from₹ ${randomNumber.nextInt(1000) + 200}', style: primaryTextStyle(color: Colors.white)).center(),
                  ).paddingOnly(right: 16).expand(),
                ],
              ),
            ).paddingOnly(bottom: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('About this game', style: boldTextStyle()),
                Icon(Icons.arrow_forward_rounded),
              ],
            ).paddingOnly(left: 16, right: 16).onTap(() {
              PSAboutGameScreen(data: widget.data).launch(context);
            }),
            12.height,
            Text('Swipe  and place the tiles orderly. Challenge the number maze quickly.').paddingOnly(left: 16, right: 16),
            18.height,
            Container(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: list2.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(left: 8, right: 8),
                    decoration: boxDecoration(color: grey, radius: 16),
                    child: Text(list2[index]).center(),
                  );
                },
              ).paddingOnly(left: 8),
            ),
            18.height,
            Text('Rate this app', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            Text('Tell other what you think').paddingOnly(left: 16, right: 16),
            18.height,
            RatingBarWidget(
              itemCount: 5,
              size: 28,
              spacing: 16,
              rating: 0,
              onRatingChanged: (v) {},
            ).paddingOnly(left: 16, right: 16),
            18.height,
            Text('Writes and reviews', style: primaryTextStyle(color: psColorRed)).paddingOnly(left: 16, right: 16),
            28.height,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${randomNumber.nextInt(5) + 0.5}', style: boldTextStyle(size: 45)),
                    RatingBarWidget(
                      itemCount: 5,
                      size: 10,
                      spacing: 16,
                      rating: 4.5,
                      onRatingChanged: (v) {},
                    ),
                    3.height,
                    Text('${randomNumber.nextInt(15662985)}', style: primaryTextStyle(size: 10)),
                  ],
                ).paddingOnly(left: 16, right: 16),
                30.width,
                Column(
                  children: [
                    Row(
                      children: [
                        Text('5', style: boldTextStyle(size: 12)),
                        8.width,
                        Container(
                          decoration: boxDecoration(bgColor: appDividerColor, radius: 16),
                          width: context.width() * 0.6,
                          height: 12.0,
                          alignment: Alignment.topLeft,
                          child: Container(color: psColorRed, width: 120.0, height: 50.0).cornerRadiusWithClipRRect(15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('4', style: boldTextStyle(size: 12)),
                        8.width,
                        Container(
                          decoration: boxDecoration(bgColor: appDividerColor, radius: 16),
                          width: context.width() * 0.6,
                          height: 12.0,
                          alignment: Alignment.topLeft,
                          child: Container(color: psColorRed, width: 30.0, height: 50.0).cornerRadiusWithClipRRect(15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('3', style: boldTextStyle(size: 12)),
                        8.width,
                        Container(
                          decoration: boxDecoration(bgColor: appDividerColor, radius: 16),
                          width: context.width() * 0.6,
                          height: 12.0,
                          alignment: Alignment.topLeft,
                          child: Container(color: psColorRed, width: 15.0, height: 50.0).cornerRadiusWithClipRRect(15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2', style: boldTextStyle(size: 12)),
                        8.width,
                        Container(
                          decoration: boxDecoration(bgColor: appDividerColor, radius: 16),
                          width: context.width() * 0.6,
                          height: 12.0,
                          alignment: Alignment.topLeft,
                          child: Container(color: psColorRed, width: 10.0, height: 50.0).cornerRadiusWithClipRRect(15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('1', style: boldTextStyle(size: 12)),
                        8.width,
                        Container(
                          decoration: boxDecoration(bgColor: appDividerColor, radius: 16),
                          width: context.width() * 0.6,
                          height: 12.0,
                          alignment: Alignment.topLeft,
                          child: Container(color: psColorRed, width: 50.0, height: 50.0).cornerRadiusWithClipRRect(15),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            30.height,
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getReviewsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(child: Text(getReviewsList[index].cirLogo![0]), backgroundColor: psColorRed),
                          16.width,
                          Text(getReviewsList[index].title!, style: secondaryTextStyle(size: 16)).expand(),
                          PopupMenuButton(
                            onSelected: (dynamic value) {
                              if (value == 1) {
                                toast("Review flagged as inappropriate ");
                              } else if (value == 2) {
                                toast('Review flagged as spam');
                              }
                            },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(value: 1, child: Text("Flag as inappropriate")),
                              PopupMenuItem(
                                value: 2,
                                child: Text("Flag as span").onTap(() {
                                  toastLong("Review flagged as span");
                                }),
                              ),
                            ],
                          )
                        ],
                      ).paddingOnly(left: 16, right: 16),
                      16.height,
                      Row(
                        children: [
                          RatingBarWidget(
                            itemCount: 5,
                            size: 10,
                            spacing: 16,
                            rating: 4.0,
                            onRatingChanged: (v) {},
                          ),
                          RatingBarWidget(
                            itemCount: 5,
                            size: 10,
                            spacing: 16,
                            rating: 4.0,
                            onRatingChanged: (v) {},
                          ).paddingOnly(left: 16),
                          8.width,
                          Text(getReviewsList[index].date!, style: secondaryTextStyle())
                        ],
                      ),
                      8.height,
                      Text(getReviewsList[index].subTile!, style: secondaryTextStyle()).paddingOnly(left: 16, right: 16),
                      32.height,
                     Row(
  children: [
    Text('Was this review helpful?', style: secondaryTextStyle()),
    16.width.expand(),
    TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        toastLong('Thanks for the feedback');
      },
      child: Text('Yes'),
    ).paddingRight(10),
    TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[400]!),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        toastLong('Thanks for the feedback');
      },
      child: Text('No'),
    ),
  ],
).paddingOnly(left: 16, right: 16),

                      8.height,
                    ],
                  );
                }),
            24.height,
            Text('See all reviews', style: primaryTextStyle(color: psColorRed)).paddingOnly(left: 16, right: 16).onTap(() {
              PSRatingReviewScreen(data1: widget.data).launch(context);
            }),
            32.height,
            widget.list != null
                ? Column(
                    children: widget.list![0].categories!.map((e) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.name!, style: boldTextStyle(size: 18)),
                              Icon(Icons.arrow_forward_rounded),
                            ],
                          ).paddingOnly(left: 16, right: 16).onTap(() {
                            PSBookMoviesViewAllScreen(data5: e).launch(context);
                          }),
                          8.height,
                          SingleChildScrollView(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: e.list!.map((e) {
                                return Container(child: PSMoviesForYouComponent(e, widget.list));
                              }).toList(),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ],
                      );
                    }).toList(),
                  )
                : SizedBox(),
            16.height,
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.refresh_outlined),
                  onPressed: () {},
                ),
                Text('App refund policy', style: boldTextStyle()),
              ],
            ),
            16.height,
            Text('All price include GST.', style: primaryTextStyle()).paddingOnly(left: 16, right: 16),
            24.height,
          ],
        ),
      ),
    );
  }
}
