import UIKit


class MainView: UIView {

    var storyLabel = UILabel()
    
    lazy var choiceOneButton = naviButton(title: "choice 1")
    lazy var choiceTwoButton = naviButton(title: "choice 2")
    
    var wallpapers = UIImageView()
    
    var stack = UIStackView()
    
    init() {
        super.init(frame: CGRect())
        setConstraints()
        setViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func naviButton(title: String) -> UIButton {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setViews() {
        
        storyLabel.textColor = .white
        storyLabel.textAlignment = .center
        storyLabel.numberOfLines = 0
        storyLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        wallpapers.image = UIImage(named: "background")
        wallpapers.contentMode = .scaleToFill
        
        choiceOneButton.backgroundColor = UIColor(red: 215/255, green: 91/255, blue: 123/255, alpha: 1.0)
        choiceTwoButton.backgroundColor = UIColor(red: 104/255, green: 76/255, blue: 129/255, alpha: 1.0)
    }
    
    
    func setConstraints() {
        stack = UIStackView(subviews: [choiceOneButton, choiceTwoButton], axis: .vertical, spacing: 20, aligment: .fill, distribution: .fillEqually)
        
        Helper.tamicOff(views: [storyLabel, stack, wallpapers])
        Helper.addSubView(views: [wallpapers, storyLabel, stack], to: self)
        
        NSLayoutConstraint.activate([
            
            wallpapers.topAnchor.constraint(equalTo: topAnchor),
            wallpapers.bottomAnchor.constraint(equalTo: bottomAnchor),
            wallpapers.leadingAnchor.constraint(equalTo: leadingAnchor),
            wallpapers.rightAnchor.constraint(equalTo: rightAnchor),
            
            storyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            storyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -350),
            storyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            storyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            stack.topAnchor.constraint(equalTo: storyLabel.bottomAnchor, constant: 100),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        ])
    }
    
}
