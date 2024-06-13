// Autogenerated from Pigeon (v17.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Enums
enum BondState: Int {
  case bonding = 0
  case bonded = 1
  case none = 2
}

/// Models
///
/// Generated class from Pigeon that represents data sent in messages.
struct BleService {
  var uuid: String
  var primary: Bool
  var characteristics: [BleCharacteristic?]

  static func fromList(_ list: [Any?]) -> BleService? {
    let uuid = list[0] as! String
    let primary = list[1] as! Bool
    let characteristics = list[2] as! [BleCharacteristic?]

    return BleService(
      uuid: uuid,
      primary: primary,
      characteristics: characteristics
    )
  }
  func toList() -> [Any?] {
    return [
      uuid,
      primary,
      characteristics,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BleCharacteristic {
  var uuid: String
  var properties: [Int64?]
  var permissions: [Int64?]
  var descriptors: [BleDescriptor?]? = nil
  var value: FlutterStandardTypedData? = nil

  static func fromList(_ list: [Any?]) -> BleCharacteristic? {
    let uuid = list[0] as! String
    let properties = list[1] as! [Int64?]
    let permissions = list[2] as! [Int64?]
    let descriptors: [BleDescriptor?]? = nilOrValue(list[3])
    let value: FlutterStandardTypedData? = nilOrValue(list[4])

    return BleCharacteristic(
      uuid: uuid,
      properties: properties,
      permissions: permissions,
      descriptors: descriptors,
      value: value
    )
  }
  func toList() -> [Any?] {
    return [
      uuid,
      properties,
      permissions,
      descriptors,
      value,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BleDescriptor {
  var uuid: String
  var value: FlutterStandardTypedData? = nil
  var permissions: [Int64?]? = nil

  static func fromList(_ list: [Any?]) -> BleDescriptor? {
    let uuid = list[0] as! String
    let value: FlutterStandardTypedData? = nilOrValue(list[1])
    let permissions: [Int64?]? = nilOrValue(list[2])

    return BleDescriptor(
      uuid: uuid,
      value: value,
      permissions: permissions
    )
  }
  func toList() -> [Any?] {
    return [
      uuid,
      value,
      permissions,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct ReadRequestResult {
  var value: FlutterStandardTypedData
  var offset: Int64? = nil
  var status: Int64? = nil

  static func fromList(_ list: [Any?]) -> ReadRequestResult? {
    let value = list[0] as! FlutterStandardTypedData
    let offset: Int64? = isNullish(list[1]) ? nil : (list[1] is Int64? ? list[1] as! Int64? : Int64(list[1] as! Int32))
    let status: Int64? = isNullish(list[2]) ? nil : (list[2] is Int64? ? list[2] as! Int64? : Int64(list[2] as! Int32))

    return ReadRequestResult(
      value: value,
      offset: offset,
      status: status
    )
  }
  func toList() -> [Any?] {
    return [
      value,
      offset,
      status,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct WriteRequestResult {
  var value: FlutterStandardTypedData? = nil
  var offset: Int64? = nil
  var status: Int64? = nil

  static func fromList(_ list: [Any?]) -> WriteRequestResult? {
    let value: FlutterStandardTypedData? = nilOrValue(list[0])
    let offset: Int64? = isNullish(list[1]) ? nil : (list[1] is Int64? ? list[1] as! Int64? : Int64(list[1] as! Int32))
    let status: Int64? = isNullish(list[2]) ? nil : (list[2] is Int64? ? list[2] as! Int64? : Int64(list[2] as! Int32))

    return WriteRequestResult(
      value: value,
      offset: offset,
      status: status
    )
  }
  func toList() -> [Any?] {
    return [
      value,
      offset,
      status,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct ManufacturerData {
  var manufacturerId: Int64
  var data: FlutterStandardTypedData

  static func fromList(_ list: [Any?]) -> ManufacturerData? {
    let manufacturerId = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let data = list[1] as! FlutterStandardTypedData

    return ManufacturerData(
      manufacturerId: manufacturerId,
      data: data
    )
  }
  func toList() -> [Any?] {
    return [
      manufacturerId,
      data,
    ]
  }
}
private class BlePeripheralChannelCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return BleCharacteristic.fromList(self.readValue() as! [Any?])
    case 129:
      return BleDescriptor.fromList(self.readValue() as! [Any?])
    case 130:
      return BleService.fromList(self.readValue() as! [Any?])
    case 131:
      return ManufacturerData.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class BlePeripheralChannelCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? BleCharacteristic {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? BleDescriptor {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? BleService {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else if let value = value as? ManufacturerData {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class BlePeripheralChannelCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return BlePeripheralChannelCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return BlePeripheralChannelCodecWriter(data: data)
  }
}

class BlePeripheralChannelCodec: FlutterStandardMessageCodec {
  static let shared = BlePeripheralChannelCodec(readerWriter: BlePeripheralChannelCodecReaderWriter())
}

/// Flutter -> Native
///
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol BlePeripheralChannel {
  func initialize() throws
  func isAdvertising() throws -> Bool?
  func isSupported() throws -> Bool
  func stopAdvertising() throws
  func askBlePermission() throws -> Bool
  func addService(service: BleService) throws
  func removeService(serviceId: String) throws
  func clearServices() throws
  func getServices() throws -> [String]
  func startAdvertising(services: [String], localName: String?, timeout: Int64?, manufacturerData: ManufacturerData?, addManufacturerDataInScanResponse: Bool) throws
  func updateCharacteristic(characteristicId: String, value: FlutterStandardTypedData, deviceId: String?) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class BlePeripheralChannelSetup {
  /// The codec used by BlePeripheralChannel.
  static var codec: FlutterStandardMessageCodec { BlePeripheralChannelCodec.shared }
  /// Sets up an instance of `BlePeripheralChannel` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: BlePeripheralChannel?) {
    let initializeChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.initialize", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      initializeChannel.setMessageHandler { _, reply in
        do {
          try api.initialize()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      initializeChannel.setMessageHandler(nil)
    }
    let isAdvertisingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.isAdvertising", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      isAdvertisingChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isAdvertising()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isAdvertisingChannel.setMessageHandler(nil)
    }
    let isSupportedChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.isSupported", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      isSupportedChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isSupported()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isSupportedChannel.setMessageHandler(nil)
    }
    let stopAdvertisingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.stopAdvertising", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      stopAdvertisingChannel.setMessageHandler { _, reply in
        do {
          try api.stopAdvertising()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      stopAdvertisingChannel.setMessageHandler(nil)
    }
    let askBlePermissionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.askBlePermission", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      askBlePermissionChannel.setMessageHandler { _, reply in
        do {
          let result = try api.askBlePermission()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      askBlePermissionChannel.setMessageHandler(nil)
    }
    let addServiceChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.addService", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      addServiceChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let serviceArg = args[0] as! BleService
        do {
          try api.addService(service: serviceArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      addServiceChannel.setMessageHandler(nil)
    }
    let removeServiceChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.removeService", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      removeServiceChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let serviceIdArg = args[0] as! String
        do {
          try api.removeService(serviceId: serviceIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      removeServiceChannel.setMessageHandler(nil)
    }
    let clearServicesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.clearServices", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      clearServicesChannel.setMessageHandler { _, reply in
        do {
          try api.clearServices()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      clearServicesChannel.setMessageHandler(nil)
    }
    let getServicesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.getServices", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getServicesChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getServices()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getServicesChannel.setMessageHandler(nil)
    }
    let startAdvertisingChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.startAdvertising", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startAdvertisingChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let servicesArg = args[0] as! [String]
        let localNameArg: String? = nilOrValue(args[1])
        let timeoutArg: Int64? = isNullish(args[2]) ? nil : (args[2] is Int64? ? args[2] as! Int64? : Int64(args[2] as! Int32))
        let manufacturerDataArg: ManufacturerData? = nilOrValue(args[3])
        let addManufacturerDataInScanResponseArg = args[4] as! Bool
        do {
          try api.startAdvertising(services: servicesArg, localName: localNameArg, timeout: timeoutArg, manufacturerData: manufacturerDataArg, addManufacturerDataInScanResponse: addManufacturerDataInScanResponseArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startAdvertisingChannel.setMessageHandler(nil)
    }
    let updateCharacteristicChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ble_peripheral.BlePeripheralChannel.updateCharacteristic", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      updateCharacteristicChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let characteristicIdArg = args[0] as! String
        let valueArg = args[1] as! FlutterStandardTypedData
        let deviceIdArg: String? = nilOrValue(args[2])
        do {
          try api.updateCharacteristic(characteristicId: characteristicIdArg, value: valueArg, deviceId: deviceIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      updateCharacteristicChannel.setMessageHandler(nil)
    }
  }
}
private class BleCallbackCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return ReadRequestResult.fromList(self.readValue() as! [Any?])
    case 129:
      return WriteRequestResult.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class BleCallbackCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? ReadRequestResult {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? WriteRequestResult {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class BleCallbackCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return BleCallbackCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return BleCallbackCodecWriter(data: data)
  }
}

class BleCallbackCodec: FlutterStandardMessageCodec {
  static let shared = BleCallbackCodec(readerWriter: BleCallbackCodecReaderWriter())
}

/// Native -> Flutter
///
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol BleCallbackProtocol {
  func onReadRequest(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, offset offsetArg: Int64, value valueArg: FlutterStandardTypedData?, completion: @escaping (Result<ReadRequestResult?, FlutterError>) -> Void)
  func onWriteRequest(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, offset offsetArg: Int64, value valueArg: FlutterStandardTypedData?, completion: @escaping (Result<WriteRequestResult?, FlutterError>) -> Void)
  func onCharacteristicSubscriptionChange(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, isSubscribed isSubscribedArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onAdvertisingStatusUpdate(advertising advertisingArg: Bool, error errorArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onBleStateChange(state stateArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onServiceAdded(serviceId serviceIdArg: String, error errorArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onMtuChange(deviceId deviceIdArg: String, mtu mtuArg: Int64, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onConnectionStateChange(deviceId deviceIdArg: String, connected connectedArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onBondStateChange(deviceId deviceIdArg: String, bondState bondStateArg: BondState, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class BleCallback: BleCallbackProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger) {
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return BleCallbackCodec.shared
  }
  func onReadRequest(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, offset offsetArg: Int64, value valueArg: FlutterStandardTypedData?, completion: @escaping (Result<ReadRequestResult?, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onReadRequest"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, characteristicIdArg, offsetArg, valueArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        let result: ReadRequestResult? = nilOrValue(listResponse[0])
        completion(.success(result))
      }
    }
  }
  func onWriteRequest(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, offset offsetArg: Int64, value valueArg: FlutterStandardTypedData?, completion: @escaping (Result<WriteRequestResult?, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onWriteRequest"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, characteristicIdArg, offsetArg, valueArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        let result: WriteRequestResult? = nilOrValue(listResponse[0])
        completion(.success(result))
      }
    }
  }
  func onCharacteristicSubscriptionChange(deviceId deviceIdArg: String, characteristicId characteristicIdArg: String, isSubscribed isSubscribedArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onCharacteristicSubscriptionChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, characteristicIdArg, isSubscribedArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onAdvertisingStatusUpdate(advertising advertisingArg: Bool, error errorArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onAdvertisingStatusUpdate"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([advertisingArg, errorArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onBleStateChange(state stateArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onBleStateChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([stateArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onServiceAdded(serviceId serviceIdArg: String, error errorArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onServiceAdded"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([serviceIdArg, errorArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onMtuChange(deviceId deviceIdArg: String, mtu mtuArg: Int64, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onMtuChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, mtuArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onConnectionStateChange(deviceId deviceIdArg: String, connected connectedArg: Bool, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onConnectionStateChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, connectedArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onBondStateChange(deviceId deviceIdArg: String, bondState bondStateArg: BondState, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.ble_peripheral.BleCallback.onBondStateChange"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([deviceIdArg, bondStateArg.rawValue] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
