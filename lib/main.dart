import 'package:flutter/material.dart';
import 'package:movie_db/color/color.dart';
import 'package:movie_db/screen/now_playing.dart';
import 'package:movie_db/widget/now_playing_detail_screen.dart';
import 'package:movie_db/screen/popular.dart';
import 'package:movie_db/screen/top_rated.dart';
import 'package:movie_db/screen/upcoming.dart';
import 'package:movie_db/widget/popular_detail_screen.dart';
import 'package:movie_db/widget/top_rated_detail_screen.dart';
import 'package:movie_db/widget/upcoming_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        NowPlayingDetailScreen.routeName: (context) => const NowPlayingDetailScreen(),
        PopularDetailScreen.routeName: (context) => const PopularDetailScreen(),
        TopRatedDetailScreen.routeName:(context) => const TopRatedDetailScreen(),
        UpcomingDetailScreen.routeName:(context) => const UpcomingDetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        title: const Text(
          'MovieDB App',
          style: TextStyle(color: AppColors.secondaryColor),
        ),
        bottom:
            TabBar(isScrollable: true, controller: _tabController, tabs: const [
          Tab(
            text: 'Now Playing',
          ),
          Tab(
            text: 'Popular',
          ),
          Tab(
            text: 'Top Rated',
          ),
          Tab(
            text: 'Upcoming',
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NowPlaying(),
          const Popular(),
          const TopRated(),
          const Upcoming(),
        ],
      ),
    );
  }
}
