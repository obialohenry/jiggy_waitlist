import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiggy_waitlist/src/config.dart';
import 'package:jiggy_waitlist/src/components.dart';
import 'package:jiggy_waitlist/src/utils.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const JiggyWaitlistApp(),
  );
}

class JiggyWaitlistApp extends StatelessWidget {
  const JiggyWaitlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const JiggyWaitListScreen(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}

class JiggyWaitListScreen extends StatefulWidget {
  const JiggyWaitListScreen({super.key});

  @override
  State<JiggyWaitListScreen> createState() => _JiggyWaitListScreenState();
}

class _JiggyWaitListScreenState extends State<JiggyWaitListScreen> {
  List<String> schools = [
    futo,
    futa,
    uniport,
    rsust,
    absu,
  ];
  List<String> states = [
    imoState,
    lagosState,
    riversState,
    abujaState,
    akwaIbomState,
  ];

  List<String> socialMediaIcons = [
    AppImages.linkedinIcon,
    AppImages.instagramIcon,
    AppImages.facebookIcon,
    AppImages.twitchIcon,
    AppImages.redditIcon,
    AppImages.tiktokIcon,
    AppImages.twitchIcon,
  ];
  String date = defaultDate;

  Future<void> selectDate(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      currentDate: DateTime.now(),
      fieldLabelText: date,
    ).then((dateSelected) {
      setState(() {
        if (dateSelected == null) {
          date;
        } else {
          date = UtilFunctions.formatDate(dateSelected.toString());
          date = DateFormat("yyyy-MM-dd").format(DateFormat("d MMM yyyy").parse(date));
        }
      });
    });
  }

  String? state;
  String? school;
  List<Widget> reasonsWhyJiggyIsCoolOnMobile(double screenWidth) {
    return [
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: secretStories,
        subText: secretStoriesSubText,
        actionText: generatedNames,
        color: AppColors.kBlueDeep,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: tailoredForCampusLife,
        subText: tailoredForCampusLifeSubText,
        actionText: collegeCentric,
        color: AppColors.kBrown100,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: connectWithDifferentMates,
        subText: connectWithDifferentMatesSubText,
        actionText: collegeCentric,
        color: AppColors.kPinkDeep,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: stayInTheLoop,
        subText: stayInTheLoopSubText,
        actionText: information,
        color: AppColors.kRedTrans,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: didSomeoneSayPrizes,
        subText: didSomeoneSayPrizesSubText,
        actionText: algorithmBased,
        color: AppColors.kBrown100,
        onTap: () {},
      ),
    ];
  }

  List<Widget> reasonsWhyJiggyIsCoolOnWeb(double screenWidth) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AReasonWhyItsCool(
              isOnMobile: false,
              screenWidth: screenWidth,
              title: tailoredForCampusLife,
              subText: tailoredForCampusLifeSubText,
              actionText: gamePlayBasedEngine,
              color: AppColors.kBrown100,
              onTap: () {},
            ),
          ),
          Expanded(
            child: AReasonWhyItsCool(
              isOnMobile: false,
              screenWidth: screenWidth,
              title: anonymity,
              subText: anonymitySubText,
              actionText: teammatesAndFriends,
              color: AppColors.kBlueDeep,
              onTap: () {},
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AReasonWhyItsCool(
              isOnMobile: false,
              screenWidth: screenWidth,
              title: randomCalls,
              subText: randomCallsSubText,
              actionText: gamePlayBasedEngine,
              color: AppColors.kBrown100,
              onTap: () {},
            ),
          ),
          Expanded(
            child: AReasonWhyItsCool(
              isOnMobile: false,
              screenWidth: screenWidth,
              title: exclusiveCampusNews,
              subText: exclusiveCampusNewsSubText,
              actionText: teammatesAndFriends,
              color: AppColors.kBlueDeep,
              onTap: () {},
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        print("screen width: ${constraints.maxWidth}");
        print("screen height: ${constraints.maxHeight}");
        double screenWidth = constraints.maxWidth;
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.jiggyBackgroundImage,
              ),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 790),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth > 820
                        ? 0
                        : screenWidth > 750 && screenWidth <= 820
                            ? 16
                            : 12,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const GradienText(
                            gradient: AppColors.kGradientTextColor,
                            style: TextStyle(fontFamily: pacifico, fontSize: 24),
                            text: jiggy,
                          ),
                          SizedBox(
                            width: 227,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.kTransparent,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Image(
                                          image: AssetImage(AppImages.aboutIcon),
                                          width: 20,
                                          height: 20,
                                        ),
                                        if (screenWidth > 450)
                                          const Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                about,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.kWhite,
                                                  fontFamily: workSans,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(top: 6, left: 6, bottom: 6, right: 8),
                                    decoration: BoxDecoration(
                                      color: AppColors.kWhite,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AppImages.emoji,
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          joinBeta,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.kBlack,
                                            fontFamily: workSans,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    join,
                                    style: TextStyle(
                                      color: AppColors.kWhite,
                                      fontSize: screenWidth > 450 ? 56 : 27.5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: openSans,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GradienText(
                                    gradient: AppColors.kGradientTextColor,
                                    style: TextStyle(
                                      fontSize: screenWidth > 450 ? 58 : 27.5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: openSans,
                                    ),
                                    text: jiggy,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    waitlist,
                                    style: TextStyle(
                                      color: AppColors.kWhite,
                                      fontSize: screenWidth > 450 ? 56 : 27.5,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: openSans,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                yourCampusYourStoryYourSecret,
                                style: TextStyle(
                                  color: AppColors.kWhite,
                                  fontSize: screenWidth > 450 ? 36 : 17.6,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: openSans,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 609),
                            child: Text(
                              unlockTheUltimateCampusExperienceWithJiggy,
                              style: TextStyle(
                                fontSize: screenWidth > 450 ? 20 : 15,
                                fontFamily: screenWidth > 450 ? workSans : lato,
                                color: AppColors.kWhite,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenWidth > 450 ? 40 : 85,
                      ),
                      Column(
                        crossAxisAlignment: screenWidth > 450
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Text(
                            screenWidth > 450 ? "                    $earlyAccess" : earlyAccess,
                            style: const TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: roboto,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 521),
                            child: const Text(
                              softWrap: true,
                              textAlign: TextAlign.center,
                              byJoiningTheWaitlistTextAndOffers,
                              style: TextStyle(
                                color: AppColors.kWhite,
                                fontSize: 16,
                                fontFamily: lato,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenWidth > 450 ? 100.0 : 10,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 630),
                        child: Column(
                          crossAxisAlignment: screenWidth > 450
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomTextField(
                              hintText: email,
                              keyboardType: TextInputType.text,
                              label: email,
                            ),
                            const CustomTextField(
                              hintText: defaultNumberFormat,
                              keyboardType: TextInputType.text,
                              label: phoneNumber,
                            ),
                            DropDownButtonMain(
                              title: school,
                              hintText: enterSchool,
                              onTap: (selectedSchool) {
                                setState(() {
                                  school = selectedSchool;
                                });
                              },
                              items: schools.map(
                                (aSchoolInListOfSchoolsNamedSchools) {
                                  return DropdownMenuItem<String>(
                                    value: aSchoolInListOfSchoolsNamedSchools,
                                    child: Text(
                                      aSchoolInListOfSchoolsNamedSchools,
                                      style: const TextStyle(
                                        fontFamily: lato,
                                        fontSize: 11.2,
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              label: institution,
                            ),
                            DropDownButtonMain(
                              title: state,
                              hintText: enterLocationOfInstitution,
                              onTap: (selectedState) {
                                setState(() {
                                  state = selectedState;
                                });
                              },
                              items: states.map(
                                (aStateInListOfStatesNamedStates) {
                                  return DropdownMenuItem<String>(
                                    value: aStateInListOfStatesNamedStates,
                                    child: Text(
                                      aStateInListOfStatesNamedStates,
                                      style: const TextStyle(
                                        fontFamily: lato,
                                        fontSize: 11.2,
                                        color: AppColors.kWhite,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              label: locationOfInstitution,
                            ),
                            CustomDateButton(
                              date: date,
                              label: expectedGraduationYear,
                              onTapped: () async {
                                selectDate(context);
                              },
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 315,
                                padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: AppColors.kPink,
                                  borderRadius: BorderRadius.circular(46),
                                  border: Border.all(color: AppColors.kWhite),
                                ),
                                child: const Center(
                                  child: Text(
                                    signIn,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: lato,
                                      color: AppColors.kWhite,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 84,
                                maxWidth: 597,
                              ),
                              child: const Text(
                                weAreReallyHonestAndPromiseNotToSendAdsText,
                                style: TextStyle(
                                  fontFamily: workSans,
                                  fontSize: 20,
                                  color: AppColors.kWhite,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        whyItsCool,
                        style: TextStyle(
                          fontFamily: roboto,
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth > 450 ? 40 : 32,
                        ),
                      ),
                      SizedBox(
                        height: screenWidth > 450 ? 20 : 30,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: screenWidth > 795
                                ? 783
                                : screenWidth >= 781 && screenWidth <= 795
                                    ? 1640
                                    : 1310,
                            maxWidth: 783),
                        child: Column(
                          crossAxisAlignment: screenWidth > 450
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: screenWidth > 795
                              ? reasonsWhyJiggyIsCoolOnWeb(screenWidth)
                              : reasonsWhyJiggyIsCoolOnMobile(screenWidth),
                        ),
                      ),
                      const SizedBox(height: 40),
                      //
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 458),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            height: 205.4,
                            decoration: BoxDecoration(
                              color:
                                  screenWidth > 795 ? AppColors.kBlack200 : AppColors.kTransparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    referAFriend,
                                    style: TextStyle(
                                        fontFamily: lato,
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth > 450 ? 26 : 20,
                                        color: AppColors.kWhite),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    earnCoinsOnEachReferral,
                                    style: TextStyle(
                                      fontFamily: lato,
                                      fontSize: screenWidth > 450 ? 20 : 16,
                                      color: AppColors.kWhite,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                        const ClipboardData(text: defaultJiggyReferralLink),
                                      );
                                      showToast(
                                          msg: "$copied '$defaultJiggyReferralLink' $toClipboard",
                                          isNeutralMessage: true);
                                    },
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(maxWidth: 414),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        height: 56,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: AppColors.kWhite,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              defaultJiggyReferralLink,
                                              style: TextStyle(
                                                color: AppColors.kBlack20,
                                                fontFamily: openSans,
                                                fontSize: screenWidth > 450 ? 21 : 16,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Clipboard.setData(
                                                  const ClipboardData(
                                                      text: defaultJiggyReferralLink),
                                                );
                                                showToast(
                                                    msg:
                                                        "$copied '$defaultJiggyReferralLink' $toClipboard",
                                                    isNeutralMessage: true);
                                              },
                                              child: Image.asset(
                                                AppImages.copyIcon,
                                                scale: screenWidth > 450 ? 3.0 : 4.0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Column(
                          children: [
                            Text(
                              yourCampusYourStoryYourSecret,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenWidth > 450 ? 24 : 17.5,
                                color: AppColors.kWhite,
                                fontFamily: workSans,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: screenWidth > 450 ? 288 : 210,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                    socialMediaIcons.map((aSocialMediaIconInSocialMediaIconsList) {
                                  return Image.asset(
                                    aSocialMediaIconInSocialMediaIconsList,
                                    scale: screenWidth > 450 ? 3.0 : 4.0,
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              allRightsReserved,
                              style: TextStyle(
                                fontSize: screenWidth > 450 ? 20 : 14.6,
                                color: AppColors.kWhite,
                                fontFamily: workSans,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AReasonWhyItsCool extends StatelessWidget {
  const AReasonWhyItsCool({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.subText,
    required this.color,
    required this.onTap,
    required this.actionText,
    required this.isOnMobile,
  });
  final double screenWidth;
  final String title;
  final String subText;
  final VoidCallback onTap;
  final Color color;
  final String actionText;
  final bool isOnMobile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: roboto,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhite,
            fontSize: screenWidth > 780 ? 28 : 22.4,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 382),
          child: Text(
            subText,
            style: TextStyle(
              fontFamily: workSans,
              fontWeight: FontWeight.normal,
              color: AppColors.kWhite,
              fontSize: screenWidth > 780 ? 20 : 16,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: color,
            ),
            child: Text(
              actionText,
              style: TextStyle(
                fontFamily: workSans,
                fontWeight: FontWeight.normal,
                color: AppColors.kWhite,
                fontSize: screenWidth > 780 ? 20 : 16,
              ),
            ),
          ),
        ),
        if (isOnMobile)
          const SizedBox(
            height: 15,
          )
      ],
    );
  }
}

class CustomDateButton extends StatelessWidget {
  const CustomDateButton({
    super.key,
    required this.date,
    required this.label,
    required this.onTapped,
  });
  final String label;
  final String date;
  final VoidCallback onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13.5, color: AppColors.kWhite, fontFamily: lato),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            width: 315,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              border: Border.all(color: AppColors.kWhite),
            ),
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 11.2,
                fontFamily: lato,
                color: AppColors.kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.label,
  });
  final String label;
  final String? hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13.5, color: AppColors.kWhite, fontFamily: lato),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          width: 315,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            border: Border.all(color: AppColors.kWhite),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            style: const TextStyle(
              fontFamily: lato,
              fontSize: 14,
              color: AppColors.kWhite,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              // prefixIcon: Image.asset(
              //   AppImages.messageIcon,
              //   width: 2,
              // ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: lato,
                fontSize: 11,
                color: AppColors.kWhite,
              ),
              // suffixIcon: SizedBox(
              //   width: 5,
              //   height: 5,
              //   child: Image.asset(
              //     AppImages.dropdownIcon,
              //     color: AppColors.kWhite,
              //     scale: 3.0,
              //   ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownButtonMain extends StatelessWidget {
  DropDownButtonMain({
    super.key,
    required this.title,
    required this.hintText,
    required this.onTap,
    required this.items,
    required this.label,
    this.colour,
    this.titleSize,
    this.titleWeight,
  });
  String hintText;
  String? title;
  double? titleSize;
  FontWeight? titleWeight;
  Color? colour;
  final String label;
  List<DropdownMenuItem<String>>? items;
  Function(String? value) onTap;
  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13.5, color: AppColors.kWhite, fontFamily: lato),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 315,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            border: Border.all(
              color: AppColors.kWhite,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.kBlack,
              isExpanded: true,
              hint: Text(
                hintText,
                style: const TextStyle(color: AppColors.kWhite),
              ),
              value: title,
              icon: SizedBox(
                width: 15,
                height: 15,
                child: Image.asset(
                  AppImages.dropdownIcon,
                  color: AppColors.kWhite,
                  scale: 3.0,
                ),
              ),
              style: const TextStyle(color: AppColors.kWhite),
              onChanged: onTap,
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}
