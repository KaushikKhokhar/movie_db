import 'package:mobx/mobx.dart';
import 'package:movie_db/api_classes/api_class4.dart';
import 'package:movie_db/network_services/network_services4.dart';

part 'movie_store4.g.dart';

class MovieStore4 = _MovieStore with _$MovieStore4;

abstract class _MovieStore with Store {
  NetworkServices4 httpClient = NetworkServices4();

  @observable
  bool isDataFatched = false;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<Movie4> movies = ObservableList<Movie4>();

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
