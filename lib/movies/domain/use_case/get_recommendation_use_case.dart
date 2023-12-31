import 'package:aflamy/core/error/failure.dart';
import 'package:aflamy/core/use_case/base_use_case.dart';
import 'package:aflamy/movies/domain/entities/recommendation.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntity>, RecommendationParameter >{
  final BaseMovieRepository  baseMovieRepository;

  GetRecommendationUseCase({
    required this.baseMovieRepository
  });
  @override
  Future<Either<Failure, List<RecommendationEntity >>> call(RecommendationParameter parameter) async{
    return await baseMovieRepository.getRecommendation(
        parameter: parameter
    );
  }

}
class RecommendationParameter extends Equatable{
  final int id;

  const RecommendationParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id
  ];

}