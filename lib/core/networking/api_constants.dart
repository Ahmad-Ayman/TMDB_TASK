/// [ApiConstants] class
///
/// Contains API constants [BaseURL, EndPoints, Headers] to easily access and modify Test
///
class ApiConstants {
  static String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static String upcomingMovies({required int page}) =>
      '${baseUrl}upcoming?language=en-US&page=$page';
  static String movieCast({required int movieId}) =>
      '${baseUrl}$movieId/credits?language=en-US';
}
