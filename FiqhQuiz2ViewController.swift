
import UIKit

class FiqhQuiz2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameQ = [Question]()
    
    var currentQ: Question?

    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configuireUI(question: gameQ.first!)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    private func configuireUI(question: Question) {
        label.text = question.text
        currentQ = question
        table.reloadData()
    }
    
    private func checkA(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
    
    private func setupQuestions() {
        gameQ.append(Question(text: "What is the first thing we will be questioned about on the Day of Judgement?", answers: [
        Answer(text: "Our fasts", correct: false),
        Answer(text: "Good deeds", correct: false),
        Answer(text: "Bad deeds", correct: false),
        Answer(text: "Prayers", correct: true),
    ]))
        gameQ.append(Question(text: "In which month do muslims have to fast 30 times?", answers: [
        Answer(text: "Ramadan", correct: true),
        Answer(text: "Muharram", correct: false),
        Answer(text: "Rajab", correct: false),
        Answer(text: "Shawwal", correct: false),
    ]))
        gameQ.append(Question(text: "Why do muslims fast in Ramadan", answers: [
        Answer(text: "To save money", correct: false),
        Answer(text: "To save food", correct: false),
        Answer(text: "It reminds us of the poor and needy", correct: true),
        Answer(text: "It gives us something to boast about", correct: false),
    ]))
        gameQ.append(Question(text: "When does our fast start", answers: [
        Answer(text: "Sunset", correct: false),
        Answer(text: "9:00am", correct: false),
        Answer(text: "9:00pm", correct: false),
        Answer(text: "Just before dawn", correct: true),
    ]))
        gameQ.append(Question(text: "When does our fast end?", answers: [
        Answer(text: "Sunset", correct: true),
        Answer(text: "9:00am", correct: false),
        Answer(text: "9:00pm", correct: false),
        Answer(text: "Just before dawn", correct: false),
    ]))
        gameQ.append(Question(text: "How many times do muslims pray a day?", answers: [
        Answer(text: "3", correct: false),
        Answer(text: "1", correct: false),
        Answer(text: "10", correct: false),
        Answer(text: "5", correct: true),
    ]))
        gameQ.append(Question(text: "Which direction do muslims pray towards?", answers: [
        Answer(text: "Any Direction", correct: false),
        Answer(text: "Qibla", correct: true),
        Answer(text: "To the local mosque", correct: false),
        Answer(text: "Towards the Holy Prophets Grave", correct: false),
    ]))
        gameQ.append(Question(text: "What is the name of the special water near the Ka'aba", answers: [
        Answer(text: "Zam Zam", correct: true),
        Answer(text: "Holy Water", correct: false),
        Answer(text: "Spring Water", correct: false),
        Answer(text: "Sparkling Water", correct: false),
    ]))
        gameQ.append(Question(text: "How many names does Allah have?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "50", correct: false),
        Answer(text: "99", correct: true),
        Answer(text: "100", correct: false),
    ]))
        gameQ.append(Question(text: "How many Pillars of Islam are there?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "10", correct: false),
        Answer(text: "5", correct: true),
    ]))
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQ?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQ?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQ else {
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        if checkA(answer: answer, question: question) {
            if let index = gameQ.firstIndex(where: { $0.text == question.text }) {
                if index < (gameQ.count - 1) {
                    let nextQ = gameQ[index+1]
                    print("\(nextQ.text)")
                    currentQ = nil
                    configuireUI(question: nextQ)
                    
                }
                else {
                    let alert = UIAlertController(title: "Well Done", message: "You Did It!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
        }
        else {
            let alert = UIAlertController(title: "Incorrect", message: "You Can Do It! Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

    
    



   
}

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
    
}

}
