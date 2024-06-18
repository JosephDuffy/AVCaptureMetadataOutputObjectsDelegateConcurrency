# AVCaptureMetadataOutputObjectsDelegateConcurrency

An example project that uses [`AVCaptureMetadataOutputObjectsDelegate`](https://developer.apple.com/documentation/avfoundation/avcapturemetadataoutputobjectsdelegate) under Swift 6 language mode.

This does not compile and the escape hatch of [`Actor.assumeIsolated(_:file:line:)`](<https://developer.apple.com/documentation/swift/actor/assumeisolated(_:file:line:)>) does not help.
