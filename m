Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A883738E882
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 16:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpfQs50BCz2xb1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 00:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FpfQW2sSSz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 00:16:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F5BED1;
 Mon, 24 May 2021 07:16:15 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 696243F719;
 Mon, 24 May 2021 07:16:13 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
In-Reply-To: <20210521092830.GF2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
 <20210521023802.GE2633526@linux.vnet.ibm.com>
 <YKdr0g6+eIHncqej@hirez.programming.kicks-ass.net>
 <20210521092830.GF2633526@linux.vnet.ibm.com>
Date: Mon, 24 May 2021 15:16:09 +0100
Message-ID: <87k0no6wuu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/05/21 14:58, Srikar Dronamraju wrote:
> * Peter Zijlstra <peterz@infradead.org> [2021-05-21 10:14:10]:
>
>> On Fri, May 21, 2021 at 08:08:02AM +0530, Srikar Dronamraju wrote:
>> > * Peter Zijlstra <peterz@infradead.org> [2021-05-20 20:56:31]:
>> >
>> > > On Thu, May 20, 2021 at 09:14:25PM +0530, Srikar Dronamraju wrote:
>> > > > Currently scheduler populates the distance map by looking at distance
>> > > > of each node from all other nodes. This should work for most
>> > > > architectures and platforms.
>> > > >
>> > > > However there are some architectures like POWER that may not expose
>> > > > the distance of nodes that are not yet onlined because those resources
>> > > > are not yet allocated to the OS instance. Such architectures have
>> > > > other means to provide valid distance data for the current platform.
>> > > >
>> > > > For example distance info from numactl from a fully populated 8 node
>> > > > system at boot may look like this.
>> > > >
>> > > > node distances:
>> > > > node   0   1   2   3   4   5   6   7
>> > > >   0:  10  20  40  40  40  40  40  40
>> > > >   1:  20  10  40  40  40  40  40  40
>> > > >   2:  40  40  10  20  40  40  40  40
>> > > >   3:  40  40  20  10  40  40  40  40
>> > > >   4:  40  40  40  40  10  20  40  40
>> > > >   5:  40  40  40  40  20  10  40  40
>> > > >   6:  40  40  40  40  40  40  10  20
>> > > >   7:  40  40  40  40  40  40  20  10
>> > > >
>> > > > However the same system when only two nodes are online at boot, then the
>> > > > numa topology will look like
>> > > > node distances:
>> > > > node   0   1
>> > > >   0:  10  20
>> > > >   1:  20  10
>> > > >
>> > > > It may be implementation dependent on what node_distance(0,3) where
>> > > > node 0 is online and node 3 is offline. In POWER case, it returns
>> > > > LOCAL_DISTANCE(10). Here at boot the scheduler would assume that the max
>> > > > distance between nodes is 20. However that would not be true.
>> > > >
>> > > > When Nodes are onlined and CPUs from those nodes are hotplugged,
>> > > > the max node distance would be 40.
>> > > >
>> > > > To handle such scenarios, let scheduler allow architectures to populate
>> > > > the distance map. Architectures that like to populate the distance map
>> > > > can overload arch_populate_distance_map().
>> > >
>> > > Why? Why can't your node_distance() DTRT? The arch interface is
>> > > nr_node_ids and node_distance(), I don't see why we need something new
>> > > and then replace one special use of it.
>> > >
>> > > By virtue of you being able to actually implement this new hook, you
>> > > supposedly can actually do node_distance() right too.
>> >
>> > Since for an offline node, arch interface code doesn't have the info.
>> > As far as I know/understand, in POWER, unless there is an active memory or
>> > CPU that's getting onlined, arch can't fetch the correct node distance.
>> >
>> > Taking the above example: node 3 is offline, then node_distance of (3,X)
>> > where X is anything other than 3, is not reliable. The moment node 3 is
>> > onlined, the node distance is reliable.
>> >
>> > This problem will not happen even on POWER if all the nodes have either
>> > memory or CPUs active at the time of boot.
>>
>> But then how can you implement this new hook? Going by the fact that
>> both nr_node_ids and distance_ref_points_depth are fixed, how many
>> possible __node_distance() configurations are there left?
>>
>
> distance_ref_point_depth is provided as a different property and is readily
> available at boot. The new api will use just use that. So based on the
> distance_ref_point_depth, we know all possible node distances for that
> platform.
>
> For an offline node, we don't have that specific nodes distance_lookup_table
> array entries. Each array would be of distance_ref_point_depth entries.
> Without the distance_lookup_table for an array populated, we will not be
> able to tell how far the node is with respect to other nodes.
>
> We can lookup the correct distance_lookup_table for a node based on memory
> or the CPUs attached to that node. Since in an offline node, both of them
> would not be around, the distance_lookup_table will have stale values.
>

Ok so from your arch you can figure out the *size* of the set of unique
distances, but not the individual node_distance(a, b)... That's quite
unfortunate.

I suppose one way to avoid the hook would be to write some "fake" distance
values into your distance_lookup_table[] for offline nodes using your
distance_ref_point_depth thing, i.e. ensure an iteration of
node_distance(a, b) covers all distance values [1]. You can then keep patch
3 around, and that should roughly be it.


>> The example provided above does not suggest there's much room for
>> alternatives, and hence for actual need of this new interface.
>>
>
> --
> Thanks and Regards
> Srikar Dronamraju
