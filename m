Return-Path: <linuxppc-dev+bounces-4205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E659F357D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:13:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlNg2bC3z305Y;
	Tue, 17 Dec 2024 03:13:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365603;
	cv=none; b=OkpDGrGg4RnEiGVRYDb1JWXi4GMZYSBHtBRNiF4Rb38ITQArk2rUbLbvK7JQXVDLMTAANXRu6Wa5Fhk4DKnSnNDlMtLeLSIgHIQKq+FYX09YrP6SZjGsuv/UNlUjkxKZyYFzdEHVfgG1AHDcQfo3JsDTfAPixbLQzM7YomnsSKNMt2/qaYNHGtezYRQFTO7Cfnaxzr6OqCWUtiAvoNY7QRW2IsBiD/o+ZNa2Wa29Yijbglyponl2gsvHUbAExf7XKijpJzGf6MtZMxPPQcDE5TLTOu7BC3uKb9yhDSVoW4aleyGHD2P2rO8gzeHVpobdzlszK3TTQE/U3s20VUXRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365603; c=relaxed/relaxed;
	bh=55xDJnwamWEvLUYplPWLCEqHmOTHUDb53EAxjaXbnws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwXPMkl4sIuwAv2QTWDCsY9Gh10CR9CZOdjQ4DgYTPTuhoeqGGSFqwlhIamPM5e5SmzAc8OsrrjCZc7M1c0VAg05tZHVCEsvLDtDbfPANo6cj2euSMPU4ASOC7jaUKnIn2/+/n7HTgpCLDxDG5o7AZ+p31pR1o9nfNlugWjHW2yRxzz9u8GBEFoz/fD3T6eEPf0PVhum/8fD3kvFBp2FR4FYkdDbExx/7JXHkf8FSkTwne582wdmSk62eu6/i970lzaDBc3n6eOG0VsJaozoghnd7ob7VBbmU25IgmuOlwk59jTPmk12twIP5SbxKfwtX/3GDYOT4CZzpuGDPGrOOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZdNccYHk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZdNccYHk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlNf2SSjz2xBf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:13:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEbIiq021883;
	Mon, 16 Dec 2024 16:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=55xDJn
	wamWEvLUYplPWLCEqHmOTHUDb53EAxjaXbnws=; b=ZdNccYHk7XqDotJnkjsLEr
	qqj35WzeQWxIKs2FU4Z4xv0AKkl3OXcWEEeDSmgiFcSf82/3UKYyAPuQP5f19DBp
	lPb0KlHtxV5lF21HKq1rTZc9iToZep5Ea+AznrQjL5IbL/OsWitSO5+DxagaiJJN
	PUwVy2EOo3JF31aDh3dDjLzBkMh0x0dGRbq8vJzFReqUH299GijdESIeumtenTqB
	lAq4n12wTmcqN4M2vjinLThk8j750VuJCz93paWumylrW+2cJBDOZsf9KoCOXM+8
	9JXrKQGtbqANVUZO2X8l+sq4YchOGVxicnWTaOzs3t2dp/jis5S9satHPaJhh9WA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgucap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:13:11 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGG6poW002541;
	Mon, 16 Dec 2024 16:13:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgucak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:13:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGCbok2029326;
	Mon, 16 Dec 2024 16:13:09 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hmbseux1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:13:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGGD76H21889418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 16:13:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D19AC20040;
	Mon, 16 Dec 2024 16:13:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 402D720043;
	Mon, 16 Dec 2024 16:13:07 +0000 (GMT)
Received: from [9.171.5.238] (unknown [9.171.5.238])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 16 Dec 2024 16:13:07 +0000 (GMT)
Message-ID: <68e14c6a-76fd-4d47-b8d6-4ed6eef33a48@linux.ibm.com>
Date: Mon, 16 Dec 2024 17:13:06 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] sched/fair: introduce new scheduler group type
 group_parked
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <543d376c-85a7-4628-a38e-52bc117258a5@linux.ibm.com>
 <27c4288d-5617-4195-8424-e6e346acefd0@linux.ibm.com>
 <4f3b49cb-15bc-43ef-b4cb-3af98c8a1c5f@linux.ibm.com>
From: Tobias Huschle <huschle@linux.ibm.com>
In-Reply-To: <4f3b49cb-15bc-43ef-b4cb-3af98c8a1c5f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QZuURhEIQhQEvDj3gTHYtPIjl5sDziEv
X-Proofpoint-ORIG-GUID: rK9OKIz43AZx9a3MJwSxrnPi6R_RAKCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160133
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/12/2024 21:24, Shrikanth Hegde wrote:
> 
> 
> On 12/9/24 13:35, Tobias Huschle wrote:
>>
> [...]
>>> So I gave it a try with using a debugfs based hint to say which CPUs 
>>> are parked.
>>> It is a hack to try it out. patch is below so one could try something 
>>> similar is their archs
>>> and see if it help if they have a use case.
>>>
>>> Notes:
>>> 1. Arch shouldn't set cpu_parked for all CPUs at boot. It causes panic.
>>> 2. Workload gets unpacked to all CPUs when changing from 40 CPUs to 
>>> 80 CPUs, but
>>>     doesn't get packed when changing the from 80 to 40 CPUs.
>>
>> With stress-ng -l 100 this can happen, I tested with stress-ng -l 50 
>> and that worked well in all cases. As mentioned above, the -l 100 case 
>> would need changes to handle the no-hz scenario. I have a patch for 
>> that which works, but it is a bit hacky.
>> If this also happens with non-100% stressors on your end, something 
>> needs ot be fixed code-wise.
>>
> 
> It was happening with 100% stress-ng case. I was wondering since i dont 
> have no-hz full enabled.
> I found out the reason why and one way to do is to trigger active load 
> balance if there are any parked cpus
> in the group. That probably needs a IS_ENABLED check not to hurt the 
> regular case.
> 
> Also, I gave a try to include arch_cpu_parked in idle_cpu and friends. 
> It seems to working for me.
> I will attach the code below. It simplifies code quite a bit.

I agree, that this makes things cleaner. One concern might be that this 
interferes with disabling the tick on idle CPUs. Will need to check.

> 
> Also, I am thinking to rely on active balance codepath more than the 
> regular pull model.
> so this would be akin to asym packing codepaths. The below code does 
> that too.>
> Feel free to take the bits as necessary if it works.

I appreciate your suggestions. Experimenting with these changes worked 
fine for me so far. I'll try to remove as many checks as possible and 
hopefully be able to provide a v2 soon.

Things that I observed: With your changes incorporated and some things 
that I added, it seems to work pretty fine, even with stress-ng using 
100% stressors. But, it occasionally takes a while to reclaim unparked 
CPUs. With any percentage below 100, the changes are almost instantly.

I also see some issues where the load balancer is very hesitant to 
reclaim unparked CPUs which are part of another scheduling domain.

> 
> ---
>   include/linux/sched/topology.h | 20 ++++++++++
>   kernel/sched/core.c            |  6 ++-
>   kernel/sched/fair.c            | 72 ++++++++++++++++++++++++++++++++--
>   kernel/sched/syscalls.c        |  3 ++
>   4 files changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/ 
> topology.h
> index 4237daa5ac7a..cfe3c59bc329 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -270,6 +270,26 @@ unsigned long arch_scale_cpu_capacity(int cpu)
>   }
>   #endif
> 
> +#ifndef arch_cpu_parked
> +/**
> + * arch_cpu_parked - Check if a given CPU is currently parked.
> + *
> + * A parked CPU cannot run any kind of workload since underlying
> + * physical CPU should not be used at the moment .
> + *
> + * @cpu: the CPU in question.
> + *
> + * By default assume CPU is not parked
> + *
> + * Return: Parked state of CPU
> + */
> +static __always_inline
> +unsigned long arch_cpu_parked(int cpu)
> +{
> +    return false;
> +}
> +#endif
> +
>   #ifndef arch_scale_hw_pressure
>   static __always_inline
>   unsigned long arch_scale_hw_pressure(int cpu)
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5fbec67d48b2..78ca95aad66b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2437,7 +2437,7 @@ static inline bool is_cpu_allowed(struct 
> task_struct *p, int cpu)
> 
>       /* Non kernel threads are not allowed during either online or 
> offline. */
>       if (!(p->flags & PF_KTHREAD))
> -        return cpu_active(cpu);
> +        return !arch_cpu_parked(cpu) && cpu_active(cpu);
> 
>       /* KTHREAD_IS_PER_CPU is always allowed. */
>       if (kthread_is_per_cpu(p))
> @@ -2447,6 +2447,10 @@ static inline bool is_cpu_allowed(struct 
> task_struct *p, int cpu)
>       if (cpu_dying(cpu))
>           return false;
> 
> +    /* CPU should be avoided at the moment */
> +    if (arch_cpu_parked(cpu))
> +        return false;
> +
>       /* But are allowed during online. */
>       return cpu_online(cpu);
>   }
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d5127d9beaea..a6216f63b756 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6898,6 +6898,9 @@ static int sched_idle_rq(struct rq *rq)
>   #ifdef CONFIG_SMP
>   static int sched_idle_cpu(int cpu)
>   {
> +    if (arch_cpu_parked(cpu))
> +        return 0;
> +
>       return sched_idle_rq(cpu_rq(cpu));
>   }
>   #endif
> @@ -7415,6 +7418,9 @@ static int wake_affine(struct sched_domain *sd, 
> struct task_struct *p,
>   {
>       int target = nr_cpumask_bits;
> 
> +    if (arch_cpu_parked(target))
> +        return prev_cpu;
> +
>       if (sched_feat(WA_IDLE))
>           target = wake_affine_idle(this_cpu, prev_cpu, sync);
> 
> @@ -9198,7 +9204,13 @@ enum group_type {
>        * The CPU is overloaded and can't provide expected CPU cycles to all
>        * tasks.
>        */
> -    group_overloaded
> +    group_overloaded,
> +    /*
> +     * The CPU should be avoided as it can't provide expected CPU cycles
> +     * even for small amounts of workload.
> +     */
> +    group_parked
> +
>   };
> 
>   enum migration_type {
> @@ -9880,6 +9892,9 @@ struct sg_lb_stats {
>       unsigned int nr_numa_running;
>       unsigned int nr_preferred_running;
>   #endif
> +    unsigned int sum_nr_parked;
> +    unsigned int parked_cpus;
> +
>   };
> 
>   /*
> @@ -10127,6 +10142,9 @@ group_type group_classify(unsigned int 
> imbalance_pct,
>                 struct sched_group *group,
>                 struct sg_lb_stats *sgs)
>   {
> +    if (sgs->parked_cpus)
> +        return group_parked;
> +

This could be changed to:

	if (sgs->sum_nr_parked)
		return group_parked;

This makes sure that we don't care about parked CPUs which do not run 
any tasks at the moment. Needs an additional check for the case that all 
CPUs of a group are parked.

>       if (group_is_overloaded(imbalance_pct, sgs))
>           return group_overloaded;
> 
> @@ -10328,6 +10346,11 @@ static inline void update_sg_lb_stats(struct 
> lb_env *env,
>           sgs->nr_numa_running += rq->nr_numa_running;
>           sgs->nr_preferred_running += rq->nr_preferred_running;
>   #endif
> +        if (rq->cfs.h_nr_running) {
> +            sgs->parked_cpus += arch_cpu_parked(i);
> +            sgs->sum_nr_parked += arch_cpu_parked(i) * rq- 
>  >cfs.h_nr_running;
> +        }
> +

I'm still a bit torn on this, as in how to count the parked cpus and 
make use of that count. I think they should be removed from the overall 
weight of the group. Probably also from the capacity. Otherwise, the 
calculations for overloaded groups are off. Will look at that.

>           /*
>            * No need to call idle_cpu() if nr_running is not 0
>            */
> @@ -10422,6 +10445,8 @@ static bool update_sd_pick_busiest(struct lb_env 
> *env,
>        */
> 
>       switch (sgs->group_type) {
> +    case group_parked:
> +        return sgs->sum_nr_parked > busiest->sum_nr_parked;
>       case group_overloaded:
>           /* Select the overloaded group with highest avg_load. */
>           return sgs->avg_load > busiest->avg_load;
> @@ -10633,6 +10658,8 @@ static inline void update_sg_wakeup_stats(struct 
> sched_domain *sd,
>           nr_running = rq->nr_running - local;
>           sgs->sum_nr_running += nr_running;
> 
> +        sgs->parked_cpus += arch_cpu_parked(i);
> +        sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
>           /*
>            * No need to call idle_cpu_without() if nr_running is not 0
>            */
> @@ -10680,6 +10707,8 @@ static bool update_pick_idlest(struct 
> sched_group *idlest,
>        */
> 
>       switch (sgs->group_type) {
> +    case group_parked:
> +        return false;
>       case group_overloaded:
>       case group_fully_busy:
>           /* Select the group with lowest avg_load. */
> @@ -10730,7 +10759,7 @@ sched_balance_find_dst_group(struct sched_domain 
> *sd, struct task_struct *p, int
>       unsigned long imbalance;
>       struct sg_lb_stats idlest_sgs = {
>               .avg_load = UINT_MAX,
> -            .group_type = group_overloaded,
> +            .group_type = group_parked,
>       };
> 
>       do {
> @@ -10788,6 +10817,8 @@ sched_balance_find_dst_group(struct sched_domain 
> *sd, struct task_struct *p, int
>           return idlest;
> 
>       switch (local_sgs.group_type) {
> +    case group_parked:
> +        return idlest;
>       case group_overloaded:
>       case group_fully_busy:
> 
> @@ -11039,6 +11070,12 @@ static inline void calculate_imbalance(struct 
> lb_env *env, struct sd_lb_stats *s
>       local = &sds->local_stat;
>       busiest = &sds->busiest_stat;
> 
> +    if (busiest->group_type == group_parked) {
> +        env->migration_type = migrate_task;
> +        env->imbalance = busiest->sum_nr_parked;
> +        return;
> +    }
> +
>       if (busiest->group_type == group_misfit_task) {
>           if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
>               /* Set imbalance to allow misfit tasks to be balanced. */
> @@ -11252,6 +11289,13 @@ static struct sched_group 
> *sched_balance_find_src_group(struct lb_env *env)
>           goto out_balanced;
> 
>       busiest = &sds.busiest_stat;
> +    local = &sds.local_stat;
> +
> +    if (local->group_type == group_parked)
> +        goto out_balanced;
> +
> +    if (busiest->group_type == group_parked)
> +        goto force_balance;
> 
>       /* Misfit tasks should be dealt with regardless of the avg load */
>       if (busiest->group_type == group_misfit_task)
> @@ -11273,7 +11317,6 @@ static struct sched_group 
> *sched_balance_find_src_group(struct lb_env *env)
>       if (busiest->group_type == group_imbalanced)
>           goto force_balance;
> 
> -    local = &sds.local_stat;
>       /*
>        * If the local group is busier than the selected busiest group
>        * don't try and pull any tasks.
> @@ -11386,6 +11429,9 @@ static struct rq 
> *sched_balance_find_src_rq(struct lb_env *env,
>           enum fbq_type rt;
> 
>           rq = cpu_rq(i);
> +        if (arch_cpu_parked(i) && rq->cfs.h_nr_running)
> +            return rq;
> +
>           rt = fbq_classify_rq(rq);
> 
>           /*
> @@ -11556,6 +11602,9 @@ static int need_active_balance(struct lb_env *env)
>   {
>       struct sched_domain *sd = env->sd;
> 
> +    if (arch_cpu_parked(env->src_cpu))
> +        return 1;
> +
>       if (asym_active_balance(env))
>           return 1;
> 
> @@ -11588,6 +11637,20 @@ static int should_we_balance(struct lb_env *env)
>       struct cpumask *swb_cpus = 
> this_cpu_cpumask_var_ptr(should_we_balance_tmpmask);
>       struct sched_group *sg = env->sd->groups;
>       int cpu, idle_smt = -1;
> +    int cpus_parked = 0;
> +
> +    if (arch_cpu_parked(env->dst_cpu))
> +        return 0;
> +
> +    for_each_cpu(cpu, sched_domain_span(env->sd)) {
> +        if (arch_cpu_parked(cpu)) {
> +            cpus_parked ++;
> +        }
> +    }
> +
> +    if (cpus_parked && !arch_cpu_parked(env->dst_cpu)) {
> +        return 1;
> +    }
> 
>       /*
>        * Ensure the balancing environment is consistent; can happen
> @@ -12708,6 +12771,9 @@ static int sched_balance_newidle(struct rq 
> *this_rq, struct rq_flags *rf)
> 
>       update_misfit_status(NULL, this_rq);
> 
> +    if (arch_cpu_parked(this_cpu))
> +        return 0;
> +
>       /*
>        * There is a task waiting to run. No need to search for one.
>        * Return 0; the task will be enqueued when switching to idle.
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index ff0e5ab4e37c..d408d87da563 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -203,6 +203,9 @@ int idle_cpu(int cpu)
>   {
>       struct rq *rq = cpu_rq(cpu);
> 
> +    if (arch_cpu_parked(cpu))
> +        return 0;
> +
>       if (rq->curr != rq->idle)
>           return 0;
> 


