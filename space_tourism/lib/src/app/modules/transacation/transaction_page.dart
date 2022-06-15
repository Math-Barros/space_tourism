import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/components/standard_button.dart';
import 'package:space_tourism/src/app/components/standard_card.dart';
import 'package:space_tourism/src/app/components/list_screen.dart';
import 'package:space_tourism/src/app/components/standard_textform.dart';
import 'package:space_tourism/src/app/modules/transacation/transaction_controller.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController transactionNameController = TextEditingController();
  TextEditingController transactionValueController = TextEditingController();
  FocusNode transactionNameFocus = FocusNode();
  FocusNode transactionValueFocus = FocusNode();

  final transactionController = TransactionController();

  Future<void> _showDialog(
      {String? transactionName, String? transactionValue}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(transactionName!),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    transactionController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListScreen(
      pageTile: 'Extrato',
      body: SingleChildScrollView(
        child: Column(
          children: [
            StandardTextForm(
              focusNode: transactionNameFocus,
              userInputController: transactionNameController,
              label: 'Nome da Transação',
              onEditingComplete: () {
                transactionValueFocus.nextFocus();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            StandardTextForm(
              focusNode: transactionValueFocus,
              userInputController: transactionValueController,
              label: 'Valor da Transação',
            ),
            const SizedBox(
              height: 5,
            ),
            StandardButton(
                buttonText: 'Adicionar nova Transação',
                onPressed: () {
                  transactionController.addNewTransaction(
                      transactionName: transactionNameController.text,
                      transactionValue: transactionValueController.text);
                }),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
              shrinkWrap: true,
              itemCount: transactionController.transactionList.length,
              itemBuilder: ((context, index) {
                var transactionItem =
                    transactionController.transactionList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print(transactionItem.transactionName);
                    },
                    child: StandardCard(
                      leftText: transactionItem.transactionName,
                      rightText: 'R\$ ${transactionItem.transactionValue}',
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
