import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_db/api_class.dart';
import 'package:movie_db/network_services.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  int? counterPages;

  NetworkService httpClient = NetworkService();

  @observable
  bool isDataFetched = false;

  @observable
  bool isDataFetchedForRefreshIndicator = false;

  @observable
  ObservableFuture<List<Movie>>? movieListFuture;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<Movie> movies = ObservableList<Movie>();

  @action
  Future fetchMovie() async {
    isDataFetched = true;
    // isDataFetchedForRefreshIndicator = true;
    var res = await httpClient.getMovies(int.parse(page.toString()));
    if (res != null) {
      movies.addAll(res);
      page++;
    }
    // isDataFetchedForRefreshIndicator = true;
    if (res == null) {
      return;
    }
    isDataFetched = false;
  }

  @action
  Future fetchTheMovie() async {
    // isDataFetched = true;
    // isDataFetchedForRefreshIndicator = true;
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

  // void getTheMovies() {
  //   fetchMovie();
  // }

  void postTheRate(double rating, int id) {
    submitRate(rating, id);
  }

  void deleteTheRate(int id) {
    delRate(id);
  }
}
