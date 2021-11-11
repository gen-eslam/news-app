abstract class NewsAppStats {}
class NewsInitialStates extends NewsAppStats{}
class NewsBottomNav extends NewsAppStats{}
class OnTabNavigationBarStates extends NewsAppStats{}
class NewsGetBusinessLoadingState extends NewsAppStats{}
class GetBusinessDataSuccessState extends NewsAppStats{}
class GetBusinessDataErrorState extends NewsAppStats
{
  final String error;
  GetBusinessDataErrorState(this.error);
}
class NewsGetSportsLoadingState extends NewsAppStats{}
class GetSportsDataSuccessState extends NewsAppStats{}
class GetSportsDataErrorState extends NewsAppStats
{
  final String error;
  GetSportsDataErrorState(this.error);
}
class NewsGetScienceLoadingState extends NewsAppStats{}
class GetScienceDataSuccessState extends NewsAppStats{}
class GetScienceDataErrorState extends NewsAppStats
{
  final String error;
  GetScienceDataErrorState(this.error);
}
class ChangeAppModeState extends NewsAppStats{}
class NewsGetSearchLoadingState extends NewsAppStats{}
class GetSearchDataSuccessState extends NewsAppStats{}
class GetSearchDataErrorState extends NewsAppStats
{
  final String error;
  GetSearchDataErrorState(this.error);
}