import 'package:flutter/material.dart';

class AboutGst extends StatelessWidget {
  const AboutGst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                'What is Gst ?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text(
                'GST(Goods and Service Tax) is a single tax on the supply of goods and services, right from the manufacturer to the consumer. Credits of input taxes paid at each stage will be available in the subsequent stage of value addition, which makes GST essentially a tax only on value addition at each stage...',
                style: TextStyle(color: Colors.black87),
              ),
              Text(''),
              Text(''),
              Text(
                'What are the benefits of using Gst calculater ?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text(
                'The simplified GST calculator helps you determine the price for gross or net product depending on the amount and gives you a split of percentage-based GST rates. It helps give the division of the rate between CGST and SGST or calculate IGST accurately.',
                style: TextStyle(color: Colors.black87),
              ),
              Text(''),
              Text(
                ' Buyer Gst Formula:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text(
                'Total Tax = Net price * Gst /100 ;',
              ),
              Text('Gross price = Net price + Total Tax ;'),
              Text('CGST = Total Tax / 2 ;'),
              Text('IGST =Total Tax / 2 ;'),
              Text(''),
              Text(
                'Manufacturer Gst Formula;',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text(
                  'Production Profit Ratio = Cost of Production * Profit Ratio / 100 ;'),
              Text(
                  'Total Production Cost = Cost of Production + Production Profit Ratio ;'),
              Text('Total Tax = Total Production Cost * Gst / 100 ;'),
              Text('CGST = Total Tax / 2 ;'),
              Text('IGST = Total Tax / 2 ;'),
              Text(''),
              Text(
                'Wholesaler/Retailer Gst Formula:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(''),
              Text('Goods profit Ratio = Cost of Goods * Profit Ratio / 100 ;'),
              Text(
                  'Total Production Cost = Cost of Goods + Goods Profit Ratio ;'),
              Text('Total Tax = Total Production Cost * Gst / 100 ;'),
              Text('CGST = Total Tax / 2 ;'),
              Text('IGST = Total Tax / 2 ;'),
            ],
          ),
        ),
      ),
    );
  }
}
