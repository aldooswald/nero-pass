import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../config/themes.dart';
import '../../utils/commons.dart';
import '../cubit/attendance/attendance_cubit.dart';
import '../widget/custom_dialog.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isProcessing = false; // Flag to prevent multiple scans

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Record Attendance'),
        foregroundColor: ColorPallete.neroLight,
        backgroundColor: ColorPallete.neroDark,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocListener<AttendanceCubit, AttendanceState>(
        listener: (context, state) {
          if (state is AttendanceError) {
            showCustomAlertDialog(
              context: context,
              message:
                  "${state.message}. Make sure you are scanning the right QR code from the Nero Card.",
              type: AlertType.failed,
              hasTwoButtons: true,
              positiveButtonText: 'Try Again',
              negativeButtonText: 'Back to Home',
              onPositiveButtonPressed: () {
                context.pop();
                _restartCamera();
              },
              onNegativeButtonPressed: () {
                context.pop();
                context.go('/home');
              },
            );
          } else if (state is AttendanceLoaded) {
            showCustomAlertDialog(
              context: context,
              message:
                  "Attendance for ${state.attendance.name} has been recorded at ${state.attendance.time}",
              type: AlertType.success,
              hasTwoButtons: true,
              positiveButtonText: 'Scan Another',
              negativeButtonText: 'Back to Home',
              onPositiveButtonPressed: () {
                context.pop();
                _restartCamera();
              },
              onNegativeButtonPressed: () {
                context.pop();
                context.go('/home');
              },
            );
          }
        },
        child: BlocBuilder<AttendanceCubit, AttendanceState>(
          builder: (context, state) {
            return Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: ColorPallete.neroLight,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                if (state is AttendanceLoading || isProcessing)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: Center(
                          child: showProgressIndicator(context),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isProcessing) {
        setState(() {
          result = scanData;
          isProcessing = true;
          _recordAttendance();
        });
      }
    });
  }

  void _recordAttendance() {
    if (result != null) {
      BlocProvider.of<AttendanceCubit>(context).inputAttendance(result!.code!);
    }
  }

  void _restartCamera() {
    controller?.resumeCamera();
    setState(() {
      isProcessing = false;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
