import 'package:flutter/material.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search',
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
