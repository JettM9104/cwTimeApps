import SwiftUI
import AVFoundation

// MARK: - Data Models
struct DictionaryEntry: Identifiable {
    let id = UUID()
    let abbreviation: String
    let definition: String
}

// Sample abbreviation dictionary
let abbreviations: [DictionaryEntry] = [
    // Letters
    .init(abbreviation: "A", definition: ".-"),
    .init(abbreviation: "B", definition: "-..."),
    .init(abbreviation: "C", definition: "-.-."),
    .init(abbreviation: "D", definition: "-.."),
    .init(abbreviation: "E", definition: "."),
    .init(abbreviation: "F", definition: "..-."),
    .init(abbreviation: "G", definition: "--."),
    .init(abbreviation: "H", definition: "...."),
    .init(abbreviation: "I", definition: ".."),
    .init(abbreviation: "J", definition: ".---"),
    .init(abbreviation: "K", definition: "-.-"),
    .init(abbreviation: "L", definition: ".-.."),
    .init(abbreviation: "M", definition: "--"),
    .init(abbreviation: "N", definition: "-."),
    .init(abbreviation: "O", definition: "---"),
    .init(abbreviation: "P", definition: ".--."),
    .init(abbreviation: "Q", definition: "--.-"),
    .init(abbreviation: "R", definition: ".-."),
    .init(abbreviation: "S", definition: "..."),
    .init(abbreviation: "T", definition: "-"),
    .init(abbreviation: "U", definition: "..-"),
    .init(abbreviation: "V", definition: "...-"),
    .init(abbreviation: "W", definition: ".--"),
    .init(abbreviation: "X", definition: "-..-"),
    .init(abbreviation: "Y", definition: "-.--"),
    .init(abbreviation: "Z", definition: "--.."),

    // Numbers
    .init(abbreviation: "0", definition: "-----"),
    .init(abbreviation: "1", definition: ".----"),
    .init(abbreviation: "2", definition: "..---"),
    .init(abbreviation: "3", definition: "...--"),
    .init(abbreviation: "4", definition: "....-"),
    .init(abbreviation: "5", definition: "....."),
    .init(abbreviation: "6", definition: "-...."),
    .init(abbreviation: "7", definition: "--..."),
    .init(abbreviation: "8", definition: "---.."),
    .init(abbreviation: "9", definition: "----."),

    // Punctuation
    .init(abbreviation: ".", definition: ".-.-.-"),
    .init(abbreviation: ",", definition: "--..--"),
    .init(abbreviation: "?", definition: "..--.."),
    .init(abbreviation: "'", definition: ".----."),
    .init(abbreviation: "!", definition: "-.-.--"),
    .init(abbreviation: "/", definition: "-..-."),
    .init(abbreviation: "(", definition: "-.--."),
    .init(abbreviation: ")", definition: "-.--.-"),
    .init(abbreviation: "&", definition: ".-..."),
    .init(abbreviation: ":", definition: "---..."),
    .init(abbreviation: ";", definition: "-.-.-."),
    .init(abbreviation: "=", definition: "-...-"),
    .init(abbreviation: "+", definition: ".-.-."),
    .init(abbreviation: "-", definition: "-....-"),
    .init(abbreviation: "_", definition: "..--.-"),
    .init(abbreviation: "\"", definition: ".-..-."),
    .init(abbreviation: "$", definition: "...-..-"),
    .init(abbreviation: "@", definition: ".--.-."),

    // Ham Radio Common Abbreviations
    .init(abbreviation: "<AA>", definition: "New line"),
    .init(abbreviation: "<AR>", definition: "End of message"),
    .init(abbreviation: "<AS>", definition: "Wait"),
    .init(abbreviation: "<BK>", definition: "Break"),
    .init(abbreviation: "<BT>", definition: "New paragraph"),
    .init(abbreviation: "<CL>", definition: "Going off the air (clear)"),
    .init(abbreviation: "<CT>", definition: "Start copying"),
    .init(abbreviation: "<DO>", definition: "Change to Wabun code"),
    .init(abbreviation: "<KA>", definition: "Starting signal"),
    .init(abbreviation: "<KN>", definition: "Invite specific station to transmit"),
    .init(abbreviation: "<SK>", definition: "End of transmission"),
    .init(abbreviation: "<SN>", definition: "Understood"),
    .init(abbreviation: "<SOS>", definition: "Distress message"),

    // Common Abbreviations
    .init(abbreviation: "73", definition: "Best regards"),
    .init(abbreviation: "88", definition: "Love and kisses"),
    .init(abbreviation: "BCNU", definition: "Be seeing you"),
    .init(abbreviation: "CQ", definition: "Call to all stations"),
    .init(abbreviation: "CS", definition: "Call sign (request)"),
    .init(abbreviation: "CUL", definition: "See you later"),
    .init(abbreviation: "DE", definition: "From (or 'this is')"),
    .init(abbreviation: "ES", definition: "And"),
    .init(abbreviation: "K", definition: "Over (invitation to transmit)"),
    .init(abbreviation: "OM", definition: "Old man"),
    .init(abbreviation: "R", definition: "Received / Roger"),
    .init(abbreviation: "RST", definition: "Signal report (Readability 5, Signal 10, Tone 10)"),
    .init(abbreviation: "UR", definition: "You are"),

    // Q Codes - Statements
    .init(abbreviation: "QRL", definition: "The frequency is in use"),
    .init(abbreviation: "QRM", definition: "Your transmission is being interfered with"),
    .init(abbreviation: "QRN", definition: "I am troubled by static"),
    .init(abbreviation: "QRO", definition: "Increase transmitter power"),
    .init(abbreviation: "QRP", definition: "Decrease transmitter power"),
    .init(abbreviation: "QRQ", definition: "Send faster"),
    .init(abbreviation: "QRS", definition: "Send more slowly"),
    .init(abbreviation: "QRT", definition: "Stop sending"),
    .init(abbreviation: "QRU", definition: "I have nothing for you"),
    .init(abbreviation: "QRV", definition: "I am ready to copy"),
    .init(abbreviation: "QRX", definition: "Wait"),
    .init(abbreviation: "QRZ", definition: "You are being called by..."),
    .init(abbreviation: "QSB", definition: "Your signals are fading"),
    .init(abbreviation: "QSL", definition: "I acknowledge receipt"),
    .init(abbreviation: "QTH", definition: "My location is..."),

    // Q Codes - Questions
    .init(abbreviation: "QRL?", definition: "Is the frequency in use?"),
    .init(abbreviation: "QRM?", definition: "Is my transmission being interfered with?"),
    .init(abbreviation: "QRN?", definition: "Are you troubled by static?"),
    .init(abbreviation: "QRO?", definition: "Shall I increase transmitter power?"),
    .init(abbreviation: "QRP?", definition: "Shall I decrease transmitter power?"),
    .init(abbreviation: "QRQ?", definition: "Shall I send faster?"),
    .init(abbreviation: "QRS?", definition: "Shall I send more slowly?"),
    .init(abbreviation: "QRT?", definition: "Shall I stop sending?"),
    .init(abbreviation: "QRU?", definition: "Have you anything for me?"),
    .init(abbreviation: "QRV?", definition: "Are you ready to copy?"),
    .init(abbreviation: "QRX?", definition: "Should I wait?"),
    .init(abbreviation: "QRZ?", definition: "Who is calling me?"),
    .init(abbreviation: "QSB?", definition: "Are my signals fading?"),
    .init(abbreviation: "QSL?", definition: "Do you acknowledge?"),
    .init(abbreviation: "QTH?", definition: "What is your location?")
]


// MARK: - Morse Code Map
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
                                Image(systemName: "book.fill").font(.title)
                            }
                            .accessibilityLabel("Dictionary")
                            Button {
                                showingSettings = true
                            } label: {
                                Image(systemName: "gearshape.fill").font(.title)
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
                    DictionaryView(entries: abbreviations)
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
                if !self.decodedText.hasSuffix(". ") {
                    self.decodedText += ". "
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

// MARK: - Dictionary View
struct DictionaryView: View {
    let entries: [DictionaryEntry]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List(entries) { entry in
                VStack(alignment: .leading) {
                    Text(entry.abbreviation)
                        .font(.headline)
                    Text(entry.definition)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationBarTitle("Dictionary", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Settings View
struct SettingsView: View {
    @Binding var wpm: Double
    @Binding var frequency: Double
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Speed (WPM)")) {
                    Slider(value: $wpm, in: 5...40, step: 1)
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

// MARK: - AVTonePlayer
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

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
