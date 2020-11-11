
import UIKit

class FiqhQuiz3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "Which one of these is part of the 5 pillars of Islam?", answers: [
        Answer(text: "Hajj", correct: false),
        Answer(text: "Salah", correct: false),
        Answer(text: "Zakat", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Who are muslims allowed to marry?", answers: [
        Answer(text: "Only Muslims", correct: false),
        Answer(text: "Only Non-Muslims", correct: false),
        Answer(text: "People of Abrahamic faiths", correct: true),
        Answer(text: "Anyone", correct: false),
    ]))
        gameQ.append(Question(text: "How many wives are muslim men allowed?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "3", correct: false),
        Answer(text: "4", correct: true),
    ]))
        gameQ.append(Question(text: "How many times must we complete Hajj in our lifetime?", answers: [
        Answer(text: "Its not required", correct: false),
        Answer(text: "Atleast once", correct: true),
        Answer(text: "2 times", correct: false),
        Answer(text: "3 times", correct: false),
    ]))
        gameQ.append(Question(text: "What percentage of our savings should be given as zakaat each year?", answers: [
        Answer(text: "1%", correct: false),
        Answer(text: "2.5%", correct: true),
        Answer(text: "5%", correct: false),
        Answer(text: "10%", correct: false),
    ]))
        gameQ.append(Question(text: "Ummrah is compulsory?", answers: [
        Answer(text: "True", correct: false),
        Answer(text: "False", correct: true),
    ]))
        gameQ.append(Question(text: "Which type of person is exempt from fasting?", answers: [
        Answer(text: "A sick person", correct: false),
        Answer(text: "A travelling person", correct: false),
        Answer(text: "Women with nifas", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "What is the Holy Book in Islam called?", answers: [
        Answer(text: "Quran", correct: true),
        Answer(text: "Bible", correct: false),
        Answer(text: "Torah", correct: false),
        Answer(text: "There is no holy book", correct: false),
    ]))
        gameQ.append(Question(text: "Who can we go to if we have a question regarding Islam?", answers: [
        Answer(text: "Our Ayatollah", correct: false),
        Answer(text: "A Molana", correct: false),
        Answer(text: "Parents", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "What does the term 'Jihad' mean?", answers: [
        Answer(text: "Struggle", correct: true),
        Answer(text: "Holy War", correct: false),
        Answer(text: "Peace", correct: false),
        Answer(text: "Suffer", correct: false),
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
