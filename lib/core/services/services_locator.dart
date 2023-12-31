
import 'package:get_it/get_it.dart';
import '../../movies/data/data_source/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/use_case/get_movie_details_use_case.dart';
import '../../movies/domain/use_case/get_now_playing.dart';
import '../../movies/domain/use_case/get_popular_movies.dart';
import '../../movies/domain/use_case/get_recommendation_use_case.dart';
import '../../movies/domain/use_case/get_top_rated.dart';
import '../../movies/presentation/controler/movie_details_bloc.dart';
import '../../movies/presentation/controler/movies_bloc.dart';

final sl = GetIt.instance;
class ServiceLocator {
  void init (){
    ///Bloc
    ///
    /// new object from MovieBloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(getMovieDetailsUseCase: sl(),

        getRecommendationUseCase: sl()));


    /// Use cases

    sl.registerLazySingleton(() =>GetNowPlayingMoviesUseCase(
        baseMovieRepository: sl()
    ) );
    sl.registerLazySingleton(() =>GetPopularMoviesUseCase(
        baseMovieRepository: sl()
    ) );
    sl.registerLazySingleton(() =>GetTopRatedMoviesUseCase(
        baseMovieRepository: sl()
    ) );

    sl.registerLazySingleton(() =>GetMovieDetailsUseCase(
        baseMovieRepository: sl()
    ) );

    sl.registerLazySingleton(() =>GetRecommendationUseCase(
        baseMovieRepository: sl()
    ) );
    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(()=>
        MoviesRepository(
            baseMovieRemoteDataSource: sl()
    )
    );
    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(()
    => MovieRemoteDataSource() );
  }
}