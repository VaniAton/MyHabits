import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollTextInformation: UIScrollView = {
        let scrollTextInformation = UIScrollView()
        scrollTextInformation.translatesAutoresizingMaskIntoConstraints = false
        scrollTextInformation.showsHorizontalScrollIndicator = true
        scrollTextInformation.backgroundColor = UIColor("#FFFFFF")
        
        return scrollTextInformation
    }()
    
    private lazy var contentInScrollView: UIView = {
        let contentInScrollView = UIView()
        
        contentInScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentInScrollView
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
        textView.font = UIFont(name: "SF Pro Text", size: 17)
        
        textView.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor("#FFFFFF")
        title = "Информация"
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(scrollTextInformation)
        
        scrollTextInformation.addSubview(labelOfText)
        scrollTextInformation.addSubview(textView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollTextInformation.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollTextInformation.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollTextInformation.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollTextInformation.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            labelOfText.leadingAnchor.constraint(equalTo: scrollTextInformation.leadingAnchor, constant: 16),
            labelOfText.topAnchor.constraint(equalTo: scrollTextInformation.topAnchor, constant: 22),
            labelOfText.heightAnchor.constraint(equalToConstant: 24),
            labelOfText.widthAnchor.constraint(equalToConstant: 218),
            
            textView.topAnchor.constraint(equalTo: scrollTextInformation.topAnchor, constant: 62),
            textView.leadingAnchor.constraint(equalTo: scrollTextInformation.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: scrollTextInformation.trailingAnchor, constant: -16)
        
        
        ])
        
    }

}