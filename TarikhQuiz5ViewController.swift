import UIKit

class TarikhQuiz5ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "Where was Imam Ali born?", answers: [
        Answer(text: "In a Hospital", correct: false),
        Answer(text: "Inside the Ka'aba", correct: true),
        Answer(text: "In a house", correct: false),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "How are Prophet Muhammed and Imam Ali related?", answers: [
        Answer(text: "Cousins", correct: true),
        Answer(text: "Brothers", correct: false),
        Answer(text: "Father and Son", correct: false),
        Answer(text: "Step Brothers", correct: false),
    ]))
        gameQ.append(Question(text: "Which number Imam is Imam Hussain?", answers: [
        Answer(text: "1st", correct: false),
        Answer(text: "3rd", correct: true),
        Answer(text: "5th", correct: false),
        Answer(text: "12th", correct: false),
    ]))
        gameQ.append(Question(text: "How long did it take Allah to reveal the full Quran?", answers: [
        Answer(text: "10 years", correct: false),
        Answer(text: "12 years", correct: false),
        Answer(text: "23 years", correct: true),
        Answer(text: "1 year", correct: false),
    ]))
        gameQ.append(Question(text: "What does Prophet mean in Islam?", answers: [
        Answer(text: "Messenger of God", correct: true),
        Answer(text: "Beliver", correct: false),
        Answer(text: "Lover", correct: false),
        Answer(text: "Solider", correct: false),
    ]))
        gameQ.append(Question(text: "Who was the mother of Prophet Isa?", answers: [
        Answer(text: "Lady Fatima", correct: false),
        Answer(text: "Lady Maryam", correct: true),
        Answer(text: "Aisha", correct: false),
        Answer(text: "Asma", correct: false),
    ]))
        gameQ.append(Question(text: "Who was Prophet Isas father?", answers: [
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Imam Ali", correct: false),
        Answer(text: "Prophet Yunus", correct: false),
        Answer(text: "He had no biological father", correct: true),
    ]))
        gameQ.append(Question(text: "Despite the differences in opinion, should we still respect our Sunni brothers and sisters?", answers: [
        Answer(text: "Yes", correct: true),
        Answer(text: "No", correct: false),
        Answer(text: "Sometimes", correct: false),
        Answer(text: "Only if they respect us", correct: false),
    ]))
        gameQ.append(Question(text: "Which country has the largest Shia population?", answers: [
        Answer(text: "Iran", correct: true),
        Answer(text: "Iraq", correct: false),
        Answer(text: "Saudi Arabia", correct: false),
        Answer(text: "UK", correct: false),
    ]))
        gameQ.append(Question(text: "What does Tarikh mean?", answers: [
        Answer(text: "Islamic History", correct: true),
        Answer(text: "Islamic Law", correct: false),
        Answer(text: "Islamic Manners", correct: false),
        Answer(text: "None of the above", correct: false),
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
