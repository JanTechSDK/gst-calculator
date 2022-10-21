import "package:flutter/material.dart";

class Manufacturer extends StatefulWidget {
  const Manufacturer({super.key});

  @override
  State<Manufacturer> createState() => ManufacturerState();
}

class ManufacturerState extends State<Manufacturer> {
  double _costProduction = 0.0;
  double _profitRatio = 0.0;
  double _gst = 0.0;
  double _totalProductionCost = 0.0;
  double _totalTax = 0.0;
  double _cGst = 0.0;
  double _iGst = 0.0;
  double _cost = 0.0;

  final TextEditingController _costProductionController =
      TextEditingController();
  final TextEditingController _profitRatioController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  void calculateManufacturer() {
    if (_costProductionController.text.toString().isNotEmpty &&
        _profitRatioController.text.toString().isNotEmpty &&
        _gstController.text.toString().isNotEmpty) {
      _costProduction = double.parse(_costProductionController.text.toString());
      _profitRatio = double.parse(_profitRatioController.text.toString());
      _gst = double.parse(_gstController.text.toString());

      setState(() {
        _cost = _costProduction * _profitRatio / 100;
        _totalProductionCost = _costProduction + _cost;
        _totalTax = _totalProductionCost * _gst / 100;
        _cGst = _totalTax / 2;
        _iGst = _totalTax / 2;
      });
    }
  }

  void resetValues() {
    _costProduction = 0.0;
    _profitRatio = 0.0;
    _gst = 0.0;

    setState(() {
      _costProduction = 0.0;
      _profitRatio = 0.0;
      _gst = 0.0;
      _cost = 0.0;
      _cGst = 0.0;
      _iGst = 0.0;
      _totalTax = 0.0;
    });

    _costProductionController.clear();
    _profitRatioController.clear();
    _gstController.clear();
  }

  @override
  void dispose() {
    super.dispose();

    _costProductionController.dispose();
    _profitRatioController.dispose();
    _gstController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Manufacturer",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _costProductionController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    calculateManufacturer();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Cost Of Production",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _profitRatioController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) {
                    calculateManufacturer();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Profit Ratio %",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _gstController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) {
                    calculateManufacturer();
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Gst",
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
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
                            'Rs: $_totalProductionCost',
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
                        children: <Widget>[
                          const Text(
                            'Total Tax',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rs:$_totalTax',
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
