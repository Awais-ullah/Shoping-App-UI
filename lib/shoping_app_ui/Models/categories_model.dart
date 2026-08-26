class CategoriesModel{
  String? image;
  String? title;
  CategoriesModel({required this.image, required this.title});
}

List<CategoriesModel> categoriesModel=[
  CategoriesModel(
      image: 'assets/img1.png',
      title: 'All items'),
  CategoriesModel(
      image: 'assets/img2.png',
      title: 'Watches'),
  CategoriesModel(
      image: 'assets/img3.png',
      title: 'shoes'),
  CategoriesModel(
      image: 'assets/img4.png',
      title: 'men'),
  CategoriesModel(
      image: 'assets/img5.png',
      title: 'women'),

];