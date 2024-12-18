import 'package:equatable/equatable.dart';
import 'package:project2/core/res/media_res.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  const PageContent.first()
      : this(
          title: 'Brand New curriculum',
          description: 'This is the first online educational platform designed '
              "by the world's top professors",
          imagePath: MediaRes.casual_reading,
        );
  const PageContent.second()
      : this(
          title: 'Brand a fun atmosphere',
          description: 'This is the first online educational platform designed '
              "by the world's top professors",
          imagePath: MediaRes.casual_life,
        );
  const PageContent.third()
      : this(
          title: 'Easy to join the lesson',
          description: 'This is the first online educational platform designed '
              "by the world's top professors",
          imagePath: MediaRes.casual_meditation_science,
        );

  final String title;
  final String description;
  final String imagePath;

  @override
  List<Object?> get props => [title, description, imagePath];
}
