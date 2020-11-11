import UIKit

class TarikhQuiz4ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "Why did the Muslims split up into sects?", answers: [
        Answer(text: "Disagreement about their leader", correct: true),
        Answer(text: "War", correct: false),
        Answer(text: "Corruption", correct: false),
        Answer(text: "Loss of faith", correct: false),
    ]))
        gameQ.append(Question(text: "Which Prophet was swallowed by a whale?", answers: [
        Answer(text: "Prophet Yunus", correct: true),
        Answer(text: "Prophet Muhammed", correct: false),
        Answer(text: "Prophet Ismail", correct: false),
        Answer(text: "Prophet Musa", correct: false),
    ]))
        gameQ.append(Question(text: "What was the relation between Prophet Ibrahim and Ismail?", answers: [
        Answer(text: "Brothers", correct: false),
        Answer(text: "Father and Son", correct: true),
        Answer(text: "Cousins", correct: false),
        Answer(text: "Step Brothers", correct: false),
    ]))
        gameQ.append(Question(text: "Who founded Islam?", answers: [
        Answer(text: "Imam Ali", correct: false),
        Answer(text: "Allah", correct: false),
        Answer(text: "Prophet Muhammed", correct: true),
        Answer(text: "Imam Hussain", correct: false),
    ]))
        gameQ.append(Question(text: "What was the name of Imam Alis wife?", answers: [
        Answer(text: "Lady Fatima", correct: false),
        Answer(text: "Lady Sakina", correct: false),
        Answer(text: "Lady Khadija", correct: false),
        Answer(text: "Lady Zainab", correct: true),
    ]))
        gameQ.append(Question(text: "Who was Lady Fatima angry with before she died?", answers: [
        Answer(text: "Umar", correct: false),
        Answer(text: "Abu Bakr", correct: true),
        Answer(text: "Yazid", correct: false),
        Answer(text: "Usmaan", correct: false),
    ]))
        gameQ.append(Question(text: "How did Imam Ali die?", answers: [
        Answer(text: "Poisoned", correct: false),
        Answer(text: "Assinated", correct: true),
        Answer(text: "Natural Causes", correct: false),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "How did the Holy Prophet die?", answers: [
        Answer(text: "Poisoned", correct: true),
        Answer(text: "Assinated", correct: false),
        Answer(text: "Natural Causes", correct: false),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "What is one of the Shia traditions of mourning for the Ahlulbayt and their companions?", answers: [
        Answer(text: "Matam", correct: false),
        Answer(text: "Zanjeer", correct: false),
        Answer(text: "Crying", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "What does companion mean?", answers: [
        Answer(text: "Lover", correct: false),
        Answer(text: "Enemy", correct: false),
        Answer(text: "Close Friend", correct: true),
        Answer(text: "Relative", correct: false),
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
