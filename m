Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23283E4090
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 08:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjmyc6CVPz2yxF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 16:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qB9cCEjA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qB9cCEjA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjmxp1vWgz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 16:53:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1796YM4w061259; Mon, 9 Aug 2021 02:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=lp/rvYZCHDMYkiRNy2uzwQrXCvNzwrRbdw+bzG8OubQ=;
 b=qB9cCEjAzWx0QnRn1P2hCiet3Pl4tnIax+6sq86qBq0aGC7SX2ybBgRFVQklDxf9uzQm
 IMp+gnRCMda84G3eAwutu+XwGJUeXqk8+QBpTvB3qbAvyjFE9FV33bbynk8tgTe4je+J
 dMQTHhBkw/wl4YzIXeNlQYzlP1vzHbryuJ3BYl7MxB/feqwL9LXRThEgN0tuLV5DKhuf
 ZiRxQe5xeq/kxs/3iDNzotxPVr9pi5Dm47vX96IsGKL3bQ4IzFUCjd/jTx6CznxYswTP
 JDADWjP9HAaV/xsAReNPQLi6wgwfX7U/0x78Ejv5++eity1QXgTsL8rnHeISSexZka33 7A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aaa1qkx83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 02:52:47 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1796q5Yv031617;
 Mon, 9 Aug 2021 06:52:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3a9ht8k3jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 06:52:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1796qgDr47579514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 06:52:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 429AAAE045;
 Mon,  9 Aug 2021 06:52:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE1DFAE058;
 Mon,  9 Aug 2021 06:52:36 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 06:52:36 +0000 (GMT)
Date: Mon, 9 Aug 2021 12:22:35 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for
 non-online nodes
Message-ID: <20210809065235.GH4072958@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com>
 <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com>
 <20210723143914.GI3836887@linux.vnet.ibm.com>
 <87h7g09bgg.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87h7g09bgg.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HAZZ2GyltbDjCpYUDPkWra9TUfwp9X2V
X-Proofpoint-ORIG-GUID: HAZZ2GyltbDjCpYUDPkWra9TUfwp9X2V
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090052
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
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Valentin Schneider <valentin.schneider@arm.com> [2021-08-08 16:56:47]:

>
> A bit late, but technically the week isn't over yet! :D
>
> On 23/07/21 20:09, Srikar Dronamraju wrote:
> > * Valentin Schneider <valentin.schneider@arm.com> [2021-07-13 17:32:14]:
> >> Now, let's take examples from your cover letter:
> >>
> >>   node distances:
> >>   node   0   1   2   3   4   5   6   7
> >>     0:  10  20  40  40  40  40  40  40
> >>     1:  20  10  40  40  40  40  40  40
> >>     2:  40  40  10  20  40  40  40  40
> >>     3:  40  40  20  10  40  40  40  40
> >>     4:  40  40  40  40  10  20  40  40
> >>     5:  40  40  40  40  20  10  40  40
> >>     6:  40  40  40  40  40  40  10  20
> >>     7:  40  40  40  40  40  40  20  10
> >>
> >> But the system boots with just nodes 0 and 1, thus only this distance
> >> matrix is valid:
> >>
> >>   node   0   1
> >>     0:  10  20
> >>     1:  20  10
> >>
> >> topology_span_sane() is going to use tl->mask(cpu), and as you reported the
> >> NODE topology level should cause issues. Let's assume all offline nodes say
> >> they're 10 distance away from everyone else, and that we have one CPU per
> >> node. This would give us:
> >>
> >
> > No,
> > All offline nodes would be at a distance of 10 from node 0 only.
> > So here node distance of all offline nodes from node 1 would be 20.
> >
> >>   NODE->mask(0) == 0,2-7
> >>   NODE->mask(1) == 1-7
> >
> > so
> >
> > NODE->mask(0) == 0,2-7
> > NODE->mask(1) should be 1
> > and NODE->mask(2-7) == 0,2-7
> >
>
> Ok, so that shouldn't trigger the warning.

Yes not at this point, but later on when we online a node.

>
> >>
> >> The intersection is 2-7, we'll trigger the WARN_ON().
> >> Now, with the above snippet, we'll check if that intersection covers any
> >> online CPU. For sched_init_domains(), cpu_map is cpu_active_mask, so we'd
> >> end up with an empty intersection and we shouldn't warn - that's the theory
> >> at least.
> >
> > Now lets say we onlined CPU 3 and node 3 which was at a actual distance
> > of 20 from node 0.
> >
> > (If we only consider online CPUs, and since scheduler masks like
> > sched_domains_numa_masks arent updated with offline CPUs,)
> > then
> >
> > NODE->mask(0) == 0
> > NODE->mask(1) == 1
> > NODE->mask(3) == 0,3
> >
>
> Wait, doesn't the distance matrix (without any offline node) say
>
>   distance(0, 3) == 40
>
> ? We should have at the very least:
>
>   node   0   1   2   3
>     0:  10  20  ??  40
>     1:  20  20  ??  40
>     2:  ??  ??  ??  ??
>     3:  40  40  ??  10
>

Before onlining node 3 and CPU 3 (node/CPU 0 and 1 are already online)
Note: Node 2-7 and CPU 2-7 are still offline.

node   0   1   2   3
  0:  10  20  40  10
  1:  20  20  40  10
  2:  40  40  10  10
  3:  10  10  10  10

NODE->mask(0) == 0
NODE->mask(1) == 1
NODE->mask(2) == 0
NODE->mask(3) == 0

Note: This is with updating Node 2's distance as 40 for figuring out
the number of numa levels. Since we have all possible distances, we
dont update Node 3 distance, so it will be as if its local to node 0.

Now when Node 3 and CPU 3 are onlined
Note: Node 2, 3-7 and CPU 2, 3-7 are still offline.

node   0   1   2   3
  0:  10  20  40  40
  1:  20  20  40  40
  2:  40  40  10  40
  3:  40  40  40  10

NODE->mask(0) == 0
NODE->mask(1) == 1
NODE->mask(2) == 0
NODE->mask(3) == 0,3

CPU 0 continues to be part of Node->mask(3) because when we online and
we find the right distance, there is no API to reset the numa mask of
3 to remove CPU 0 from the numa masks.

If we had an API to clear/set sched_domains_numa_masks[node][] when
the node state changes, we could probably plug-in to clear/set the
node masks whenever node state changes.


> Regardless, NODE->mask(x) is sched_domains_numa_masks[0][x], if
>
>   distance(0,3) > LOCAL_DISTANCE
>
> then
>
>   node0 ??? NODE->mask(3)
>
> > cpumask_and(intersect, tl->mask(cpu), tl->mask(i));
> > if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) && cpumask_intersects(intersect, cpu_map))
> >
> > cpu_map is 0,1,3
> > intersect is 0
> >
> > From above NODE->mask(0) is !equal to NODE->mask(1) and
> > cpumask_intersects(intersect, cpu_map) is also true.
> >
> > I picked Node 3 since if Node 1 is online, we would have faked distance
> > for Node 2 to be at distance of 40.
> >
> > Any node from 3 to 7, we would have faced the same problem.
> >
> >>
> >> Looking at sd_numa_mask(), I think there's a bug with topology_span_sane():
> >> it doesn't run in the right place wrt where sched_domains_curr_level is
> >> updated. Could you try the below on top of the previous snippet?
> >>
> >> If that doesn't help, could you share the node distances / topology masks
> >> that lead to the WARN_ON()? Thanks.
> >>
> >> ---
> >> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> >> index b77ad49dc14f..cda69dfa4065 100644
> >> --- a/kernel/sched/topology.c
> >> +++ b/kernel/sched/topology.c
> >> @@ -1516,13 +1516,6 @@ sd_init(struct sched_domain_topology_level *tl,
> >>      int sd_id, sd_weight, sd_flags = 0;
> >>      struct cpumask *sd_span;
> >>
> >> -#ifdef CONFIG_NUMA
> >> -	/*
> >> -	 * Ugly hack to pass state to sd_numa_mask()...
> >> -	 */
> >> -	sched_domains_curr_level = tl->numa_level;
> >> -#endif
> >> -
> >>      sd_weight = cpumask_weight(tl->mask(cpu));
> >>
> >>      if (tl->sd_flags)
> >> @@ -2131,7 +2124,12 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> >>
> >>              sd = NULL;
> >>              for_each_sd_topology(tl) {
> >> -
> >> +#ifdef CONFIG_NUMA
> >> +			/*
> >> +			 * Ugly hack to pass state to sd_numa_mask()...
> >> +			 */
> >> +			sched_domains_curr_level = tl->numa_level;
> >> +#endif
> >>                      if (WARN_ON(!topology_span_sane(tl, cpu_map, i)))
> >>                              goto error;
> >>
> >>
> >
> > I tested with the above patch too. However it still not helping.
> >
> > Here is the log from my testing.
> >
> > At Boot.
> >
> > (Do remember to arrive at sched_max_numa_levels we faked the
> > numa_distance of node 1 to be at 20 from node 0. All other offline
> > nodes are at a distance of 10 from node 0.)
> >
>
> [...]
>
> > ( First addition of a CPU to a non-online node esp node whose node
> > distance was not faked.)
> >
> > numactl -H
> > available: 3 nodes (0,5,7)
> > node 0 cpus: 0 1 2 3 4 5 6 7
> > node 0 size: 0 MB
> > node 0 free: 0 MB
> > node 5 cpus: 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 32 33 34 35 40 41 42 43 48 49 50 51 56 57 58 59 64 65 66 67 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87
> > node 5 size: 32038 MB
> > node 5 free: 29024 MB
> > node 7 cpus: 88 89 90 91 92 93 94 95
> > node 7 size: 0 MB
> > node 7 free: 0 MB
> > node distances:
> > node   0   5   7
> >   0:  10  40  40
> >   5:  40  10  20
> >   7:  40  20  10
> > ------------------------------------------------------------------
> > grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
> > ------------------------------------------------------------------
> > awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
> > ==================================================================
> >
> > I had added a debug patch to dump some variables that may help to
> > understand the problem
> > ------------------->8--------------------------------------------8<----------
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 5e1abd9a8cc5..146f59381bcc 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -2096,7 +2096,8 @@ static bool topology_span_sane(struct sched_domain_topology_level *tl,
> >               cpumask_and(intersect, tl->mask(cpu), tl->mask(i));
> >               if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) &&
> >                   cpumask_intersects(intersect, cpu_map)) {
> > -			pr_err("name=%s mask(%d/%d)=%*pbl mask(%d/%d)=%*pbl", tl->name, cpu, cpu_to_node(cpu), cpumask_pr_args(tl->mask(cpu)), i, cpu_to_node(i), cpumask_pr_args(tl->mask(i)));
> > +			pr_err("name=%s mask(%d/%d)=%*pbl mask(%d/%d)=%*pbl numa-level=%d curr_level=%d", tl->name, cpu, cpu_to_node(cpu), cpumask_pr_args(tl->mask(cpu)), i, cpu_to_node(i), cpumask_pr_args(tl->mask(i)), tl->numa_level, sched_domains_curr_level);
> > +			pr_err("intersect=%*pbl cpu_map=%*pbl", cpumask_pr_args(intersect), cpumask_pr_args(cpu_map));
> >                       return false;
> >               }
> >       }
> > ------------------->8--------------------------------------------8<----------
> >
> > From dmesg:
> >
> > [  167.626915] name=NODE mask(0/0)=0-7 mask(88/7)=0-7,88 numa-level=0 curr_level=0    <-- hunk above
> > [  167.626925] intersect=0-7 cpu_map=0-19,24-27,32-35,40-43,48-51,56-59,64-67,72-88
>
> > [  168.026621] name=NODE mask(0/0)=0-7 mask(88/7)=0-7,88-89 numa-level=0 curr_level=0
> > [  168.026626] intersect=0-7 cpu_map=0-19,24-27,32-35,40-43,48-51,56-59,64-67,72-89
> >
>
> Ok so to condense the info, we have:
>
>   node   0   5   7
>     0:  10  40  40
>     5:  40  10  20
>     7:  40  20  10
>
>   node0: 0-7
>   node5: 8-29, 32-35, 40-43, 48-51, 56-59, 64-67, 72-87
>   node7: 88-95
>
> With the above distance map, we should have
>
>   node->mask(cpu0) == 0-7
>   node->mask(cpu8) == 8-29, 32-35, 40-43, 48-51, 56-59, 64-67, 72-87
>   node->mask(cpu88) == 88-95
>

Yes. this is what we should have and

node->mask(cpu0) == 0-7
node->mask(cpu8) == 8-29, 32-35, 40-43, 48-51, 56-59, 64-67, 72-87
node->mask(cpu88) == 0-7, 88-95

this is what we get.


> (this is sched_domains_numa_masks[0][CPUx], and
> sched_domains_numa_distance[0] == LOCAL_DISTANCE, thus the mask of CPUs
> LOCAL_DISTANCE away from CPUx).
>
> For some reason you end up with node0 being part of node7's NODE
> mask. Neither nodes are offline, and per the above distance table that
> shouldn't happen.
>
> > Now this keeps repeating.
> >
> > I know I have mentioned this before. (So sorry for repeating)
>
> It can't hurt to reformulate ;)
>
> > Generally on Power node distance is not populated for offline nodes.
> > However to arrive at sched_max_numa_levels, we thought of faking few
> > node distances. In the above case, we faked distance of node 1 as 20
> > (from node 0) node 5 was already at distance of 40 from node 0.
> >
>
> Right, again that gives us the right set of unique distances (10, 20, 40).
>
> > So when sched_domains_numa_masks_set is called to update sd_numa_mask or
> > sched_domains_numa_masks, all CPUs under node 0 get updated for node 2
> > too. (since node 2 is shown as at a local distance from node 0). Do
> > look at the node mask of CPU 88 in the dmesg. It should have been 88,
> > however its 0-7,88 where 0-7 are coming from node 0.
> >
> > Even if we skip updation of sched_domains_numa_masks for offline nodes,
> > on online of a node (i.e when we get the correct node distance), we have
> > to update the sched_domains_numa_masks to ensure CPUs that were already
> > present within a certain distance and skipped are added back. And this
> > was what I tried to do in my patch.
> >
>
> Ok, so it looks like we really can't do without that part - even if we get
> "sensible" distance values for the online nodes, we can't divine values for
> the offline ones.
>

Yes

--
Thanks and Regards
Srikar Dronamraju
