import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()
    
    lazy var storyLabel = mainView.storyLabel
    lazy var choiceOneButton = mainView.choiceOneButton
    lazy var choiceTwoButton = mainView.choiceTwoButton
    
    var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        updateUI()
        pressedButton()
       
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.storyText()
        choiceOneButton.setTitle(storyBrain.firstAnswerText(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.secondAnswerText(), for: .normal)
    }

    func pressedButton() {
        choiceOneButton.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        choiceTwoButton.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
    }
    
    @objc func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        storyBrain.nextStory(userChoice: userAnswer)
        updateUI()
    }
}

