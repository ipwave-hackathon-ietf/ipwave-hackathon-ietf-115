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
import simu5g.nodes.NR.NRDrone;
import simu5g.nodes.backgroundCell.BackgroundCell;
import simu5g.world.radio.LteChannelControl;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import simu5g.Dest;
import simu5g.MissionBase;
import inet.node.inet.AdhocHost;
import simu5g.DroneAODVRouter1;
import simu5g.DroneHost;


// SingleCell_standalone
//
// This network represents the deployment option 3 in 3GPP 38.801
//
network CANA
{
    parameters:
        int numDrones;
        int numdst;
        int numBgCells = default(0);
        //int numBgCells = default(0);
        @display("i=block/network2;bgb=826,558;bgi=background/pisa");
    submodules:
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=50,125");
        }
        binder: Binder {
            @display("p=50,175;is=s");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=50.993748,258.7;is=s");
        }
        server: StandardHost {
            @display("p=212,118;is=n;i=device/server");
        }
        router: Router {
            @display("p=363.175,115.66875;i=device/smallrouter");
        }
        upf: Upf {
            @display("p=527.35,116.9125");
        }
        iUpf: Upf {
            @display("p=725,118");
        }
        gnb: gNodeB {
            @display("p=565.372,314.72;is=vl");
        }
        drone[numDrones]: NRDrone {
            @display("p=443.97998,452.972");
        }
        dst[numdst]: Dest {
            @display("i=misc/town;r=,,#707070;p=472.08,210.188");
        }
        bstion[4]: MissionBase {
            @display("i=dronesim/bstation;p=307,339");
        }
        bgCell[numBgCells]: BackgroundCell {
            @display("p=211.312,345.068;is=vl");
        }
        visualizer: IntegratedVisualizer {
            @display("p=238,39");
        }
    connections:
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;
        upf.pppg++ <--> Eth10G <--> iUpf.pppg++;
        iUpf.pppg++ <--> Eth10G <--> gnb.ppp;
}
