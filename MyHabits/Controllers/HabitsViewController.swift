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
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.estimatedItemSize = .init(width: 343, height: 60)
        viewLayout.minimumLineSpacing = 12
        viewLayout.sectionInset = .init(top: 10, left: 0, bottom: 10, right: 0)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor("#F2F2F7")
        collectionView.register(
            ProgressCollectionViewCell.self ,
            forCellWithReuseIdentifier: "\(ProgressCollectionViewCell.self)"
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
    }
    
    @objc func openNewHabit(_ sender: UIButton) {
        let habitViewController = HabitViewController()
        navigationController?.pushViewController(habitViewController, animated: true)
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
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

extension HabitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellBar = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProgressCollectionViewCell.self)", for: indexPath) as! 
        ProgressCollectionViewCell
        return cellBar
    }
}
extension HabitsViewController: UICollectionViewDelegate {
    
}
