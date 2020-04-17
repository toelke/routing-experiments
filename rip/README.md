# RIP routing protocol

With this protocol, router broadcast their routing table to other routers on
request. The routing tables are updated if a shorter path (counted by hops) is
received.

Run this using `docker-compose up`.

It starts the following network:

![network topology](images/network.png)

The routing daemons are all configured the same, they communicate over all
network interfaces and update their routing table accordingly.

There is also one "client" started ("ab1") that does not run the routing
daemon but can be used to test by adding the routers "a" or "b" as default
route and then pinging "c"-"e".

Note: Since this is a circular net, sometimes RIP finds asymmetric routes.
That means that packets going from router 1 to router 2 go another way than
packets going from router 2 to router 1. Linux filters packets arriving from
the "wrong" interface by default. Run `echo 2 >
/proc/sys/net/ipv4/conf/all/rp_filter` in all network namespaces
(privileged!) to allow asymmetric routes.

## Useful commands

To plot the network as it is defined in the `docker-compose.yml`: `docker run --rm -it --name dcv -v %CD%:/input pmsipilot/docker-compose-viz render -m image docker-compose.yml`

To get a graphviz file of the network routes, use the `./plot` script. It generates a plot like this:

![routing plot](images/routes.png)

Each router is shown as an ellipse with all its IP addresses and arrows point to routers, annotated by the prefix being routed that way.
