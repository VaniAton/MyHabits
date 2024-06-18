import UIKit

class HabitDetailsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}

// MARK: - SwiftUI

import SwiftUI
struct HabitDetailsProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let controller = HabitDetailsViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<HabitDetailsProvider.ContainterView>) -> some HabitDetailsViewController {
            return controller
        }
        
        func updateUIViewController(_ uiViewController: HabitDetailsProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<HabitDetailsProvider.ContainterView>) {
    
        }
    }
}
