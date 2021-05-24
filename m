Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C5438F159
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 18:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpj8Z2yRDz3bt1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 02:19:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O8CYlEV0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O8CYlEV0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpj823f2nz2yXF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 02:18:57 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OG4Ffv189870; Mon, 24 May 2021 12:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=2d4e+3UO/K9UI/YB0ZF8+Z/WO9yD6abs1KYQ7dFMXb0=;
 b=O8CYlEV0D8Z761W1lYFy7C9JY4jp/0HsEe1ZQ2DvFjKGcVQIo6yMUVuPTGGAA1TSCagp
 UFydmyF/21ZDxvoK8+I77xhcmwwyJTFuLxhXZEVmC0E2xY9h7COqL6i4wwav9YVOrZ0i
 0xbRcmoZAqCbWV1SnhLUkMWctbyP+yMt9DfcfgJr/HVqAmnSkcZ/8+r2tFpA+M1lKuBn
 Jl49A5tG+7xbcGFsyf4Pus1CEJr3zpygP56N0TpJ+rkzXXqdFBEdU6daKpLMZi6Aa8oi
 FgCuJMhOPkN2DEMiamz8zrAfr3UaqP4opRO/OSGQMaz0zxkwyz8Cg7Ad4V4nucXOD2n4 mg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rew3192v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 12:18:38 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14OFsfDc004021;
 Mon, 24 May 2021 16:18:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 38ps7h8g0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 16:18:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14OGIXkb33292674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 16:18:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A14DA4040;
 Mon, 24 May 2021 16:18:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97F56A4057;
 Mon, 24 May 2021 16:18:30 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 24 May 2021 16:18:30 +0000 (GMT)
Date: Mon, 24 May 2021 21:48:29 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <20210524161829.GL2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
 <20210521023802.GE2633526@linux.vnet.ibm.com>
 <YKdr0g6+eIHncqej@hirez.programming.kicks-ass.net>
 <20210521092830.GF2633526@linux.vnet.ibm.com>
 <87k0no6wuu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87k0no6wuu.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y8gn98C9zQO3run0PiewUUxKxZfhEkxT
X-Proofpoint-GUID: y8gn98C9zQO3run0PiewUUxKxZfhEkxT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_08:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=875 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105240096
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Valentin Schneider <valentin.schneider@arm.com> [2021-05-24 15:16:09]:

> On 21/05/21 14:58, Srikar Dronamraju wrote:
> > * Peter Zijlstra <peterz@infradead.org> [2021-05-21 10:14:10]:
> >
> >> On Fri, May 21, 2021 at 08:08:02AM +0530, Srikar Dronamraju wrote:
> >> > * Peter Zijlstra <peterz@infradead.org> [2021-05-20 20:56:31]:
> >> >
> >> > > On Thu, May 20, 2021 at 09:14:25PM +0530, Srikar Dronamraju wrote:
> >> > > > Currently scheduler populates the distance map by looking at distance
> >> > > > of each node from all other nodes. This should work for most
> >> > > > architectures and platforms.
> >> > > >
> >> > > > However there are some architectures like POWER that may not expose
> >> > > > the distance of nodes that are not yet onlined because those resources
> >> > > > are not yet allocated to the OS instance. Such architectures have
> >> > > > other means to provide valid distance data for the current platform.
> >> > > >
> >> > > > For example distance info from numactl from a fully populated 8 node
> >> > > > system at boot may look like this.
> >> > > >
> >> > > > node distances:
> >> > > > node   0   1   2   3   4   5   6   7
> >> > > >   0:  10  20  40  40  40  40  40  40
> >> > > >   1:  20  10  40  40  40  40  40  40
> >> > > >   2:  40  40  10  20  40  40  40  40
> >> > > >   3:  40  40  20  10  40  40  40  40
> >> > > >   4:  40  40  40  40  10  20  40  40
> >> > > >   5:  40  40  40  40  20  10  40  40
> >> > > >   6:  40  40  40  40  40  40  10  20
> >> > > >   7:  40  40  40  40  40  40  20  10
> >> > > >
> >> > > > However the same system when only two nodes are online at boot, then the
> >> > > > numa topology will look like
> >> > > > node distances:
> >> > > > node   0   1
> >> > > >   0:  10  20
> >> > > >   1:  20  10
> >> > > >
> >> > > > It may be implementation dependent on what node_distance(0,3) where
> >> > > > node 0 is online and node 3 is offline. In POWER case, it returns
> >> > > > LOCAL_DISTANCE(10). Here at boot the scheduler would assume that the max
> >> > > > distance between nodes is 20. However that would not be true.
> >> > > >
> >> > > > When Nodes are onlined and CPUs from those nodes are hotplugged,
> >> > > > the max node distance would be 40.
> >> > > >
> >> > > > To handle such scenarios, let scheduler allow architectures to populate
> >> > > > the distance map. Architectures that like to populate the distance map
> >> > > > can overload arch_populate_distance_map().
> >> > >
> >> > > Why? Why can't your node_distance() DTRT? The arch interface is
> >> > > nr_node_ids and node_distance(), I don't see why we need something new
> >> > > and then replace one special use of it.
> >> > >
> >> > > By virtue of you being able to actually implement this new hook, you
> >> > > supposedly can actually do node_distance() right too.
> >> >
> >> > Since for an offline node, arch interface code doesn't have the info.
> >> > As far as I know/understand, in POWER, unless there is an active memory or
> >> > CPU that's getting onlined, arch can't fetch the correct node distance.
> >> >
> >> > Taking the above example: node 3 is offline, then node_distance of (3,X)
> >> > where X is anything other than 3, is not reliable. The moment node 3 is
> >> > onlined, the node distance is reliable.
> >> >
> >> > This problem will not happen even on POWER if all the nodes have either
> >> > memory or CPUs active at the time of boot.
> >>
> >> But then how can you implement this new hook? Going by the fact that
> >> both nr_node_ids and distance_ref_points_depth are fixed, how many
> >> possible __node_distance() configurations are there left?
> >>
> >
> > distance_ref_point_depth is provided as a different property and is readily
> > available at boot. The new api will use just use that. So based on the
> > distance_ref_point_depth, we know all possible node distances for that
> > platform.
> >
> > For an offline node, we don't have that specific nodes distance_lookup_table
> > array entries. Each array would be of distance_ref_point_depth entries.
> > Without the distance_lookup_table for an array populated, we will not be
> > able to tell how far the node is with respect to other nodes.
> >
> > We can lookup the correct distance_lookup_table for a node based on memory
> > or the CPUs attached to that node. Since in an offline node, both of them
> > would not be around, the distance_lookup_table will have stale values.
> >
> 
> Ok so from your arch you can figure out the *size* of the set of unique
> distances, but not the individual node_distance(a, b)... That's quite
> unfortunate.

Yes, thats true.

> 
> I suppose one way to avoid the hook would be to write some "fake" distance
> values into your distance_lookup_table[] for offline nodes using your
> distance_ref_point_depth thing, i.e. ensure an iteration of
> node_distance(a, b) covers all distance values [1]. You can then keep patch
> 3 around, and that should roughly be it.
> 

Yes, this would suffice but to me its not very clean.
static int found[distance_ref_point_depth];

for_each_node(node){
	int i, nd, distance = LOCAL_DISTANCE;
		goto out;

	nd = node_distance(node, first_online_node)
	for (i=0; i < distance_ref_point_depth; i++, distance *= 2) {
		if (node_online) {
			if (distance != nd)
				continue;
			found[i] ++;
			break;
		}
		if (found[i])
			continue;
		distance_lookup_table[node][i] = distance_lookup_table[first_online_node][i];
		found[i] ++;
		break;
	}
}

But do note: We are setting a precedent for node distance between two nodes
to change.


> 
> >> The example provided above does not suggest there's much room for
> >> alternatives, and hence for actual need of this new interface.
> >>
> >
> > --
> > Thanks and Regards
> > Srikar Dronamraju

-- 
Thanks and Regards
Srikar Dronamraju
