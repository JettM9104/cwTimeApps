import SwiftUI
import AVFoundation

// MARK: - Data Models
struct DictionaryEntry: Identifiable {
    let id = UUID()
    let category: String
    let abbreviation: String
    let definition: String
}

// MARK: - Dictionary (with categories)
let allEntries: [DictionaryEntry] = [
    // Letters
    .init(category: "Letters", abbreviation: "A", definition: ".-"),
    .init(category: "Letters", abbreviation: "B", definition: "-..."),
    .init(category: "Letters", abbreviation: "C", definition: "-.-."),
    .init(category: "Letters", abbreviation: "D", definition: "-.."),
    .init(category: "Letters", abbreviation: "E", definition: "."),
    .init(category: "Letters", abbreviation: "F", definition: "..-."),
    .init(category: "Letters", abbreviation: "G", definition: "--."),
    .init(category: "Letters", abbreviation: "H", definition: "...."),
    .init(category: "Letters", abbreviation: "I", definition: ".."),
    .init(category: "Letters", abbreviation: "J", definition: ".---"),
    .init(category: "Letters", abbreviation: "K", definition: "-.-"),
    .init(category: "Letters", abbreviation: "L", definition: ".-.."),
    .init(category: "Letters", abbreviation: "M", definition: "--"),
    .init(category: "Letters", abbreviation: "N", definition: "-."),
    .init(category: "Letters", abbreviation: "O", definition: "---"),
    .init(category: "Letters", abbreviation: "P", definition: ".--."),
    .init(category: "Letters", abbreviation: "Q", definition: "--.-"),
    .init(category: "Letters", abbreviation: "R", definition: ".-."),
    .init(category: "Letters", abbreviation: "S", definition: "..."),
    .init(category: "Letters", abbreviation: "T", definition: "-"),
    .init(category: "Letters", abbreviation: "U", definition: "..-"),
    .init(category: "Letters", abbreviation: "V", definition: "...-"),
    .init(category: "Letters", abbreviation: "W", definition: ".--"),
    .init(category: "Letters", abbreviation: "X", definition: "-..-"),
    .init(category: "Letters", abbreviation: "Y", definition: "-.--"),
    .init(category: "Letters", abbreviation: "Z", definition: "--.."),
    
    // Numbers
    .init(category: "Numbers", abbreviation: "0", definition: "-----"),
    .init(category: "Numbers", abbreviation: "1", definition: ".----"),
    .init(category: "Numbers", abbreviation: "2", definition: "..---"),
    .init(category: "Numbers", abbreviation: "3", definition: "...--"),
    .init(category: "Numbers", abbreviation: "4", definition: "....-"),
    .init(category: "Numbers", abbreviation: "5", definition: "....."),
    .init(category: "Numbers", abbreviation: "6", definition: "-...."),
    .init(category: "Numbers", abbreviation: "7", definition: "--..."),
    .init(category: "Numbers", abbreviation: "8", definition: "---.."),
    .init(category: "Numbers", abbreviation: "9", definition: "----."),
    
    // Punctuation
    .init(category: "Punctuation", abbreviation: ".", definition: ".-.-.-"),
    .init(category: "Punctuation", abbreviation: ",", definition: "--..--"),
    .init(category: "Punctuation", abbreviation: "?", definition: "..--.."),
    .init(category: "Punctuation", abbreviation: "'", definition: ".----."),
    .init(category: "Punctuation", abbreviation: "!", definition: "-.-.--"),
    .init(category: "Punctuation", abbreviation: "/", definition: "-..-."),
    .init(category: "Punctuation", abbreviation: "(", definition: "-.--."),
    .init(category: "Punctuation", abbreviation: ")", definition: "-.--.-"),
    .init(category: "Punctuation", abbreviation: "&", definition: ".-..."),
    .init(category: "Punctuation", abbreviation: ":", definition: "---..."),
    .init(category: "Punctuation", abbreviation: ";", definition: "-.-.-."),
    .init(category: "Punctuation", abbreviation: "=", definition: "-...-"),
    .init(category: "Punctuation", abbreviation: "+", definition: ".-.-."),
    .init(category: "Punctuation", abbreviation: "-", definition: "-....-"),
    .init(category: "Punctuation", abbreviation: "_", definition: "..--.-"),
    .init(category: "Punctuation", abbreviation: "\"", definition: ".-..-."),
    .init(category: "Punctuation", abbreviation: "$", definition: "...-..-"),
    .init(category: "Punctuation", abbreviation: "@", definition: ".--.-."),
    
    // Ham Radio Common Abbreviations
    .init(category: "Ham Radio Common", abbreviation: "<AA>", definition: "New line"),
    .init(category: "Ham Radio Common", abbreviation: "<AR>", definition: "End of message"),
    .init(category: "Ham Radio Common", abbreviation: "<AS>", definition: "Wait"),
    .init(category: "Ham Radio Common", abbreviation: "<BK>", definition: "Break"),
    .init(category: "Ham Radio Common", abbreviation: "<BT>", definition: "New paragraph"),
    .init(category: "Ham Radio Common", abbreviation: "<CL>", definition: "Going off the air (clear)"),
    .init(category: "Ham Radio Common", abbreviation: "<CT>", definition: "Start copying"),
    .init(category: "Ham Radio Common", abbreviation: "<DO>", definition: "Change to Wabun code"),
    .init(category: "Ham Radio Common", abbreviation: "<KA>", definition: "Starting signal"),
    .init(category: "Ham Radio Common", abbreviation: "<KN>", definition: "Invite specific station to transmit"),
    .init(category: "Ham Radio Common", abbreviation: "<SK>", definition: "End of transmission"),
    .init(category: "Ham Radio Common", abbreviation: "<SN>", definition: "Understood"),
    .init(category: "Ham Radio Common", abbreviation: "<SOS>", definition: "Distress message"),
    
    // Common Abbreviations
    .init(category: "Common Abbreviations", abbreviation: "73", definition: "Best regards"),
    .init(category: "Common Abbreviations", abbreviation: "88", definition: "Love and kisses"),
    .init(category: "Common Abbreviations", abbreviation: "BCNU", definition: "Be seeing you"),
    .init(category: "Common Abbreviations", abbreviation: "CQ", definition: "Call to all stations"),
    .init(category: "Common Abbreviations", abbreviation: "CS", definition: "Call sign (request)"),
    .init(category: "Common Abbreviations", abbreviation: "CUL", definition: "See you later"),
    .init(category: "Common Abbreviations", abbreviation: "DE", definition: "From (or 'this is')"),
    .init(category: "Common Abbreviations", abbreviation: "ES", definition: "And"),
    .init(category: "Common Abbreviations", abbreviation: "K", definition: "Over (invitation to transmit)"),
    .init(category: "Common Abbreviations", abbreviation: "OM", definition: "Old man"),
    .init(category: "Common Abbreviations", abbreviation: "R", definition: "Received / Roger"),
    .init(category: "Common Abbreviations", abbreviation: "RST", definition: "Signal report (599)"),
    .init(category: "Common Abbreviations", abbreviation: "UR", definition: "You are"),
    
    // Q Codes - Statements
    .init(category: "Q Codes (Statements)", abbreviation: "QRL", definition: "The frequency is in use"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRM", definition: "Your transmission is being interfered with"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRN", definition: "I am troubled by static"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRO", definition: "Increase transmitter power"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRP", definition: "Decrease transmitter power"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRQ", definition: "Send faster"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRS", definition: "Send more slowly"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRT", definition: "Stop sending"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRU", definition: "I have nothing for you"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRV", definition: "I am ready to copy"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRX", definition: "Wait"),
    .init(category: "Q Codes (Statements)", abbreviation: "QRZ", definition: "You are being called by..."),
    .init(category: "Q Codes (Statements)", abbreviation: "QSB", definition: "Your signals are fading"),
    .init(category: "Q Codes (Statements)", abbreviation: "QSL", definition: "I acknowledge receipt"),
    .init(category: "Q Codes (Statements)", abbreviation: "QTH", definition: "My location is..."),
    
    // Q Codes - Questions
    .init(category: "Q Codes (Questions)", abbreviation: "QRL?", definition: "Is the frequency in use?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRM?", definition: "Is my transmission being interfered with?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRN?", definition: "Are you troubled by static?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRO?", definition: "Shall I increase transmitter power?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRP?", definition: "Shall I decrease transmitter power?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRQ?", definition: "Shall I send faster?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRS?", definition: "Shall I send more slowly?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRT?", definition: "Shall I stop sending?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRU?", definition: "Have you anything for me?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRV?", definition: "Are you ready to copy?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRX?", definition: "Should I wait?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QRZ?", definition: "Who is calling me?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QSB?", definition: "Are my signals fading?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QSL?", definition: "Do you acknowledge?"),
    .init(category: "Q Codes (Questions)", abbreviation: "QTH?", definition: "What is your location?")
]

// Compute a sorted array of unique category names
private var categories: [String] {
    Array(Set(allEntries.map { $0.category }))
        .sorted(by: { $0 < $1 })
}

// MARK: - Main View
struct ContentView: View {
    @State private var wpm: Double = 20
    @State private var frequency: Double = 500
    @State private var showingSettings = false
    @State private var showingDictionary = false

    @State private var isDitPressed = false
    @State private var isDahPressed = false

    @State private var morseBuffer = ""
    @State private var decodedText = ""
    @State private var lastInputTime: Date = Date()
 
    @State private var elementQueue: [MorseElement] = []
    @State private var keyingWorkItem: DispatchWorkItem? = nil
    @State private var lastElement: MorseElement = .dah

    @State private var gapTimer: Timer?

    private var audioEngine = AVAudioEngine()
    private var tonePlayer = AVTonePlayer()

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    VStack(spacing: 12) {
                        Text("Morse: \(morseBuffer)").font(.title2)
                        Text("Text: \(decodedText)").font(.headline)
                        HStack(spacing: 20) {
                            Button {
                                morseBuffer = ""
                                decodedText = ""
                            } label: {
                                Image(systemName: "trash").font(.title)
                            }
                            .accessibilityLabel("Clear")
                            Spacer()
                            Button {
                                showingDictionary = true
                            } label: {
                                Image(systemName: "character.book.closed").font(.title)
                            }
                            .accessibilityLabel("Dictionary")
                            Button {
                                showingSettings = true
                            } label: {
                                Image(systemName: "gearshape").font(.title)
                            }
                            .accessibilityLabel("Settings")
                            .padding(.trailing)
                        }
                    }
                    .frame(height: geo.size.height / 2)

                    HStack(spacing: 0) {
                        paddleView(isPressed: $isDitPressed, element: .dit, color: .blue)
                        paddleView(isPressed: $isDahPressed, element: .dah, color: .green)
                    }
                    .frame(height: geo.size.height / 2)
                }
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    setupAudio()
                    startGapTimer()
                }
                .onDisappear {
                    stopAudio()
                    stopGapTimer()
                }
                .sheet(isPresented: $showingSettings) {
                    SettingsView(wpm: $wpm, frequency: $frequency)
                }
                .sheet(isPresented: $showingDictionary) {
                    DictionaryRootView()
                }
            }
            .navigationBarHidden(true)
        }
    }

    private func paddleView(isPressed: Binding<Bool>, element: MorseElement, color: Color) -> some View {
        Rectangle()
            .fill(isPressed.wrappedValue ? color : .white)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        if !isPressed.wrappedValue {
                            isPressed.wrappedValue = true
                            enqueue(element)
                            paddleChanged()
                        }
                    }
                    .onEnded { _ in
                        isPressed.wrappedValue = false
                        paddleChanged()
                    }
            )
            .accessibilityLabel(element == .dit ? "Dit paddle" : "Dah paddle")
            .accessibilityAddTraits(.isButton)
    }

    private func enqueue(_ element: MorseElement) {
        elementQueue.append(element)
        lastInputTime = Date()
    }

    private func paddleChanged() {
        if (isDitPressed || isDahPressed) && keyingWorkItem == nil {
            lastElement = .dah
            scheduleNext()
        }
    }

    private func scheduleNext() {
        var workItem: DispatchWorkItem!
        workItem = DispatchWorkItem {
            guard self.keyingWorkItem === workItem else { return }

            let next: MorseElement
            if !self.elementQueue.isEmpty {
                next = self.elementQueue.removeFirst()
            } else if self.isDitPressed && self.isDahPressed {
                next = (self.lastElement == .dit ? .dah : .dit)
            } else if self.isDitPressed {
                next = .dit
            } else if self.isDahPressed {
                next = .dah
            } else {
                self.keyingWorkItem = nil
                return
            }

            self.lastElement = next
            let unit = self.unitDuration()
            let duration = unit * (next == .dit ? 1 : 3)

            self.tonePlayer.play(frequency: self.frequency, duration: duration)

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.morseBuffer += (next == .dit ? "." : "-")
                self.lastInputTime = Date()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + duration + unit) {
                guard self.keyingWorkItem === workItem else { return }
                self.scheduleNext()
            }
        }

        keyingWorkItem = workItem
        DispatchQueue.main.async(execute: workItem)
    }

    private func unitDuration() -> TimeInterval {
        1.2 / wpm
    }

    private func startGapTimer() {
        gapTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            let gap = Date().timeIntervalSince(self.lastInputTime)
            let unit = self.unitDuration()

            if gap >= unit * 20 {
                self.finishCharacter()
                if !self.decodedText.hasSuffix("<|>") {
                    self.decodedText += "<|>"
                }
                self.lastInputTime = Date.distantFuture
            } else if gap >= unit * 12 {
                self.finishCharacter()
                if !self.decodedText.hasSuffix(" ") {
                    self.decodedText += " "
                }
            } else if gap >= unit * 4 {
                self.finishCharacter()
            }
        }
    }

    private func stopGapTimer() {
        gapTimer?.invalidate()
        gapTimer = nil
    }

    private func finishCharacter() {
        guard !morseBuffer.isEmpty else { return }
        let char = morseToChar[morseBuffer] ?? "Ø"
        decodedText += char
        morseBuffer = ""
    }

    private func setupAudio() {
        tonePlayer.attach(to: audioEngine)
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine failed to start: \(error)")
        }
    }

    private func stopAudio() {
        audioEngine.stop()
        tonePlayer.detach(from: audioEngine)
    }
}

// MARK: - Dictionary Root View
struct DictionaryRootView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: DictionaryCategoryView(category: category)) {
                        Text(category)
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Dictionary", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Dictionary Category View
struct DictionaryCategoryView: View {
    let category: String

    // Filter entries that belong to this category, then sort by abbreviation
    private var entriesInCategory: [DictionaryEntry] {
        allEntries
            .filter { $0.category == category }
            .sorted(by: { $0.abbreviation < $1.abbreviation })
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(entriesInCategory) { entry in
                    // Each entry becomes a “card” with centered content:
                    VStack(spacing: 4) {
                        Text(entry.abbreviation)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)

                        Text(entry.definition)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    }
                    .frame(maxWidth: .infinity)            // fill horizontally
                    .frame(height: 80, alignment: .center) // fixed height, content centered vertically
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
        .navigationBarTitle(category, displayMode: .inline)
    }
}



// MARK: - Settings View (unchanged)
struct SettingsView: View {
    @Binding var wpm: Double
    @Binding var frequency: Double
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Speed (WPM)")) {
                    Slider(value: $wpm, in: 5...45, step: 1)
                    Text("\(Int(wpm)) WPM")
                }
                Section(header: Text("Frequency (Hz)")) {
                    Slider(value: $frequency, in: 200...1000, step: 10)
                    Text("\(Int(frequency)) Hz")
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Morse Code Map (unchanged)
enum MorseElement { case dit, dah }

let morseToChar: [String: String] = [
    // Letters
    ".-": "A", "-...": "B", "-.-.": "C", "-..": "D",
    ".": "E", "..-.": "F", "--.": "G", "....": "H",
    "..": "I", ".---": "J", "-.-": "K", ".-..": "L",
    "--": "M", "-.": "N", "---": "O", ".--.": "P",
    "--.-": "Q", ".-.": "R", "...": "S", "-": "T",
    "..-": "U", "...-": "V", ".--": "W", "-..-": "X",
    "-.--": "Y", "--..": "Z",

    // Numbers
    "-----": "0", ".----": "1", "..---": "2", "...--": "3",
    "....-": "4", ".....": "5", "-....": "6", "--...": "7",
    "---..": "8", "----.": "9",

    // Punctuation
    ".-.-.-": ".", "--..--": ",", "..--..": "?", ".----.": "'",
    "-.-.--": "!", "-..-.": "/", "-.--.": "(", "-.--.-": ")",
    ".-...": "&", "---...": ":", "-.-.-.": ";", "-...-": "=",
    ".-.-.": "+", "-....-": "-", "..--.-": "_", ".-..-.": "\"",
    "...-..-": "$", ".--.-.": "@"
]

// MARK: - AVTonePlayer (unchanged)
class AVTonePlayer {
    private let mixer = AVAudioMixerNode()
    private var sourceNode: AVAudioSourceNode!
    private var frequency: Double = 0

    func attach(to engine: AVAudioEngine) {
        let sampleRate = engine.outputNode.outputFormat(forBus: 0).sampleRate
        var currentPhase: Double = 0
        let phaseIncrement = { (freq: Double) in 2 * .pi * freq / sampleRate }

        sourceNode = AVAudioSourceNode { [unowned self] _, _, frameCount, audioBufferList in
            let abl = UnsafeMutableAudioBufferListPointer(audioBufferList)
            for frame in 0..<Int(frameCount) {
                let sample = Float(sin(currentPhase))
                for buffer in abl {
                    buffer.mData?.assumingMemoryBound(to: Float.self)[frame] = sample
                }
                currentPhase += phaseIncrement(self.frequency)
                if currentPhase >= 2 * .pi { currentPhase -= 2 * .pi }
            }
            return noErr
        }

        engine.attach(sourceNode)
        engine.attach(mixer)
        engine.connect(sourceNode, to: mixer, format: nil)
        engine.connect(mixer, to: engine.mainMixerNode, format: nil)
        mixer.outputVolume = 0
    }

    func detach(from engine: AVAudioEngine) {
        engine.disconnectNodeOutput(sourceNode)
        engine.detach(sourceNode)
        engine.disconnectNodeOutput(mixer)
        engine.detach(mixer)
    }

    func play(frequency: Double, duration: TimeInterval) {
        self.frequency = frequency
        mixer.outputVolume = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.mixer.outputVolume = 0
        }
    }
}
