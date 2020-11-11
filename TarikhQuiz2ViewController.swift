import UIKit

class TarikhQuiz2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "Who was the first ever prophet in Islam?", answers: [
        Answer(text: "Prophet Isa", correct: false),
        Answer(text: "Prophet Musa", correct: false),
        Answer(text: "Prophet Adam", correct: true),
        Answer(text: "Prophet Younis", correct: false),
    ]))
        gameQ.append(Question(text: "Which city is Imam Ali (as) buried?", answers: [
        Answer(text: "Karbala", correct: false),
        Answer(text: "Najaf", correct: true),
        Answer(text: "Medina", correct: false),
        Answer(text: "Mecca", correct: false),
    ]))
        gameQ.append(Question(text: "How many members are apart of the Holy Prophets household?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "5", correct: true),
        Answer(text: "9", correct: false),
    ]))
        gameQ.append(Question(text: "How many wives did the Holy Prophet have?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "7", correct: false),
        Answer(text: "11", correct: true),
    ]))
        gameQ.append(Question(text: "What was the first surah revealed in the quran?", answers: [
        Answer(text: "Al Ikhlaas", correct: false),
        Answer(text: "Al Nas", correct: false),
        Answer(text: "Al Falaq", correct: false),
        Answer(text: "Al Alaq", correct: true),
    ]))
        gameQ.append(Question(text: "Why do Shia Muslims mourn in Muharram?", answers: [
        Answer(text: "Martydom of Imam Hussain and family", correct: true),
        Answer(text: "Death of Holy Prophet", correct: false),
        Answer(text: "Death of Imam Ali", correct: false),
        Answer(text: "None of the above", correct: false),
    ]))
        gameQ.append(Question(text: "What day of Muharram did Imam Hussain die?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "28", correct: false),
        Answer(text: "10", correct: true),
        Answer(text: "5", correct: false),
    ]))
        gameQ.append(Question(text: "Who killed Imam Hussain?", answers: [
        Answer(text: "Abu Bakr", correct: true),
        Answer(text: "Umar", correct: false),
        Answer(text: "Yazid", correct: true),
        Answer(text: "Usmaan", correct: false),
    ]))
        gameQ.append(Question(text: "Where is Imam Hussain buried?", answers: [
        Answer(text: "Karbala", correct: true),
        Answer(text: "Medina", correct: false),
        Answer(text: "Mecca", correct: false),
        Answer(text: "Najaf", correct: false),
    ]))
        gameQ.append(Question(text: "Who is buried in close proximity to Imam Hussain?", answers: [
        Answer(text: "Imam Ali", correct: false),
        Answer(text: "Hazart Abbas", correct: true),
        Answer(text: "Imam Hassan", correct: false),
        Answer(text: "Abu Bakr", correct: false),
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
