import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:onepref/onepref.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'donate_page_model.dart';
export 'donate_page_model.dart';

class DonatePageWidget extends StatefulWidget {
  const DonatePageWidget({super.key});

  @override
  State<DonatePageWidget> createState() => _DonatePageWidgetState();
}

class _DonatePageWidgetState extends State<DonatePageWidget> {
//payload
  late final List<ProductDetails> _products = <ProductDetails>[];

//IApEngine object

  IApEngine iapEngine = IApEngine();

//list type product id
  List<ProductId> storeProductIds = <ProductId>[
    ProductId(id: "0.99usd", isConsumable: true, reward: 10),
    ProductId(id: "3.99usd", isConsumable: true, reward: 20),
    ProductId(id: "7.99usd", isConsumable: true, reward: 50),
    ProductId(id: "15.99usd", isConsumable: true, reward: 100),
    ProductId(id: "24.99usd", isConsumable: true, reward: 100),
    ProductId(id: "39.99usd", isConsumable: true, reward: 100),
    ProductId(id: "59.99usd", isConsumable: true, reward: 100),
    ProductId(id: "89usd", isConsumable: true, reward: 100),
  ];

  Future<void> listenPurchases(List<PurchaseDetails> list) async {
    for (PurchaseDetails purchase in list) {
      if (purchase.status == PurchaseStatus.restored ||
          purchase.status == PurchaseStatus.purchased) {
        if (Platform.isAndroid &&
            iapEngine
                .getProductIdsOnly(storeProductIds)
                .contains(purchase.productID)) {
          final InAppPurchaseAndroidPlatformAddition androidAddition = iapEngine
              .inAppPurchase
              .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
        }

        if (purchase.pendingCompletePurchase) {
          await iapEngine.inAppPurchase.completePurchase(purchase);
        }
      }
    }
  }

  void getProducts() async {
    final isAvailable = await iapEngine.getIsAvailable();
    if (isAvailable) {
      final result = await iapEngine.queryProducts(storeProductIds);
      setState(() {
        _products.addAll(result.productDetails);
        _products.sort((a, b) => a.price.length.compareTo(b.price.length));
        print("products");
        print(_products);
      });
    } else {}
  }

//
  late DonatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonatePageModel());
    //payment
    iapEngine.inAppPurchase.purchaseStream.listen((list) {
      listenPurchases(list);
    });
    getProducts();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).secondary
              ],
              stops: const [0.0, 1.0],
              begin: const AlignmentDirectional(0.0, -1.0),
              end: const AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'DONATE',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 60.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: _products.length > 0
                                ? Column(
                                    children: List.generate(
                                      _products.length,
                                      (index) => MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: const Color(0x4C0C044B),
                                        onPressed: () async => {
                                          iapEngine.handlePurchase(
                                              _products[index], storeProductIds)
                                        },
                                        child: Row(
                                          children: [
                                            Text(_products[index].description,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                            const Spacer(),
                                            Text(_products[index].price,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text(
                                    'DEVICE NOT SUPPORT PAYMENT',
                                    style: GoogleFonts.jacquesFrancois(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Thanks for donate :)',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 30.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: 'Go Back',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0x4C0C044B),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
