import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';

import '../../model/cloth_item_model.dart';
import '../../utils/app_utils.dart';
import '../check_out_screen/check_out_view.dart';
import '../widget/my_text.dart';
import '../widget/radio_seleciton_container.dart';
import '../widget/check_out_container.dart';
import 'detail_viewmodel.dart';

class DetailView extends StackedView<DetailViewModel> {
  const DetailView({
    super.key,
    required this.clothItem,
  });

  final ClothItem clothItem;

  @override
  Widget builder(
      BuildContext context, DetailViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          child: const Icon(Icons.arrow_back_rounded),
                        ),
                      ),
                      const Expanded(
                          child: Center(
                              child: MyText(
                        text: 'DETAILS',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ))),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.15),
                            child: const Icon(EvaIcons.shopping_bag_outline),
                          ),
                          const Positioned(
                              top: 7,
                              right: 7,
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height / 1.6,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Hero(
                                  tag: clothItem.categoryName,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          clothItem.categoryImage,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          clothItem.categoryImage,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          clothItem.categoryImage,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          clothItem.categoryImage,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange[600],
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '4.4/5',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '(150 Reviews)    452',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Purchased  ',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '675',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Stocks',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        MyText(
                          text: clothItem.categoryName,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    RadioSelectionContainer(
                                        title: ' S ',
                                        isSelected: viewModel.smallSize,
                                        onTap: () {
                                          viewModel.selectSize(0);
                                        }),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    RadioSelectionContainer(
                                        title: ' M ',
                                        isSelected: viewModel.mediumSize,
                                        onTap: () {
                                          viewModel.selectSize(1);
                                        }),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    RadioSelectionContainer(
                                        title: ' L ',
                                        isSelected: viewModel.largeSize,
                                        onTap: () {
                                          viewModel.selectSize(2);
                                        }),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    RadioSelectionContainer(
                                        title: ' XL ',
                                        isSelected: viewModel.extraLargeSize,
                                        onTap: () {
                                          viewModel.selectSize(3);
                                        }),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Color',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.teal,
                                        radius: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Items',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.itemCount++;
                                      viewModel.calculatedPrice = int.parse(
                                              clothItem.categoryPrice
                                                  .split('\$')
                                                  .last) *
                                          viewModel.itemCount;
                                      viewModel.rebuildUi();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppUtils.greenColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '  ${viewModel.itemCount}  ',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (viewModel.itemCount > 1) {
                                        viewModel.itemCount--;
                                        viewModel.calculatedPrice = int.parse(
                                                clothItem.categoryPrice
                                                    .split('\$')
                                                    .last) *
                                            viewModel.itemCount;
                                        viewModel.rebuildUi();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: viewModel.itemCount > 1
                                              ? AppUtils.greenColor
                                              : AppUtils.greenColor
                                                  .withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Icon(
                                        Icons.remove,
                                        size: 14,
                                        color: viewModel.itemCount > 1
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Product Details',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          'Our latest clothing line combines style, comfort, and sustainability. Made from high-quality, eco-friendly materials like organic cotton and recycled polyester, each piece is designed to last while reducing environmental impact. The collection includes a variety of options, from casual wear to more formal attire, all featuring modern, versatile designs. Each item is carefully crafted for a comfortable fit, ensuring you feel great whether you\'re at work, out with friends, or relaxing at home. With attention to detail in stitching, fabric choice, and durability, our clothing offers a perfect blend of fashion and function.',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.05)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (viewModel.enableCheckout) {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => CheckOutView(
                            clothItem: clothItem,
                          ),
                        ));
                  }
                },
                child: CheckoutWidget(
                  enableCheckout: viewModel.enableCheckout,
                  price: viewModel.calculatedPrice,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  DetailViewModel viewModelBuilder(BuildContext context) {
    DetailViewModel obj = DetailViewModel();
    obj.initState(int.parse(clothItem.categoryPrice.split('\$').last));
    return obj;
  }
}