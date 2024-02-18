import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/features/home/peresintation/view_model/home_cubit.dart';
import 'package:insights_news_2_11/features/home/peresintation/view_model/home_statues.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
if (state is NewsByCategoryErrorstate){
return Text(state.error);

} else if(state is NewsByCategorySucessstate){


return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: AppColors.containerBg,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/rodri.png',
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Man City stay perfect despite Rodri red against Forest',
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
