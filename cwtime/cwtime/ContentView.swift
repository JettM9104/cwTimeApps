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

// Logical display order — avoids non-deterministic Set ordering
private let categoryOrder: [String] = [
    "Letters", "Numbers", "Punctuation",
    "Ham Radio Common", "Common Abbreviations",
    "Q Codes (Statements)", "Q Codes (Questions)"
]

private var categories: [String] {
    categoryOrder.filter { cat in allEntries.contains { $0.category == cat } }
}

// MARK: - Main View
struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var isTonePlaying = false

    @AppStorage("wpm") private var wpm: Double = 20
    @AppStorage("frequency") private var frequency: Double = 500
    @AppStorage("useFlashlight") private var useFlashlight: Bool = false

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

    // BUG FIX: @StateObject ensures a single engine instance lives for the view's lifetime.
    // `private var` was creating a new AVTonePlayer (and audio engine) on every render.
    @StateObject private var tonePlayer = AVTonePlayer()

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Text display area
                    VStack(spacing: 6) {
                        Text(decodedText.isEmpty ? "Decoded text appears here" : decodedText)
                            .font(.headline)
                            .foregroundColor(decodedText.isEmpty ? .secondary : .primary)
                            .multilineTextAlignment(.center)
                            .lineLimit(5)

                        Text(morseBuffer.isEmpty ? " " : morseBuffer)
                            .font(.title.monospaced())
                            .foregroundColor(morseBuffer.isEmpty ? .clear : .primary)
                            .animation(.none, value: morseBuffer)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(UIColor.secondarySystemBackground))
                    )
                    .overlay(alignment: .topTrailing) {
                        Button {
                            UIPasteboard.general.string = decodedText
                        } label: {
                            Image(systemName: "doc.on.doc")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(10)
                        }
                        .disabled(decodedText.isEmpty)
                        .opacity(decodedText.isEmpty ? 0 : 1)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)

                    // Control buttons sit in the gap between text and paddles
                    HStack {
                        VStack(spacing: 12) {
                            Button {
                                morseBuffer = ""
                                decodedText = ""
                            } label: {
                                Image(systemName: "trash")
                                    .font(.title2)
                                    .foregroundColor(.red)
                                    .padding(10)
                                    .background(Circle().fill(Color.red.opacity(0.15)))
                            }
                            .accessibilityLabel("Clear")

                            Button {
                                guard !decodedText.isEmpty else { return }
                                decodedText.removeLast()
                            } label: {
                                Image(systemName: "delete.backward")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .padding(10)
                                    .background(Circle().fill(Color.orange.opacity(0.15)))
                            }
                            .disabled(decodedText.isEmpty)
                            .accessibilityLabel("Backspace")

                            Button {
                                showingDictionary = true
                            } label: {
                                Image(systemName: "character.book.closed")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                    .padding(10)
                                    .background(Circle().fill(Color.blue.opacity(0.15)))
                            }
                            .accessibilityLabel("Dictionary")

                            Button {
                                showingSettings = true
                            } label: {
                                Image(systemName: "gearshape")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    .padding(10)
                                    .background(Circle().fill(Color.gray.opacity(0.15)))
                            }
                            .accessibilityLabel("Settings")
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(UIColor.secondarySystemBackground))
                                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        )

                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 16)

                    Spacer()

                    HStack(spacing: 0) {
                        paddleView(isPressed: $isDitPressed, element: .dit, color: .blue, label: "DIT")
                        paddleView(isPressed: $isDahPressed, element: .dah, color: .green, label: "DAH")
                    }
                    .frame(height: geo.size.height / 2)
                }
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    startGapTimer()
                    tonePlayer.restart()
                }
                .onDisappear {
                    stopGapTimer()
                    tonePlayer.shutdown()
                }
                .onChange(of: scenePhase) { newPhase in
                    if newPhase != .active {
                        forceReleasePaddles()
                    } else {
                        tonePlayer.restart()
                    }
                }
                .sheet(isPresented: $showingSettings) {
                    SettingsView(wpm: $wpm, frequency: $frequency, useFlashlight: $useFlashlight)
                }
                .sheet(isPresented: $showingDictionary) {
                    DictionaryRootView()
                }
            }
            .navigationBarHidden(true)
        }
    }

    private func forceReleasePaddles() {
        isDitPressed = false
        isDahPressed = false
        keyingWorkItem?.cancel()
        keyingWorkItem = nil
        isTonePlaying = false
        tonePlayer.stop()
        if useFlashlight { setFlashlight(on: false) }
    }

    private func paddleView(isPressed: Binding<Bool>, element: MorseElement, color: Color, label: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    isPressed.wrappedValue
                    ? AnyShapeStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [color.opacity(0.7), color]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                      )
                    : AnyShapeStyle(Color(UIColor.systemBackground))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color, lineWidth: 3)
                        .opacity(isPressed.wrappedValue ? 0 : 0.6)
                )
                .shadow(
                    color: isPressed.wrappedValue ? color.opacity(0.6) : Color.black.opacity(0.1),
                    radius: isPressed.wrappedValue ? 10 : 3,
                    x: 0, y: isPressed.wrappedValue ? 5 : 2
                )

            Text(label)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .foregroundColor(isPressed.wrappedValue ? .white : color)
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed.wrappedValue {
                        isPressed.wrappedValue = true
                        // Differentiated haptics: light tap for dit, heavier for dah
                        let style: UIImpactFeedbackGenerator.FeedbackStyle = element == .dit ? .medium : .heavy
                        UIImpactFeedbackGenerator(style: style).impactOccurred()
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
        .padding(8)
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

            self.isTonePlaying = true
            self.tonePlayer.play(frequency: self.frequency, duration: duration)

            if self.useFlashlight { self.setFlashlight(on: true) }

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.isTonePlaying = false
                if self.useFlashlight { self.setFlashlight(on: false) }
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
        gapTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if self.isTonePlaying { return }
            if self.isDitPressed || self.isDahPressed { return }

            let gap = Date().timeIntervalSince(self.lastInputTime)
            let unit = self.unitDuration()

            if gap >= unit * 7 {
                self.finishCharacter()
                if !self.decodedText.hasSuffix(" ") && !self.decodedText.isEmpty {
                    self.decodedText += " "
                }
                // BUG FIX: reset lastInputTime so this branch doesn't re-fire every 50ms while idle
                self.lastInputTime = Date()
            } else if gap >= unit * 3 && !self.morseBuffer.isEmpty {
                self.finishCharacter()
                // finishCharacter() already resets lastInputTime
            }
        }
    }

    private func stopGapTimer() {
        gapTimer?.invalidate()
        gapTimer = nil
    }

    private func finishCharacter() {
        guard !morseBuffer.isEmpty else { return }
        let char = morseToChar[morseBuffer] ?? "?"
        decodedText += char
        morseBuffer = ""
        lastInputTime = Date()
    }

    private func setFlashlight(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
        do {
            try device.lockForConfiguration()
            if on {
                try device.setTorchModeOn(level: 1.0)
            } else {
                device.torchMode = .off
            }
            device.unlockForConfiguration()
        } catch {
            print("Flashlight error: \(error)")
        }
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
            .listStyle(InsetGroupedListStyle())
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

    private var entriesInCategory: [DictionaryEntry] {
        allEntries
            .filter { $0.category == category }
            .sorted(by: { $0.abbreviation < $1.abbreviation })
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(entriesInCategory) { entry in
                    VStack(spacing: 6) {
                        Text(entry.abbreviation)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)

                        Text(entry.definition)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(UIColor.systemGray6))
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
        .navigationBarTitle(category, displayMode: .inline)
    }
}

// MARK: - Settings View
struct SettingsView: View {
    @Binding var wpm: Double
    @Binding var frequency: Double
    @Binding var useFlashlight: Bool

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Speed (WPM)")) {
                    Slider(value: $wpm, in: 5...45, step: 1)
                    Text("\(Int(wpm)) WPM")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Section(header: Text("Frequency (Hz)")) {
                    Slider(value: $frequency, in: 200...1000, step: 10)
                    Text("\(Int(frequency)) Hz")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Section(header: Text("Flashlight")) {
                    Toggle("Enable Flashlight Feedback", isOn: $useFlashlight)
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top)
        }
    }
}

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

// MARK: - AVTonePlayer

// ObservableObject conformance allows @StateObject use in ContentView,
// ensuring a single engine instance for the view's lifetime.
class AVTonePlayer: ObservableObject {
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    private var sampleRate: Double { engine.outputNode.outputFormat(forBus: 0).sampleRate }

    init() {
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)

        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: format)

        startEngine()
    }

    func restart() {
        guard !engine.isRunning else { return }
        try? AVAudioSession.sharedInstance().setActive(true)
        startEngine()
    }

    private func startEngine() {
        do {
            try engine.start()
        } catch {
            print("Audio engine failed: \(error)")
        }
    }

    func play(frequency: Double, duration: TimeInterval) {
        guard frequency > 0 else { return }

        let frameCount = AVAudioFrameCount(sampleRate * duration)
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount) else { return }

        buffer.frameLength = frameCount
        let samples = buffer.floatChannelData![0]
        let increment = Float(2 * Double.pi * frequency / sampleRate)

        var theta: Float = 0
        let fadeSamples = Int(sampleRate * 0.005) // 5ms fade to avoid clicks

        for i in 0..<Int(frameCount) {
            var sample = sin(theta)

            if i < fadeSamples {
                sample *= Float(i) / Float(fadeSamples)
            }
            if i >= Int(frameCount) - fadeSamples {
                sample *= max(0, Float(Int(frameCount) - i) / Float(fadeSamples))
            }

            samples[i] = sample
            theta += increment
        }

        player.scheduleBuffer(buffer, at: nil, options: []) { }
        player.play()
    }

    func stop() {
        player.stop()
    }

    func shutdown() {
        engine.stop()
    }
}
