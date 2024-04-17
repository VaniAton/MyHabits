import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollTextInformation: UIScrollView = {
        let scrollTextInformation = UIScrollView()
        scrollTextInformation.translatesAutoresizingMaskIntoConstraints = false
        scrollTextInformation.showsHorizontalScrollIndicator = true
        scrollTextInformation.showsHorizontalScrollIndicator = false
        
        return scrollTextInformation
    }()
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelOfText: UILabel = {
        let labelOfText = UILabel()
        labelOfText.translatesAutoresizingMaskIntoConstraints = false
        labelOfText.text = "Привычка за 21 день"
        labelOfText.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        labelOfText.textColor = UIColor("#000000")
        labelOfText.highlightedTextColor = UIColor("#000000")
        
        return labelOfText
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor("#000000")
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = """
Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:

1. Провести 1 день без обращения
к старым привычкам, стараться вести себя так, как будто цель, загаданная
в перспективу, находится на расстоянии шага.
        
2. Выдержать 2 дня в прежнем состоянии самоконтроля.

3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,c
чем еще предстоит серьезно бороться.
    
4. Поздравить себя с прохождением первого серьезного порога в 21 день.
За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше
работать в сторону принятия положительных качеств.

5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого
негатива и двигается в нужном направлении с хорошей динамикой.

6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и
человек, оглянувшись назад, осознает себя полностью обновившимся.
"""
        
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor("#FFFFFF")
        title = "Информация"
        addSubviews()
        setupConstraints()
        setupConstraintsContent()
        navigationController?.navigationBar.prefersLargeTitles = false

    }
    
    private func addSubviews() {
        view.addSubview(scrollTextInformation)
        
        scrollTextInformation.addSubview(contentView)
        contentView.addSubview(labelOfText)
        contentView.addSubview(textView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollTextInformation.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollTextInformation.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollTextInformation.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollTextInformation.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollTextInformation.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollTextInformation.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollTextInformation.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollTextInformation.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollTextInformation.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollTextInformation.heightAnchor)
            
        ])
    }
    
    private func setupConstraintsContent() {
        
        NSLayoutConstraint.activate([
            
            labelOfText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelOfText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            labelOfText.heightAnchor.constraint(equalToConstant: 24),
            labelOfText.widthAnchor.constraint(equalToConstant: 218),
            labelOfText.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            textView.topAnchor.constraint(equalTo: labelOfText.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
            contentView.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
