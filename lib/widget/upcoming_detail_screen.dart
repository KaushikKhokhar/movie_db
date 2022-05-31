// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db/store/movie_store4.dart';
import '../color/color.dart';

class UpcomingDetailScreen extends StatefulWidget {
  const UpcomingDetailScreen({Key? key}) : super(key: key);

  static const routeName = 'Upcoming-Detail-Screen';

  @override
  State<UpcomingDetailScreen> createState() => _UpcomingDetailScreenState();
}

class _UpcomingDetailScreenState extends State<UpcomingDetailScreen> {
  double _rating = 0;

  MovieStore4 store = MovieStore4();

  @override
  Widget build(BuildContext context) {
    final allMovies = ModalRoute.of(context)!.settings.arguments as dynamic;

    void ratingShowDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Thanks for rating'),
          content: const Text(
              'Your valuable rating to helps other people to watch more this movie.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }

    void rateDeleteShowDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Your rate has been deleted'),
          content: const Text('Your rate deleted successfully!'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }

    void rateCount() {
      showModalBottomSheet(
        backgroundColor: AppColors.secondaryColor,
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(8),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Submit your rating here',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      updateOnDrag: true,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      minRating: 1,
                      itemSize: 30,
                      allowHalfRating: true,
                      itemBuilder: ((context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      onRatingUpdate: (rating) {
                        print(rating);
                        setState(
                          () {
                            _rating = rating;
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[300]),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        store.postTheRate(_rating, allMovies.id);
                        Navigator.of(context).pop();
                        ratingShowDialog(context);
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    void rateDelete() {
      showModalBottomSheet(
        backgroundColor: AppColors.secondaryColor,
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Do you want to delete your rating ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[300]),
                          child: const Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          store.deleteTheRate(allMovies.id);
                          Navigator.of(context).pop();
                          rateDeleteShowDialog(context);
                        },
                        child: Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue),
                          child: const Center(
                            child: Text(
                              'Yes',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      rateDelete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.secondaryColor, width: 2)),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/loading_image.png'),
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${allMovies.backdrop_path}',
                    ),
                    width: 325,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Text(
                    allMovies.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${allMovies.original_language}"
                        "  |  "
                        "${allMovies.release_date}"
                        "  |  "
                        "${allMovies.popularity}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.secondaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        allMovies.vote_average.toString(),
                        style:
                            const TextStyle(color: Colors.amber, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RatingBar.builder(
                        unratedColor: AppColors.secondaryColor,
                        initialRating: 3,
                        itemSize: 30,
                        allowHalfRating: true,
                        itemBuilder: ((context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            )),
                        onRatingUpdate: (r) {
                          rateCount();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      allMovies.overview,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.secondaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
