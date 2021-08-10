Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F543E5962
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 13:48:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkWSF3hCHz3bXp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 21:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBBNzoW/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bBBNzoW/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkWRX2g9Tz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 21:48:08 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ABWk3G004313; Tue, 10 Aug 2021 07:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=ApVcNwceqGXJmfSMdPYdvLweguMTt0ucvPKAQ3SXbFo=;
 b=bBBNzoW/Hd/etl4YCQb3xRCDwvEMYNWcHS0VyytegqmVmfW6m10RVleN8EplcJqGKbMW
 w2orF8Y+kiBi9QW7oRsGbZ4+4w8Z2fzZFHldHtthCXrBabD1LCVHLMvNMzwXuG/1FFIk
 rLprWcHnsGsfAgw8SGzte7YEwMBiuzhR/bO05NYSJsdOP+x6rIevB3iq7ksM6+1ExPnw
 wVgU41MVMWP2lNyUxNVCZwBJy1eO7TZ1Fg9EJazu3QPdrlSN9pIgRYF//yIwFYzO0UwS
 3tGtIfun0Z6SMMk5lUa+PWd/EQ/52yHxM4lyfjbEOR3MbEeJl9hr7EWss8VYa0dFO/1F Sg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abk4ps643-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 07:47:38 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17ABgcjU008433;
 Tue, 10 Aug 2021 11:47:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3a9ht8na1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 11:47:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17ABiL0q58917238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 11:44:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2B554C063;
 Tue, 10 Aug 2021 11:47:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98B7F4C073;
 Tue, 10 Aug 2021 11:47:28 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 10 Aug 2021 11:47:28 +0000 (GMT)
Date: Tue, 10 Aug 2021 17:17:27 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for
 non-online nodes
Message-ID: <20210810114727.GB21942@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com>
 <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com>
 <20210723143914.GI3836887@linux.vnet.ibm.com>
 <87h7g09bgg.mognet@arm.com>
 <20210809065235.GH4072958@linux.vnet.ibm.com>
 <875yweaig9.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <875yweaig9.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g5tXX57lGmLT7rAbdaAJwiw-rARi1j1C
X-Proofpoint-GUID: g5tXX57lGmLT7rAbdaAJwiw-rARi1j1C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_05:2021-08-10,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100073
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

* Valentin Schneider <valentin.schneider@arm.com> [2021-08-09 13:52:38]:

> On 09/08/21 12:22, Srikar Dronamraju wrote:
> > * Valentin Schneider <valentin.schneider@arm.com> [2021-08-08 16:56:47]:
> >> Wait, doesn't the distance matrix (without any offline node) say
> >>
> >>   distance(0, 3) == 40
> >>
> >> ? We should have at the very least:
> >>
> >>   node   0   1   2   3
> >>     0:  10  20  ??  40
> >>     1:  20  20  ??  40
> >>     2:  ??  ??  ??  ??
> >>     3:  40  40  ??  10
> >>
> >
> > Before onlining node 3 and CPU 3 (node/CPU 0 and 1 are already online)
> > Note: Node 2-7 and CPU 2-7 are still offline.
> >
> > node   0   1   2   3
> >   0:  10  20  40  10
> >   1:  20  20  40  10
> >   2:  40  40  10  10
> >   3:  10  10  10  10
> >
> > NODE->mask(0) == 0
> > NODE->mask(1) == 1
> > NODE->mask(2) == 0
> > NODE->mask(3) == 0
> >
> > Note: This is with updating Node 2's distance as 40 for figuring out
> > the number of numa levels. Since we have all possible distances, we
> > dont update Node 3 distance, so it will be as if its local to node 0.
> >
> > Now when Node 3 and CPU 3 are onlined
> > Note: Node 2, 3-7 and CPU 2, 3-7 are still offline.
> >
> > node   0   1   2   3
> >   0:  10  20  40  40
> >   1:  20  20  40  40
> >   2:  40  40  10  40
> >   3:  40  40  40  10
> >
> > NODE->mask(0) == 0
> > NODE->mask(1) == 1
> > NODE->mask(2) == 0
> > NODE->mask(3) == 0,3
> >
> > CPU 0 continues to be part of Node->mask(3) because when we online and
> > we find the right distance, there is no API to reset the numa mask of
> > 3 to remove CPU 0 from the numa masks.
> >
> > If we had an API to clear/set sched_domains_numa_masks[node][] when
> > the node state changes, we could probably plug-in to clear/set the
> > node masks whenever node state changes.
> >
> 
> Gotcha, this is now coming back to me...
> 
> [...]
> 
> >> Ok, so it looks like we really can't do without that part - even if we get
> >> "sensible" distance values for the online nodes, we can't divine values for
> >> the offline ones.
> >>
> >
> > Yes
> >
> 
> Argh, while your approach does take care of the masks, it leaves
> sched_numa_topology_type unchanged. You *can* force an update of it, but
> yuck :(
> 
> I got to the below...
> 

Yes, I completely missed that we should update sched_numa_topology_type.


> ---
> From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Date: Thu, 1 Jul 2021 09:45:51 +0530
> Subject: [PATCH 1/1] sched/topology: Skip updating masks for non-online nodes
> 
> The scheduler currently expects NUMA node distances to be stable from init
> onwards, and as a consequence builds the related data structures
> once-and-for-all at init (see sched_init_numa()).
> 
> Unfortunately, on some architectures node distance is unreliable for
> offline nodes and may very well change upon onlining.
> 
> Skip over offline nodes during sched_init_numa(). Track nodes that have
> been onlined at least once, and trigger a build of a node's NUMA masks when
> it is first onlined post-init.
> 

Your version is much much better than mine.
And I have verified that it works as expected.


> Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>  kernel/sched/topology.c | 65 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index b77ad49dc14f..cba95793a9b7 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1482,6 +1482,8 @@ int				sched_max_numa_distance;
>  static int			*sched_domains_numa_distance;
>  static struct cpumask		***sched_domains_numa_masks;
>  int __read_mostly		node_reclaim_distance = RECLAIM_DISTANCE;
> +
> +static unsigned long __read_mostly *sched_numa_onlined_nodes;
>  #endif
> 
>  /*
> @@ -1833,6 +1835,16 @@ void sched_init_numa(void)
>  			sched_domains_numa_masks[i][j] = mask;
> 
>  			for_each_node(k) {
> +				/*
> +				 * Distance information can be unreliable for
> +				 * offline nodes, defer building the node
> +				 * masks to its bringup.
> +				 * This relies on all unique distance values
> +				 * still being visible at init time.
> +				 */
> +				if (!node_online(j))
> +					continue;
> +
>  				if (sched_debug() && (node_distance(j, k) != node_distance(k, j)))
>  					sched_numa_warn("Node-distance not symmetric");
> 
> @@ -1886,6 +1898,53 @@ void sched_init_numa(void)
>  	sched_max_numa_distance = sched_domains_numa_distance[nr_levels - 1];
> 
>  	init_numa_topology_type();
> +
> +	sched_numa_onlined_nodes = bitmap_alloc(nr_node_ids, GFP_KERNEL);
> +	if (!sched_numa_onlined_nodes)
> +		return;
> +
> +	bitmap_zero(sched_numa_onlined_nodes, nr_node_ids);
> +	for_each_online_node(i)
> +		bitmap_set(sched_numa_onlined_nodes, i, 1);
> +}
> +
> +void __sched_domains_numa_masks_set(unsigned int node)
> +{
> +	int i, j;
> +
> +	/*
> +	 * NUMA masks are not built for offline nodes in sched_init_numa().
> +	 * Thus, when a CPU of a never-onlined-before node gets plugged in,
> +	 * adding that new CPU to the right NUMA masks is not sufficient: the
> +	 * masks of that CPU's node must also be updated.
> +	 */
> +	if (test_bit(node, sched_numa_onlined_nodes))
> +		return;
> +
> +	bitmap_set(sched_numa_onlined_nodes, node, 1);
> +
> +	for (i = 0; i < sched_domains_numa_levels; i++) {
> +		for (j = 0; j < nr_node_ids; j++) {
> +			if (!node_online(j) || node == j)
> +				continue;
> +
> +			if (node_distance(j, node) > sched_domains_numa_distance[i])
> +				continue;
> +
> +			/* Add remote nodes in our masks */
> +			cpumask_or(sched_domains_numa_masks[i][node],
> +				   sched_domains_numa_masks[i][node],
> +				   sched_domains_numa_masks[0][j]);
> +		}
> +	}
> +
> +	/*
> +	 * A new node has been brought up, potentially changing the topology
> +	 * classification.
> +	 *
> +	 * Note that this is racy vs any use of sched_numa_topology_type :/
> +	 */
> +	init_numa_topology_type();
>  }
> 
>  void sched_domains_numa_masks_set(unsigned int cpu)
> @@ -1893,8 +1952,14 @@ void sched_domains_numa_masks_set(unsigned int cpu)
>  	int node = cpu_to_node(cpu);
>  	int i, j;
> 
> +	__sched_domains_numa_masks_set(node);
> +
>  	for (i = 0; i < sched_domains_numa_levels; i++) {
>  		for (j = 0; j < nr_node_ids; j++) {
> +			if (!node_online(j))
> +				continue;
> +
> +			/* Set ourselves in the remote node's masks */
>  			if (node_distance(j, node) <= sched_domains_numa_distance[i])
>  				cpumask_set_cpu(cpu, sched_domains_numa_masks[i][j]);
>  		}
> -- 
> 2.25.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
