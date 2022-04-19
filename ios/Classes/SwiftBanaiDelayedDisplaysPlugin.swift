import Flutter
import UIKit

public class SwiftBanaiDelayedDisplaysPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "banai_delayed_displays", binaryMessenger: registrar.messenger())
    let instance = SwiftBanaiDelayedDisplaysPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
