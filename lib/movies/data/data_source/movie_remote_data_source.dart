
import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_recommendation_use_case.dart';
import '../models/movie_details_model.dart';
import '../models/movies_model.dart';
import '../models/recommendation_model.dart';

// contract
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>?> getNowPlayingMovies();
  Future<List<MovieModel>?> getPopularMovies();
  Future<List<MovieModel>?> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters movieDetailsParams);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {


  //  methods --> from useCases
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        ApiConstant.nowPlayingPath
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  @override
  Future<List<MovieModel>?> getPopularMovies() async {
    final response = await Dio().get(
        ApiConstant.popularPath
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  @override
  Future<List<MovieModel>?> getTopRatedMovies() async {
    final response = await Dio().get(
        ApiConstant.topRatedPath
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters movieDetailsParams) async {
    final response = await Dio().get(
        ApiConstant.movieDetailsPath(movieDetailsParams.movieId)
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameter) async{
    final response = await Dio().get(
        ApiConstant.recommendation(parameter.id)
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List).map(
            (e) => RecommendationModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }

  }

}