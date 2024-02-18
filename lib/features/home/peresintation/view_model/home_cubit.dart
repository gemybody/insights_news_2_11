import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_2_11/core/services/api_servies.dart';
import 'package:insights_news_2_11/features/home/peresintation/view_model/home_statues.dart';

class  NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(NewInitstate());



// get by category
 
 getNewsByCategory(){
  emit(NewsByCategoryLoadingstatw());
  try {
    ApiServies.getNewsByCategory().then((value){

        emit(NewsByCategorySucessstate(model: value!));
    });
  } catch (e) {
    emit(NewsByCategoryErrorstate(error: e.toString()));
    
  }

}


}
