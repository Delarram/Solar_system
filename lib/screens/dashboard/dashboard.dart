import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_input_field.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Item> items = [];
  bool sort = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _itemController;
  TextEditingController _priceController;


  @override
  void initState() {
    super.initState();
    _itemController = TextEditingController();
    _priceController = TextEditingController();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              FormInputField(
                itemController: _itemController,
                hintText: 'Item',
                validateMessage: 'Please provide the item name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: FormInputField(
                      itemController: _priceController,
                      hintText: 'Price',
                      validateMessage: 'Please provide the price',
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        items.add(Item(
                            itemName: _itemController.text,
                            itemPrice: double.parse(_priceController.text)));
                        setState(() {
                          _itemController.clear();
                          _priceController.clear();
                        });
                      }
                    },
                    icon: Icon(
                      Icons.subdirectory_arrow_left,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class Item {
  String itemName;
  double itemPrice;

  Item({this.itemName, this.itemPrice});
}