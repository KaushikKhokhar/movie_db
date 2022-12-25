import 'package:mobx/mobx.dart';
import '../http_method/now_playing_http_method.dart';
import '../model/now_playing.dart';

part 'now_playing_store.g.dart';

class MovieStore1 = _MovieStore with _$MovieStore1;

abstract class _MovieStore with Store {
  NowPlayingHttpMethod httpClient = NowPlayingHttpMethod();

  @observable
  bool isDataFetched = false;

  @observable
  ObservableFuture? rateListFuture;

  @observable
  ObservableFuture? deleteRateFuture;

  @observable
  int page = 1;

  ObservableList<NowPlayingModelClass> movies = ObservableList<NowPlayingModelClass>();

  @action
  Future fetchMovie() async {
    
    isDataFetched = true;
    var res = await httpClient.getMovies(int.parse(page.toString()));
    if (res != null) {
      movies.addAll(res);
      page++;
    }
    if (res == null) {
      return;
    }
    isDataFetched = false;
    
  }

  @action
  Future fetchTheMovie() async {
    var res = await httpClient.getMovies(
      int.parse(
        page.toString(),
      ),
    );
    if (res != null) {
      movies.addAll(res);
      page++;
    }
  }

  @action
  Future submitRate(double rating, int id) => rateListFuture =
      ObservableFuture(httpClient.postRate(rating, id));

  @action
  Future delRate(int id) => deleteRateFuture = ObservableFuture(
      httpClient.deleteRate(id));

  void postTheRate(double rating, int id) {
    submitRate(rating, id);
  }

  void deleteTheRate(int id) {
    delRate(id);
  }
}