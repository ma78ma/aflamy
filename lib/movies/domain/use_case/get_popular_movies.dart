
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends  BaseUseCase<List<MovieEntity>,NoParameter>{


  final BaseMovieRepository  baseMovieRepository ;
  GetPopularMoviesUseCase( {
    required this.baseMovieRepository
  } );

  @override
  Future<Either<Failure , List<MovieEntity> >> call(NoParameter parameter) async {
    return   await  baseMovieRepository.getPopularMovies()   ;
  }


}