import UIKit

class HeaderForHabitsVC: UICollectionReusableView {
    
    private lazy var todayLabel: UILabel = {
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.text = "Сегодня"
        todayLabel.textColor = UIColor("#000000")
        todayLabel.highlightedTextColor = UIColor("#000000")
        todayLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return todayLabel
    }()
    
    func cofigure() {
        
        addSubview(todayLabel)
        setupConstraintsForHabitVC()
        backgroundColor = UIColor("#FFFFFF")
    }
    
    private func setupConstraintsForHabitVC() {
        
        NSLayoutConstraint.activate([
        
            todayLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            todayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            todayLabel.widthAnchor.constraint(equalToConstant: 141)
        ])
    }
}
