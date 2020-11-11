
import UIKit

class AkhlaqQuiz4ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "If you are about to eat, who should you wait for?", answers: [
        Answer(text: "Siblings", correct: false),
        Answer(text: "Grandparents", correct: false),
        Answer(text: "Parents", correct: false),
        Answer(text: "Anyone you are eating with", correct: true),
    ]))
        
        gameQ.append(Question(text: "Muslims are not allowed to make fun of others?", answers: [
        Answer(text: "True", correct: true),
        Answer(text: "False", correct: false),
    ]))
        gameQ.append(Question(text: "What are the rights of our non-muslim neighbors?", answers: [
        Answer(text: "They have no rights", correct: false),
        Answer(text: "Treat them differently", correct: false),
        Answer(text: "Treat them the same way as muslim neighbors", correct: true),
        Answer(text: "Do not talk to them", correct: false),
    ]))
        gameQ.append(Question(text: "How should we act with our neighbors?", answers: [
        Answer(text: "Do not talk to them", correct: false),
        Answer(text: "Look after them", correct: true),
        Answer(text: "Annoy them", correct: false),
        Answer(text: "Boast infront of them", correct: false),
    ]))
        gameQ.append(Question(text: "How should muslims take care of themselves?", answers: [
        Answer(text: "Have a healthy diet", correct: false),
        Answer(text: "Excerise daily", correct: false),
        Answer(text: "Clean themselves regularly", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Joking around is only allowed if it...", answers: [
        Answer(text: "Makes fun of somebody", correct: false),
        Answer(text: "Offends anything", correct: false),
        Answer(text: "All jokes are allowed", correct: false),
        Answer(text: "Makes someone happy and joyful", correct: true),
    ]))
        gameQ.append(Question(text: "How should we treat guests in our house?", answers: [
        Answer(text: "Clean the house beforehand", correct: false),
        Answer(text: "Prepare food", correct: false),
        Answer(text: "Treat guests with respect", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Why should we give charity?", answers: [
        Answer(text: "So we have somthing to boast about", correct: false),
        Answer(text: "To help the poor and needy", correct: true),
        Answer(text: "We shouldnt give charity", correct: false),
        Answer(text: "We dont have to give charity", correct: false),
    ]))
        gameQ.append(Question(text: "Allah rewards us from charity acts?", answers: [
        Answer(text: "True", correct: true),
        Answer(text: "False", correct: false),
    ]))
        gameQ.append(Question(text: "Who are we allowed to give charity towards?", answers: [
        Answer(text: "The rich", correct: false),
        Answer(text: "Anybody who needs it", correct: true),
        Answer(text: "Only muslims", correct: false),
        Answer(text: "Only non-muslims", correct: false),
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

