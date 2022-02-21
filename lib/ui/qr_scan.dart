import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

<<<<<<< HEAD
=======
import '../theme/app_theme.dart';

>>>>>>> origin/dev_170222_visitor
class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
<<<<<<< HEAD
=======
  late ThemeData theme;
  late CustomTheme customTheme;
>>>>>>> origin/dev_170222_visitor
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
<<<<<<< HEAD
=======
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
>>>>>>> origin/dev_170222_visitor
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
<<<<<<< HEAD
          Expanded(flex: 4, child: _buildQrView(context)),
=======
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("write bar code"),
                    // TextField(
                    //   cursorColor: customTheme.homemadePrimary,
                    //   decoration: const InputDecoration(
                    //     labelText: 'write bar code',
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(flex: 3, child: _buildQrView(context)),
>>>>>>> origin/dev_170222_visitor
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
<<<<<<< HEAD
                    // const Text(
                    //   'Scan',
                    //   style: TextStyle(
                    //       fontSize: 14.0, fontWeight: FontWeight.w600),
                    // ),
=======
>>>>>>> origin/dev_170222_visitor
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () async {
                            await controller?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Text(
                                    'Scaning ${describeEnum(snapshot.data!)}...');
                              } else {
                                return const Text('loading');
                              }
                            },
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffc5558e),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xffc5558e),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (kDebugMode) {
          print(Text(
              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'));
        }
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (_) => const ScanDetail()));
        //TODO
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
