class Post{

  int id;
  String title;
  String content;
  String dateWritten;
  String featuredImage;
  String voteDown,voteUp;
  List<int> votersUp, votersDown;
  String userId;
  String categoryId;

  Post({
      this.id,
      this.title,
      this.content,
      this.dateWritten,
      this.featuredImage,
      this.voteUp,
      this.voteDown,
      this.votersUp,
      this.votersDown,
      this.userId,
      this.categoryId});
}