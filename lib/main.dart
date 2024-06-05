import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiggy_waitlist/model/local/dummy_data.dart';
import 'package:jiggy_waitlist/model/response/south_east_university_response.dart';
import 'package:jiggy_waitlist/src/config.dart';
import 'package:jiggy_waitlist/src/components.dart';
import 'package:jiggy_waitlist/src/utils.dart';
import 'package:intl/intl.dart';
import 'package:jiggy_waitlist/view_model/jiggy%20_waitlist_view_model.dart';

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

class JiggyWaitListScreen extends ConsumerStatefulWidget {
  const JiggyWaitListScreen({super.key});

  @override
  ConsumerState<JiggyWaitListScreen> createState() => _JiggyWaitListScreenState();
}

class _JiggyWaitListScreenState extends ConsumerState<JiggyWaitListScreen> {
  final _signInFormKey = GlobalKey<FormState>();
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

  // Future<void> selectDate(BuildContext context) {
  //   return showDatePicker(
  //     context: context,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(3000),
  //     currentDate: DateTime.now(),
  //     fieldLabelText: date,
  //   ).then((dateSelected) {
  //     setState(() {
  //       if (dateSelected == null) {
  //         date;
  //       } else {
  //         date = UtilFunctions.formatDate(dateSelected.toString());
  //         date = DateFormat("yyyy-MM-dd").format(DateFormat("d MMM yyyy").parse(date));
  //       }
  //     });
  //   });
  // }

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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var jiggyWaitlistProvider = ref.watch(jiggyWaitlistViewModel);
    jiggyWaitlistProvider.getAllUniversitiesInTheSouthEast(context);
  }

  Validator validator = Validator();
  @override
  Widget build(BuildContext context) {
    var jiggyWaitlistProvider = ref.watch(jiggyWaitlistViewModel);
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
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 790),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth > 820
                        ? 0
                        : screenWidth > 750 && screenWidth <= 820
                            ? 16
                            : 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //
                      Header(screenWidth: screenWidth),
                      const SizedBox(
                        height: 60,
                      ),
                      //An introductory text, telling what
                      JoinJiggyWaitlist(screenWidth: screenWidth),
                      SizedBox(
                        height: screenWidth > 450 ? 40 : 85,
                      ),
                      EarlyAccess(screenWidth: screenWidth),
                      SizedBox(
                        height: screenWidth > 450 ? 100.0 : 10,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 680, maxWidth: 554),
                        child: DummyData.referralCode == null
                            ? SignIn(
                                screenWidth: screenWidth,
                                signInFormKey: _signInFormKey,
                                validator: validator,
                                jiggyWaitlistProvider: jiggyWaitlistProvider,
                              )
                            : DummyData.referralCode != null &&
                                    jiggyWaitlistProvider.isUserNotLoggedIn
                                ? LogIn(
                                    screenWidth: screenWidth,
                                    jiggyWaitlistProvider: jiggyWaitlistProvider)
                                : YourWaitlistEarnings(screenWidth: screenWidth),
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
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 483),
                        child: Text(
                          softWrap: true,
                          textAlign: TextAlign.center,
                          dontSettleForLess,
                          style: TextStyle(
                            fontFamily: lato,
                            fontSize: screenWidth > 450 ? 21 : 14,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      //
                      ReferAFriend(screenWidth: screenWidth),
                      const SizedBox(height: 40),
                      Footer(
                        screenWidth: screenWidth,
                        socialMediaIcons: socialMediaIcons,
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

class YourWaitlistEarnings extends StatelessWidget {
  const YourWaitlistEarnings({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your waitlist earnings",
          style: TextStyle(
            fontSize: screenWidth > 450 ? 48 : 32,
            fontFamily: lato,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(height: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Number of referalls.
              Column(
                children: [
                  Text(
                    "No of referalls:",
                    style: TextStyle(
                      fontSize: screenWidth > 450 ? 17 : 12,
                      fontFamily: lato,
                      color: AppColors.kWhite,
                    ),
                  ),
                  const SizedBox(height: 15),
                  //TODO: ask for the api that gets a users total referall.//@Obialor
                  Text(
                    "20",
                    style: TextStyle(
                      fontSize: screenWidth > 450 ? 48 : 32,
                      fontFamily: lato,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kWhite,
                    ),
                  ),
                ],
              ),
              //Number of coins
              Column(
                children: [
                  Text(
                    "No of coins:",
                    style: TextStyle(
                      fontSize: screenWidth > 450 ? 17 : 12,
                      fontFamily: lato,
                      color: AppColors.kWhite,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      //TODO: get a user's jiggy coin from the login API. //@Obialor
                      Text(
                        "200Jigs",
                        style: TextStyle(
                          fontSize: screenWidth > 450 ? 48 : 32,
                          fontFamily: pacifico,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kWhite,
                        ),
                      ),
                      Image.asset(
                        AppImages.jiggyCoinLogo,
                        scale: screenWidth > 450 ? 2 : 3,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Earnings can be used in the app after launch to purchase "
          "data in-app items etc",
          style: TextStyle(
            fontSize: screenWidth > 450 ? 20 : 13,
            fontFamily: lato,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 458),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                              const ClipboardData(text: defaultJiggyReferralLink),
                            );
                            showToast(
                                msg: "$copied '$defaultJiggyReferralLink' $toClipboard",
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
      ],
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({
    super.key,
    required this.screenWidth,
    required this.jiggyWaitlistProvider,
  });

  final double screenWidth;
  final JiggyWaitlistViewModel jiggyWaitlistProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yay, you are on the waitlist.😉",
          style: TextStyle(
            fontSize: screenWidth > 450 ? 48 : 32,
            fontFamily: lato,
            fontWeight: FontWeight.bold,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "click to join our community for update and giveaway",
            style: TextStyle(
              fontSize: screenWidth > 450 ? 24 : 16,
              fontFamily: lato,
              color: AppColors.kWhite,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          email,
          style: TextStyle(
            fontSize: screenWidth > 450 ? 30 : 20,
            fontFamily: openSans,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Login to see earnings",
          style: TextStyle(
            fontSize: screenWidth > 450 ? 24 : 16,
            fontFamily: lato,
            color: AppColors.kWhite,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: DummyData.email,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 315,
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.kPink,
                borderRadius: BorderRadius.circular(46),
                border: Border.all(color: AppColors.kWhite),
              ),
              child: Center(
                child: jiggyWaitlistProvider.isLoggingIn
                    ? const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          color: AppColors.kWhite,
                        ),
                      )
                    : const Text(
                        "login",
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
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.screenWidth,
    required this.socialMediaIcons,
  });

  final double screenWidth;
  final List<String> socialMediaIcons;

  @override
  Widget build(BuildContext context) {
    return Align(
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
              children: socialMediaIcons.map((aSocialMediaIconInSocialMediaIconsList) {
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
    );
  }
}

class ReferAFriend extends StatelessWidget {
  const ReferAFriend({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 458),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 205.4,
          decoration: BoxDecoration(
            color: screenWidth > 795 ? AppColors.kBlack200 : AppColors.kTransparent,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                const ClipboardData(text: defaultJiggyReferralLink),
                              );
                              showToast(
                                  msg: "$copied '$defaultJiggyReferralLink' $toClipboard",
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
    );
  }
}

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
    required this.screenWidth,
    required GlobalKey<FormState> signInFormKey,
    required this.validator,
    required this.jiggyWaitlistProvider,
  }) : _signInFormKey = signInFormKey;

  final double screenWidth;
  final GlobalKey<FormState> _signInFormKey;
  final Validator validator;
  final JiggyWaitlistViewModel jiggyWaitlistProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenWidth > 450 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Form(
          key: _signInFormKey,
          child: Column(
            crossAxisAlignment:
                screenWidth > 450 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: email,
                keyboardType: TextInputType.text,
                label: email,
                validator: (email) => validator.validateEmail(email),
                controller: jiggyWaitlistProvider.emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: defaultNumberFormat,
                keyboardType: TextInputType.number,
                label: phoneNumber,
                validator: (phoneNumber) => validator.validatePhoneNumber(phoneNumber),
                controller: jiggyWaitlistProvider.phoneNumberController,
              ),
              const SizedBox(
                height: 10,
              ),
              //A Dropdown for all southeast universities.
              DropDownButtonMain(
                title: jiggyWaitlistProvider.school,
                hintText: enterSchool,
                onTap: (selectedUniversity) {
                  jiggyWaitlistProvider.selectASouthEastUniversity(selectedUniversity);
                },
                items: jiggyWaitlistProvider.southEastUniversitiesList?.map(
                  (aUniversityInTheSouthEast) {
                    return DropdownMenuItem<String>(
                      value: aUniversityInTheSouthEast.name,
                      child: Text(
                        aUniversityInTheSouthEast.name!,
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
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: defaultDate,
                keyboardType: TextInputType.number,
                label: expectedGraduationYear,
                validator: (graduationYear) => validator.validateEmptyTextField(graduationYear),
                controller: jiggyWaitlistProvider.expectedYearOfGraduationController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: code,
                keyboardType: TextInputType.text,
                label: referral,
                controller: jiggyWaitlistProvider.referralController,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //
        GestureDetector(
          onTap: () {
            if (_signInFormKey.currentState!.validate()) {
              _signInFormKey.currentState!.save();
              jiggyWaitlistProvider.getUniversityId();
              jiggyWaitlistProvider.aWaitlistForm(context);
            }
          },
          child: Container(
            width: 315,
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.kPink,
              borderRadius: BorderRadius.circular(46),
              border: Border.all(color: AppColors.kWhite),
            ),
            child: Center(
              child: jiggyWaitlistProvider.isPostingWaitlistForm
                  ? const SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(
                        color: AppColors.kWhite,
                      ),
                    )
                  : const Text(
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
        const SizedBox(
          height: 20,
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
    );
  }
}

class EarlyAccess extends StatelessWidget {
  const EarlyAccess({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: screenWidth > 450 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
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
    );
  }
}

class JoinJiggyWaitlist extends StatelessWidget {
  const JoinJiggyWaitlist({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  padding: const EdgeInsets.only(top: 6, left: 6, bottom: 6, right: 8),
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

// class CustomDateButton extends StatelessWidget {
//   const CustomDateButton({
//     super.key,
//     required this.date,
//     required this.label,
//     required this.onTapped,
//   });
//   final String label;
//   final String date;
//   final VoidCallback onTapped;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTapped,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(fontSize: 13.5, color: AppColors.kWhite, fontFamily: lato),
//           ),
//           const SizedBox(
//             height: 15.0,
//           ),
//           Container(
//             width: 315,
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(46),
//               border: Border.all(color: AppColors.kWhite),
//             ),
//             child: Text(
//               date,
//               style: const TextStyle(
//                 fontSize: 11.2,
//                 fontFamily: lato,
//                 color: AppColors.kWhite,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// TextFormField(
//             onChanged: widget.onChanged,
//             maxLength: widget.maxlength,
//             inputFormatters: widget.inputFormatter,
//             controller: widget.controller,
//             textInputAction: widget.textInputAction,
//             focusNode: myFocusNode,
//             style: theme.textTheme.bodyMedium!.copyWith(
//               color: theme.colorScheme.primary,
//               fontWeight: FontWeight.w400,
//               fontFamily: 'TTHoves',
//               fontSize: widget.fontSize ?? 14.spMin,
//             ),
//             keyboardType: widget.keyboardType,
//             initialValue: widget.initialValue,
//             textCapitalization: widget.textCapitalization,
//             onTap: widget.onTap,
//             readOnly: widget.readOnly,
//             enabled: widget.enabled,
//             textAlign: widget.textAlign,
//             maxLines: widget.maxLines ?? 1,
//             validator: widget.validator,
//             obscureText: widget.obscureInput,
//             decoration: InputDecoration(
//               border: widget.readOnly ? InputBorder.none : null,
//               hintText: widget.hint,
//               hintStyle: theme.textTheme.bodyMedium!.copyWith(
//                 color: widget.readOnly
//                     ? themeMode == ThemeMode.light
//                         ? AppColors.kBlack4
//                         : AppColors.kWhite

//                     ///Check if this is the best color for the darkmode
//                     : theme.colorScheme.primary,
//                 fontFamily: 'TTHoves',
//                 fontSize: 15.spMin,
//                 fontWeight: FontWeight.w400,
//               ),
//               prefixIcon: widget.prefixIcon,
//               suffixText: widget.showSuffixText! ? widget.suffixText : '',
//               suffixIcon: widget.textAlign == TextAlign.center
//                   ? null
//                   : widget.showSuffixIcon!
//                       ? Stack(
//                           alignment: AlignmentDirectional.center,
//                           children: [
//                             Visibility(
//                               visible: widget.password!,
//                               child: GestureDetector(
//                                 onTap: widget.onObscureText,
//                                 child: SizedBox(
//                                   height: 40.h,
//                                   width: 45.w,
//                                   // color: Colors.red,
//                                   child: Icon(
//                                     widget.obscureInput
//                                         ? Icons.visibility_outlined
//                                         : Icons.visibility_off_outlined,
//                                     size: 20.r,
//                                     color: theme.colorScheme.primary,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Visibility(
//                               visible: widget.trailing != null,
//                               child: widget.trailing ?? const SizedBox(),
//                             ),
//                           ],
//                         )
//                       : null,
//               filled: widget.isFilled,
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               fillColor: widget.readOnly ? theme.cardColor : widget.fillColor,
//               enabledBorder: widget.isFilled

//                     )
//                   : InputBorder.none,

//           ),

  

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.label,
    this.validator,
    this.controller,
  });
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style: const TextStyle(fontSize: 13.5, color: AppColors.kWhite, fontFamily: lato),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 315,
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontFamily: lato,
              fontSize: 14,
              color: AppColors.kWhite,
            ),
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(46),
                borderSide: const BorderSide(color: AppColors.kRed),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(46),
                borderSide: const BorderSide(color: AppColors.kRed),
              ),
              errorStyle: const TextStyle(color: AppColors.kRed),
              errorMaxLines: 4,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(46),
                borderSide: const BorderSide(color: AppColors.kWhite, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(46),
                borderSide: const BorderSide(
                  color: AppColors.kWhite,
                ),
              ),
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
