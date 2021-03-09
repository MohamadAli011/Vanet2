# A 3 nodes example for ad hoc simulation with AODV
# Define options
set val(chan)       Channel/WirelessChannel     ;# channel type
set val(prop)       Propagation/TwoRayGround    ;# radio-propagation model
set val(netif)      Phy/WirelessPhy             ;# network interface type
set val(mac)        Mac/802_11                  ;# MAC type
set val(ifq)        Queue/DropTail/PriQueue     ;# interface queue type
set val(ll)         LL                          ;# link layer type
set val(ant)        Antenna/OmniAntenna         ;# antenna model
set val(ifqlen)     100                         ;# max packet in ifq
set val(nn)         42                          ;# number of mobilenodes
set val(rp)         AODV                        ;# routing protocol
set val(x)          9500                        ;# X dimension of topography
set val(y)          1000                         ;# Y dimension of topography
set val(stop)       820                         ;# time of simulation end

set ns          [new Simulator]
set tracefd     [open ujianudp.tr w]
set namtrace    [open ujianudp.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

# Create nn mobilenodes [$val(nn)] and attach them to the channel.
set chan_1_ [new $val(chan)]

# konfigurasi node
$ns node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-channel $chan_1_ \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON

#untuk node
for {set i 0} {$i < $val(nn) } { incr i } {
    set node_($i) [$ns node]
}

# peletakan lokasi node
$node_(0) set X_ 9490.0 #transjakarta 1
$node_(0) set Y_ 390.0
$node_(0) set Z_ 0.0
$node_(32) set X_ 9490.0 #transjakarta 1a
$node_(32) set Y_ 390.0
$node_(32) set Z_ 0.0
$node_(33) set X_ 9490.0 #transjakarta 1b
$node_(33) set Y_ 390.0
$node_(33) set Z_ 0.0
$node_(36) set X_ 9490.0 #metromini 20
$node_(36) set Y_ 440.0
$node_(36) set Z_ 0.0
$node_(37) set X_ 7675.0 #metromini 75
$node_(37) set Y_ 10.0
$node_(37) set Z_ 0.0
$node_(40) set X_ 8250.0 #angkot 61
$node_(40) set Y_ 990.0
$node_(40) set Z_ 0.0
$node_(41) set X_ 7675.0 #angkot 11
$node_(41) set Y_ 10.0
$node_(41) set Z_ 0.0
$node_(1) set X_ 9300.0 #ragunan (190)
$node_(1) set Y_ 335.0
$node_(1) set Z_ 0.0
$node_(2) set X_ 8775.0 #ragunan-deptan(525)
$node_(2) set Y_ 340.0
$node_(2) set Z_ 0.0
$node_(3) set X_ 8250.0 #deptan 1 (1050)
$node_(3) set Y_ 340.0
$node_(3) set Z_ 0.0
$node_(4) set X_ 8025.0 #smk 57  (225)
$node_(4) set Y_ 340.0
$node_(4) set Z_ 0.0
$node_(5) set X_ 7675.0 #jatipadang 2 (350)
$node_(5) set Y_ 340.0
$node_(5) set Z_ 0.0
$node_(6) set X_ 7125.0 #pejaten 3 (550)
$node_(6) set Y_ 340.0
$node_(6) set Z_ 0.0
$node_(7) set X_ 6900.0 #buncit indah (225)
$node_(7) set Y_ 340.0
$node_(7) set Z_ 0.0
$node_(8) set X_ 6550.0 #buncit indah-warung jati (350)
$node_(8) set Y_ 335.0
$node_(8) set Z_ 0.0
$node_(9) set X_ 6200.0 #warung jati(700)
$node_(9) set Y_ 340.0
$node_(9) set Z_ 0.0
$node_(10) set X_ 5775.0 #warung jati- imigrasi (425)
$node_(10) set Y_ 335.0
$node_(10) set Z_ 0.0
$node_(11) set X_ 5350.0 #warung jati-imigrasi (425)
$node_(11) set Y_ 335.0
$node_(11) set Z_ 0.0
$node_(12) set X_ 4925.0 #warung jati-imigrasi (425)
$node_(12) set Y_ 335.0
$node_(12) set Z_ 0.0
$node_(13) set X_ 4500.0 #imigrasi 4 (1700)
$node_(13) set Y_ 340.0
$node_(13) set Z_ 0.0
$node_(14) set X_ 4225.0 #durentiga 5 (225)
$node_(14) set Y_ 340.0
$node_(14) set Z_ 0.0
$node_(15) set X_ 3675.0 #mampang prapatan
$node_(15) set Y_ 340.0
$node_(15) set Z_ 0.0
$node_(28) set X_ 3275.0 #kuningan timur
$node_(28) set Y_ 490.0
$node_(28) set Z_ 0.0
$node_(29) set X_ 3275.0 #kuningan timur
$node_(29) set Y_ 640.0
$node_(29) set Z_ 0.0
$node_(30) set X_ 3275.0 #kuningan timur
$node_(30) set Y_ 240.0
$node_(30) set Z_ 0.0
$node_(31) set X_ 3275.0 #kuningan timur
$node_(31) set Y_ 140.0
$node_(31) set Z_ 0.0
$node_(16) set X_ 3275.0 #kuningan timur
$node_(16) set Y_ 340.0
$node_(16) set Z_ 0.0
$node_(17) set X_ 2975.0 #patra kuningan
$node_(17) set Y_ 340.0
$node_(17) set Z_ 0.0
$node_(18) set X_ 2625.0 #depkes
$node_(18) set Y_ 340.0
$node_(18) set Z_ 0.0
$node_(19) set X_ 2200.0 #gor sumantri
$node_(19) set Y_ 340.0
$node_(19) set Z_ 0.0
$node_(20) set X_ 2025.0 #karet kuningan
$node_(20) set Y_ 340.0
$node_(20) set Z_ 0.0
$node_(21) set X_ 1850.0 #kuningan madya
$node_(21) set Y_ 340.0
$node_(21) set Z_ 0.0
$node_(22) set X_ 1600.0 #setiabudi utara aini
$node_(22) set Y_ 340.0
$node_(22) set Z_ 0.0
$node_(23) set X_ 1100.0 #latuharhari
$node_(23) set Y_ 340.0
$node_(23) set Z_ 0.0
$node_(24) set X_ 650.0 #halimun
$node_(24) set Y_ 340.0
$node_(24) set Z_ 0.0
$node_(25) set X_ 325.0 #halimun-dukuh atas (325)
$node_(25) set Y_ 335.0
$node_(25) set Z_ 0.0
$node_(26) set X_ 50.0 #dukuh atas
$node_(26) set Y_ 340.0
$node_(26) set Z_ 0.0
$node_(27) set X_ 10.0 #mobil 2
$node_(27) set Y_ 290.0
$node_(27) set Z_ 0.0
$node_(34) set X_ 1500.0 #mobil 2a
$node_(34) set Y_ 990.0
$node_(34) set Z_ 0.0
$node_(35) set X_ 3175.0 #mobil 2b
$node_(35) set Y_ 990.0
$node_(35) set Z_ 0.0
$node_(38) set X_ 1500.0 #metromini 20
$node_(38) set Y_ 990.0
$node_(38) set Z_ 0.0
$node_(39) set X_ 3175.0 #metromini 75
$node_(39) set Y_ 990.0
$node_(39) set Z_ 0.0

# Generation of movements
$ns at 1.0 "$node_(0) setdest 9300.0 390.0 15.0" 
$ns at 20.0 "$node_(0) setdest 8250.0 390.0 15.0" 
$ns at 95.0 "$node_(0) setdest 8200.0 390.0 15.0"
$ns at 105.0 "$node_(0) setdest 8025.0 390.0 15.0" 
$ns at 125.0 "$node_(0) setdest 7725.0 390.0 15.0" 
$ns at 150.0 "$node_(0) setdest 7675.0 390.0 15.0" 
$ns at 165.0 "$node_(0) setdest 7175.0 390.0 15.0" 
$ns at 210.0 "$node_(0) setdest 7125.0 390.0 15.0" 
$ns at 220.0 "$node_(0) setdest 6900.0 390.0 15.0"
$ns at 240.0 "$node_(0) setdest 6200.0 390.0 15.0"
$ns at 290.0 "$node_(0) setdest 4800.0 390.0 15.0"
$ns at 390.0 "$node_(0) setdest 4500.0 390.0 15.0"
$ns at 415.0 "$node_(0) setdest 4300.0 390.0 15.0"
$ns at 435.0 "$node_(0) setdest 4225.0 390.0 15.0"
$ns at 445.0 "$node_(0) setdest 3675.0 390.0 15.0"
$ns at 490.0 "$node_(0) setdest 3275.0 390.0 15.0"
$ns at 525.0 "$node_(0) setdest 2975.0 390.0 15.0"
$ns at 550.0 "$node_(0) setdest 2625.0 390.0 15.0"
$ns at 580.0 "$node_(0) setdest 2200.0 390.0 15.0"
$ns at 615.0 "$node_(0) setdest 2025.0 390.0 15.0"
$ns at 635.0 "$node_(0) setdest 1850.0 390.0 15.0"
$ns at 655.0 "$node_(0) setdest 1600.0 390.0 15.0"
$ns at 675.0 "$node_(0) setdest 1100.0 390.0 15.0"
$ns at 715.0 "$node_(0) setdest 650.0 390.0 15.0"
$ns at 750.0 "$node_(0) setdest 50.0 390.0 15.0"
$ns at 790.0 "$node_(0) setdest 20.0 390.0 15.0"
$ns at 820.0 "$node_(0) setdest 10.0 390.0 15.0"

$ns at 11.0 "$node_(32) setdest 9300.0 390.0 15.0" 
$ns at 30.0 "$node_(32) setdest 8250.0 390.0 15.0" 
$ns at 105.0 "$node_(32) setdest 8200.0 390.0 15.0"
$ns at 115.0 "$node_(32) setdest 8025.0 390.0 15.0" 
$ns at 135.0 "$node_(32) setdest 7725.0 390.0 15.0" 
$ns at 160.0 "$node_(32) setdest 7675.0 390.0 15.0" 
$ns at 175.0 "$node_(32) setdest 7175.0 390.0 15.0" 
$ns at 220.0 "$node_(32) setdest 7125.0 390.0 15.0" 
$ns at 230.0 "$node_(32) setdest 6900.0 390.0 15.0"
$ns at 250.0 "$node_(32) setdest 6200.0 390.0 15.0"
$ns at 300.0 "$node_(32) setdest 4800.0 390.0 15.0"
$ns at 400.0 "$node_(32) setdest 4500.0 390.0 15.0"
$ns at 425.0 "$node_(32) setdest 4300.0 390.0 15.0"
$ns at 445.0 "$node_(32) setdest 4225.0 390.0 15.0"
$ns at 455.0 "$node_(32) setdest 3675.0 390.0 15.0"
$ns at 500.0 "$node_(32) setdest 3275.0 390.0 15.0"
$ns at 535.0 "$node_(32) setdest 2975.0 390.0 15.0"
$ns at 560.0 "$node_(32) setdest 2625.0 390.0 15.0"
$ns at 570.0 "$node_(32) setdest 2200.0 390.0 15.0"
$ns at 625.0 "$node_(32) setdest 2025.0 390.0 15.0"
$ns at 645.0 "$node_(32) setdest 1850.0 390.0 15.0"
$ns at 665.0 "$node_(32) setdest 1600.0 550.0 15.0"
$ns at 685.0 "$node_(32) setdest 1500.0 650.0 15.0"
$ns at 725.0 "$node_(32) setdest 1500.0 700.0 15.0"
$ns at 760.0 "$node_(32) setdest 1500.0 800.0 15.0"
$ns at 800.0 "$node_(32) setdest 1500.0 900.0 15.0"
$ns at 820.0 "$node_(32) setdest 1500.0 990.0 15.0"

$ns at 21.0 "$node_(33) setdest 9300.0 390.0 15.0" 
$ns at 40.0 "$node_(33) setdest 8250.0 390.0 15.0" 
$ns at 115.0 "$node_(33) setdest 8200.0 390.0 15.0"
$ns at 125.0 "$node_(33) setdest 8025.0 390.0 15.0" 
$ns at 145.0 "$node_(33) setdest 7725.0 390.0 15.0" 
$ns at 170.0 "$node_(33) setdest 7675.0 390.0 15.0" 
$ns at 185.0 "$node_(33) setdest 7175.0 390.0 15.0" 
$ns at 230.0 "$node_(33) setdest 7125.0 390.0 15.0" 
$ns at 240.0 "$node_(33) setdest 6900.0 390.0 15.0"
$ns at 260.0 "$node_(33) setdest 6200.0 390.0 15.0"
$ns at 310.0 "$node_(33) setdest 4800.0 390.0 15.0"
$ns at 410.0 "$node_(33) setdest 4500.0 390.0 15.0"
$ns at 435.0 "$node_(33) setdest 4300.0 390.0 15.0"
$ns at 455.0 "$node_(33) setdest 4225.0 390.0 15.0"
$ns at 465.0 "$node_(33) setdest 3675.0 390.0 15.0"
$ns at 510.0 "$node_(33) setdest 3275.0 390.0 15.0"
$ns at 545.0 "$node_(33) setdest 3175.0 450.0 15.0"
$ns at 580.0 "$node_(33) setdest 3175.0 550.0 15.0"
$ns at 635.0 "$node_(33) setdest 3175.0 650.0 15.0"
$ns at 695.0 "$node_(33) setdest 3175.0 750.0 15.0"
$ns at 735.0 "$node_(33) setdest 3175.0 850.0 15.0"
$ns at 810.0 "$node_(33) setdest 3175.0 950.0 15.0"
$ns at 820.0 "$node_(33) setdest 3175.0 990.0 15.0"

$ns at 16.0 "$node_(36) setdest 9300.0 440.0 15.0" 
$ns at 35.0 "$node_(36) setdest 8250.0 440.0 15.0" 
$ns at 110.0 "$node_(36) setdest 8200.0 440.0 15.0"
$ns at 120.0 "$node_(36) setdest 8025.0 440.0 15.0" 
$ns at 140.0 "$node_(36) setdest 7725.0 440.0 15.0" 
$ns at 165.0 "$node_(36) setdest 7675.0 440.0 15.0" 
$ns at 180.0 "$node_(36) setdest 7175.0 440.0 15.0" 
$ns at 225.0 "$node_(36) setdest 7125.0 440.0 15.0" 
$ns at 235.0 "$node_(36) setdest 6900.0 440.0 15.0"
$ns at 255.0 "$node_(36) setdest 6200.0 440.0 15.0"
$ns at 305.0 "$node_(36) setdest 4800.0 440.0 15.0"
$ns at 405.0 "$node_(36) setdest 4500.0 440.0 15.0"
$ns at 430.0 "$node_(36) setdest 4300.0 440.0 15.0"
$ns at 450.0 "$node_(36) setdest 4225.0 440.0 15.0"
$ns at 460.0 "$node_(36) setdest 3675.0 440.0 15.0"
$ns at 505.0 "$node_(36) setdest 3275.0 440.0 15.0"
$ns at 540.0 "$node_(36) setdest 2975.0 440.0 15.0"
$ns at 565.0 "$node_(36) setdest 2625.0 440.0 15.0"
$ns at 575.0 "$node_(36) setdest 2200.0 440.0 15.0"
$ns at 630.0 "$node_(36) setdest 2025.0 440.0 15.0"
$ns at 650.0 "$node_(36) setdest 1850.0 440.0 15.0"
$ns at 670.0 "$node_(36) setdest 1600.0 440.0 15.0"
$ns at 690.0 "$node_(36) setdest 1500.0 440.0 15.0"
$ns at 730.0 "$node_(36) setdest 1500.0 300.0 15.0"
$ns at 765.0 "$node_(36) setdest 1500.0 200.0 15.0"
$ns at 805.0 "$node_(36) setdest 1500.0 100.0 15.0"
$ns at 820.0 "$node_(36) setdest 1500.0 50.0 15.0"

$ns at 26.0 "$node_(37) setdest 7675.0 50.0 15.0" 
$ns at 45.0 "$node_(37) setdest 7675.0 200.0 15.0" 
$ns at 110.0 "$node_(37) setdest 7675.0 350.0 15.0"
$ns at 130.0 "$node_(37) setdest 7675.0 440.0 15.0" 
$ns at 155.0 "$node_(37) setdest 7675.0 440.0 15.0" 
$ns at 180.0 "$node_(37) setdest 7175.0 440.0 15.0" 
$ns at 205.0 "$node_(37) setdest 7125.0 440.0 15.0" 
$ns at 245.0 "$node_(37) setdest 6900.0 440.0 15.0"
$ns at 265.0 "$node_(37) setdest 6200.0 440.0 15.0"
$ns at 315.0 "$node_(37) setdest 4800.0 440.0 15.0"
$ns at 415.0 "$node_(37) setdest 4500.0 440.0 15.0"
$ns at 440.0 "$node_(37) setdest 4300.0 440.0 15.0"
$ns at 460.0 "$node_(37) setdest 4225.0 440.0 15.0"
$ns at 470.0 "$node_(37) setdest 3675.0 440.0 15.0"
$ns at 515.0 "$node_(37) setdest 3275.0 440.0 15.0"
$ns at 550.0 "$node_(37) setdest 3275.0 440.0 15.0"
$ns at 740.0 "$node_(37) setdest 3275.0 600.0 15.0"
$ns at 775.0 "$node_(37) setdest 3275.0 750.0 15.0"
$ns at 790.0 "$node_(37) setdest 3275.0 850.0 15.0"
$ns at 820.0 "$node_(37) setdest 3275.0 950.0 15.0"

$ns at 10.0 "$node_(40) setdest 8250.0 990.0 15.0"
$ns at 20.0 "$node_(40) setdest 8250.0 700.0 15.0"
$ns at 50.0 "$node_(40) setdest 8250.0 550.0 15.0"   
$ns at 70.0 "$node_(40) setdest 8250.0 440.0 15.0" 
$ns at 145.0 "$node_(40) setdest 8200.0 440.0 15.0"
$ns at 155.0 "$node_(40) setdest 8025.0 440.0 15.0" 
$ns at 175.0 "$node_(40) setdest 7725.0 440.0 15.0" 
$ns at 190.0 "$node_(40) setdest 7675.0 300.0 15.0" 
$ns at 200.0 "$node_(40) setdest 7625.0 200.0 15.0" 
$ns at 250.0 "$node_(40) setdest 7675.0 100.0 15.0" 
$ns at 500.0 "$node_(40) setdest 7675.0 50.0 15.0" 

$ns at 26.0 "$node_(41) setdest 7675.0 10.0 15.0" 
$ns at 45.0 "$node_(41) setdest 7625.0 200.0 15.0" 
$ns at 110.0 "$node_(41) setdest 7625.0 300.0 15.0"
$ns at 130.0 "$node_(41) setdest 7625.0 440.0 15.0" 
$ns at 160.0 "$node_(41) setdest 7125.0 700.0 15.0" 
$ns at 200.0 "$node_(41) setdest 7125.0 800.0 15.0" 
$ns at 250.0 "$node_(41) setdest 7125.0 990.0 15.0" 

$ns at 1.0 "$node_(27) setdest 50.0 290.0 15.0" 
$ns at 10.0 "$node_(27) setdest 650.0 290.0 15.0" 
$ns at 60.0 "$node_(27) setdest 1100.0 290.0 15.0"
$ns at 95.0 "$node_(27) setdest 1600.0 290.0 15.0" 
$ns at 135.0 "$node_(27) setdest 1850.0 290.0 15.0" 
$ns at 160.0 "$node_(27) setdest 2025.0 290.0 15.0" 
$ns at 180.0 "$node_(27) setdest 2200.0 290.0 15.0" 
$ns at 200.0 "$node_(27) setdest 2625.0 290.0 15.0" 
$ns at 235.0 "$node_(27) setdest 2975.0 290.0 15.0"
$ns at 265.0 "$node_(27) setdest 3275.0 290.0 15.0"
$ns at 290.0 "$node_(27) setdest 3675.0 290.0 15.0"
$ns at 325.0 "$node_(27) setdest 4225.0 290.0 15.0"
$ns at 365.0 "$node_(27) setdest 4300.0 290.0 15.0"
$ns at 375.0 "$node_(27) setdest 4500.0 290.0 15.0"
$ns at 395.0 "$node_(27) setdest 4800.0 290.0 15.0"
$ns at 420.0 "$node_(27) setdest 6200.0 290.0 15.0"
$ns at 520.0 "$node_(27) setdest 6900.0 290.0 15.0"
$ns at 570.0 "$node_(27) setdest 7125.0 290.0 15.0"
$ns at 590.0 "$node_(27) setdest 7175.0 290.0 15.0"
$ns at 600.0 "$node_(27) setdest 7675.0 290.0 15.0"
$ns at 640.0 "$node_(27) setdest 7725.0 290.0 15.0"
$ns at 650.0 "$node_(27) setdest 8025.0 290.0 15.0"
$ns at 675.0 "$node_(27) setdest 8200.0 290.0 15.0"
$ns at 693.0 "$node_(27) setdest 8250.0 290.0 15.0"
$ns at 700.0 "$node_(27) setdest 9300.0 290.0 15.0"
$ns at 800.0 "$node_(27) setdest 9490.0 290.0 15.0"

$ns at 11.0 "$node_(34) setdest 1500.0 990.0 15.0" 
$ns at 20.0 "$node_(34) setdest 1500.0 700.0 15.0" 
$ns at 70.0 "$node_(34) setdest 1500.0 500.0 15.0"
$ns at 105.0 "$node_(34) setdest 1600.0 290.0 15.0" 
$ns at 145.0 "$node_(34) setdest 1850.0 290.0 15.0" 
$ns at 170.0 "$node_(34) setdest 2025.0 290.0 15.0" 
$ns at 190.0 "$node_(34) setdest 2200.0 290.0 15.0" 
$ns at 210.0 "$node_(34) setdest 2625.0 290.0 15.0" 
$ns at 245.0 "$node_(34) setdest 2975.0 290.0 15.0"
$ns at 275.0 "$node_(34) setdest 3275.0 290.0 15.0"
$ns at 300.0 "$node_(34) setdest 3675.0 290.0 15.0"
$ns at 335.0 "$node_(34) setdest 4225.0 290.0 15.0"
$ns at 375.0 "$node_(34) setdest 4300.0 290.0 15.0"
$ns at 385.0 "$node_(34) setdest 4500.0 290.0 15.0"
$ns at 405.0 "$node_(34) setdest 4800.0 290.0 15.0"
$ns at 430.0 "$node_(34) setdest 6200.0 290.0 15.0"
$ns at 530.0 "$node_(34) setdest 6900.0 290.0 15.0"
$ns at 580.0 "$node_(34) setdest 7125.0 290.0 15.0"
$ns at 600.0 "$node_(34) setdest 7175.0 290.0 15.0"
$ns at 610.0 "$node_(34) setdest 7675.0 290.0 15.0"
$ns at 650.0 "$node_(34) setdest 7725.0 290.0 15.0"
$ns at 660.0 "$node_(34) setdest 8025.0 290.0 15.0"
$ns at 685.0 "$node_(34) setdest 8200.0 290.0 15.0"
$ns at 703.0 "$node_(34) setdest 8250.0 290.0 15.0"
$ns at 710.0 "$node_(34) setdest 9300.0 290.0 15.0"
$ns at 820.0 "$node_(34) setdest 9490.0 290.0 15.0"

$ns at 21.0 "$node_(35) setdest 3175.0 990.0 15.0" 
$ns at 30.0 "$node_(35) setdest 3175.0 800.0 15.0" 
$ns at 80.0 "$node_(35) setdest 3175.0 700.0 15.0"
$ns at 180.0 "$node_(35) setdest 3175.0 600.0 15.0" 
$ns at 120.0 "$node_(35) setdest 3175.0 500.0 15.0" 
$ns at 220.0 "$node_(35) setdest 3175.0 400.0 15.0" 
$ns at 305.0 "$node_(35) setdest 3275.0 290.0 15.0"
$ns at 330.0 "$node_(35) setdest 3675.0 290.0 15.0"
$ns at 365.0 "$node_(35) setdest 4225.0 290.0 15.0"
$ns at 405.0 "$node_(35) setdest 4300.0 290.0 15.0"
$ns at 415.0 "$node_(35) setdest 4500.0 290.0 15.0"
$ns at 435.0 "$node_(35) setdest 4800.0 290.0 15.0"
$ns at 460.0 "$node_(35) setdest 6200.0 290.0 15.0"
$ns at 560.0 "$node_(35) setdest 6900.0 290.0 15.0"
$ns at 610.0 "$node_(35) setdest 7125.0 290.0 15.0"
$ns at 630.0 "$node_(35) setdest 7175.0 290.0 15.0"
$ns at 640.0 "$node_(35) setdest 7675.0 290.0 15.0"
$ns at 680.0 "$node_(35) setdest 7725.0 290.0 15.0"
$ns at 690.0 "$node_(35) setdest 8025.0 290.0 15.0"
$ns at 715.0 "$node_(35) setdest 8200.0 290.0 15.0"
$ns at 733.0 "$node_(35) setdest 8250.0 290.0 15.0"
$ns at 740.0 "$node_(35) setdest 9300.0 290.0 15.0"
$ns at 820.0 "$node_(35) setdest 9490.0 290.0 15.0"

$ns at 16.0 "$node_(38) setdest 1500.0 10.0 15.0" 
$ns at 25.0 "$node_(38) setdest 1500.0 100.0 15.0" 
$ns at 75.0 "$node_(38) setdest 1500.0 200.0 15.0"
$ns at 110.0 "$node_(38) setdest 1600.0 250.0 15.0" 
$ns at 150.0 "$node_(38) setdest 1850.0 250.0 15.0" 
$ns at 175.0 "$node_(38) setdest 2025.0 250.0 15.0" 
$ns at 195.0 "$node_(38) setdest 2200.0 250.0 15.0" 
$ns at 215.0 "$node_(38) setdest 2625.0 250.0 15.0" 
$ns at 250.0 "$node_(38) setdest 2975.0 250.0 15.0"
$ns at 280.0 "$node_(38) setdest 3275.0 250.0 15.0"
$ns at 305.0 "$node_(38) setdest 3675.0 250.0 15.0"
$ns at 340.0 "$node_(38) setdest 4225.0 250.0 15.0"
$ns at 380.0 "$node_(38) setdest 4300.0 250.0 15.0"
$ns at 390.0 "$node_(38) setdest 4500.0 250.0 15.0"
$ns at 410.0 "$node_(38) setdest 4800.0 250.0 15.0"
$ns at 435.0 "$node_(38) setdest 6200.0 250.0 15.0"
$ns at 535.0 "$node_(38) setdest 6900.0 250.0 15.0"
$ns at 585.0 "$node_(38) setdest 7125.0 250.0 15.0"
$ns at 605.0 "$node_(38) setdest 7175.0 250.0 15.0"
$ns at 615.0 "$node_(38) setdest 7675.0 250.0 15.0"
$ns at 655.0 "$node_(38) setdest 7725.0 250.0 15.0"
$ns at 665.0 "$node_(38) setdest 8025.0 250.0 15.0"
$ns at 690.0 "$node_(38) setdest 8200.0 250.0 15.0"
$ns at 708.0 "$node_(38) setdest 8250.0 250.0 15.0"
$ns at 715.0 "$node_(38) setdest 9300.0 250.0 15.0"
$ns at 815.0 "$node_(38) setdest 9490.0 250.0 15.0"

$ns at 26.0 "$node_(39) setdest 3175.0 990.0 15.0" 
$ns at 35.0 "$node_(39) setdest 3175.0 800.0 15.0" 
$ns at 85.0 "$node_(39) setdest 3175.0 700.0 15.0"
$ns at 185.0 "$node_(39) setdest 3175.0 600.0 15.0" 
$ns at 205.0 "$node_(39) setdest 3175.0 500.0 15.0" 
$ns at 225.0 "$node_(39) setdest 3175.0 400.0 15.0" 
$ns at 310.0 "$node_(39) setdest 3275.0 250.0 15.0"
$ns at 335.0 "$node_(39) setdest 3675.0 250.0 15.0"
$ns at 370.0 "$node_(39) setdest 4225.0 250.0 15.0"
$ns at 410.0 "$node_(39) setdest 4300.0 250.0 15.0"
$ns at 420.0 "$node_(39) setdest 4500.0 250.0 15.0"
$ns at 440.0 "$node_(39) setdest 4800.0 250.0 15.0"
$ns at 465.0 "$node_(39) setdest 6200.0 250.0 15.0"
$ns at 565.0 "$node_(39) setdest 6900.0 250.0 15.0"
$ns at 615.0 "$node_(39) setdest 7125.0 250.0 15.0"
$ns at 635.0 "$node_(39) setdest 7175.0 250.0 15.0"
$ns at 645.0 "$node_(39) setdest 7675.0 250.0 15.0"
$ns at 745.0 "$node_(39) setdest 7675.0 150.0 15.0"
$ns at 820.0 "$node_(39) setdest 7675.0 50.0 15.0"

# Set a UDP connection between node (0) and node (1-41)
set udp0 [new Agent/UDP]
$ns attach-agent $node_(0) $udp0
set udp1 [new Agent/UDP]
$ns attach-agent $node_(1) $udp1
set udp2 [new Agent/UDP]
$ns attach-agent $node_(2) $udp2
set udp3 [new Agent/UDP]
$ns attach-agent $node_(3) $udp3
set udp4 [new Agent/UDP]
$ns attach-agent $node_(4) $udp4
set udp5 [new Agent/UDP]
$ns attach-agent $node_(5) $udp5
set udp6 [new Agent/UDP]
$ns attach-agent $node_(6) $udp6
set udp7 [new Agent/UDP]
$ns attach-agent $node_(7) $udp7
set udp8 [new Agent/UDP]
$ns attach-agent $node_(8) $udp8
set udp9 [new Agent/UDP]
$ns attach-agent $node_(9) $udp9
set udp10 [new Agent/UDP]
$ns attach-agent $node_(10) $udp10
set udp11 [new Agent/UDP]
$ns attach-agent $node_(11) $udp11
set udp12 [new Agent/UDP]
$ns attach-agent $node_(12) $udp12
set udp13 [new Agent/UDP]
$ns attach-agent $node_(13) $udp13
set udp14 [new Agent/UDP]
$ns attach-agent $node_(14) $udp14
set udp15 [new Agent/UDP]
$ns attach-agent $node_(15) $udp15
set udp16 [new Agent/UDP]
$ns attach-agent $node_(16) $udp16
set udp17 [new Agent/UDP]
$ns attach-agent $node_(17) $udp17
set udp18 [new Agent/UDP]
$ns attach-agent $node_(18) $udp18
set udp19 [new Agent/UDP]
$ns attach-agent $node_(19) $udp19
set udp20 [new Agent/UDP]
$ns attach-agent $node_(20) $udp20
set udp21 [new Agent/UDP]
$ns attach-agent $node_(21) $udp21
set udp22 [new Agent/UDP]
$ns attach-agent $node_(22) $udp22
set udp23 [new Agent/UDP]
$ns attach-agent $node_(23) $udp23
set udp24 [new Agent/UDP]
$ns attach-agent $node_(24) $udp24
set udp25 [new Agent/UDP]
$ns attach-agent $node_(25) $udp25
set udp26 [new Agent/UDP]
$ns attach-agent $node_(26) $udp26
set udp27 [new Agent/UDP]
$ns attach-agent $node_(27) $udp27
set udp28 [new Agent/UDP]
$ns attach-agent $node_(28) $udp28
set udp29 [new Agent/UDP]
$ns attach-agent $node_(29) $udp29
set udp30 [new Agent/UDP]
$ns attach-agent $node_(30) $udp30
set udp31 [new Agent/UDP]
$ns attach-agent $node_(31) $udp31
set udp32 [new Agent/UDP]
$ns attach-agent $node_(32) $udp32
set udp33 [new Agent/UDP]
$ns attach-agent $node_(33) $udp33
set udp34 [new Agent/UDP]
$ns attach-agent $node_(34) $udp34
set udp35 [new Agent/UDP]
$ns attach-agent $node_(35) $udp35
set udp36 [new Agent/UDP]
$ns attach-agent $node_(36) $udp36
set udp37 [new Agent/UDP]
$ns attach-agent $node_(37) $udp37
set udp38 [new Agent/UDP]
$ns attach-agent $node_(38) $udp38
set udp39 [new Agent/UDP]
$ns attach-agent $node_(39) $udp39
set udp40 [new Agent/UDP]
$ns attach-agent $node_(40) $udp40
set udp41 [new Agent/UDP]
$ns attach-agent $node_(41) $udp41
$ns connect $udp0 $udp1 
$ns connect $udp0 $udp2 
$ns connect $udp0 $udp3
$ns connect $udp0 $udp4
$ns connect $udp0 $udp5
$ns connect $udp0 $udp6
$ns connect $udp0 $udp7
$ns connect $udp0 $udp8
$ns connect $udp0 $udp9
$ns connect $udp0 $udp10
$ns connect $udp0 $udp11
$ns connect $udp0 $udp12
$ns connect $udp0 $udp13
$ns connect $udp0 $udp14
$ns connect $udp0 $udp15
$ns connect $udp0 $udp16
$ns connect $udp0 $udp17
$ns connect $udp0 $udp18
$ns connect $udp0 $udp19

Agent/UDP instproc process_data {size data} {
    global ns
    $self instvar node_

    # note in the trace file that the packet was received
    $ns trace-annotate "[$node_ node-addr] received {$data}"

}

set fp [open "runtime.txt" r]
set flist [split [read $fp] \n];#each line of your file is a list element
close $fp
foreach pair $flist {
   set pair [string map {, " "} $pair] ;#change "," to " "
   set [lindex $pair 0] [lindex $pair 1] ;# eg set Ryan 3453
}
for {set m1 0} {$m1 < 60} {incr m1} {
    for {set m2 0} {$m2 < 60} {incr m2} {
      for {set m3 0} {$m2 < 100} {incr m3} {
        incr l 1
        #$ns at $m1.$m2 "$udp0 send 500 pos"
        $ns at $m1.$m2.$m3 "$udp0 send 500  Xpos=$xpos($l)"
        $ns at $m1.$m2.$m3 "$udp0 send 500  Ypos=$ypos($l)"
        

       
    }
}

# Define node initial position in nam
for {set i 0} {$i <$val(nn)} { incr i } {

# 42 defines the node size for nam
$ns initial_node_pos $node_($i) 42
}

# Telling nodes when the simulation ends
for {set i 0} {$i <$val(nn) } { incr i } {
$ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 820.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run
