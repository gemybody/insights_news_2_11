import 'package:insights_news_2_11/features/home/data/newsmodel/newsmodel.dart';

class NewsStates{}

class NewInitstate extends NewsStates{ }
class NewsByCategoryLoadingstatw extends NewsStates{}
class NewsByCategorySucessstate extends NewsStates{
final Newsmodel model;
  NewsByCategorySucessstate({required this.model}); 
}
class NewsByCategoryErrorstate extends NewsStates{ 
final String error;
  NewsByCategoryErrorstate({ required this.error});
}