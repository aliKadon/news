import 'package:equatable/equatable.dart';

import '../domain/models/most_viewed.dart';


abstract class States extends Equatable {}


class NewsLoadingState extends States {
  @override
  List<Object?> get props => [];
}


class NewsLoaded extends States {
  NewsLoaded(this.news);
  final List<MostViewed> news;
  @override
  List<Object?> get props => [news];

}
