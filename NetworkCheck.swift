import UIKit
import Network
import MaterialComponents.MaterialSnackbar

class ViewController: UIViewController {
let monitor = NWPathMonitor()

override func viewDidLoad() {
        super.viewDidLoad()
        
         monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                let action = MDCSnackbarMessageAction()
                let answerMessage = MDCSnackbarMessage()
                MDCSnackbarMessageView.appearance().backgroundColor = .magenta
                answerMessage.text = "You are online"
                action.title = "OK"
                answerMessage.action = action
                MDCSnackbarManager.default.show(answerMessage)
                
            } else {
                let action = MDCSnackbarMessageAction()
                let answerMessage = MDCSnackbarMessage()
                MDCSnackbarMessageView.appearance().backgroundColor = .magenta
                answerMessage.text = "You are offline"
                action.title = "OK"
                answerMessage.action = action
                MDCSnackbarManager.default.show(answerMessage)
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)

}


}
    
