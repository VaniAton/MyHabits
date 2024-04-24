import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var todayLabel: UILabel = {
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.text = "Сегодня"
        todayLabel.textColor = UIColor("#000000")
        todayLabel.highlightedTextColor = UIColor("#000000")
        todayLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return todayLabel
    }()
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openInfo))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = openButton
        view.backgroundColor = UIColor("#FFFFFF")
        view.addSubview(todayLabel)
        setupConstraintsForHabitVC()
    }
    
    @objc func openInfo(_ sender: UIButton) {
        _ = InfoViewController()
    }
    
    private func setupConstraintsForHabitVC() {
        
        NSLayoutConstraint.activate([
        
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            todayLabel.widthAnchor.constraint(equalToConstant: 141)
            
        
        ])
    }
}
