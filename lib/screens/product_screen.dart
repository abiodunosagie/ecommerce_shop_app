import 'package:ecommerce_shop_app/constants/app_style.dart';
import 'package:ecommerce_shop_app/constants/size_config.dart';
import 'package:ecommerce_shop_app/util/product_model.dart';
import 'package:ecommerce_shop_app/util/size_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import '../util/counter.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({required this.product, super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final Counter _counter = Counter();
  void _incrementCounter() {
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter.value > 0) {
        _counter.value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              40,
            ),
            color: kDarkBrown,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/shopping_cart_icon.svg',
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'Add to Cart | \$2,000 ',
                  style: kEncodeSansBold.copyWith(
                    color: kWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$2,000',
                      style: kEncodeSansRagular.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness:
                            SizeConfig.blockSizeHorizontal! * 1,
                        decorationColor: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 60,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        24,
                      ),
                      child: Image.network(
                        widget.product.imageUrl,
                        height: SizeConfig.blockSizeVertical! * 60,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kBrown.withOpacity(
                                      0.11,
                                    ),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(
                                      0,
                                      5,
                                    ),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                    'assets/arrow_back_icon.svg'),
                              ),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kBrown.withOpacity(
                                      0.11,
                                    ),
                                    spreadRadius: 0.0,
                                    blurRadius: 12,
                                    offset: const Offset(
                                      0,
                                      5,
                                    ),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                5,
                              ),
                              child: SvgPicture.asset(
                                  'assets/favorite_black_icon.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kEncodeSansSemibold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 7,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _decrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kBorderColor,
                              width: 1,
                            ),
                            color: kWhite,
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: kGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      Text(
                        _counter.value.toString(),
                        style: kEncodeSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: kDarkBrown,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kBorderColor,
                              width: 1,
                            ),
                            color: kWhite,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: kDarkGrey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 18,
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.all(2),
                    itemBuilder: (contest, _) => const Icon(
                      Icons.star,
                      color: kYellow,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    unratedColor: kLightGrey,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: widget.product.reviews,
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(9,483 reviews)',
                          style: kEncodeSansRagular.copyWith(
                            color: kBlue,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ReadMoreText(
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: ' ',
                style: kEncodeSansRagular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
                trimCollapsedText: 'Read More...',
                trimExpandedText: 'Show Less',
                lessStyle: kEncodeSansBold.copyWith(
                    color: kDarkBrown,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4),
                moreStyle: kEncodeSansBold.copyWith(
                    color: kDarkBrown,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4),
                widget.product.description,
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 1,
                color: kLightGrey,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Size',
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizeSelection()
                    ],
                  ),
                  //color section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 8,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kLightGrey,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 8,
                            decoration: BoxDecoration(
                              border: Border.all(color: kLightGrey, width: 1),
                              shape: BoxShape.circle,
                              color: kDarkBrown,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 8,
                            decoration: BoxDecoration(
                                border: Border.all(color: kLightGrey, width: 1),
                                shape: BoxShape.circle,
                                color: kBrown),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
