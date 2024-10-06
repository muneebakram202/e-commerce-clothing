import 'package:cloth_ecommerce/presentation/check_out_screen/check_out_viewmodel.dart';
import 'package:cloth_ecommerce/presentation/check_out_screen/widget/payment_selection.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';

import '../../model/cloth_item_model.dart';
import '../../utils/app_utils.dart';
import '../widget/my_text.dart';

class CheckOutView extends StackedView<CheckOutViewModel> {
  const CheckOutView({super.key, required this.clothItem});

  final ClothItem clothItem;

  @override
  Widget builder(
      BuildContext context, CheckOutViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          width: MediaQuery.sizeOf(context).width,
                          child: SingleChildScrollView(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            clothItem.categoryImage,
                                            fit: BoxFit.cover,
                                            width: 280,
                                            height: 280,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyText(
                                      text: clothItem.categoryName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyText(
                                      text: '${clothItem.categoryPrice}.00',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            clothItem.categoryImage,
                                            fit: BoxFit.cover,
                                            width: 280,
                                            height: 280,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyText(
                                      text: clothItem.categoryName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyText(
                                      text: '${clothItem.categoryPrice}.00',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            clothItem.categoryImage,
                                            fit: BoxFit.cover,
                                            width: 280,
                                            height: 280,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyText(
                                      text: clothItem.categoryName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyText(
                                      text: '${clothItem.categoryPrice}.00',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MyText(
                                text: 'Apply Offer',
                                fontSize: 18,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Add your code',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppUtils.greenColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'FA204',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Choose Payment',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              PaymentWidgetSelection(
                                icon: Brand(Brands.visa),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              PaymentWidgetSelection(
                                icon: Brand(Brands.paypal),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              PaymentWidgetSelection(
                                icon: Brand(Brands.mastercard),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              MyText(
                                text: '\$248.00',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
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
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 74,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Row(
                children: [
                  Text(
                    'Make Payment',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(Icons.navigate_next_rounded,color: Colors.white,)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  CheckOutViewModel viewModelBuilder(BuildContext context) =>
      CheckOutViewModel();
}

