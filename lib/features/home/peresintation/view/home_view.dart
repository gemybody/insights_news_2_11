import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/features/home/peresintation/widgets/home_header.dart';
import 'package:insights_news_2_11/features/home/peresintation/widgets/news_list_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              HomeHeader(),
              Gap(20),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/rodri.png',
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: .8,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                  )),
              Gap(10),
              SmoothPageIndicator(
                  controller: PageController(
                    initialPage: pageIndex,
                  ), // PageController
                  count: 6,
                  effect: ScrollingDotsEffect(
                      activeDotColor: AppColors.lemonadaColor,
                      dotHeight: 14,
                      dotWidth: 14,
                      spacing: 7), // your preferred effect
                  onDotClicked: (index) {}),
              Gap(20),
              // tabs
              ButtonsTabBar(
                  // Customize the appearance and behavior of the tab bar
                  backgroundColor: AppColors.lemonadaColor,
                  borderColor: Colors.black,
                  buttonMargin: const EdgeInsets.only(left: 10),
                  labelStyle: getBodyStyle(color: Colors.black),
                  unselectedBackgroundColor: AppColors.containerBg,
                  unselectedLabelStyle: getBodyStyle(color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  // Add your tabs here
                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ]),
                  Gap(10),
              Expanded(
                child: TabBarView(children: [
                  NewsListBuilder(category:'Science' ,),
                  
                  NewsListBuilder(category:'Entertainment' ,),
                  NewsListBuilder(category: 'Sports',),
                  NewsListBuilder(category:  'Business',),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
