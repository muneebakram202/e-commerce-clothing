import 'package:stacked/stacked.dart';

class DetailViewModel extends BaseViewModel{
  bool smallSize=false;
  bool mediumSize=false;
  bool largeSize=false;
  bool extraLargeSize=false;
  bool enableCheckout=false;
  int itemCount=1;
   int calculatedPrice=0;

  void initState(int unitPrice){
    calculatedPrice=unitPrice;
  }

  void selectSize(int index) {
    smallSize = false;
    mediumSize = false;
    largeSize = false;
    extraLargeSize = false;
    enableCheckout=true;

    switch(index){
      case 0:
        smallSize=true;
        rebuildUi();
        return;
      case 1:
        mediumSize=true;
        rebuildUi();
        return;
      case 2:
        largeSize=true;
        rebuildUi();
        return;
      case 3:
        extraLargeSize=true;
        rebuildUi();
        return;
    }
  }
}