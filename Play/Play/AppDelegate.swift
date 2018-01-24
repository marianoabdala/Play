import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let originalPlaygroundPath = Bundle.main.path(forResource: "MyPlayground", ofType: "playground")
        let newPlaygroundPath = NSHomeDirectory() + "/Desktop/\(self.newPlaygroundName()).playground"
        try? FileManager.default.copyItem(atPath: originalPlaygroundPath!, toPath: newPlaygroundPath)
        
        let openTask = Process()
        openTask.launchPath = "/usr/bin/open"
        openTask.arguments = [newPlaygroundPath]
        openTask.launch()
        openTask.waitUntilExit()
        
        NSApp.terminate(nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    private func newPlaygroundName() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm-dd hh.mm.ss"
        
        return "MyPlayground from \(dateFormatter.string( from: Date()))"
    }
}
