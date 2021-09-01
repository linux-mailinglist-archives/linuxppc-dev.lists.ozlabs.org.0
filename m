Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59C3FD796
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 12:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H00Wb5yhZz2yMx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 20:23:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r6AnKkBp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r6AnKkBp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H00Vl52fWz2xsJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 20:22:39 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181A2wUn178204; Wed, 1 Sep 2021 06:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=+/8/jvsC5y8xk6OD2UtcCuPugQAZY/HqEKJVVFPMIEg=;
 b=r6AnKkBpguTMSD06TDAuF6wEWb+uI9/s94By3S2cJIIFB/cHHQEjFv72viasFApS+09b
 fYuBHti4nAn9ZeO3er8f13kFvptPfeAp2A0rJo0df/HLg/bRHSwEK9haFGVtzeQa819Y
 DKWf1CaLvXctG5/8HNo4phjuPuW5UXsfBbJSLQ9U46TnKH95uZ6wP+HKgSCsL8/NQJCb
 1rou62QTxTZK1Z2SgVLjqKodXOZAOtbE70nvUhgpDh9wj367k7C39Aeg0xFWAmtlYuD1
 gjTTjFnV9v/JgJ5DRE5rI60NB7ye9k5e3HDlglVZsKMpLUaD/+nAWri+p4KiiYXxomed eA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at7ctrv53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 06:22:18 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181AL3Fr026876;
 Wed, 1 Sep 2021 10:22:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3aqcs97e3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:22:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181AMCiC56557832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 10:22:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05508AE06C;
 Wed,  1 Sep 2021 10:22:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A08EAE064;
 Wed,  1 Sep 2021 10:22:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  1 Sep 2021 10:22:07 +0000 (GMT)
Date: Wed, 1 Sep 2021 15:52:06 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/numa: Fill distance_lookup_table for
 offline nodes
Message-ID: <20210901102206.GO21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
 <875yvsba4q.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <875yvsba4q.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: axX2JPiVRHCrM7aJIlHXLU6Qi_7K22in
X-Proofpoint-GUID: axX2JPiVRHCrM7aJIlHXLU6Qi_7K22in
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_03:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010058
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2021-08-26 23:36:53]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Scheduler expects unique number of node distances to be available at
> > boot.
> 
> I think it needs "the number of unique node distances" ?
> 
> > It uses node distance to calculate this unique node distances.
> 
> It iterates over all pairs of nodes and records node_distance() for that
> pair, and then calculates the set of unique distances.
> 
> > On POWER, node distances for offline nodes is not available. However,
> > POWER already knows unique possible node distances.
> 
> I think it would be more accurate to say PAPR rather than POWER there.
> It's PAPR that defines the way we determine distances and imposes that
> limitation.
> 

Okay, will do all the necessary modifications as suggested above.

> > Fake the offline node's distance_lookup_table entries so that all
> > possible node distances are updated.
> 
> Does this work if we have a single node offline at boot?
> 

It should.

> Say we start with:
> 
> node distances:
> node   0   1
>   0:  10  20
>   1:  20  10
> 
> And node 2 is offline at boot. We can only initialise that nodes entries
> in the distance_lookup_table:
> 
> 		while (i--)
> 			distance_lookup_table[node][i] = node;
> 
> By filling them all with 2 that causes node_distance(2, X) to return the
> maximum distance for all other nodes X, because we won't break out of
> the loop in __node_distance():
> 
> 	for (i = 0; i < distance_ref_points_depth; i++) {
> 		if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
> 			break;
> 
> 		/* Double the distance for each NUMA level */
> 		distance *= 2;
> 	}
> 
> If distance_ref_points_depth was 4 we'd return 160.

As you already know, distance 10, 20, .. are defined by Powerpc, form1
affinity. PAPR doesn't define actual distances, it only provides us the
associativity. If there are distance_ref_points_depth is 4,
(distance_ref_points_depth doesn't take local distance into consideration)
10, 20, 40, 80, 160.

> 
> That'd leave us with 3 unique distances at boot, 10, 20, 160.
> 

So if there are unique distances, then the distances as per the current
code has to be 10, 20, 40, 80.. I dont see a way in which we have a break in
the series. like having 160 without 80.

> But when node 2 comes online it might introduce more than 1 new distance
> value, eg. it could be that the actual distances are:
> 
> node distances:
> node   0   1   2
>   0:  10  20  40
>   1:  20  10  80
>   2:  40  80  10
> 
> ie. we now have 4 distances, 10, 20, 40, 80.
> 
> What am I missing?
> 

As I said above, I am not sure how we can have a break in the series.
If distance_ref_points_depth is 3, the distances has to be 10,20,40,80 as
atleast for form1 affinity.

> > However this only needs to be done if the number of unique node
> > distances that can be computed for online nodes is less than the
> > number of possible unique node distances as represented by
> > distance_ref_points_depth.
> 
> Looking at a few machines they all have distance_ref_points_depth = 2.
> 
> So maybe that explains it, in practice we only see 10, 20, 40.
> 
> > When the node is actually onlined, distance_lookup_table will be
> > updated with actual entries.
> 
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Valentin Schneider <valentin.schneider@arm.com>
> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> > Cc: Laurent Dufour <ldufour@linux.ibm.com>
> > Cc: kernel test robot <lkp@intel.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/mm/numa.c | 70 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >
> > Changelog:
> > v1: https://lore.kernel.org/linuxppc-dev/20210701041552.112072-3-srikar@linux.vnet.ibm.com/t/#u
> > [ Fixed a missing prototype warning Reported-by: kernel test robot <lkp@intel.com>]
> >
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 3c124928a16d..0ee79a08c9e1 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -856,6 +856,75 @@ void __init dump_numa_cpu_topology(void)
> >  	}
> >  }
> >  
> > +/*
> > + * Scheduler expects unique number of node distances to be available at
> > + * boot. It uses node distance to calculate this unique node distances. On
> > + * POWER, node distances for offline nodes is not available. However, POWER
> > + * already knows unique possible node distances. Fake the offline node's
> > + * distance_lookup_table entries so that all possible node distances are
> > + * updated.
> > + */
> 
> > +static void __init fake_update_distance_lookup_table(void)
> > +{
> > +	unsigned long distance_map;
> > +	int i, nr_levels, nr_depth, node;
> 
> Are they distances, depths, or levels? :)
> 
> Bit more consistency in the variable names might make the code easier to
> follow.
> 
> > +
> > +	if (!numa_enabled)
> > +		return;
> > +
> > +	if (!form1_affinity)
> > +		return;
> 
> That doesn't exist since Aneesh's FORM2 series, so that will need a
> rebase, and possibly some more rework to interact with that series.
> 

We only have to handle for form1, so it should be easier to handle.

> > +	/*
> > +	 * distance_ref_points_depth lists the unique numa domains
> > +	 * available. However it ignore LOCAL_DISTANCE. So add +1
> > +	 * to get the actual number of unique distances.
> > +	 */
> > +	nr_depth = distance_ref_points_depth + 1;
> 
> num_depths would be a better name IMHO.

Okay,
s/nr_depth/num_depths/g
s/nr_level/depth/g

> 
> > +
> > +	WARN_ON(nr_depth > sizeof(distance_map));
> 
> Warn but then continue, and corrupt something on the stack? Seems like a
> bad idea :)
> 
> I guess it's too early to use bitmap_alloc(). But can we at least return
> if nr_depth is too big.

Yes, we can't use bitmap_alloc here.
Now should we continue if nr_depth is greater than sizeof(distance_map)

If we don't and return immediately, then we can end up not creating enough
scheduler domains and may later on lead to build_sched_domain OOPs, when we
online nodes.

However if don't return, chance of surviving when the domains are actually
onlined is more.
We could probably reset nr_depth to be same as sizeof(distance_map).

That said, I think we are too far away from nr_depths being anywhere closer
to sizeof(long). So I am okay either way.

> 
> > +
> > +	bitmap_zero(&distance_map, nr_depth);
> > +	bitmap_set(&distance_map, 0, 1);
> > +
> > +	for_each_online_node(node) {
> > +		int nd, distance = LOCAL_DISTANCE;
> > +
> > +		if (node == first_online_node)
> > +			continue;
> > +
> > +		nd = __node_distance(node, first_online_node);
> > +		for (i = 0; i < nr_depth; i++, distance *= 2) {
> 
> 		for (i = 0, distance = LOCAL_DISTANCE; i < nr_depth; i++, distance *= 2) {
> 
> Could make it clearer what the for loop is doing I think.
> 
> > +			if (distance == nd) {
> > +				bitmap_set(&distance_map, i, 1);
> > +				break;
> > +			}
> > +		}
> > +		nr_levels = bitmap_weight(&distance_map, nr_depth);
> > +		if (nr_levels == nr_depth)
> > +			return;
> > +	}
> > +
> > +	for_each_node(node) {
> > +		if (node_online(node))
> > +			continue;
> > +
> > +		i = find_first_zero_bit(&distance_map, nr_depth);
> > +		if (i >= nr_depth || i == 0) {
> 
> Neither of those can happen can they?
> 
> We checked the bitmap weight in the previous for loop, or at the bottom
> of this one, and returned if we'd filled the map already.
> 
> And we set bit zero explicitly with bitmap_set().
> 

Agree, I can drop the hunk.

> > +			pr_warn("Levels(%d) not matching levels(%d)", nr_levels, nr_depth);
> > +			return;
> > +		}


> > +
> > +		bitmap_set(&distance_map, i, 1);
> > +		while (i--)
> > +			distance_lookup_table[node][i] = node;
> 
> That leaves distance_lookup_table[node][i+1] and so on uninitialised, or
> initialised to zero because it's static, is that OK?

Yes, this should be fine, because we are only interested in finding number
of unique numa distances, By the time actual distances come and overwrite,
we would no more use these fake distances.

But if you are comfortable with updating for all the depths, I can update
too.

> 
> > +		nr_levels = bitmap_weight(&distance_map, nr_depth);
> > +		if (nr_levels == nr_depth)
> > +			return;
> > +	}
> > +}
> > +
> >  /* Initialize NODE_DATA for a node on the local memory */
> >  static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> >  {
> > @@ -971,6 +1040,7 @@ void __init mem_topology_setup(void)
> >  		 */
> >  		numa_setup_cpu(cpu);
> >  	}
> > +	fake_update_distance_lookup_table();
> >  }
> >  
> >  void __init initmem_init(void)
> 
> 
> cheers

-- 
Thanks and Regards
Srikar Dronamraju
