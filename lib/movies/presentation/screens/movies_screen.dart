// ignore_for_file: prefer_const_constructors

import 'package:aflamy/movies/presentation/components/now_playing_component.dart';
import 'package:aflamy/movies/presentation/components/popular_component.dart';
import 'package:aflamy/movies/presentation/components/top_rated_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../controler/movies_bloc.dart';
import '../controler/movies_events.dart';


class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (ctx)  {
      return  sl<MoviesBloc>()..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(GetTopRatedEvent());
    },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:  SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingComponent(),
              PopularComponent(),
              TopRatedComponent(),
              SizedBox(height: 50.0),

            ],
          ),
        ),
      ),
    ) ;
  }
}