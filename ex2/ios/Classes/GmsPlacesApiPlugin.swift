import Flutter
import UIKit
import GooglePlaces

/// NSObjectとFlutterPluginプロトコルを継承しています。NSObjectはObjective-Cのクラスの基底クラスであり、
// FlutterPluginはFlutterプラグインを作成する際に実装する必要があるプロトコル
public class GmsPlacesApiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // SetUpを呼び出してメソッドチャンネルを開通させる
      GmsPlacesApiSetup.setUp(binaryMessenger: registrar.messenger(), api: GmsPlacesApiImpl())
  }
}
