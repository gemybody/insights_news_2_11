import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/features/home/data/newsmodel/newsmodel.dart';
import 'package:insights_news_2_11/features/home/peresintation/view_model/home_cubit.dart';
import 'package:insights_news_2_11/features/home/peresintation/view_model/home_statues.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    super.key, required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context) {
 context.read<NewsCubit>().getNewsByCategory(category);

    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
if (state is NewsByCategoryErrorstate){
return Text(state.error);

} else if(state is NewsByCategorySucessstate){
  Newsmodel news= state.model;


return ListView.builder(
          itemCount: news.articles?.length,
          itemBuilder: (context, index) {

            var newsItem = news.articles?[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: AppColors.containerBg,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      newsItem?.urlToImage?? '',
                      width: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context,error,StackTrace){
                        return Icon(Icons.error); 
                      },
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItem?.title ??'',
                          style: getBodyStyle(fontSize: 14),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            Icon(
                              Icons.menu,
                              size: 14,
                              color: AppColors.white,
                            ),
                            const Gap(7),
                            Text(
                              'Read',
                              style: getSmallStyle(color: AppColors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );



}else{
  return Center(child: CircularProgressIndicator());
}

        
      },
    );
  }
}
