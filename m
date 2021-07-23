Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DAA3D3BE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 16:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWX6W6HFcz30Nc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 00:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZAUH5IEA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZAUH5IEA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWX5v4tKdz308y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 00:39:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NEX175056143; Fri, 23 Jul 2021 10:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=fKX4zNXgaGJKAPHkX+VvD2qjMshr2LD1fraA+Czoeko=;
 b=ZAUH5IEASoDeRfr+OzCNBjKD2kELB7tGi5zzy7rc+vw/M9Cxx+X7U/IuTxCtQy/ru47a
 Ze3lAYzQGVaD7yIIMYohicsOFtvTtpp97AwguP6MuTjOInlpaO07+Ad3kNDGXo8Ydfat
 tfZdy56Tm7ASCHqxnQw5510+XbD1yvH1JZBxNQ765FyKqcOGS9/BUNCulk9CXg5VTR26
 vZFkIAo5qUfNcJVZESNFDwmsOkZXPiH3LiIuKb97HlG33XgT31lS5UBCSatJpmt/WX2v
 glmH8PKBI5UOspK1+HF2pJk7O+RpSAmVCRM/2n3+0yhzo+6CBnpC0wPou63Ssv4WWozs SA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yygv8hmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 10:39:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16NEXGT6030071;
 Fri, 23 Jul 2021 14:39:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 39xhx4997m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 14:39:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16NEdJaV37028096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 14:39:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA794C040;
 Fri, 23 Jul 2021 14:39:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B08D4C04A;
 Fri, 23 Jul 2021 14:39:15 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 23 Jul 2021 14:39:15 +0000 (GMT)
Date: Fri, 23 Jul 2021 20:09:14 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for
 non-online nodes
Message-ID: <20210723143914.GI3836887@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com>
 <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87zguqmay9.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Wa-xcP-Wm7AVpsaMsZjSqtAxKW1JuKUT
X-Proofpoint-GUID: Wa-xcP-Wm7AVpsaMsZjSqtAxKW1JuKUT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_08:2021-07-23,
 2021-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107230087
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

* Valentin Schneider <valentin.schneider@arm.com> [2021-07-13 17:32:14]:

> On 12/07/21 18:18, Srikar Dronamraju wrote:
> > Hi Valentin,
> >
> >> On 01/07/21 09:45, Srikar Dronamraju wrote:
> >> > @@ -1891,12 +1894,30 @@ void sched_init_numa(void)
> >> >  void sched_domains_numa_masks_set(unsigned int cpu)
> >> >  {
> >
> > Unfortunately this is not helping.
> > I tried this patch alone and also with 2/2 patch of this series where
> > we update/fill fake topology numbers. However both cases are still failing.
> >
> 
> Thanks for testing it.
> 
> 
> Now, let's take examples from your cover letter:
> 
>   node distances:
>   node   0   1   2   3   4   5   6   7
>     0:  10  20  40  40  40  40  40  40
>     1:  20  10  40  40  40  40  40  40
>     2:  40  40  10  20  40  40  40  40
>     3:  40  40  20  10  40  40  40  40
>     4:  40  40  40  40  10  20  40  40
>     5:  40  40  40  40  20  10  40  40
>     6:  40  40  40  40  40  40  10  20
>     7:  40  40  40  40  40  40  20  10
> 
> But the system boots with just nodes 0 and 1, thus only this distance
> matrix is valid:
> 
>   node   0   1
>     0:  10  20
>     1:  20  10
> 
> topology_span_sane() is going to use tl->mask(cpu), and as you reported the
> NODE topology level should cause issues. Let's assume all offline nodes say
> they're 10 distance away from everyone else, and that we have one CPU per
> node. This would give us:
> 

No,
All offline nodes would be at a distance of 10 from node 0 only.
So here node distance of all offline nodes from node 1 would be 20.

>   NODE->mask(0) == 0,2-7
>   NODE->mask(1) == 1-7

so 

NODE->mask(0) == 0,2-7
NODE->mask(1) should be 1
and NODE->mask(2-7) == 0,2-7

> 
> The intersection is 2-7, we'll trigger the WARN_ON().
> Now, with the above snippet, we'll check if that intersection covers any
> online CPU. For sched_init_domains(), cpu_map is cpu_active_mask, so we'd
> end up with an empty intersection and we shouldn't warn - that's the theory
> at least.

Now lets say we onlined CPU 3 and node 3 which was at a actual distance
of 20 from node 0.

(If we only consider online CPUs, and since scheduler masks like
sched_domains_numa_masks arent updated with offline CPUs,)
then

NODE->mask(0) == 0
NODE->mask(1) == 1
NODE->mask(3) == 0,3

cpumask_and(intersect, tl->mask(cpu), tl->mask(i));
if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) && cpumask_intersects(intersect, cpu_map))

cpu_map is 0,1,3
intersect is 0

From above NODE->mask(0) is !equal to NODE->mask(1) and
cpumask_intersects(intersect, cpu_map) is also true.

I picked Node 3 since if Node 1 is online, we would have faked distance
for Node 2 to be at distance of 40.

Any node from 3 to 7, we would have faced the same problem.

> 
> Looking at sd_numa_mask(), I think there's a bug with topology_span_sane():
> it doesn't run in the right place wrt where sched_domains_curr_level is
> updated. Could you try the below on top of the previous snippet?
> 
> If that doesn't help, could you share the node distances / topology masks
> that lead to the WARN_ON()? Thanks.
> 
> ---
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index b77ad49dc14f..cda69dfa4065 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1516,13 +1516,6 @@ sd_init(struct sched_domain_topology_level *tl,
>  	int sd_id, sd_weight, sd_flags = 0;
>  	struct cpumask *sd_span;
> 
> -#ifdef CONFIG_NUMA
> -	/*
> -	 * Ugly hack to pass state to sd_numa_mask()...
> -	 */
> -	sched_domains_curr_level = tl->numa_level;
> -#endif
> -
>  	sd_weight = cpumask_weight(tl->mask(cpu));
> 
>  	if (tl->sd_flags)
> @@ -2131,7 +2124,12 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> 
>  		sd = NULL;
>  		for_each_sd_topology(tl) {
> -
> +#ifdef CONFIG_NUMA
> +			/*
> +			 * Ugly hack to pass state to sd_numa_mask()...
> +			 */
> +			sched_domains_curr_level = tl->numa_level;
> +#endif
>  			if (WARN_ON(!topology_span_sane(tl, cpu_map, i)))
>  				goto error;
> 
> 

I tested with the above patch too. However it still not helping.

Here is the log from my testing.

At Boot.

(Do remember to arrive at sched_max_numa_levels we faked the
numa_distance of node 1 to be at 20 from node 0. All other offline
nodes are at a distance of 10 from node 0.)

numactl -H
available: 2 nodes (0,5)
node 0 cpus: 0 1 2 3 4 5 6 7
node 0 size: 0 MB
node 0 free: 0 MB
node 5 cpus:
node 5 size: 32038 MB
node 5 free: 29367 MB
node distances:
node   0   5
  0:  10  40
  5:  40  10
------------------------------------------------------------------
grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
/sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
/sys/kernel/debug/sched/domains/cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_CPUCAPACITY SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
/sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
/sys/kernel/debug/sched/domains/cpu0/domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
------------------------------------------------------------------
awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
domain0 00000055
domain0 000000aa
domain1 000000ff
==================================================================

(After performing smt mode switch to 1 and adding 2 additional small cores.
(We always add 2 small cores at a time.))

numactl -H
available: 2 nodes (0,5)
node 0 cpus: 0
node 0 size: 0 MB
node 0 free: 0 MB
node 5 cpus: 8 9 10 11 12 13 14 15
node 5 size: 32038 MB
node 5 free: 29389 MB
node distances:
node   0   5
  0:  10  40
  5:  40  10
------------------------------------------------------------------
grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
/sys/kernel/debug/sched/domains/cpu0/domain0/name:NUMA
/sys/kernel/debug/sched/domains/cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_SERIALIZE SD_OVERLAP SD_NUMA
------------------------------------------------------------------
awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
domain0 0000ff00
domain0 0000ff01
domain1 0000ff01
==================================================================

<snipped for brevity>
(Penultimate successful smt mode switch + add of a core)

numactl -H
available: 2 nodes (0,5)
node 0 cpus: 0 1 2 3
node 0 size: 0 MB
node 0 free: 0 MB
node 5 cpus: 8 9 10 11 16 17 18 19 24 25 26 27 32 33 34 35 40 41 42 43 48 49 50 51 56 57 58 59 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79
node 5 size: 32038 MB
node 5 free: 29106 MB
node distances:
node   0   5
  0:  10  40
  5:  40  10
------------------------------------------------------------------
grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
/sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
/sys/kernel/debug/sched/domains/cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_CPUCAPACITY SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
/sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
/sys/kernel/debug/sched/domains/cpu0/domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
/sys/kernel/debug/sched/domains/cpu0/domain2/name:NUMA
/sys/kernel/debug/sched/domains/cpu0/domain2/flags:SD_BALANCE_NEWIDLE SD_SERIALIZE SD_OVERLAP SD_NUMA
------------------------------------------------------------------
awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
domain0 00000005
domain0 0000000a
domain0 00000f00
domain0 000f0000
domain0 0f000000
domain0 0000000f,00000000
domain0 00000f00,00000000
domain0 000f0000,00000000
domain0 8f000000,00000000
domain0 000000ff,00000000
domain0 0000ff00,00000000
domain1 0000000f
domain1 0000ffff,8f0f0f0f,0f0f0f00
domain2 0000ffff,8f0f0f0f,0f0f0f0f
==================================================================

(Before Last successful smt mode switch and 2 small core additions.
Till now all CPU additions have been from nodes which are online.)

numactl -H
available: 2 nodes (0,5)
node 0 cpus: 0 1 2 3 4 5
node 0 size: 0 MB
node 0 free: 0 MB
node 5 cpus: 8 9 10 11 16 17 18 19 24 25 26 27 32 33 34 35 40 41 42 43 48 49 50 51 56 57 58 59 64 65 66 67 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87
node 5 size: 32038 MB
node 5 free: 29099 MB
node distances:
node   0   5
  0:  10  40
  5:  40  10
------------------------------------------------------------------
grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
/sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
/sys/kernel/debug/sched/domains/cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_CPUCAPACITY SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
/sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
/sys/kernel/debug/sched/domains/cpu0/domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
/sys/kernel/debug/sched/domains/cpu0/domain2/name:NUMA
/sys/kernel/debug/sched/domains/cpu0/domain2/flags:SD_BALANCE_NEWIDLE SD_SERIALIZE SD_OVERLAP SD_NUMA
------------------------------------------------------------------
awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
domain0 00000015
domain0 0000002a
domain0 00000f00
domain0 000f0000
domain0 0f000000
domain0 0000000f,00000000
domain0 00000f00,00000000
domain0 000f0000,00000000
domain0 0f000000,00000000
domain0 0000000f,00000000
domain0 0000ff00,00000000
domain0 00ff0000,00000000
domain1 0000003f
domain1 00ffff0f,0f0f0f0f,0f0f0f00
domain2 00ffff0f,0f0f0f0f,0f0f0f3f
==================================================================

( First addition of a CPU to a non-online node esp node whose node
distance was not faked.)

numactl -H
available: 3 nodes (0,5,7)
node 0 cpus: 0 1 2 3 4 5 6 7
node 0 size: 0 MB
node 0 free: 0 MB
node 5 cpus: 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 32 33 34 35 40 41 42 43 48 49 50 51 56 57 58 59 64 65 66 67 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87
node 5 size: 32038 MB
node 5 free: 29024 MB
node 7 cpus: 88 89 90 91 92 93 94 95
node 7 size: 0 MB
node 7 free: 0 MB
node distances:
node   0   5   7
  0:  10  40  40
  5:  40  10  20
  7:  40  20  10
------------------------------------------------------------------
grep -r . /sys/kernel/debug/sched/domains/cpu0/domain{0,1,2,3,4}/{name,flags}
------------------------------------------------------------------
awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
==================================================================

I had added a debug patch to dump some variables that may help to
understand the problem
------------------->8--------------------------------------------8<----------
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 5e1abd9a8cc5..146f59381bcc 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2096,7 +2096,8 @@ static bool topology_span_sane(struct sched_domain_topology_level *tl,
 		cpumask_and(intersect, tl->mask(cpu), tl->mask(i));
 		if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) &&
 		    cpumask_intersects(intersect, cpu_map)) {
-			pr_err("name=%s mask(%d/%d)=%*pbl mask(%d/%d)=%*pbl", tl->name, cpu, cpu_to_node(cpu), cpumask_pr_args(tl->mask(cpu)), i, cpu_to_node(i), cpumask_pr_args(tl->mask(i)));
+			pr_err("name=%s mask(%d/%d)=%*pbl mask(%d/%d)=%*pbl numa-level=%d curr_level=%d", tl->name, cpu, cpu_to_node(cpu), cpumask_pr_args(tl->mask(cpu)), i, cpu_to_node(i), cpumask_pr_args(tl->mask(i)), tl->numa_level, sched_domains_curr_level);
+			pr_err("intersect=%*pbl cpu_map=%*pbl", cpumask_pr_args(intersect), cpumask_pr_args(cpu_map));
 			return false;
 		}
 	}
------------------->8--------------------------------------------8<----------

From dmesg:

[   99.076892] WARNING: workqueue cpumask: online intersect > possible intersect
[  167.256079] Built 2 zonelists, mobility grouping on.  Total pages: 508394
[  167.256108] Policy zone: Normal
[  167.626915] name=NODE mask(0/0)=0-7 mask(88/7)=0-7,88 numa-level=0 curr_level=0    <-- hunk above
[  167.626925] intersect=0-7 cpu_map=0-19,24-27,32-35,40-43,48-51,56-59,64-67,72-88
[  167.626951] ------------[ cut here ]------------
[  167.626959] WARNING: CPU: 88 PID: 6285 at kernel/sched/topology.c:2143 build_sched_domains+0xacc/0x1780
[  167.626975] Modules linked in: rpadlpar_io rpaphp mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag bonding tls nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink pseries_rng xts vmx_crypto uio_pdrv_genirq uio binfmt_misc ip_tables xfs libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
[  167.627068] CPU: 88 PID: 6285 Comm: kworker/88:0 Tainted: G        W         5.13.0-rc6+ #60
[  167.627075] Workqueue: events cpuset_hotplug_workfn
[  167.627085] NIP:  c0000000001caf3c LR: c0000000001caf38 CTR: 00000000007088ec
[  167.627091] REGS: c0000000aa253260 TRAP: 0700   Tainted: G        W          (5.13.0-rc6+)
[  167.627095] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48848222  XER: 00000004
[  167.627108] CFAR: c0000000001eac38 IRQMASK: 0 
               GPR00: c0000000001caf38 c0000000aa253500 c000000001c4a500 0000000000000044 
               GPR04: 00000000fff7ffff c0000000aa253210 0000000000000027 c0000007d9807f90 
               GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000007d2ffffe8 
               GPR12: 0000000000008000 c00000001e9aa480 c000000001c93060 c00000006b834e80 
               GPR16: c000000001d3c6b0 0000000000000000 c000000001775860 c000000001775868 
               GPR20: 0000000000000000 c00000000c064900 0000000000000280 c0000000010bf838 
               GPR24: 0000000000000280 c000000001d3c6c0 0000000000000007 0000000000000058 
               GPR28: 0000000000000000 c00000000c446cc0 c000000001c978a0 c0000000b0a36f00 
[  167.627161] NIP [c0000000001caf3c] build_sched_domains+0xacc/0x1780
[  167.627166] LR [c0000000001caf38] build_sched_domains+0xac8/0x1780
[  167.627172] Call Trace:
[  167.627174] [c0000000aa253500] [c0000000001caf38] build_sched_domains+0xac8/0x1780 (unreliable)
[  167.627182] [c0000000aa253680] [c0000000001ccf2c] partition_sched_domains_locked+0x3ac/0x4c0
[  167.627188] [c0000000aa253710] [c000000000280a84] rebuild_sched_domains_locked+0x404/0x9e0
[  167.627194] [c0000000aa253810] [c000000000284400] rebuild_sched_domains+0x40/0x70
[  167.627201] [c0000000aa253840] [c0000000002846c4] cpuset_hotplug_workfn+0x294/0xf10
[  167.627208] [c0000000aa253c60] [c000000000175140] process_one_work+0x290/0x590
[  167.627217] [c0000000aa253d00] [c0000000001754c8] worker_thread+0x88/0x620
[  167.627224] [c0000000aa253da0] [c000000000181804] kthread+0x194/0x1a0
[  167.627230] [c0000000aa253e10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
[  167.627238] Instruction dump:
[  167.627242] 38635150 f9610070 4801fcdd 60000000 80de0000 3c62ff47 7f25cb78 7fe7fb78 
[  167.627252] 386351a0 7cc43378 4801fcbd 60000000 <0fe00000> 3920fff4 f92100c0 e86100e0 
[  167.627262] ---[ end trace 870f890d7c623d18 ]---
[  168.026621] name=NODE mask(0/0)=0-7 mask(88/7)=0-7,88-89 numa-level=0 curr_level=0
[  168.026626] intersect=0-7 cpu_map=0-19,24-27,32-35,40-43,48-51,56-59,64-67,72-89
[  168.026637] ------------[ cut here ]------------
[  168.026643] WARNING: CPU: 89 PID: 6298 at kernel/sched/topology.c:2143 build_sched_domains+0xacc/0x1780
[  168.026650] Modules linked in: rpadlpar_io rpaphp mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag bonding tls nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink pseries_rng xts vmx_crypto uio_pdrv_genirq uio binfmt_misc ip_tables xfs libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
[  168.026707] CPU: 89 PID: 6298 Comm: kworker/89:0 Tainted: G        W         5.13.0-rc6+ #60
[  168.026713] Workqueue: events cpuset_hotplug_workfn
[  168.026719] NIP:  c0000000001caf3c LR: c0000000001caf38 CTR: 00000000007088ec
[  168.026723] REGS: c0000000ae6d7260 TRAP: 0700   Tainted: G        W          (5.13.0-rc6+)
[  168.026728] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48848222  XER: 00000007
[  168.026738] CFAR: c0000000001eac38 IRQMASK: 0 
               GPR00: c0000000001caf38 c0000000ae6d7500 c000000001c4a500 0000000000000044 
               GPR04: 00000000fff7ffff c0000000ae6d7210 0000000000000027 c0000007d9907f90 
               GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000007d2ffffe8 
               GPR12: 0000000000008000 c00000001e9a9400 c000000001c93060 c00000006b836a80 
               GPR16: c000000001d3c6b0 0000000000000000 c000000001775860 c000000001775868 
               GPR20: 0000000000000000 c00000000c064900 0000000000000280 c0000000010bf838 
               GPR24: 0000000000000280 c000000001d3c6c0 0000000000000007 0000000000000058 
               GPR28: 0000000000000000 c00000000c446cc0 c000000001c978a0 c0000000b1c13b00 
[  168.026792] NIP [c0000000001caf3c] build_sched_domains+0xacc/0x1780
[  168.026796] LR [c0000000001caf38] build_sched_domains+0xac8/0x1780
[  168.026801] Call Trace:
[  168.026804] [c0000000ae6d7500] [c0000000001caf38] build_sched_domains+0xac8/0x1780 (unreliable)
[  168.026811] [c0000000ae6d7680] [c0000000001ccf2c] partition_sched_domains_locked+0x3ac/0x4c0
[  168.026817] [c0000000ae6d7710] [c000000000280a84] rebuild_sched_domains_locked+0x404/0x9e0
[  168.026823] [c0000000ae6d7810] [c000000000284400] rebuild_sched_domains+0x40/0x70
[  168.026829] [c0000000ae6d7840] [c0000000002846c4] cpuset_hotplug_workfn+0x294/0xf10
[  168.026835] [c0000000ae6d7c60] [c000000000175140] process_one_work+0x290/0x590
[  168.026841] [c0000000ae6d7d00] [c0000000001754c8] worker_thread+0x88/0x620
[  168.026848] [c0000000ae6d7da0] [c000000000181804] kthread+0x194/0x1a0
[  168.026853] [c0000000ae6d7e10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
[  168.026859] Instruction dump:
[  168.026863] 38635150 f9610070 4801fcdd 60000000 80de0000 3c62ff47 7f25cb78 7fe7fb78 
[  168.026872] 386351a0 7cc43378 4801fcbd 60000000 <0fe00000> 3920fff4 f92100c0 e86100e0 
[  168.026883] ---[ end trace 870f890d7c623d19 ]---

Now this keeps repeating.

I know I have mentioned this before. (So sorry for repeating)
Generally on Power node distance is not populated for offline nodes.
However to arrive at sched_max_numa_levels, we thought of faking few
node distances. In the above case, we faked distance of node 1 as 20
(from node 0) node 5 was already at distance of 40 from node 0.

So when sched_domains_numa_masks_set is called to update sd_numa_mask or
sched_domains_numa_masks, all CPUs under node 0 get updated for node 2
too. (since node 2 is shown as at a local distance from node 0). Do
look at the node mask of CPU 88 in the dmesg. It should have been 88,
however its 0-7,88 where 0-7 are coming from node 0.

Even if we skip updation of sched_domains_numa_masks for offline nodes,
on online of a node (i.e when we get the correct node distance), we have
to update the sched_domains_numa_masks to ensure CPUs that were already
present within a certain distance and skipped are added back. And this
was what I tried to do in my patch.

-- 
Thanks and Regards
Srikar Dronamraju
