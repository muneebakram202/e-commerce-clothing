import 'package:stacked/stacked.dart';

import '../../model/cloth_item_model.dart';

class HomeViewModel extends BaseViewModel {
  bool isPopularSelected = false;
  bool isJacketSelected = false;
  bool isPentSelected = false;
  bool isShoesSelected = false;
  bool homeNav = true;
  bool favNav = false;
  bool searchNav = false;
  bool personNav = false;

  List<ClothItem> clothItems = [
    ClothItem(
      categoryName: 'VELVET LUXE BLAZER',
      categoryPrice: '\$199',
      categoryImage: 'https://i.pinimg.com/564x/28/dc/de/28dcdeb1e2f03b91b5cf2248a9f78dd1.jpg',
      isFav: false,
    ),
    ClothItem(
      categoryName: 'COTTON CLASSIC SHIRT',
      categoryPrice: '\$79',
      categoryImage: 'https://i.pinimg.com/564x/77/ee/98/77ee987ad04e029e7514cefb07c639e3.jpg',
      isFav: true,
    ),
    ClothItem(
      categoryName: 'WOOL COZY SWEATER',
      categoryPrice: '\$129',
      categoryImage: 'https://i.pinimg.com/736x/6e/b7/84/6eb78483cc442cf016639da8951fe4a6.jpg',
      isFav: false,
    ),
    ClothItem(
      categoryName: 'LINEN SUMMER PANTS',
      categoryPrice: '\$89',
      categoryImage: 'https://i.pinimg.com/564x/91/e1/f0/91e1f0afd2f971230bb625cfffdfe76c.jpg',
      isFav: false,
    ),
    ClothItem(
      categoryName: 'LEATHER AVIATOR JACKET',
      categoryPrice: '\$299',
      categoryImage: 'https://i.pinimg.com/564x/28/dc/de/28dcdeb1e2f03b91b5cf2248a9f78dd1.jpg',
      isFav: true,
    ),
    ClothItem(
      categoryName: 'SILK EVENING DRESS',
      categoryPrice: '\$249',
      categoryImage: 'https://i.pinimg.com/564x/b6/55/33/b6553310b886c2ca512125b53331fd96.jpg',
      isFav: false,
    ),
    ClothItem(
      categoryName: 'DENIM DISTRESSED JEANS',
      categoryPrice: '\$109',
      categoryImage: 'https://i.pinimg.com/564x/c8/31/f1/c831f1b7c17f1bed380cee26e2af022a.jpg',
      isFav: true,
    ),
    ClothItem(
      categoryName: 'SUEDE LUXURY SHOES',
      categoryPrice: '\$159',
      categoryImage: 'https://i.pinimg.com/564x/be/aa/20/beaa20b068acb8d00404fc66e3d54698.jpg',
      isFav: false,
    ),
    ClothItem(
      categoryName: 'SUEDE CLASSIC HAT',
      categoryPrice: '\$69',
      categoryImage: 'https://i.pinimg.com/564x/1d/14/37/1d1437a25a6acefdc925da7fdbc2d866.jpg',
      isFav: false,
    ),
  ];

  selectNav(int index) {
    homeNav = false;
     favNav = false;
     searchNav = false;
     personNav = false;
     switch(index){
       case 0:
         homeNav=true;
         rebuildUi();
         return;
       case 1:
         favNav=true;
         rebuildUi();
         return;
       case 2:
         searchNav=true;
         rebuildUi();
         return;
       case 3:
         personNav=true;
         rebuildUi();
         return;
     }
  }
}



