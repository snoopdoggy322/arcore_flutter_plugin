import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UtkaDetectPlane extends StatefulWidget {
  @override
  _UtkaDetectPlaneState createState() => _UtkaDetectPlaneState();
}

class _UtkaDetectPlaneState extends State<UtkaDetectPlane> {
  ArCoreController arCoreController;
  ArCoreNode node;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
        ),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableUpdateListener: true,
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneDetected = _handleOnPlaneDetected;
  }

  void _handleOnPlaneDetected(ArCorePlane plane) {
    if (node != null) {
      arCoreController.removeNode(nodeName: node.name);
    }
    _addSphere(arCoreController, plane);
  }

  Future _addSphere(ArCoreController controller, ArCorePlane plane) async {
    if (!isAdded) {
      final toucanoNode = ArCoreReferenceNode(
          name: 'assets/TocoToucan.gif',
          object3DFileName: 'toucan.sfb',
          position: plane.centerPose.translation,
          rotation: plane.centerPose.rotation);
      controller.addArCoreNodeWithAnchor(toucanoNode);
      setState(() {
        isAdded = true;
      });
    }
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
