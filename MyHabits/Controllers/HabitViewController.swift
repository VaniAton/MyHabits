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
        nameTextField.font = UIFont.systemFont(ofSize: 16)
        nameTextField.autocorrectionType = UITextAutocorrectionType.no
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        nameTextField.delegate = self

        return nameTextField
    }()
    
    private lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "ЦВЕТ"
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.textColor = UIColor("#000000")
        colorLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return colorLabel
    }()
    
    private lazy var colorView: UIView = {
        let colorView = UIView()
        colorView.layer.cornerRadius = 15
        colorView.frame = CGRect(x: 16, y: 108, width: 30, height: 30)
        colorView.backgroundColor = .placeholderText
        
        let tapForChangeColor = UITapGestureRecognizer(
            target: self,
            action: #selector(tapChangeColor)
        )
        view.addGestureRecognizer(tapForChangeColor)
        return colorView
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
        dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        dateTimePicker.datePickerMode = .time
        dateTimePicker.preferredDatePickerStyle = .wheels
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
        navigationController?.navigationBar.prefersLargeTitles = false
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
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollHabitView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollHabitView.contentInset.bottom = 0.0
    }
    @objc func tapChangeColor() {
        presentColorPicker()
    }
    
    func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Цвет"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        if #available(iOS 16.0, *) {
            colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        } else {
        }
        self.present(colorPicker, animated: true)
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
        contentView.addSubview(colorLabel)
        contentView.addSubview(colorView)
        contentView.addSubview(timeLabel)
        contentView.addSubview(dateTextField)
        contentView.addSubview(dateTimePicker)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
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
            
        ])
    }
    
    private func setupConstraintsContent() {
        
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            
            colorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            colorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 83),
            
            colorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            colorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 108),
            
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 153),
            
            dateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 178),
            
            dateTimePicker.topAnchor.constraint(equalTo: dateTextField.topAnchor, constant: 22),
            dateTimePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateTimePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
            contentView.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

extension HabitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension HabitViewController:UIColorPickerViewControllerDelegate {
    
}
