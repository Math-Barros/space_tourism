import 'package:flutter/material.dart';
import 'package:space_tourism/src/app/model/transaction_model.dart';

class TransactionController extends ChangeNotifier {
  List<TransactionModel> transactionList = [
    TransactionModel(
        transactionName: 'Remendar o Peugeot', transactionValue: 5000),
    TransactionModel(transactionName: 'Comprar PODs', transactionValue: 150),
    TransactionModel(transactionName: 'Rodizio Japonês', transactionValue: 125),
  ];

  addNewTransaction(
      {required String? transactionName, required String? transactionValue}) {
    transactionList.insert(
      0,
      TransactionModel(
          transactionName: transactionName,
          transactionValue: num.parse(transactionValue.toString())),
    );
    notifyListeners();
  }
}
