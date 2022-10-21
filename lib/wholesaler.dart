import "package:flutter/material.dart";

class Wholesaler extends StatefulWidget {
  const Wholesaler({super.key});

  @override
  State<Wholesaler> createState() => _WholesalerState();
}

class _WholesalerState extends State<Wholesaler> {
  double _costGoods = 0.0;
  double _profitRatio = 0.0;
  double _gst = 0.0;
  double _totalProductionCost = 0.0;
  double _totalTax = 0.0;
  double _cGst = 0.0;
  double _iGst = 0.0;
  double _cost = 0.0;

  final TextEditingController _costGoodsController = TextEditingController();
  final TextEditingController _profitRatioController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  void calculateWholsaler() {
    _costGoods = double.parse(_costGoodsController.text.toString());
    _profitRatio = double.parse(_profitRatioController.text.toString());
    _gst = double.parse(_gstController.text.toString());

    setState(() {
      _cost = _costGoods * _profitRatio / 100;
      _totalProductionCost = _costGoods + _cost;
      _totalTax = _totalProductionCost * _gst / 100;
      _cGst = _totalTax / 2;
      _iGst = _totalTax / 2;
    });
  }

  void resetValue() {
    _costGoods = 0.0;
    _profitRatio = 0.0;
    _gst = 0.0;

    setState(() {});
    _costGoodsController.clear();
    _profitRatioController.clear();
    _gstController.clear();
  }

  @override
  void dispose() {
    super.dispose();

    _costGoodsController.dispose();
    _profitRatioController.dispose();
    _gstController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Center(
              child: Text(
                'Wholesaler/Retailer',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _costGoodsController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) {
                      calculateWholsaler();
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Cost Of Goods',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _profitRatioController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (vla) {
                      calculateWholsaler();
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Profit Ratio %',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _gstController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) {
                      calculateWholsaler();
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'can\'t be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Gst %',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 4,
                childAspectRatio: (8 / 6),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Total production cost',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs:$_totalProductionCost',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.pinkAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'CGST Amount',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs:$_cGst ',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'IGST Amount',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs:$_iGst ',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Total Tax',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs:$_totalTax ',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
