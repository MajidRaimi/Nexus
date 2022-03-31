import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../widgets/textInputField.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _search = TextEditingController();
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: TextFieldInput(
          controller: _search,
          prefixIcon: const Icon(Icons.search, color: kMainColor),
          keyboardType: TextInputType.text,
          hintText: "Search For Clubs ...",
          isOptional: true,
        ),
      ),
      body: Center(
        child : SvgPicture.asset("assets/searchImage.svg" , width : 300) ,
      ),
    );
  }
}
