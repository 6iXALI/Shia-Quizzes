import UIKit

class TarikhQuiz1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        gameQ.append(Question(text: "How many Imams are there in Islam?", answers: [
        Answer(text: "14", correct: false),
        Answer(text: "8", correct: false),
        Answer(text: "12", correct: true),
        Answer(text: "124,000", correct: false),
    ]))
        gameQ.append(Question(text: "How many Prophets are there in Islam?", answers: [
        Answer(text: "12", correct: false),
        Answer(text: "124,000", correct: true),
        Answer(text: "160,000", correct: false),
        Answer(text: "14", correct: false),
    ]))
        gameQ.append(Question(text: "Who was the last Prophet in Islam?", answers: [
        Answer(text: "Prophet Muhammed (PBUH)", correct: true),
        Answer(text: "Prophet Musa (PBUH)", correct: false),
        Answer(text: "Prophet Yusuf (PBUH)", correct: false),
        Answer(text: "Prophet Isa (PBUH)", correct: false),
    ]))
        gameQ.append(Question(text: "Who was the first Imam?", answers: [
        Answer(text: "Imam Hussain (as)", correct: false),
        Answer(text: "Imam Hassan (as)", correct: false),
        Answer(text: "Imam Ali (as)", correct: true),
        Answer(text: "Imam Jaafar as Sadiq (as)", correct: false),
    ]))
        gameQ.append(Question(text: "What Islamic month was Prophet Muhammed (PBUH) born?", answers: [
        Answer(text: "Muharram", correct: false),
        Answer(text: "Safar", correct: false),
        Answer(text: "Rajab", correct: false),
        Answer(text: "Rabi al-awwal", correct: true),
    ]))
        gameQ.append(Question(text: "What Islamic month did Prophet Muhammad (PBUH) die?", answers: [
        Answer(text: "Safar", correct: true),
        Answer(text: "Shaaban", correct: false),
        Answer(text: "Rabi al-awwal", correct: false),
        Answer(text: "Ramadan", correct: false),
    ]))
        gameQ.append(Question(text: "What is so special about the day of Ghadeer?", answers: [
        Answer(text: "Revelation of the Quran", correct: false),
        Answer(text: "Ending of the Battle of Karbala", correct: false),
        Answer(text: "Birthday of the Holy Prophet", correct: false),
        Answer(text: "Annoucement of the Holy Prophets succesor", correct: true),
    ]))
        gameQ.append(Question(text: "Who was the Holy Prophets successor?", answers: [
        Answer(text: "Imam Ali (as)", correct: true),
        Answer(text: "Umar", correct: false),
        Answer(text: "Abu Bakr", correct: false),
        Answer(text: "Usmaan", correct: false),
    ]))
        gameQ.append(Question(text: "In which city was the Holy Prophet born?", answers: [
        Answer(text: "Karbala", correct: false),
        Answer(text: "Medina", correct: false),
        Answer(text: "Mecca", correct: true),
        Answer(text: "Najaf", correct: false),
    ]))
        gameQ.append(Question(text: "Which city was the Holy Prophet buried?", answers: [
        Answer(text: "Mecca", correct: false),
        Answer(text: "Karbala", correct: false),
        Answer(text: "Najaf", correct: false),
        Answer(text: "Medina", correct: true),
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
