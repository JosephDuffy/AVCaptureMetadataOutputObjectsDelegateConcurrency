import AVFoundation
import UIKit

@MainActor
final class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    private var output: AVCaptureMetadataOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: .main)
        self.output = output
    }

    private func doSomethingWithMetadataObjects(_ metadataObjects: [AVMetadataObject]) {}

    // Must be marked nonisolated because the AVCaptureMetadataOutputObjectsDelegate protocol cannot declare the actor on which the function will be called.
    nonisolated func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // We know it's on the main actor so we should be able to assume
        // isolated and pass metadata objects to another function.
        MainActor.assumeIsolated {
            // This does not compile though, presumably because AVMetadataObject
            // is not Sendable.
            doSomethingWithMetadataObjects(metadataObjects) // Sending 'metadataObjects' risks causing data races
        }
    }
}
