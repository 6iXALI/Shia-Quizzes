

import UIKit

class FiqhQuiz1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "What is the meaning of Fiqh?", answers: [
        Answer(text: "Islamic History", correct: false),
        Answer(text: "Islamic Law", correct: true),
        Answer(text: "Islamic Manners and Morality", correct: false),
        Answer(text: "Sharia Law", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Mustahab' mean?", answers: [
        Answer(text: "Recommended", correct: true),
        Answer(text: "Obligartory", correct: false),
        Answer(text: "True", correct: false),
        Answer(text: "Not true", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Fard' mean?", answers: [
        Answer(text: "Recommended", correct: false),
        Answer(text: "Obligartory", correct: true),
        Answer(text: "True", correct: false),
        Answer(text: "Not true", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Mubah' mean?", answers: [
        Answer(text: "True", correct: false),
        Answer(text: "Thank You", correct: false),
        Answer(text: "Permitted", correct: true),
        Answer(text: "Recommended", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Makrooh' mean?", answers: [
        Answer(text: "Liked", correct: false),
        Answer(text: "Disliked", correct: true),
        Answer(text: "True", correct: false),
        Answer(text: "Not true", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Haraam' mean?", answers: [
        Answer(text: "Liked", correct: false),
        Answer(text: "Disliked", correct: false),
        Answer(text: "Allowed", correct: false),
        Answer(text: "Forbidden", correct: true),
    ]))
        gameQ.append(Question(text: "Which one of these are Fard?", answers: [
        Answer(text: "Fasting", correct: false),
        Answer(text: "Prayer", correct: false),
        Answer(text: "Charity", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Which one of these is an example of tawbah?", answers: [
        Answer(text: "Not feeling guilty", correct: false),
        Answer(text: "Repeating the act", correct: false),
        Answer(text: "Feeling guilty", correct: true),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "When water is not available, how should we perform wudu?", answers: [
        Answer(text: "No need to do wudu", correct: false),
        Answer(text: "Tayammum", correct: true),
        Answer(text: "With another liquid", correct: false),
        Answer(text: "Just do the niyaat", correct: false),
    ]))
        gameQ.append(Question(text: "When the Holy Prophet woke up, what did he do every morning?", answers: [
        Answer(text: "Pray", correct: false),
        Answer(text: "Wudu", correct: false),
        Answer(text: "Shower", correct: false),
        Answer(text: "Brush Teeth", correct: true),
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
