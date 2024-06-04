import Foundation
import UIKit

class HabitCollectionViewCell: UICollectionViewCell, SelfConfiguringCell {
    
    func configure(with intValue: Int) {
        print("2")
    }
    
    static var reuseId: String = "Habit"
    
    private lazy var nameOfHabit: UILabel = {
        let nameOfHabit = UILabel()
        nameOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfHabit.text = HabitsStore.shared.habits.first?.name
        return nameOfHabit
    }()
    
    private lazy var nameTimeOfHabit: UILabel = {
        let nameTimeOfHabit = UILabel()
        nameTimeOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameTimeOfHabit.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nameTimeOfHabit.textColor = UIColor("#8E8E93")
        nameTimeOfHabit.text = HabitsStore.shared.habits.first?.dateString
        return nameTimeOfHabit
    }()
    
    private lazy var countOfHabit: UILabel = {
        let countOfHabit = UILabel()
        countOfHabit.translatesAutoresizingMaskIntoConstraints = false
        countOfHabit.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        countOfHabit.textColor = UIColor("#8E8E93")
        countOfHabit.text = HabitsStore.shared.habits.first?.isAlreadyTakenToday.description
        return countOfHabit
    }()
    
    private lazy var checkOfHabit: UIView = {
        let checkOfHabit = UIView()
        checkOfHabit.translatesAutoresizingMaskIntoConstraints = false
        checkOfHabit.layer.cornerRadius = 20
        checkOfHabit.backgroundColor = HabitsStore.shared.habits.first?.color.self
        return checkOfHabit
    }()
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        
    }

        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            setupSubviews()
            setupConstraintsForHabitView()
            contentView.clipsToBounds = true
            contentView.backgroundColor = UIColor("#FFFFFF")
            contentView.layer.cornerRadius = 12
            
    }
    
    private func setupSubviews() {
            contentView.addSubview(nameOfHabit)
            contentView.addSubview(nameTimeOfHabit)
            contentView.addSubview(countOfHabit)
            contentView.addSubview(checkOfHabit)
    }
    
    private func setupConstraintsForHabitView() {
        NSLayoutConstraint.activate([
            
            nameOfHabit.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameOfHabit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameOfHabit.widthAnchor.constraint(equalToConstant: 220),
            nameOfHabit.heightAnchor.constraint(equalToConstant: 22),
            
            nameTimeOfHabit.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTimeOfHabit.topAnchor.constraint(equalTo: nameOfHabit.bottomAnchor, constant: 4),
            
            countOfHabit.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countOfHabit.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
            countOfHabit.heightAnchor.constraint(equalToConstant: 18),
            countOfHabit.widthAnchor.constraint(equalToConstant: 188),
            
            checkOfHabit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 46),
            checkOfHabit.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            checkOfHabit.heightAnchor.constraint(equalToConstant: 38),
            checkOfHabit.widthAnchor.constraint(equalToConstant: 38),
            
            
        
        ])
    }
    
    func setup(
            with habit: Habit
        ) {
        }
}
