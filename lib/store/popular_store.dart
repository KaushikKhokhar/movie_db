import 'package:mobx/mobx.dart';

import '../http_method/popular_http_method.dart';
import '../model/popular.dart';

part 'popular_store.g.dart';

class MovieStore2 = _MovieStroe with _$MovieStore2;

abstract class _MovieStroe with Store {
  PopularHttpMethod httpClient = PopularHttpMethod();

  @observable
  bool isDataFatched = false;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<PopularModelClass> movies = ObservableList<PopularModelClass>();

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