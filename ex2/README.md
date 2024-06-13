### package 　作成コマンド

```sh
$ flutter create --org jp.co.altive --template=plugin --platforms=android,ios PACKEAGENAME --project-name PACKEAGENAME
```

### ルートに pigeons ディレクトリを作成

```sh
$ mkdir pigeons && touch pigeons/messages.dart
```

messages.dart で pingeon の出力先を指定

```dart
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/generated/gms_places_api_platform_interface.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/GmsPlacessssApi.swift',
  swiftOptions: SwiftOptions(),
  kotlinOut: 'android/src/main/kotlin/dev/laihz/gms_places_api/GmsPlacesApi.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.laihz.gms_places_api',
  ),
))
```

### pigeon 生成コマンド

```sh
$ flutter pub run pigeon --input pigeons/gms_places_api.dart.dart
```

### GmsPlacesApiPlugin.swift 　を作成

flutter と　 iOS の間でデータのやり取りを行うためのクラスを作成

```swift
import Flutter
import UIKit
import GooglePlaces

/// NSObjectとFlutterPluginプロトコルを継承。NSObjectはObjective-Cのクラスの基底クラスであり、
// FlutterPluginはFlutterプラグインを作成する際に実装する必要があるプロトコル
public class GmsPlacesApiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // SetUpを呼び出してメソッドチャンネルを開通させる
      GmsPlacesApiSetup.setUp(binaryMessenger: registrar.messenger(), api: GmsPlacesApiImpl())
  }
}

```

````swift

### GmsPlacesApi.swift 　に以下のようなクラスが生成される

```swift
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol GmsPlacesApi {
  func ensureInitialized() throws
  func autocomplete(fromQuery: String, filter: PlacesFilterType, completion: @escaping (Result<[Prediction], Error>) -> Void)
  func getDetailById(placeId: String, fields: [PlaceFields], completion: @escaping (Result<PlaceItem?, Error>) -> Void)
}
````

これは、messages.dart で定義した以下のようなクラスに対応している

```dart
@HostApi()
abstract class GmsPlacesApi {
  void ensureInitialized();
  @async
  List<Prediction> autocomplete(String fromQuery, PlacesFilterType filter);

  @async
  PlaceItem? getDetailById(String placeId, List<PlaceFields> fields);
}
```

### GmsPlacesApiImpl.swift 　を作成して関数を実装

```swift
class GmsPlacesApiImpl: GmsPlacesApi {
    static var token: GMSAutocompleteSessionToken?
    static var fieldDict: [PlaceFields: GMSPlaceField] = [
        .formattedAddress: .formattedAddress,
        .addressComponents: .addressComponents,
        .businessStatus: .businessStatus,
        .placeID: .placeID,
        .coordinate: .coordinate,
        .name: .name,
        .photos: .photos,
        .plusCode: .plusCode,
        .types: .types,
        .viewport: .viewport,
    ]
    static var businessStatusDict: [GMSPlacesBusinessStatus: PlacesBusinessStatus] = [
        .closedPermanently: .closedPermanently,
        .closedTemporarily: .closedTemporarily,
        .operational: .operational,
        .unknown: .unknown,
    ]

    func ensureInitialized() throws {
        GmsPlacesApiImpl.token = GMSAutocompleteSessionToken()
    }

    func autocomplete(fromQuery: String, filter: PlacesFilterType, completion: @escaping (Result<[Prediction], Error>) -> Void) {
        let autocompleteFilter = GMSAutocompleteFilter()
        switch filter {
        case .address:
            autocompleteFilter.type = .address
        case .city:
```

````sh
### swift
func ensureInitialized() throws {
        GmsPlacesApiImpl.token = GMSAutocompleteSessionToken()
    }

### dartのアプリ側の AppDelegate.swift で初期化
```swift
import UIKit
import Flutter
import GooglePlaces

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSPlacesClient.provideAPIKey("dummy")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
````

### dart のアプリで初期化して @HostApiで定義した関数を呼ぶ

```dart
await GmsPlacesApi.ensureInitialized();
```
