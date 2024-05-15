import UIKit

class HabitViewController: UIViewController {
    
    
    private lazy var scrollHabitView: UIScrollView = {
        let scrollHabitView = UIScrollView()
        scrollHabitView.translatesAutoresizingMaskIntoConstraints = false
        scrollHabitView.showsHorizontalScrollIndicator = true
        scrollHabitView.showsHorizontalScrollIndicator = false
        
        return scrollHabitView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "НАЗВАНИЕ"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor("#000000")
        nameLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return nameLabel
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        return nameTextField
    }()
    
    private lazy var collorLabel: UILabel = {
        let collorLabel = UILabel()
        collorLabel.text = "ЦВЕТ"
        collorLabel.translatesAutoresizingMaskIntoConstraints = false
        collorLabel.textColor = UIColor("#000000")
        collorLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return collorLabel
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = UIColor("#000000")
        timeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return timeLabel
    }()
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfo))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "test"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = openButton
        self.navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func openInfo(_ sender: UIButton) {
        
    }
    
}
