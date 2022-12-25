import 'package:mobx/mobx.dart';
import 'package:movie_db/api/upcoming_api.dart';
import '../model/upcoming_model.dart';

part 'upcoming_store.g.dart';

class MovieStore4 = _MovieStore with _$MovieStore4;

abstract class _MovieStore with Store {
  UpcomingApi httpClient = UpcomingApi();

  @observable
  bool isDataFatched = false;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<UpcomingModel> movies = ObservableList<UpcomingModel>();

  @action
  Future fetchMovie() async {
    isDataFatched = true;
    var res = await httpClient.getMovies(int.parse(page.toString()));
    if (res != null) {
      movies.addAll(res);
      page++;
    }
    if (res == null) {
      return;
    }
    isDataFatched = false;
  }

  @action
  Future fetchTheMovie() async {
    var res = await httpClient.getMovies(int.parse(page.toString()));
    if (res != null) {
      movies.addAll(res);
      page++;
    }
  }

  @action
  Future submitRate(double rating, int id) => rateListFuture =
      ObservableFuture(httpClient.postRate(rating, id).then((rate) => rate));

  @action
  Future delRate(int id) => deleteRateFuture = ObservableFuture(
      httpClient.deleteRate(id).then((deleteRates) => deleteRates));

  void postTheRate(double rating, int id) {
    submitRate(rating, id);
  }

  void deleteTheRate(int id) {
    delRate(id);
  }
}
