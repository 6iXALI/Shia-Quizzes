

import UIKit

class AkhlaqQuiz1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameQ = [Question]()
    
    var currentQ: Question?

    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQ()
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
    
    private func setupQ() {
        gameQ.append(Question(text: "What is the meaning of Akhlaq?", answers: [
        Answer(text: "Islamic History", correct: false),
        Answer(text: "Islamic Law", correct: false),
        Answer(text: "Islamic Manners and Morality", correct: true),
        Answer(text: "Sharia Law", correct: false),
    ]))
        
        gameQ.append(Question(text: "What is the correct greeting in Islam?", answers: [
        Answer(text: "As-Salam-u-Alaikum", correct: true),
        Answer(text: "Va-alaikum As-salaam", correct: false),
        Answer(text: "Hello", correct: false),
        Answer(text: "Bonjour", correct: false),
    ]))
        gameQ.append(Question(text: "How do we respond to a greeting in Islam?", answers: [
        Answer(text: "As-Salam-u-Alaikum", correct: false),
        Answer(text: "Va-alaikum As-salaam", correct: true),
        Answer(text: "Bye", correct: false),
        Answer(text: "See you later", correct: false),
    ]))
        gameQ.append(Question(text: "What do we say before eating?", answers: [
        Answer(text: "Nothing", correct: false),
        Answer(text: "Thank You", correct: false),
        Answer(text: "Bismillahir Rahman Nir Rahim", correct: true),
        Answer(text: "Grace", correct: false),
    ]))
        gameQ.append(Question(text: "Which of these foods are we allowed to eat?", answers: [
        Answer(text: "Halal Meat", correct: true),
        Answer(text: "Alcohol ", correct: false),
        Answer(text: "Pork", correct: false),
        Answer(text: "Gelatine", correct: false),
    ]))
        gameQ.append(Question(text: "As Muslims, we should wear...", answers: [
        Answer(text: "Torn clothes, so we dont look rich", correct: false),
        Answer(text: "Clean and respectful clothing", correct: true),
        Answer(text: "In fashion clothes", correct: false),
        Answer(text: "Revealing Clothes", correct: false),
    ]))
        gameQ.append(Question(text: "Which of the following did the Holy Prophet (PBUH) say about sabr?", answers: [
        Answer(text: "Have sabr in times of hardship", correct: false),
        Answer(text: "Have sabr in times of obedience", correct: false),
        Answer(text: "Have sabr in times of disobedience", correct: false),
        Answer(text: "All of the above", correct: true),
    ]))
        gameQ.append(Question(text: "Which type of Backbiting is allowed?", answers: [
        Answer(text: "Gheebat", correct: false),
        Answer(text: "Tohmat", correct: false),
        Answer(text: "No backbiting is allowed at all", correct: true),
        Answer(text: "All forms of backbiting is allowed", correct: false),
    ]))
        gameQ.append(Question(text: "Which of these should we act towards our parents with?", answers: [
        Answer(text: "Never insult or shout at them", correct: true),
        Answer(text: "Annoy them", correct: false),
        Answer(text: "Sit while they stand", correct: false),
        Answer(text: "Speak when they are speaking", correct: false),
    ]))
        gameQ.append(Question(text: "Teasing other people only proves...", answers: [
        Answer(text: "You have no will power", correct: false),
        Answer(text: "You are not following the teachings of the Ahlulbayt", correct: false),
        Answer(text: "You have no will power", correct: false),
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

