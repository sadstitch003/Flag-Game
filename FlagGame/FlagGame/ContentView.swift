import SwiftUI

struct ContentView: View {
    @State var rand_num = Int.random(in: 0...9)
    @State var num_list = [Int]()
    @State var correct = 0
    @State var alertShown = false
    @State var result = ""
    
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    
    func buttonPressed(_ number: Int) {
        result = "Incorrect"
        if number == rand_num {
            correct += 1
            result = "Correct"
        }

        num_list.append(rand_num)
        if num_list.count < 10 {
            while num_list.contains(rand_num) {
                rand_num = Int.random(in: 0...9)
            }
        } else {
            result = "Game Over"
        }
    }
    
    func reset() {
        rand_num = Int.random(in: 0...9)
        num_list = [Int]()
        correct = 0
        result = ""
    }
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[rand_num])
                    .foregroundStyle(.black)
            }
        }
        
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        buttonPressed(number)
                        alertShown = true
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(Text(result), isPresented: $alertShown){
                        if result != "Game Over" {
                            Button("OK", role: .cancel) {}
                        } else {
                            Button("Score: \(correct * 10)") {reset()}
                        }
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        buttonPressed(number)
                        alertShown = true
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(Text(result), isPresented: $alertShown){
                        if result != "Game Over" {
                            Button("OK", role: .cancel) {}
                        } else {
                            Button("Score: \(correct * 10)") {reset()}
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
