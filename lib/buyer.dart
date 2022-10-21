import "package:flutter/material.dart";

class MyBuyers extends StatefulWidget {
  const MyBuyers({super.key});

  @override
  State<MyBuyers> createState() => _MyBuyersState();
}

class _MyBuyersState extends State<MyBuyers> {
  double _grossPrice = 0.0;

  double _netPrice = 0.0;
  double _gst = 0.0;
  double _totalTax = 0.0;
  double _cGst = 0.0;
  double _iGst = 0.0;

  final TextEditingController _netPriceController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  void calculateBuyers() {
    if (_netPriceController.text.toString().isNotEmpty &&
        _gstController.text.toString().isNotEmpty) {
      _netPrice = double.parse(_netPriceController.text.toString());
      _gst = double.parse(_gstController.text.toString());

      setState(() {
        _totalTax = ((_netPrice * _gst) / 100);
        _grossPrice = _netPrice + _totalTax;
        _cGst = _totalTax / 2;
        _iGst = _totalTax / 2;
      });
    }
  }

  void resetValues() {
    _netPrice = 0.0;
    _gst = 0.0;

    setState(() {
      _totalTax = 0.0;
      _grossPrice = 0.0;
      _cGst = 0.0;
      _iGst = 0.0;
    });

    _netPriceController.clear();
    _gstController.clear();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _netPriceController.dispose();
    _gstController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "buyers",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _netPriceController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) {
                  calculateBuyers();
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Net Price",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _gstController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) {
                  calculateBuyers();
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Gst %",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                  border: OutlineInputBorder(),
                ),
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
                      children: [
                        const Text(
                          'Gross Price',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs: $_grossPrice',
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
                      children: [
                        const Text(
                          'CGST Amount',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs:$_cGst",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.lightBlueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'IGST Amount',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs:$_iGst',
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
                      children: [
                        const Text(
                          'Total Tax',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs: $_totalTax',
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
