import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';


// Replace with your live credentials
const String CLIENT_ID = "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
const String SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('eSewa Payment Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              initiateESewaPayment();
            },
            child: Text('Initiate Payment'),
          ),
        ),
      ),
    );
  }

  void initiateESewaPayment() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.live,
          clientId: CLIENT_ID,
          secretId: SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81", // Replace with your unique product ID
          productName: "Product One", // Replace with your product name
          productPrice: "20", callbackUrl: '', // Replace with the amount you are charging
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
          // Handle payment failure
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
          // Handle payment cancellation
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
      // Handle exceptions
    }
  }

  void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {
    try {
      // Call your verification API to verify transaction status
      var response = await callVerificationApi(result.refId);
      
      if (response.statusCode == 200) {
        // Parse the response
        List<dynamic> responseData = response.data;
        var transactionDetails = responseData.isNotEmpty ? responseData[0]['transactionDetails'] : null;
        
        if (transactionDetails != null && transactionDetails['status'] == 'COMPLETE') {
          // Transaction verification successful, handle success
          debugPrint("Transaction Verified: Success");
          // Example: Navigate to success page or update UI accordingly
        } else {
          // Transaction verification failed, handle failure
          debugPrint("Transaction Verified: Failed");
          // Example: Show error message or retry payment
        }
      } else {
        // Handle HTTP error
        debugPrint("Transaction Verification HTTP Error: ${response.statusCode}");
        // Example: Show error message or retry payment
      }
    } catch (e) {
      // Handle exceptions
      debugPrint("Transaction Verification Exception: ${e.toString()}");
      // Example: Show error message or retry payment
    }
  }

  Future<dynamic> callVerificationApi(String refId) async {
    // Replace with your verification API endpoint and credentials
    // Example: Replace with your actual merchantId and merchantSecret
    String merchantId = "your_merchant_id";
    String merchantSecret = "your_merchant_secret";
    
    // Replace with your actual API endpoint
    String verificationUrl = "https://rc.esewa.com.np/mobile/transaction?txnRefId=$refId";
    
    try {
      // Make HTTP GET request to verification API
      // Example: Use Dio package or other HTTP client
      // var response = await dio.get(verificationUrl, options: Options(headers: {
      //   'merchantId': merchantId,
      //   'merchantSecret': merchantSecret,
      //   'Content-Type': 'application/json',
      // }));
      
      // Example: Mock response for demonstration
      var response = await Future.delayed(Duration(seconds: 1), () {
        return {
          "statusCode": 200,
          "data": [
            {
              "productId": "1999",
              "productName": "Android SDK Payment",
              "totalAmount": "25.0",
              "code": "00",
              "message": {
                "technicalSuccessMessage": "Your transaction has been completed.",
                "successMessage": "Your transaction has been completed."
              },
              "transactionDetails": {
                "date": "Mon Dec 26 12:58:14 NPT 2022",
                "referenceId": "0004VZR",
                "status": "COMPLETE"
              },
              "merchantName": "Android SDK Payment"
            }
          ]
        };
      });
      
      return response;
    } catch (e) {
      // Handle exceptions
      debugPrint("Transaction Verification API Exception: ${e.toString()}");
      // Example: Show error message or retry payment
      throw Exception("Failed to verify transaction");
    }
  }
}
