import Foundation
import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var motivationLabel: UILabel = {
        let motivationLabel = UILabel()
        motivationLabel.text = "Все получится!"
        motivationLabel.translatesAutoresizingMaskIntoConstraints = false
        motivationLabel.textColor = UIColor("#8E8E93")
        motivationLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return motivationLabel
    }()
    
    private lazy var motivationProgressProcent: UILabel = {
        let motivationProgressProcent = UILabel()
        motivationProgressProcent.text = "Все получится!"
        motivationProgressProcent.translatesAutoresizingMaskIntoConstraints = false
        motivationProgressProcent.textColor = UIColor("#8E8E93")
        motivationProgressProcent.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return motivationProgressProcent
    }()
    
    private lazy var progresLabelView: UIProgressView = {
        let progresLabelView = UIProgressView()
        progresLabelView.translatesAutoresizingMaskIntoConstraints = false
        progresLabelView.progressViewStyle = .default
        progresLabelView.progressTintColor = UIColor("#A116CC")
        progresLabelView.trackTintColor = UIColor("#D8D8D8")
        progresLabelView.progress = HabitsStore.shared.todayProgress
        progresLabelView.setProgress(0.0, animated: true)
        progresLabelView.contentMode = .scaleAspectFill
        return progresLabelView
    }()
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            setupSubviews()
            setupConstraintsForProgresView()
            contentView.clipsToBounds = true
            contentView.backgroundColor = UIColor("#FFFFFF")
            contentView.layer.cornerRadius = 12
    }
    
    private func setupSubviews() {
            contentView.addSubview(motivationLabel)
            contentView.addSubview(motivationProgressProcent)
            contentView.addSubview(progresLabelView)
        }
    
    func setupConstraintsForProgresView() {
        
        NSLayoutConstraint.activate([
        
            motivationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            motivationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            motivationLabel.heightAnchor.constraint(equalToConstant: 18),
            
            motivationProgressProcent.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 236),
            motivationProgressProcent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            motivationProgressProcent.heightAnchor.constraint(equalToConstant: 18),
            
            progresLabelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 38),
            progresLabelView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            progresLabelView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            progresLabelView.heightAnchor.constraint(equalToConstant: 7)
        
        ])
    }
    
    func setup(
            with habit: Habit
        ) {
            progresLabelView.setProgress(0.1, animated: true)
        }
}
