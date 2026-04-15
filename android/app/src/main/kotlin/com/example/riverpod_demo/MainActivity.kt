package com.example.riverpod_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.riverpod/native_code"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler {
            call, result ->
            if (call.method == "getKotlinMessage"){
                val message = getMyKotlinData()
                result.success(message)
            }else{
                result.notImplemented()
            }
        }
    }

    private fun getMyKotlinData(): String{
        return "Hello from kotlin!"
    }
}
