import UIKit

class HabitViewController: UIViewController {
    
    
    private lazy var scrollHabitView: UIScrollView = {
        let scrollHabitView = UIScrollView()
        scrollHabitView.translatesAutoresizingMaskIntoConstraints = false
        scrollHabitView.showsHorizontalScrollIndicator = true
        scrollHabitView.showsHorizontalScrollIndicator = false
        
        return scrollHabitView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "НАЗВАНИЕ"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor("#000000")
        nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return nameLabel
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Бегать по утрам, спать 8 часов и т.д."
        return nameTextField
    }()
    
    private lazy var collorLabel: UILabel = {
        let collorLabel = UILabel()
        collorLabel.text = "ЦВЕТ"
        collorLabel.translatesAutoresizingMaskIntoConstraints = false
        collorLabel.textColor = UIColor("#000000")
        collorLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return collorLabel
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = UIColor("#000000")
        timeLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return timeLabel
    }()
    
    private lazy var dateTextField: UITextField = {
        let dateTextField = UITextField()
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.inputView = dateTimePicker
        return dateTextField
    }()
    
    private lazy var dateTimePicker: UIDatePicker = {
        let dateTimePicker = UIDatePicker()
        dateTimePicker.datePickerMode = .time
     //   dateTimePicker.datePickerStyle = .automatic
        let LocaleID = Locale.preferredLanguages.first       // Локаль для смены языка для датапикера(при смене языка айфона)
        dateTimePicker.locale = Locale(identifier: LocaleID!)
        dateTimePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return dateTimePicker
    }()
    
    private lazy var safeButton = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(safeHabit))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Создать"
        view.backgroundColor = UIColor("#FFFFFF")
        navigationItem.rightBarButtonItem = safeButton
        self.navigationController?.navigationBar.topItem?.title = "Отменить"
        addSubviews()
        setupConstraints()
        setupConstraintsContent()
        getDateFromPicker()
    }
    
    @objc func safeHabit(_ sender: UIButton) {
        
    }
    
    @objc func dateChanged(_ sender: UIButton) {
        getDateFromPicker()
    }
    
   func getDateFromPicker() {
       let formatter = DateFormatter()
       formatter.dateFormat = "Каждый день в HH:mm"
       dateTextField.text = formatter.string(from: dateTimePicker.date)
    }
    
    private func addSubviews() {
        view.addSubview(scrollHabitView)
        
        scrollHabitView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(collorLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dateTextField)
        contentView.addSubview(dateTimePicker)
    
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollHabitView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollHabitView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollHabitView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollHabitView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollHabitView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollHabitView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollHabitView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollHabitView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollHabitView.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollHabitView.heightAnchor)
            
        ])
    }
    
    private func setupConstraintsContent() {
        
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            
            collorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 83),
            
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 153),
            
            dateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 178),
            
            dateTimePicker.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 178),
          //  dateTimePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dateTimePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
          //  dateTimePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
          //  dateTimePicker.heightAnchor.constraint(equalToConstant: 216),
        ])
            contentView.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
