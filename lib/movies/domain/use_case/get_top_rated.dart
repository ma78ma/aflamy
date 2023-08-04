import 'package:aflamy/core/use_case/base_use_case.dart';
import 'package:aflamy/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<MovieEntity>,NoParameter>{


  final BaseMovieRepository  baseMovieRepository ;
  GetTopRatedMoviesUseCase( {
    required this.baseMovieRepository
  } );

  @override
  Future<Either<Failure , List<MovieEntity> >> call(NoParameter parameter) async {
    return  await baseMovieRepository.getTopRatedMovies() ;
  }

}