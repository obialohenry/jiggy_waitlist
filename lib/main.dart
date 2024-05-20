import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiggy_waitlist/config/app_strings.dart';
import 'package:jiggy_waitlist/src/config.dart';
import 'package:jiggy_waitlist/src/components.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              Container(
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
                              const SizedBox(width: 15),
                              Container(
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
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "                    Early Access",
                          style: TextStyle(
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
                    Container(
                      width: 315,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(46),
                        border: Border.all(color: AppColors.kWhite),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          fontFamily: lato,
                          fontSize: 14,
                          color: AppColors.kWhite,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          // prefixIcon: Image.asset(
                          //   AppImages.messageIcon,
                          //   width: 2,
                          // ),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            fontFamily: lato,
                            fontSize: 11,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                    ),
                    Column()
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
