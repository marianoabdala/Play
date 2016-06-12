import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let originalPlaygroundPath = NSBundle.mainBundle().pathForResource("MyPlayground", ofType: "playground")!
        let newPlaygroundPath = NSHomeDirectory().stringByAppendingString("/Desktop/\(self.newPlaygroundName()).playground")
        
        try! NSFileManager.defaultManager().copyItemAtPath(originalPlaygroundPath, toPath: newPlaygroundPath)
        
        let openTask = NSTask()
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
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm-dd hh.mm.ss"
        
        return "MyPlayground from \(dateFormatter.stringFromDate(NSDate()))"
    }
}
