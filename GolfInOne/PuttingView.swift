//
//  PuttingView.swift
//  GolfInOne
//
//  Created by William Chandler on 26.06.25.
//
/*
 Putting Building Blocks & Exercises
 Learn: Mechanics, feel (how), touch
 Miss zone: p.215
 20,000 repetitions!
 
 11. Pre-Shot Routine
 Behind ball on aimline, look at hole, 3 practice strokes
 Walk to ball, eyes over aimline
 4th from ball address — e.g. practice — imagine (roll 17" past) (look at 17", look at hole)
 5th move: look for very thin aimline, pull trigger (UPT path) down/up/through
 12. Ritual (p.231)
 Putter down – look down aimline – look at ball – back to top of backswing
 Train path – repeat with final action release
 6. Flowlines – shoulders tilt
 Elk’s key: watch sloped drill, shoulders (tick left), eyes
 6. Stance & Ball Pos – shoulder width
 Tilt shoulders over aimline
 Toes in, inside of heels 2 putter widths apart
 7. PUTT Axis – UMP Perfect Setup
 Eyes below shoulders
 Only one 1 (e.g. right leg + shaft length)
 1. Aim
 LazerLine, putting track, putt mirror
 Practice using 1 eye in, mark toe → ball pos
 3. Path
 Putting track – 10 in. scoring zone
 Putt mirror – practice swing in zone
 Ball pos + Elk’s key
 Ball follows “throw”, not “navigate”
 Putt to marker, outside, build aimline (9°), 6°
 13. Stability
 Tilt, foam, match, data to ball
 Tilt in right, hold 5 beats
 2× test eyes slot
 If 12° = 10°, 6°, 7° ± 2°, 10°, 12° = 2°
 5. Impact
 Sweetspot – long putter lie angle to top wire key
 Match top edge, test impact with putting track
 Round stroke (hips), no rotation
 Speed match “release clip” + Elk key + metronome
 → 750 with sweet spot in track
 4. Face Angle
 TruPutt – 3× print with 6/12/18 ft putts
 PuttRolls, 5×, 50% → 80%
 Putting Strokes & Aimline (p.288), TruthBoard (p.290)
 2. Power Source
 Heel motion against wall, shadow test
 Hips against door jam
 Stand in cement (hold body)
 Balance board, Putt-Triangle, shoulders on door/frame
 8. Touch
 What (length, greenspeed, roll, size of swing), mettle – e.g. yards
 Triangle drill – 3 missed putts ×4
 Edge-of-green drill: measure edge–edge putt
 3 balls back/forth
 Drawback > 3 ft = drawback end putt by 3 ft
 Safety Drawback: 1 ft, 3 ft, no drawback in Safe Zone (3 ft finish circle)
 CI putting – find distance where clip is closer (3× 50–100)
 Plumb–Hole drill → mark white tee, walk distance of putt
 Place plumb hole, walk surface distance
 9. Feel
 Place Plumb–Hole in front (behind real hole) to simulate level change
 9. Feel
 Sens: slot over → over 1–2 balls
 */

import SwiftUI

// MARK: - Data Model
struct PuttingBlock: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let description: String
    let tools: [String]
    let drills: [String]
    let notes: String
    let isCore: Bool
    let learningOrder: Int
    let subblocks: [PuttingBlock]?
}

// MARK: - Sample Data

let sampleBlocks: [PuttingBlock] = [

    PuttingBlock(
        title: "Basics",
        summary: "The basic putting motion: grip, posture, and swing",
        description: "Corret setup leads to accurate repeatable stroke",
        tools: [],
        drills: [],
        notes: "",
        isCore: true,
        learningOrder: 1,
        subblocks: [
            PuttingBlock(
                title: "Grip",
                summary: "Hold the putter consistently and without tension.",
                description: "Two-handed grip with all fingers on shaft - perhaps with lead hand index finger running down over rear hand fingers; perhaps with rear hand index finger running down shaft\nAvoid tight grip; hands should be neutral and quiet",
                tools: [/*"Grip pressure scale", "Putter handle reference"*/],
                drills: [/*"Consistent pressure drill", "Mirror grip check"*/],
                notes: "",
                isCore: true,
                learningOrder: 1,
                subblocks: nil
            ),
            PuttingBlock(
                title: "Posture",
                summary: "Establish a balanced stable setup.",
                description: "Balanced stance\nBend over from hips - not too tall\nLet arms fall - hands directly below shoulders\nEyes over/just behind ball and on aimline\nFeet, hips, shoulders parallel to aimline\nForm a triangle between left and right shoulders and hands - maintain throughout stroke\nDon't lock arms",
                tools: ["Full-length mirror", "Mirror on floor"],
                drills: ["Eyes over ball in mirror on ground", "Drop ball from between/left eye - should land on ball to be putt", "Shoulder parallel in full-length mirror"],
                notes: "",
                isCore: true,
                learningOrder: 2,
                subblocks: nil
            ),
            PuttingBlock(
                title: "Swing",
                summary: "Create a smooth, pendulum-like stroke.",
                description: "Use pendulum motion, by rotating shoulders around spine angle with no wrist movement\nAccelerate through the ball\nKeep head still\n",
                tools: ["Metronome"],
                drills: ["No-ball pendulum swing with metronome", "Keep alignment stick between arms and body", "Putt with head touching wall"],
                notes: "Pendulum motion puts the emphasis on the bigger muscles which are easier to control. A little bit of wrist action can cause a lot of variables in line and speed. Try to maintain your wrists on short and medium putts. May need a bit of wrist action for long lags.",
                isCore: true,
                learningOrder: 3,
                subblocks: nil
            )
        ]
    ),
    // routine p.226
    PuttingBlock(
        title: "Pre-Putt Routine",
        summary: "Develop a consistent mental and physical pre-putt sequence - enhances confidence and reduces pressure",
        description: "1. Stand behind ball on aimline, three practice swings for touch\n2. Walk to ball keeping eyes over aimline\n3. Address 10cm parallel inside aimline\n4. 3-6 practice strokes - imagine roll \(17 * 2.5) past hole\n5. Address ball, eyes over aimline, look to verify alignment to aimline, initiate ritual",
        tools: ["Checklist"],
        drills: ["Practice steps"],
        notes: "Essential for confidence and consistency under pressure.",
        isCore: true,
        learningOrder: 2,
        subblocks: nil
    ),
    PuttingBlock(
        title: "Putt Routine",
        summary: "Again, establish consistent sequence when actually making the stroke",
        description: "1. Putter down/forward 2. Look down airline 3. Look back at ball 4. Take club back to top of backswing 5. Through stroke – hold finish – no recoil",
        tools: [],
        drills: ["Practice steps"],
        notes: "",
        isCore: false,
        learningOrder: 3,
        subblocks: nil
    ),
    
    
/*
    PuttingBlock(
        title: "Rhythm Test",
        summary: "Assess rhythm using real strokes.",
        description: "Putt 6/12/18 reps with TruPutt, PuttRails, Fox, 50% → 80%",
        tools: ["TruPutt", "PuttRails", "Fox device"],
        drills: ["Repetition speed control"],
        notes: "From Putting Bible pp. 237, 288, 290",
        isCore: false,
        learningOrder: 2,
        subblocks: nil
    ),
*/
    /*
    PuttingBlock(
        title: "Putter Fit",
        summary: "Adjust putter to your natural stance.",
        description: "With perfect setup (eyes over airline, hands below shoulders), only one lie angle + shaft length fits.",
        tools: ["Mirror", "Static lie board"],
        drills: ["Check eye and hand position in mirror"],
        notes: "Fit supports consistent stroke mechanics.",
        isCore: true,
        learningOrder: 6,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Aim",
        summary: "Align putter and stroke to the target.",
        description: "Use laser, putting track, and aim gates. Check for bias; mark face alignment.",
        tools: ["Laser", "Putting gates", "Aim markers"],
        drills: ["Gate drill", "Laser alignment test"],
        notes: "Critical for initial direction and confidence.",
        isCore: true,
        learningOrder: 7,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Path",
        summary: "Control arc and shape of the stroke.",
        description: "Use putting track – 10 in. strokes only. Practice going in one hole, mark toe-ball pos.",
        tools: ["Putting track", "Mirror"],
        drills: ["Path matching drill", "Inside-arc test"],
        notes: "Most essential mechanical skill. Affects direction and roll.",
        isCore: true,
        learningOrder: 8,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Stability",
        summary: "Minimize head and body motion.",
        description: "11” foam track, data ball, tilted platform, hold 5 beats. 2x test: eyes slot.",
        tools: ["Foam track", "Stability base"],
        drills: ["Hold head still drill", "Eyes slot check"],
        notes: "Keep body and head still to stabilize aim and impact.",
        isCore: true,
        learningOrder: 9,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Impact",
        summary: "Control contact location and putter face.",
        description: "Use sweet spot marker, check putter lie angle to top with key. Test impact via putting track.",
        tools: ["Impact tape", "Track", "Lie marker"],
        drills: ["Toe–heel impact test", "Center strike drill"],
        notes: "Feedback is critical – no correction if missed.",
        isCore: true,
        learningOrder: 10,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Face Angle",
        summary: "Ensure face is square at impact.",
        description: "Use TruPutt, 3–5° print with tools above. Check for >50% success before moving on.",
        tools: ["TruPutt", "Airline", "TruthBoard"],
        drills: ["Face square test", "Directional consistency"],
        notes: "Tiny variations in face angle = big directional errors.",
        isCore: true,
        learningOrder: 11,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Power Source",
        summary: "Use torso, not wrists, for stroke.",
        description: "Test motion with wall shadow, hips vs. door frame. Use triangle (shoulders–arms–putter).",
        tools: ["Door frame", "Balance board", "Putt-Triangle"],
        drills: ["Shoulders only stroke", "Doorframe body control test"],
        notes: "All motion from triangle – no wrists.",
        isCore: true,
        learningOrder: 12,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Touch",
        summary: "Manage speed and roll length.",
        description: "Calibrate: what (length, greenspeed, roll, size of swing). Nettle – 3 distances, triangle drill.",
        tools: ["Nettle mat", "Triangle board", "Edge-of-green markers"],
        drills: ["Distance ladder", "Plong–hole drill"],
        notes: "Drawback max 35\", safety zone 1.5–3.5\", find edge where dip is detectable.",
        isCore: true,
        learningOrder: 13,
        subblocks: nil
    ),

    PuttingBlock(
        title: "Feel",
        summary: "Train perception and subtlety.",
        description: "Place plong–hole in front (behind red hole to simulate level change). Feel slot over 1 tick.",
        tools: ["Plong–hole device"],
        drills: ["Slot drill", "Level feel change simulation"],
        notes: "Feel is sensation, not thought – trained by repetition.",
        isCore: false,
        learningOrder: 14,
        subblocks: nil
    )
     */
]




/* old code to check for useful content
    PuttingBlock(
        title: "Path",
        summary: "Understanding and controlling the stroke arc.",
        tools: ["Putting track", "Putt mirror"],
        drills: ["Arc-only swing with gate", "Back-and-through stroke track"],
        description: "Path is the foundation of your putting motion, influencing consistency and roll.",
        isCore: true,
        learningOrder: 2,
        subblocks: nil
    ),
    PuttingBlock(
        title: "Power Source",
        summary: "Generating stable, body-led motion.",
        tools: ["Wall drill", "Balance board"],
        drills: ["Shoulders against doorframe", "Putt-Triangle stability test"],
        description: "Minimize wrist usage, drive motion from shoulders.",
        isCore: true,
        learningOrder: 3,
        subblocks: nil
    ),
    
    PuttingBlock(
        title: "Putter Fit",
        summary: "Match your putter’s shaft and lie angle to your natural setup.",
        tools: ["Lie board", "Mirror", "Static fit chart"],
        drills: ["Setup mirror check", "Lie angle board test"],
        description: "With correct setup—eyes over aimline, hands below shoulders—there's only one ideal lie angle and shaft length. Fit follows posture.",
        isCore: true,
        learningOrder: 7,
        subblocks: nil
    ),
    
    PuttingBlock(
        title: "Stability",
        summary: "Keep your lower body and head steady throughout the stroke.",
        tools: ["Balance board", "Head mirror clip"],
        drills: ["Still head test", "No-movement challenge"],
        description: "Minimize unnecessary motion. Keep your base and head still to avoid altering the stroke path.",
        isCore: true,
        learningOrder: 13,
        subblocks: nil
    ),
    PuttingBlock(
        title: "Rhythm Test",
        summary: "Train consistent tempo and timing in your stroke.",
        tools: ["Metronome", "Stopwatch", "Rhythm app"],
        drills: ["Back-forward beat match", "Swing tempo metronome drill"],
        description: "Measure your tempo, usually around 0.6–0.7 sec per stroke. Helps link mental state to physical flow.",
        isCore: false,
        learningOrder: 14,
        subblocks: nil
    ),
    PuttingBlock(
        title: "Attitude",
        summary: "Mental preparation and confidence in putting.",
        tools: [],
        drills: [],
        description: "Stay relaxed, positive, and focused regardless of result.",
        isCore: false,
        learningOrder: 15,
        subblocks: nil
    )
 */

// MARK: - Block View
struct PuttingBlockView: View {
    let block: PuttingBlock
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Step \(block.learningOrder): \(block.title)")
                        .font(.title)
                        .fontWeight(.bold)
                    if block.isCore {
                        Text("CORE")
                            .font(.caption)
                            .padding(4)
                            .background(Color.green.opacity(0.2))
                            .clipShape(Capsule())
                    }
                }
                
                Text(block.summary)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if !block.description.isEmpty {
                    Label("Description", systemImage: "questionmark.text.page")
                        .font(.headline)
                    Text(block.description)
                        .italic()
                }
                /*
                if !block.tools.isEmpty {
                    Label("Tools", systemImage: "wrench")
                        .font(.headline)
                    ForEach(block.tools, id: \.self) { tool in
                        Text("• \(tool)")
                    }
                }
                */
                if !block.drills.isEmpty {
                    Label("Drills", systemImage: "figure.walk")
                        .font(.headline)
                    ForEach(block.drills, id: \.self) { drill in
                        Text("• \(drill)")
                    }
                }
                
                if let subblocks = block.subblocks {
                    Divider()
                    Text("Subtopics")
                        .font(.title3)
                        .fontWeight(.semibold)
                    ForEach(subblocks.sorted(by: { $0.learningOrder < $1.learningOrder })) { sub in
                        NavigationLink(destination: PuttingBlockView(block: sub)) {
                            VStack(alignment: .leading) {
                                Text("Step \(sub.learningOrder): \(sub.title)")
                                    .font(.headline)
                                Text(sub.summary)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(UIColor.secondarySystemBackground)))
            .shadow(radius: 2)
            .padding(.horizontal)
        }
    }
}

// MARK: - Block List View
struct PuttingBlockListView: View {
    //@ObservedObject var bleManager: BLEManager

    @AppStorage("refreshInterval") var refreshInterval: Double = 1.0
    @State private var displayedFrame: SensorFrame?
    @State private var timer: Timer?

    @ObservedObject private var sensorData = SensorDataStore.shared

    var body: some View {
        NavigationStack {
            List {
                // Section 1: Putting Blocks
                Section(header: Text("Learning Steps")) {
                    ForEach(sampleBlocks.sorted(by: { $0.learningOrder < $1.learningOrder })) { block in
                        NavigationLink(destination: PuttingBlockView(block: block)) {
                            VStack(alignment: .leading) {
                                Text("Step \(block.learningOrder): \(block.title)")
                                    .font(.headline)
                                Text(block.summary)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                // Section 2: Sensor Frame (for testing)
                Section(header: Text("Live Sensor Data")) {
                    if let frame = displayedFrame {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Accel: x: \(frame.acceleration.x, specifier: "%.2f")g, y: \(frame.acceleration.y, specifier: "%.2f")g, z: \(frame.acceleration.z, specifier: "%.2f")g")
                            Text("Gyro: x: \(frame.gyro.x, specifier: "%.2f")°/s, y: \(frame.gyro.y, specifier: "%.2f")°/s, z: \(frame.gyro.z, specifier: "%.2f")°/s")
                            Text("Angle: roll: \(frame.angle.roll, specifier: "%.2f")°, pitch: \(frame.angle.pitch, specifier: "%.2f")°, yaw: \(frame.angle.yaw, specifier: "%.2f")°")
                        }
                    } else {
                        Text("Waiting for sensor data...")
                            .foregroundColor(.gray)
                    }
                }
                .onAppear {
                    startPolling()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                .onChange(of: refreshInterval) { _ in
                    startPolling()
                }
            }
            .navigationTitle("Putting Blocks")
        }
    }
    
    func startPolling() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: refreshInterval, repeats: true) { _ in
            displayedFrame = sensorData.latestFrame

            //displayedFrame = bleManager.latestSensorFrame
        }
    }
}



// MARK: - Preview
#Preview {
    PuttingBlockListView(/*bleManager: BLEManager()*/)
}
