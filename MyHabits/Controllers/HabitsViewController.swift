import UIKit

class HabitsViewController: UIViewController {
    

    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 22
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: layout
            )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor("#F2F2F7")
        collectionView.register(
                ProgressCollectionViewCell.self ,
                forCellWithReuseIdentifier: "ProgressCollectionViewCell"
            )
        collectionView.register(
                HabitCollectionViewCell.self,
                forCellWithReuseIdentifier: "HabitCollectionViewCell"
            )
        collectionView.register(
                HeaderForHabitsVC.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "HeaderForHabitsVC")
            
        collectionView.dataSource = self
        collectionView.delegate = self
        
            
            return collectionView
        }()
    
    
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openNewHabit))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = openButton
        view.backgroundColor = UIColor("#FFFFFF")
        view.addSubview(collectionView)
        setupConstraintsForHabitCollection()
    }
    
    @objc func openNewHabit(_ sender: UIButton) {
        let habitViewController = HabitViewController()
        navigationController?.pushViewController(habitViewController, animated: true)
    }
    
    private func setupConstraintsForHabitCollection() {
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCollectionViewCell", for: indexPath) as? ProgressCollectionViewCell else { fatalError("error")
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitCollectionViewCell", for: indexPath) as? HabitCollectionViewCell else { fatalError("error")
            }
            if indexPath.row < HabitsStore.shared.habits.count {
                let profile = HabitsStore.shared.habits[indexPath.row]
                cell.setup(with: profile)
                cell.reloadInputViews()
            } else {
                return cell
            }
            cell.reloadInputViews()
            
            return cell
        }
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 343, height: 60)
        } else {
            return CGSize(width: 343, height: 130)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let habitDetailsViewController = HabitDetailsViewController()
        let model = HabitsStore.shared.habits[indexPath.row]
        navigationController?.pushViewController(HabitDetailsViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderForHabitsVC", for: indexPath) as! HeaderForHabitsVC
        headerView.cofigure()
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 141, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 22, left: 16, bottom: 10, right: 16)
        }
}

// MARK: - SwiftUI

import SwiftUI
struct HabitsProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let controller = HabitsViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<HabitsProvider.ContainterView>) -> some HabitsViewController {
            return controller
        }
        
        func updateUIViewController(_ uiViewController: HabitsProvider.ContainterView.UIViewControllerType, context:
                                    UIViewControllerRepresentableContext<HabitsProvider.ContainterView>) {
    
        }
    }
}
