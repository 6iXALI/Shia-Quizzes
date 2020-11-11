

import UIKit

class AkhlaqQuiz3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "What should we do before we go sleep?", answers: [
        Answer(text: "Wudu", correct: false),
        Answer(text: "Brush Teeth", correct: false),
        Answer(text: "Recite a surah", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        
        gameQ.append(Question(text: "Allah tells us to respect...", answers: [
        Answer(text: "Only Muslims", correct: false),
        Answer(text: "Only Non Muslims", correct: false),
        Answer(text: "Only Parents", correct: false),
        Answer(text: "Everyone", correct: true),
    ]))
        gameQ.append(Question(text: "What do Muslims say when intending to do something in the future?", answers: [
        Answer(text: "Inshaallah", correct: true),
        Answer(text: "Bismilah", correct: false),
        Answer(text: "Hopefully", correct: false),
        Answer(text: "Alhamdulilah", correct: false),
    ]))
        gameQ.append(Question(text: "What did the Holy Prophet say about cleanliness?", answers: [
        Answer(text: "Cleanliness has no part in Islam", correct: false),
        Answer(text: "Its ok to be clean", correct: false),
        Answer(text: "Cleanliness is half of our faith", correct: true),
        Answer(text: "He did not mention it", correct: false),
    ]))
        gameQ.append(Question(text: "What must we do before we pray?", answers: [
        Answer(text: "Wear a cap", correct: false),
        Answer(text: "Read Quran", correct: false),
        Answer(text: "Have fun", correct: false),
        Answer(text: "Wudu", correct: true),
    ]))
        gameQ.append(Question(text: "What should we do before eating?", answers: [
        Answer(text: "Thank Allah", correct: false),
        Answer(text: "Remember the poor", correct: false),
        Answer(text: "Say Bismilah", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Why should we visit someone when they are sick?", answers: [
        Answer(text: "Allah will reward us", correct: false),
        Answer(text: "Its considered a noble deed", correct: false),
        Answer(text: "Its a virtous deed", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "What does 'Tahara' mean?", answers: [
        Answer(text: "Impure", correct: false),
        Answer(text: "Pure", correct: false),
        Answer(text: "Free from filth", correct: true),
        Answer(text: "Spirtuality", correct: false),
    ]))
        gameQ.append(Question(text: "What are some characteristics of good muslims?", answers: [
        Answer(text: "Ignorance", correct: false),
        Answer(text: "Piety and Humility", correct: true),
        Answer(text: "Arrogance", correct: false),
        Answer(text: "Boastfull", correct: false),
        ]))
        gameQ.append(Question(text: "Why is eating Halal meat important?", answers: [
        Answer(text: "It is tasty", correct: false),
        Answer(text: "It is cleaner", correct: true),
        Answer(text: "It is cheaper", correct: false),
        Answer(text: "All of the above", correct: false),
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

