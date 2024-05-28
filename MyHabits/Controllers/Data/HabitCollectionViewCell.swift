import Foundation
import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

        override init(frame: CGRect) {
            super.init(frame: .zero)
            
    }
    
    func setup(
            with habit: Habit
        ) {
        }
}
