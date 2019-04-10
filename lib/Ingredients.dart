class Ingredients {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Ingredients(this.idCategory,this.strCategory,this.strCategoryThumb, this.strCategoryDescription);

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
        json['idCategory'],
        json['strCategory'],
        json['strCategoryThumb'],
        json['strCategoryDescription']
    );
  }}