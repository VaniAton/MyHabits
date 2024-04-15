import UIKit

class HabitsViewController: UIViewController {
    
    var titlePost: String = "Сегодня"
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfo))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = openButton
        view.backgroundColor = UIColor("#FFFFFF")
    }
    
    @objc func openInfo(_ sender: UIButton) {
        _ = InfoViewController()
        
        
    }
}
