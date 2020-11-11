

import UIKit

class AkhlaqQuiz5ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "What should we share with the people around us?", answers: [
        Answer(text: "Money", correct: false),
        Answer(text: "Food", correct: false),
        Answer(text: "Knowledge", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        
        gameQ.append(Question(text: "What is the first thing we should say once our food is finished?", answers: [
        Answer(text: "Thank You", correct: false),
        Answer(text: "Nothing", correct: false),
        Answer(text: "Alhamduliah", correct: true),
        Answer(text: "Bismilah", correct: false),
    ]))
        gameQ.append(Question(text: "What is the best way to clean yourself?", answers: [
        Answer(text: "Any Liquid", correct: false),
        Answer(text: "Tissue", correct: false),
        Answer(text: "Water", correct: true),
        Answer(text: "Juice", correct: false),
    ]))
        gameQ.append(Question(text: "If you do not have money to give to charity, what can you do instead?", answers: [
        Answer(text: "Nothing", correct: false),
        Answer(text: "Pray for forgiveness", correct: false),
        Answer(text: "Smile", correct: true),
        Answer(text: "Steal from the rich", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Sunnah' mean?", answers: [
        Answer(text: "Acts that the Holy Prophet did", correct: true),
        Answer(text: "Things that we must follow", correct: false),
        Answer(text: "Things we should not follow", correct: false),
        Answer(text: "Acts that Imam Ali did", correct: false),
    ]))
        gameQ.append(Question(text: "When we are respectful, who becomes happy with us?", answers: [
        Answer(text: "Allah", correct: false),
        Answer(text: "Angels", correct: false),
        Answer(text: "Our Parents", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "What was one of the Holy Prophet's name, which meant truthful", answers: [
        Answer(text: "Allah", correct: false),
        Answer(text: "Muhammed", correct: false),
        Answer(text: "Al Amin", correct: true),
        Answer(text: "Abd", correct: false),
    ]))
        gameQ.append(Question(text: "The most virtuous charity is that you feed a...", answers: [
        Answer(text: "Rich Man", correct: false),
        Answer(text: "Hungry Person", correct: true),
        Answer(text: "Muslim", correct: false),
        Answer(text: "Non-Muslim", correct: false),
    ]))
        gameQ.append(Question(text: "What does 'Iyadah' mean?", answers: [
        Answer(text: "Helping the poor", correct: false),
        Answer(text: "Visiting friends", correct: false),
        Answer(text: "Visiting the sick", correct: true),
        Answer(text: "Visiting family", correct: false),
    ]))
        gameQ.append(Question(text: "Why is Akhlaq important?", answers: [
        Answer(text: "It teaches us Islamic Manners", correct: false),
        Answer(text: "It shows us how to be good muslims", correct: false),
        Answer(text: "Puts foward the teachings of the Ahlulbayt", correct: false),
        Answer(text: "All of the above", correct: true),
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
