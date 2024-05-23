import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JiggyWaitListScreen(),
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
    "Federal University Of Technology Owerri",
    "Federal University Of Technology Akurre",
    "University Of Port-HarCourt",
    "Rivers State University",
    "Abia State University",
  ];
  List<String> states = [
    "Imo State",
    "Lagos State",
    "Rivers State",
    "Abuja State",
    "Akwa-Ibom State",
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
  String date = "00/00/28";

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
        title: "Secret Stories",
        subText: "No judgement: Ever wanted to spill the tea without the drama? "
            "jiggy's anonymous posting feature lets you share your juciest stories, deepest thoughts and craziest "
            "campus adventures without fear of judgement. "
            "Your secrets are safe with us!",
        actionText: "Generated names",
        color: AppColors.kBlueDeep,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: "Tailored For Campus Life",
        subText: "Jiggy is all about enhancing the college experience. "
            "From sharing campus stories to organizing events, "
            "Jiggy is your go-to platform for everything campus-related",
        actionText: "College centric",
        color: AppColors.kBrown100,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: "Connect With Different Mates",
        subText: "with jiggy, you can easily stay connected with your "
            "new people from other colleges, classmates, and even that cool "
            "guy/girl from your GST class who sits in the back row. Say goodbye to "
            "FOMO and hello to endless hangouts!",
        actionText: "College centric",
        color: AppColors.kPinkDeep,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: "Stay In The Loop",
        subText: "From campus news and events to exclusive deals and discounts, "
            "jiggy keeps you in the loop with all things college life. Never miss "
            "a beat with our curated feed of campus happenings and must-know info",
        actionText: "Information",
        color: AppColors.kRedTrans,
        onTap: () {},
      ),
      AReasonWhyItsCool(
        isOnMobile: true,
        screenWidth: screenWidth,
        title: "Did Someone Say Prizes",
        subText: "Get ready to flex those brain muscles and show off your campus knowledge!\n"
            "Participate in jiggy quizzes, challenges, and scavenger hunts for a chance to win "
            "epic prizes and bragging rights among your peers.",
        actionText: "Algorithm based",
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
          AReasonWhyItsCool(
            isOnMobile: false,
            screenWidth: screenWidth,
            title: "Tailored For Campus Life",
            subText: "Jiggy is all about enhancing the college experience. "
                "From sharing campus stories to organizing events, "
                "Jiggy is your go-to platform for everything campus-related",
            actionText: "gameplay-based engine",
            color: AppColors.kBrown100,
            onTap: () {},
          ),
          AReasonWhyItsCool(
            isOnMobile: false,
            screenWidth: screenWidth,
            title: "Anonymity",
            subText: "With jiggy, users can share their experiences anonymously, "
                "fostering a safe and open environment for genuine connections and conversations",
            actionText: "teammates and friends",
            color: AppColors.kBlueDeep,
            onTap: () {},
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
          AReasonWhyItsCool(
            isOnMobile: false,
            screenWidth: screenWidth,
            title: "Random Calls",
            subText: "Want to meet new people? jiggy's random video call feature "
                "lets you connect with other users on your campus in an instant, "
                "making it easy to forge new friendships.",
            actionText: "gameplay-based engine",
            color: AppColors.kBrown100,
            onTap: () {},
          ),
          AReasonWhyItsCool(
            isOnMobile: false,
            screenWidth: screenWidth,
            title: "Exclusive Campus News",
            subText: "Stay in the loop with the latest campus news, "
                "events, and updates tailored to your university",
            actionText: "teammates and friends",
            color: AppColors.kBlueDeep,
            onTap: () {},
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
                        screenWidth > 450 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
                                                "About",
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
                                          "Join beta",
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
                        crossAxisAlignment: screenWidth > 450
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: screenWidth > 450
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: screenWidth <= 450
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Join",
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
                                    "Waitlist",
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
                                "Your Campus, Your Story, Your Secret",
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
                              "Unlock the ultimate campus experience with Jiggy - the "
                              "social networking app designed exclusively for college "
                              "students, join our waitlist today and be among the first to "
                              "experience the magic of jiggy. Connect, share, and discover "
                              "your campus like never before. Your journey starts here.",
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
                            screenWidth > 450 ? "                    Early Access" : "Early Access",
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
                              "By joining the waitlist, you'll be among the first to experience all that jiggy "
                              "has to offer, giving you exclusive access to new features and updates "
                              "before anyone else, In short, jiggy is cool because it's not just a social "
                              "networking app - it's a community-driven platform that celebrates campus "
                              "life and fosters genuine connections among college students."
                              "Sounds cool right? join the waitlist and get awesome rewards upon launch "
                              "such as unique names, coins, free data, etc.",
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
                              hintText: "Email",
                              keyboardType: TextInputType.text,
                              label: "Email",
                            ),
                            const CustomTextField(
                              hintText: "+234",
                              keyboardType: TextInputType.text,
                              label: "Phone number",
                            ),
                            DropDownButtonMain(
                              title: school,
                              hintText: "Enter school",
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
                              label: "Institution",
                            ),
                            DropDownButtonMain(
                              title: state,
                              hintText: "Enter location of institution",
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
                              label: "Location of institution",
                            ),
                            CustomDateButton(
                              date: date,
                              label: "Expected graduation year",
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
                                    "Sign In",
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
                                "We're really honest guys and promise not to send you ads. "
                                "We will write only once when our platform is ready.",
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
                        "Why it's cool?",
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
                            maxHeight: screenWidth > 795 ? 783 : 1650, maxWidth: 783),
                        child: Column(
                          crossAxisAlignment: screenWidth > 450
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: screenWidth > 795
                              ? reasonsWhyJiggyIsCoolOnWeb(screenWidth)
                              : reasonsWhyJiggyIsCoolOnMobile(screenWidth),
                        ),
                      ),
                      screenWidth > 795 ? const SizedBox.shrink() : const SizedBox(height: 40),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Column(
                          children: [
                            Text(
                              "Your campus, Your secret, Your story.",
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
                              "©️ All Rights Reserved. Jiggy social",
                              style: TextStyle(
                                fontSize: screenWidth > 450 ? 20 : 14.6,
                                color: AppColors.kWhite,
                                fontFamily: workSans,
                              ),
                            ),
                          ],
                        ),
                      )
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
