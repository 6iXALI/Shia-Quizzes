
import UIKit

class FiqhQuiz4ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "If someone missed their prayer, what should they do?", answers: [
        Answer(text: "Forget about it", correct: false),
        Answer(text: "Pray that salah tomorrow", correct: false),
        Answer(text: "Pray that salah asap", correct: true),
        Answer(text: "Repent", correct: false),
    ]))
        gameQ.append(Question(text: "How many Gods are their in Islam?", answers: [
        Answer(text: "1", correct: true),
        Answer(text: "2", correct: false),
        Answer(text: "3", correct: false),
        Answer(text: "4", correct: false),
    ]))
        gameQ.append(Question(text: "How many eids do us Shia celebrate?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "3", correct: false),
        Answer(text: "4", correct: true),
    ]))
        gameQ.append(Question(text: "What is the Eid after Ramadan called?", answers: [
        Answer(text: "Eid al Fitr", correct: true),
        Answer(text: "Eid al Adha", correct: false),
        Answer(text: "Eid al Ghadeer", correct: false),
        Answer(text: "Eid al Mubahala", correct: false),
    ]))
        gameQ.append(Question(text: "What is the Eid after Hajj called?", answers: [
        Answer(text: "Eid al Fitr", correct: false),
        Answer(text: "Eid al Adha", correct: true),
        Answer(text: "Eid al Ghadeer", correct: false),
        Answer(text: "Eid al Mubahala", correct: false),
    ]))
        gameQ.append(Question(text: "Which month is Hajj completed in?", answers: [
        Answer(text: "Ramadan", correct: false),
        Answer(text: "Dhul Qadah", correct: false),
        Answer(text: "Shawwal", correct: false),
        Answer(text: "Dhul Hijjah", correct: true),
    ]))
        gameQ.append(Question(text: "During Hajj, who must shave off their hair?", answers: [
        Answer(text: "Everyone", correct: false),
        Answer(text: "Men", correct: true),
        Answer(text: "Women", correct: false),
        Answer(text: "Nobody", correct: false),
    ]))
        gameQ.append(Question(text: "How many times must muslims circle the Ka'ba during Hajj?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "5", correct: false),
        Answer(text: "7", correct: true),
    ]))
        gameQ.append(Question(text: "How many surahs are in the Holy Quran?", answers: [
        Answer(text: "122", correct: false),
        Answer(text: "58", correct: false),
        Answer(text: "114", correct: true),
        Answer(text: "124", correct: false),
    ]))
        gameQ.append(Question(text: "How many Juzz are in the Holy Quran?", answers: [
        Answer(text: "10", correct: false),
        Answer(text: "20", correct: false),
        Answer(text: "30", correct: true),
        Answer(text: "40", correct: false),
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
