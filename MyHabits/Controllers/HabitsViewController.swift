import UIKit

class HabitsViewController: UIViewController {
    
    enum SectionHabits: Int, CaseIterable {
        case progress, habit
        var columCount: Int {
            switch self {
            case .progress:
                return 1
            case .habit:
                return 1
            }
        }
    }
    
    var dataSource: UICollectionViewDiffableDataSource<SectionHabits, Int>!
    
    
    private lazy var todayLabel: UILabel = {
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.text = "Сегодня"
        todayLabel.textColor = UIColor("#000000")
        todayLabel.highlightedTextColor = UIColor("#000000")
        todayLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        
        return todayLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = createLayout()

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor("#F2F2F7")
        collectionView.register(
            ProgressCollectionViewCell.self ,
            forCellWithReuseIdentifier: ProgressCollectionViewCell.reuseId
        )
        collectionView.register(
            HabitCollectionViewCell.self,
            forCellWithReuseIdentifier: HabitCollectionViewCell.reuseId
        )
        
        return collectionView
    }()
    
    
    
    private lazy var openButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openNewHabit))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = openButton
        view.backgroundColor = UIColor("#FFFFFF")
        view.addSubview(todayLabel)
        setupCollectionView()
        setupConstraintsForHabitVC()
        setupConstraintsForHabitCollection()
        setupDataSource()
        reloadData()
    }
    
    @objc func openNewHabit(_ sender: UIButton) {
        let habitViewController = HabitViewController()
        navigationController?.pushViewController(habitViewController, animated: true)
    }
    
    func configure<T: SelfConfiguringCell>(cellType: T.Type, with intValue: Int, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Error cellTipe")
        }
        return cell
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionHabits, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, intValue)-> UICollectionViewCell? in
            let section = SectionHabits(rawValue: indexPath.section)!
            switch section {
            case .progress:
                return self.configure(cellType: ProgressCollectionViewCell.self, with: intValue, for: indexPath)
            case .habit:
                return self.configure(cellType: HabitCollectionViewCell.self, with: intValue, for: indexPath)
            }
        })
    }
    
    func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<SectionHabits, Int>()
        let itemHabitSelection = 1
        let itemHabitSection = 1
        SectionHabits.allCases.forEach { (SectionHabits) in
            let itemOfSet = SectionHabits.columCount * itemHabitSection
            let itemUpperBound = itemOfSet + itemHabitSelection
            snapShot.appendSections([SectionHabits])
            snapShot.appendItems(Array(itemOfSet..<itemUpperBound))
        }
        dataSource.apply(snapShot, animatingDifferences: false)
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvirnment -> NSCollectionLayoutSection? in
            let section = SectionHabits(rawValue: sectionIndex)!
            switch section {
            case .progress:
                return self.createProgressLayout()
            case .habit:
                return self.createHabitLayout()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createProgressLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 22, leading: 16, bottom: 0, trailing: 16)
        return section
    }
    
    private func createHabitLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 1)
        let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 0, trailing: 16)
        return section
    }
    
    private func setupConstraintsForHabitVC() {
        
        NSLayoutConstraint.activate([
        
            todayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            todayLabel.widthAnchor.constraint(equalToConstant: 141)
        ])
    }
    
    private func setupConstraintsForHabitCollection() {
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
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
