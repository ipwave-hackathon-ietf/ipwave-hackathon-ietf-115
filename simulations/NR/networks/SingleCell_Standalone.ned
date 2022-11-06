// 
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
// 
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself, 
// and cannot be removed from it.
// 
package simu5g.simulations.NR.networks;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.ethernet.Eth10G;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import simu5g.common.binder.Binder;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Upf;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.NR.NRUe;
import simu5g.nodes.backgroundCell.BackgroundCell;
import simu5g.world.radio.LteChannelControl;
import inet.node.inet.AdhocHost;
import simu5g.DroneAODVRouter1;
import simu5g.DroneHost;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import simu5g.Dest;
import simu5g.MissionBase;


// SingleCell_standalone
//
// This network represents the deployment option 3 in 3GPP 38.801
//
network SingleCell_Standalone
{
    parameters:
        //int numUe = default(1);
        //int numBgCells = default(0);
        int numdrones;
        int numdst;

        @display("bgb=600,400");

    submodules:
        drone[numdrones]: DroneAODVRouter1 {
            parameters:
                @display("p=292.24,48.332;r=30,,#707070");
        }
        radioMedium: RadioMedium {
            @display("p=91,35");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=89.92,107.904;is=s");
        }
        gcs: AdhocHost {
            @display("i=device/antennatower_vl;r=150,,#707070;p=91,200");
        }
        configurator: Ipv4NetworkConfigurator {
            config = xml("<config><interface hosts='*' address='192.168.0.x' netmask='255.255.255.0'/></config>");
            @display("p=91,300");
        }
        dst[numdst]: Dest {
            @display("i=misc/town;r=,,#707070;p=472.08,210.188");
        }
        bstion[4]: MissionBase {
            @display("i=dronesim/bstation;p=307,339");
        }
        visualizer: IntegratedVisualizer {
            @display("p=130.384,445.104");
        }


}
