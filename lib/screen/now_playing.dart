// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_db/color/color.dart';
import 'package:movie_db/widget/now_playing_detail_screen.dart';
import 'package:movie_db/store/movie_store1.dart';
import 'package:overlay_support/overlay_support.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  MovieStore1 store = MovieStore1();

  bool hasInternet = false;
  bool loadingMovie = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.fetchMovie();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        store.fetchMovie();
      }
    });
  }

  Future _refresh() async {
    hasInternet = await InternetConnectionChecker().hasConnection;
    final color = hasInternet ? Colors.green : Colors.red;
    final text =
        hasInternet ? 'Refresh Successfully' : 'Please check your network';
    showSimpleNotification(
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        background: color);
    return store.fetchTheMovie();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.movies;
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 32, 32, 32)),
      child: Observer(
        builder: ((_) {
          if (future.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 8),
                      itemCount: future.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final movie = future[index];
                        var imageUrl =
                            'https://image.tmdb.org/t/p/w500${movie.backdrop_path}';
                        return Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 6,
                                child: InkWell(
                                  onTap: () {
                                    print(movie.backdrop_path);
                                    Navigator.of(context).pushNamed(
                                      NowPlayingDetailScreen.routeName,
                                      arguments: movie,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.secondaryColor),
                                    ),
                                    child: FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/loading_image.png'),
                                      image: NetworkImage(
                                        imageUrl,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  movie.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    movie.vote_average.toString(),
                                    style: const TextStyle(
                                        color: AppColors.secondaryColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (store.isDataFetched) const CircularProgressIndicator(),
                if (store.isDataFetched)
                  const SizedBox(
                    height: 8,
                  ),
              ],
            );
          }
        }),
      ),
    );
  }
}
