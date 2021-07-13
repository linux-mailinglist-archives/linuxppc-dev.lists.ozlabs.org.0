Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D912A3C7492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 18:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPR525xhmz3bY2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 02:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GPR4d75Dlz2yPH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 02:32:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410806D;
 Tue, 13 Jul 2021 09:32:27 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4543F7D8;
 Tue, 13 Jul 2021 09:32:25 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for non-online
 nodes
In-Reply-To: <20210712124856.GA3836887@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com> <20210712124856.GA3836887@linux.vnet.ibm.com>
Date: Tue, 13 Jul 2021 17:32:14 +0100
Message-ID: <87zguqmay9.mognet@arm.com>
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
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/07/21 18:18, Srikar Dronamraju wrote:
> Hi Valentin,
>
>> On 01/07/21 09:45, Srikar Dronamraju wrote:
>> > @@ -1891,12 +1894,30 @@ void sched_init_numa(void)
>> >  void sched_domains_numa_masks_set(unsigned int cpu)
>> >  {
>>
>> Hmph, so we're playing games with masks of offline nodes - is that really
>> necessary? Your modification of sched_init_numa() still scans all of the
>> nodes (regardless of their online status) to build the distance map, and
>> that is never updated (sched_init_numa() is pretty much an __init
>> function).
>>
>> So AFAICT this is all to cope with topology_span_sane() not applying
>> 'cpu_map' to its masks. That seemed fine to me back when I wrote it, but in
>> light of having bogus distance values for offline nodes, not so much...
>>
>> What about the below instead?
>>
>> ---
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index b77ad49dc14f..c2d9caad4aa6 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -2075,6 +2075,7 @@ static struct sched_domain *build_sched_domain(struct sched_domain_topology_leve
>>  static bool topology_span_sane(struct sched_domain_topology_level *tl,
>>                            const struct cpumask *cpu_map, int cpu)
>>  {
>> +	struct cpumask *intersect = sched_domains_tmpmask;
>>      int i;
>>
>>      /* NUMA levels are allowed to overlap */
>> @@ -2090,14 +2091,17 @@ static bool topology_span_sane(struct sched_domain_topology_level *tl,
>>      for_each_cpu(i, cpu_map) {
>>              if (i == cpu)
>>                      continue;
>> +
>>              /*
>> -		 * We should 'and' all those masks with 'cpu_map' to exactly
>> -		 * match the topology we're about to build, but that can only
>> -		 * remove CPUs, which only lessens our ability to detect
>> -		 * overlaps
>> +		 * We shouldn't have to bother with cpu_map here, unfortunately
>> +		 * some architectures (powerpc says hello) have to deal with
>> +		 * offline NUMA nodes reporting bogus distance values. This can
>> +		 * lead to funky NODE domain spans, but since those are offline
>> +		 * we can mask them out.
>>               */
>> +		cpumask_and(intersect, tl->mask(cpu), tl->mask(i));
>>              if (!cpumask_equal(tl->mask(cpu), tl->mask(i)) &&
>> -		    cpumask_intersects(tl->mask(cpu), tl->mask(i)))
>> +		    cpumask_intersects(intersect, cpu_map))
>>                      return false;
>>      }
>>
>
> Unfortunately this is not helping.
> I tried this patch alone and also with 2/2 patch of this series where
> we update/fill fake topology numbers. However both cases are still failing.
>

Thanks for testing it.


Now, let's take examples from your cover letter:

  node distances:
  node   0   1   2   3   4   5   6   7
    0:  10  20  40  40  40  40  40  40
    1:  20  10  40  40  40  40  40  40
    2:  40  40  10  20  40  40  40  40
    3:  40  40  20  10  40  40  40  40
    4:  40  40  40  40  10  20  40  40
    5:  40  40  40  40  20  10  40  40
    6:  40  40  40  40  40  40  10  20
    7:  40  40  40  40  40  40  20  10

But the system boots with just nodes 0 and 1, thus only this distance
matrix is valid:

  node   0   1
    0:  10  20
    1:  20  10

topology_span_sane() is going to use tl->mask(cpu), and as you reported the
NODE topology level should cause issues. Let's assume all offline nodes say
they're 10 distance away from everyone else, and that we have one CPU per
node. This would give us:

  NODE->mask(0) == 0,2-7
  NODE->mask(1) == 1-7

The intersection is 2-7, we'll trigger the WARN_ON().
Now, with the above snippet, we'll check if that intersection covers any
online CPU. For sched_init_domains(), cpu_map is cpu_active_mask, so we'd
end up with an empty intersection and we shouldn't warn - that's the theory
at least.

Looking at sd_numa_mask(), I think there's a bug with topology_span_sane():
it doesn't run in the right place wrt where sched_domains_curr_level is
updated. Could you try the below on top of the previous snippet?

If that doesn't help, could you share the node distances / topology masks
that lead to the WARN_ON()? Thanks.

---
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index b77ad49dc14f..cda69dfa4065 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1516,13 +1516,6 @@ sd_init(struct sched_domain_topology_level *tl,
 	int sd_id, sd_weight, sd_flags = 0;
 	struct cpumask *sd_span;
 
-#ifdef CONFIG_NUMA
-	/*
-	 * Ugly hack to pass state to sd_numa_mask()...
-	 */
-	sched_domains_curr_level = tl->numa_level;
-#endif
-
 	sd_weight = cpumask_weight(tl->mask(cpu));
 
 	if (tl->sd_flags)
@@ -2131,7 +2124,12 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 
 		sd = NULL;
 		for_each_sd_topology(tl) {
-
+#ifdef CONFIG_NUMA
+			/*
+			 * Ugly hack to pass state to sd_numa_mask()...
+			 */
+			sched_domains_curr_level = tl->numa_level;
+#endif
 			if (WARN_ON(!topology_span_sane(tl, cpu_map, i)))
 				goto error;
 

