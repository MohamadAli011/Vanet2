# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     38                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1440                      ;# X dimension of topography
set val(y)      700                      ;# Y dimension of topography
set val(stop)   70.0                         ;# time of simulation end

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
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
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
#Create 38 nodes
set n0 [$ns node]
$n0 set X_ 350
$n0 set Y_ 102
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 100
$n1 set Y_ 100
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 600
$n2 set Y_ 100
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 850
$n3 set Y_ 100
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 100
$n4 set Y_ 300
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 98
$n5 set Y_ 603
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 362
$n6 set Y_ 297
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 400
$n7 set Y_ 601
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 601
$n8 set Y_ 301
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 600
$n9 set Y_ 599
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 850
$n10 set Y_ 601
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 659
$n11 set Y_ 200
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 173
$n12 set Y_ 100
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 35
$n13 set Y_ 104
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 219
$n14 set Y_ 96
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 99
$n15 set Y_ 174
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 97
$n16 set Y_ 238
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 99
$n17 set Y_ 468
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 161
$n18 set Y_ 600
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 101
$n19 set Y_ 540
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20
set n20 [$ns node]
$n20 set X_ 398
$n20 set Y_ 302
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20
set n21 [$ns node]
$n21 set X_ 347
$n21 set Y_ 188
$n21 set Z_ 0.0
$ns initial_node_pos $n21 20
set n22 [$ns node]
$n22 set X_ 377
$n22 set Y_ 370
$n22 set Z_ 0.0
$ns initial_node_pos $n22 20
set n23 [$ns node]
$n23 set X_ 471
$n23 set Y_ 599
$n23 set Z_ 0.0
$ns initial_node_pos $n23 20
set n24 [$ns node]
$n24 set X_ 325
$n24 set Y_ 603
$n24 set Z_ 0.0
$ns initial_node_pos $n24 20
set n25 [$ns node]
$n25 set X_ 677
$n25 set Y_ 603
$n25 set Z_ 0.0
$ns initial_node_pos $n25 20
set n26 [$ns node]
$n26 set X_ 601
$n26 set Y_ 530
$n26 set Z_ 0.0
$ns initial_node_pos $n26 20
set n27 [$ns node]
$n27 set X_ 601
$n27 set Y_ 453
$n27 set Z_ 0.0
$ns initial_node_pos $n27 20
set n28 [$ns node]
$n28 set X_ 435
$n28 set Y_ 104
$n28 set Z_ 0.0
$ns initial_node_pos $n28 20
set n29 [$ns node]
$n29 set X_ 703
$n29 set Y_ 100
$n29 set Z_ 0.0
$ns initial_node_pos $n29 20
set n30 [$ns node]
$n30 set X_ 853
$n30 set Y_ 238
$n30 set Z_ 0.0
$ns initial_node_pos $n30 20
set n31 [$ns node]
$n31 set X_ 851
$n31 set Y_ 426
$n31 set Z_ 0.0
$ns initial_node_pos $n31 20
set n32 [$ns node]
$n32 set X_ 853
$n32 set Y_ 348
$n32 set Z_ 0.0
$ns initial_node_pos $n32 20
set n33 [$ns node]
$n33 set X_ 97
$n33 set Y_ 693
$n33 set Z_ 0.0
$ns initial_node_pos $n33 20
set n34 [$ns node]
$n34 set X_ 971
$n34 set Y_ 600
$n34 set Z_ 0.0
$ns initial_node_pos $n34 20
set n35 [$ns node]
$n35 set X_ 992
$n35 set Y_ 104
$n35 set Z_ 0.0
$ns initial_node_pos $n35 20
set n36 [$ns node]
$n36 set X_ 852
$n36 set Y_ 708
$n36 set Z_ 0.0
$ns initial_node_pos $n36 20
set n37 [$ns node]
$n37 set X_ 601
$n37 set Y_ 704
$n37 set Z_ 0.0
$ns initial_node_pos $n37 20

#===================================
#        Generate movement          
#===================================
$ns at 0,1 " $n0 setdest 400 500 40 " 
$ns at 0,1 " $n1 setdest 600 100 20 " 
$ns at 0,1 " $n2 setdest 850 100 30 " 
$ns at 0,1 " $n3 setdest 850 600 20 " 
$ns at 0,1 " $n4 setdest 100 600 20 " 
$ns at 0,1 " $n5 setdest 850 600 30 " 
$ns at 0,1 " $n6 setdest 400 600 25 "  
$ns at 0,1 " $n7 setdest 350 100 30 " 
$ns at 0,1 " $n8 setdest 600 600 30 " 
$ns at 0,1 " $n9 setdest 600 100 30 " 
$ns at 0,1 " $n10 setdest 100 600 30 " 
$ns at 0,1 " $n12 setdest 850 100 30 " 
$ns at 0,1 " $n13 setdest 350 100 30 " 
$ns at 0,1 " $n14 setdest 600 100 25 " 
$ns at 0,1 " $n15 setdest 100 600 30 "  
$ns at 0,1 " $n16 setdest 100 600 20 "  
$ns at 0,1 " $n17 setdest 100 100 20 " 
$ns at 0,1 " $n18 setdest 600 600 30 "  
$ns at 0,1 " $n19 setdest 100 100 30 " 
$ns at 0,1 " $n20 setdest 600 300 30 " 
$ns at 0,1 " $n21 setdest 400 600 30 "  
$ns at 0,1 " $n22 setdest 400 600 25 " 
$ns at 0,1 " $n23 setdest 850 600 30 " 
$ns at 0,1 " $n24 setdest 600 600 20 "  
$ns at 0,1 " $n25 setdest 100 600 30 " 
$ns at 0,1 " $n26 setdest 600 100 30 " 
$ns at 0,1 " $n27 setdest 600 100 30 " 
$ns at 0,1 " $n28 setdest 850 100 30 " 
$ns at 0,1 " $n29 setdest 850 100 20 " 
$ns at 0,1 " $n30 setdest 850 600 30 " 
$ns at 0,1 " $n31 setdest 850 600 30 " 
$ns at 0,1 " $n32 setdest 850 100 30 " 
$ns at 0,1 " $n33 setdest 100 100 30 " 
$ns at 0,1 " $n34 setdest 100 600 30 " 
$ns at 0,2 " $n35 setdest 100 100 15 " 
$ns at 0,1 " $n36 setdest 850 100 25 " 
$ns at 0,1 " $n37 setdest 600 100 30 "


$ns at 15 " $n4 setdest 600 600 25 " 
$ns at 14,3 " $n15 setdest 600 600 30 "
$ns at 18 " $n16 setdest 600 600 20 " 
$ns at 9,3 " $n22 setdest 600 600 25 " 
$ns at 12,4 " $n6 setdest 600 600 25 "
$ns at 14 " $n21 setdest 600 600 30 "

$ns at 20,7 " $n21 setdest 600 100 30 "
$ns at 13,8 " $n24 setdest 600 100 20 "
$ns at 35,1 " $n4 setdest 600 100 20 " 
$ns at 43,2 " $n16 setdest 660 100 20 "  
$ns at 14,7 " $n18 setdest 700 600 25 "
$ns at 10 " $n8 setdest 100 600 30 "

#===================================
#        Agents Definition        
#===================================

#===================================
#        Applications Definition        
#===================================

#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
