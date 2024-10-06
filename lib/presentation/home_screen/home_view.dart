import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:stacked/stacked.dart';

import '../../model/cloth_item_model.dart';
import '../../utils/app_utils.dart';
import '../detail_screen/detail_view.dart';
import '../widget/category_container.dart';
import '../widget/circular_text.dart';
import '../widget/my_text.dart';
import '../widget/nav_bar.dart';
import '../widget/radio_seleciton_container.dart';
import 'home_viewmodel.dart';


class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          children: [
            Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/7c/e1/10/7ce110b227b2f50acb36e0de78382285.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        MyText(
                          text: 'JOHN WHITAKER',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const Spacer(),
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
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const MyText(
                                text: 'HALLOWEEN SPECIAL SALE',
                                fontSize: 16,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const MyText(
                                      text: 'UP TO ',
                                      fontSize: 32,
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w600),
                                  MyText(
                                      text: '50%',
                                      fontSize: 32,
                                      textColor: AppUtils.greenColor,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 46,
                                  backgroundColor: AppUtils.greenColor,
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: Colors.black,
                                    child: Transform.rotate(
                                      angle: 0.8,
                                      child: const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: CircularText(
                                      text: 'shop now  ',
                                      radius: 40,
                                      repetitions: 4, // Adjust radius as needed
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioSelectionContainer(
                      title: 'Popular',
                      isSelected: viewModel.isPopularSelected,
                      onTap: () {
                        viewModel.isPopularSelected =
                            !viewModel.isPopularSelected;
                        viewModel.rebuildUi();
                      },
                    ),
                    RadioSelectionContainer(
                      title: 'Jacket',
                      isSelected: viewModel.isJacketSelected,
                      onTap: () {
                        viewModel.isJacketSelected =
                            !viewModel.isJacketSelected;
                        viewModel.rebuildUi();
                      },
                    ),
                    RadioSelectionContainer(
                      title: 'Pents',
                      isSelected: viewModel.isPentSelected,
                      onTap: () {
                        viewModel.isPentSelected = !viewModel.isPentSelected;
                        viewModel.rebuildUi();
                      },
                    ),
                    RadioSelectionContainer(
                      title: 'Shoes',
                      isSelected: viewModel.isShoesSelected,
                      onTap: () {
                        viewModel.isShoesSelected = !viewModel.isShoesSelected;
                        viewModel.rebuildUi();
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    MyText(
                      text: 'POPULAR COLLECTION',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 80),
                  children:
                      List.generate(viewModel.clothItems.length, (int index) {
                    final ClothItem clothItem = viewModel.clothItems[index];
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Hero(
                          tag: clothItem.categoryName,
                          child: CategoryContainer(
                            categoryName: clothItem.categoryName,
                            categoryPrice: clothItem.categoryPrice,
                            categoryImage: clothItem.categoryImage,
                            onTapFav: () {
                              clothItem.isFav = !clothItem.isFav;
                              viewModel.rebuildUi();
                            },
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) =>  DetailView(clothItem: clothItem,),
                              ));
                            },
                            isFav: clothItem.isFav,
                          ),
                        ));
                  }),
                ),
              ),
            ]),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.7),
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
              child: CustomNavigationBar(navIcon:  [
                NavigationIcon(
                  isSelected: viewModel.homeNav,
                  iconData: OctIcons.home,
                  onTap: () {
                    viewModel.selectNav(0);
                  },
                ),
                NavigationIcon(
                  isSelected: viewModel.favNav,
                  iconData: OctIcons.heart,
                  onTap: () {
                    viewModel.selectNav(1);
                  },
                ),
                NavigationIcon(
                  isSelected: viewModel.searchNav,
                  iconData: OctIcons.search,
                  onTap: () {
                    viewModel.selectNav(2);
                  },
                ),
                NavigationIcon(
                  isSelected: viewModel.personNav,
                  iconData: OctIcons.person,
                  onTap: () {
                    viewModel.selectNav(3);
                  },
                ),
              ],),
            )
          ],
        )));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}