import 'package:flutter/material.dart';
import '../constants/app_style.dart';
import '../constants/size_config.dart';


class SizeSelection extends StatefulWidget {
  const SizeSelection({Key? key}) : super(key: key);

  @override
  _SizeSelectionState createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          children: [
            _buildSizeButton('S'),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 1,
            ),
            _buildSizeButton('M'),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 1,
            ),
            _buildSizeButton('L'),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 1,
            ),
            _buildSizeButton('XL'),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 1,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeButton(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        height: SizeConfig.blockSizeHorizontal! * 8,
        width: SizeConfig.blockSizeHorizontal! * 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedSize == size ? kDarkBrown : kLightGrey,
            width: 1,
          ),
          shape: BoxShape.circle,
          color: _selectedSize == size ? kDarkBrown : kWhite,
        ),
        child: Center(
          child: Text(
            size,
            style: kEncodeSansRagular.copyWith(
              color: _selectedSize == size ? kWhite : kDarkBrown,
              fontSize: SizeConfig.blockSizeHorizontal! * 3,
            ),
          ),
        ),
      ),
    );
  }
}
