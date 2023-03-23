import 'package:ecommerce_shop_app/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_style.dart';
import '../constants/size_config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ecommerce_shop_app/util/product_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['All Items', 'Dress', 'Hat', 'watch'];
  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'hat_icon',
    'watch_icon'
  ];

  //color highlight variable
  int current = 0;
  int currentlike = 0;
  //state variable to hold the search text entered by the user.
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, Welcome 👋',
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      'Abiodun Osagie',
                      style: kEncodeSansBold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                      'assets/shopping_cart_icon.svg',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //search field
          SizedBox(
            height: 84,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
                        prefixIcon: const IconTheme(
                          data: IconThemeData(
                            color: kDarkGrey,
                          ),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        hintText: 'Search Products...',
                        border: kInputBorder,
                        errorBorder: kInputBorder,
                        disabledBorder: kInputBorder,
                        focusedBorder: kInputBorder,
                        focusedErrorBorder: kInputBorder,
                        enabledBorder: kInputBorder,
                        hintStyle: kEncodeSansMedium.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 49,
                    width: 49,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        kBorderRadius,
                      ),
                      color: kBlack,
                    ),
                    child: SvgPicture.asset(
                      'assets/filter_icon.svg',
                      // fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
//clothes tab bar categories
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      margin: EdgeInsets.only(
                        left: index == 0 ? kPaddingHorizontal : 15,
                        right: index == categories.length - 1
                            ? kPaddingHorizontal
                            : 0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: current == index ? kBrown : kWhite,
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        border: current == index
                            ? Border.all(color: kLightGrey, width: 0)
                            : Border.all(
                                color: kLightGrey,
                                width: 1,
                              ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(current == index
                              ? 'assets/${icons[index]}_selected.svg'
                              : 'assets/${icons[index]}_unselected.svg'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            categories[index],
                            style: kEncodeSansMedium.copyWith(
                              color: current == index ? kWhite : kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          //mansory gridview below
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //images and like button
                  Stack(
                    children: [
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                    product: products[index],
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              product.imageUrl,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 12,
                          top: 12,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentlike = index;
                              });
                            },
                            child: SvgPicture.asset(currentlike == index
                                ? 'assets/favorite_cloth_icon_selected.svg'
                                : 'assets/favorite_cloth_icon_unselected.svg'),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansSemibold.copyWith(
                      color: kDarkBrown,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    product.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRagular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.price,
                        style: kEncodeSansSemibold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kYellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            product.reviews,
                            style: kEncodeSansRagular.copyWith(
                              color: kDarkBrown,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
