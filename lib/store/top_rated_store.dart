import 'package:mobx/mobx.dart';
import 'package:movie_db/api/top_rated_api.dart';
import 'package:movie_db/model/top_rated_model.dart';

part 'top_rated_store.g.dart';

class MovieStore3 = _MovieStore with _$MovieStore3;

abstract class _MovieStore with Store {
  TopRatedApi httpClient = TopRatedApi();

  @observable
  bool isDataFatched = false;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<TopRatedModel> movies = ObservableList<TopRatedModel>();

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
