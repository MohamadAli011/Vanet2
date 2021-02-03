
set val(chan)       Channel/WirelessChannel     ;# channel type
set val(prop)       Propagation/TwoRayGround    ;# radio-propagation model
set val(netif)      Phy/WirelessPhy             ;# network interface type
set val(mac)        Mac/802_11                  ;# MAC type
set val(ifq)        Queue/DropTail/PriQueue     ;# interface queue type
set val(ll)         LL                          ;# link layer type
set val(ant)        Antenna/OmniAntenna         ;# antenna model
set val(ifqlen)     100                         ;# max packet in ifq
set val(nn)         4                          ;# number of mobilenodes
set val(rp)         AODV                        ;# routing protocol
set val(x)          100                        ;# X dimension of topography
set val(y)          100                         ;# Y dimension of topography
set val(stop)       20                         ;# time of simulation end
set val(wormholes)  1
#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open good.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open good.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#Create 2 nodes
# peletakan lokasi node
set n0 [$ns node]
$n0 set X_ 5 #transjakarta 1
$n0 set Y_ 40
$n0 set Z_ 0.0
$ns initial_node_pos $n0 10

set n1 [$ns node]
$n1 set X_ 200 #ragunan (190)
$n1 set Y_ 40
$n1 set Z_ 0.0
$ns initial_node_pos $n1 10

set n2 [$ns node]
$n2 set X_ 400 #ragunan-deptan(525)
$n2 set Y_ 40
$n2 set Z_ 0.0
$ns initial_node_pos $n2 10
$n2 set ll_(0)
$ns initial_node_pos $n2 10	
$ns at 0.01 "$n2 label \"wormhole1\""

set n3 [$ns node]
$n3 set X_ 600 #deptan 1 (1050)
$n3 set Y_ 40
$n3 set Z_ 0.0
$ns initial_node_pos $n3 10


#set n4 [$ns node]
#$n4 set X_ 120 #smk 57  (225)
#$n4 set Y_ 40
#$n4 set Z_ 0.0
#$ns initial_node_pos $n4 10
#set n5 [$ns node]
#$n5 set X_ 150 #jatipadang 2 (350)
#$n5 set Y_ 40
#$n5 set Z_ 0.0
#$ns initial_node_pos $n5 10
#set n6 [$ns node]
#$n6 set X_ 180 #pejaten 3 (550)
#$n6 set Y_ 40
#$n6 set Z_ 0.0
#$ns initial_node_pos $n6 10
#set n7 [$ns node]
#$n7 set X_ 210 #buncit indah (225)
#$n7 set Y_ 40
#$n7 set Z_ 0.0
#$ns initial_node_pos $n7 10
#set n8 [$ns node]
#$n8 set X_ 240 #buncit indah-warung jati (350)
#$n8 set Y_ 40
#$n8 set Z_ 0.0
#$n8 set ll_(0)
#$ns initial_node_pos $n8 10	
#$ns at 0.01 "$n8 label \"wormhole1\""

#set n9 [$ns node]
#$n9 set X_ 270 #warung jati(700)
#$n9 set Y_ 40
#$n9 set Z_ 0.0
#$ns initial_node_pos $n9 10


#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set null1 [new Agent/Null]
$ns attach-agent $n3 $null1
$ns connect $udp0 $null1
$udp0 set packetSize_ 1500

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 0.0 "$cbr0 start"
$ns at 10.0 "$cbr0 stop"

#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam good.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i address?"
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
