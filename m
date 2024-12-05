Return-Path: <linuxppc-dev+bounces-3835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8B9E5DEB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 19:04:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y42NJ14bbz30Ty;
	Fri,  6 Dec 2024 05:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733421888;
	cv=none; b=VA9BLupRb/rLKep7Q+hAUn8WNhT/yBGCha51n2ZyHoDAycfVkLzLqUhA1/27mNo1XnV72bOSI0gYy6eo5N37+XqoRCeZqcq9J7xZtQJt0xItI5jQvQSObd8Y4fBHAxmLWkLR1CSlbiOeKuCBMLDE5jalwns3PO+RL5pWc/LMDpzODnHSroRuUPd+Fdx2vrmQmYF2uZVpgLim0cpGGc7OOdLpEI+MS1s6K9Z7bauSu/OqgJEAsFITvNSl5WkNJ0oNWKn1hpLiCCXL6Y3J+CU1/SjmDJz0FWKaRUwkarIQkWOEyhjbj+tlXJyqRa7BHsGtfy/tkTleTHVSCbt159yiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733421888; c=relaxed/relaxed;
	bh=7eRIiBaC2/NJSVx6fPq7rzlPrkL1wtTVmAMBA3NWeL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VI+ZQ0iBm+BwZk2H7MgvxSO9s+gusTI5agd+5LkBoikfTN+GJqvPTGSrGeouB2uzuUktHzazaC/9SkYwRJ2VauNEXGLe1gsro7etYWAmlmRotzn837NIFX9z0vM8t7xtWJ13425SkFzFW1/BVc8CTr8ZdI/60NdgQo7pupM2DYymmeJ6JSUxuqkd7IvJaJuLW9JUDbftjBgYZIBqCLSDGSnbsFjsBkS4VpvbIR3UCTXlhXsFVvR+v2CHq3iz1698o7byMgKgDxfzJSJcjaAEvTbZ4qO78B3f2ul2PagHjayNpEDdTQXIvQib4oXbH3x9SRHEhe3cmXHLhgevucrHEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aqEArEnG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aqEArEnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y42NG2WZpz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 05:04:45 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ElQF9012690;
	Thu, 5 Dec 2024 18:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7eRIiB
	aC2/NJSVx6fPq7rzlPrkL1wtTVmAMBA3NWeL0=; b=aqEArEnGuFeufiH9H7gzHo
	8e6nRsCij4idRce1vrCJIhRBXX6kE1MRYgfqs39UHvfIcizViBRkpXGrPUHQKJZb
	mzMw6ZL5YqMDz3sYb6Vh/TIg0G66z0JsSsFJy6DS+/wx2s6L5RqpMMHa5SsKkwZ9
	pWeKTPoRi7KOEx0DuFFsvpn7JpsrXrO41NoVVqnnRfhJ1AMrIvIpaGD+tVDHDNu3
	e+n2/1mzwzEciLfsGJWl7ngLgaUK0B0nC54fiFUwm2EfeBELBk7t5QN+XbWogO2w
	QsmWzI3fDvT8USvl9K9BRdoYH+QRuDyGaPW6vEy7RXPxF/hKp0l5d08qOlDSryag
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4jf2bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:04:36 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5I1Xw7028714;
	Thu, 5 Dec 2024 18:04:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437s4jf2b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:04:36 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5GoFSl023083;
	Thu, 5 Dec 2024 18:04:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1na1cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 18:04:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5I4WjK27591078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 18:04:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D915A20040;
	Thu,  5 Dec 2024 18:04:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F4852004B;
	Thu,  5 Dec 2024 18:04:26 +0000 (GMT)
Received: from [9.39.27.71] (unknown [9.39.27.71])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 18:04:26 +0000 (GMT)
Message-ID: <5f8584e4-d180-4f65-ab42-9b0348b703d5@linux.ibm.com>
Date: Thu, 5 Dec 2024 23:34:24 +0530
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
Subject: Re: [RFC PATCH 1/2] sched/fair: introduce new scheduler group type
 group_parked
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <20241204112149.25872-2-huschle@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241204112149.25872-2-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NM30V_Wo2qC9g26fwAMpIFAy4CehXfe0
X-Proofpoint-ORIG-GUID: 5-anfkpRB6e3IRu6bxOwdXtDfucRDwva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050132
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/4/24 16:51, Tobias Huschle wrote:
> A parked CPU is considered to be flagged as unsuitable to process
> workload at the moment, but might be become usable anytime. Depending on
> the necessity for additional computation power and/or available capacity
> of the underlying hardware.
> 
> A scheduler group is considered to be parked if it only contains parked
> CPUs. A parked scheduler group is considered to be busier than another
> if it runs more tasks than the other parked scheduler group.
> 
> Indicators whether a CPU should be parked depend on the underlying
> hardware and must be considered to be architecture dependent.
> Therefore the check whether a CPU is parked is architecture specific.
> For architectures not relying on this feature, the check is a NOP.
> 
> This is more efficient and non-disruptive compared to CPU hotplug in
> environments where such changes can be necessary on a frequent basis.
> 
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>   include/linux/sched/topology.h |  20 ++++++
>   kernel/sched/core.c            |  10 ++-
>   kernel/sched/fair.c            | 122 ++++++++++++++++++++++++++-------
>   3 files changed, 127 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 4237daa5ac7a..cfe3c59bc329 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -270,6 +270,26 @@ unsigned long arch_scale_cpu_capacity(int cpu)
>   }
>   #endif
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

bool instead?

> +{
> +	return false;
> +}
> +#endif
> +
>   #ifndef arch_scale_hw_pressure
>   static __always_inline
>   unsigned long arch_scale_hw_pressure(int cpu)
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1dee3f5ef940..8f9aeb97c396 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2437,7 +2437,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>   
>   	/* Non kernel threads are not allowed during either online or offline. */
>   	if (!(p->flags & PF_KTHREAD))
> -		return cpu_active(cpu);
> +		return !arch_cpu_parked(cpu) && cpu_active(cpu);
>   
>   	/* KTHREAD_IS_PER_CPU is always allowed. */
>   	if (kthread_is_per_cpu(p))
> @@ -2447,6 +2447,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>   	if (cpu_dying(cpu))
>   		return false;
>   
> +	/* CPU should be avoided at the moment */
> +	if (arch_cpu_parked(cpu))
> +		return false;
> +
>   	/* But are allowed during online. */
>   	return cpu_online(cpu);
>   }
> @@ -3924,6 +3928,10 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
>   	if (task_on_scx(p))
>   		return false;
>   
> +	/* The task should not be queued onto a parked CPU. */
> +	if (arch_cpu_parked(cpu))
> +		return false;
> +

When it comes here, likely cpu is not parked since wakeup path has those 
checks.

>   	/*
>   	 * Do not complicate things with the async wake_list while the CPU is
>   	 * in hotplug state.
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4283c818bbd1..fa1c19d285de 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7415,6 +7415,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
>   {
>   	int target = nr_cpumask_bits;
>   
> +	if (arch_cpu_parked(target))
> +		return prev_cpu;
> +
>   	if (sched_feat(WA_IDLE))
>   		target = wake_affine_idle(this_cpu, prev_cpu, sync);
>   
> @@ -7454,6 +7457,9 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>   	for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
>   		struct rq *rq = cpu_rq(i);
>   
> +		if (arch_cpu_parked(i))
> +			continue;
> +
>   		if (!sched_core_cookie_match(rq, p))
>   			continue;
>   
> @@ -7546,10 +7552,14 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
>   	return new_cpu;
>   }
>   
> +static inline bool is_idle_cpu_allowed(int cpu)
> +{
> +	return !arch_cpu_parked(cpu) && (available_idle_cpu(cpu) || sched_idle_cpu(cpu));
> +}

How about adding below code, it could simplify the code quite a bit. no? 
sched_idle_rq also might need the same check though.

+++ b/kernel/sched/syscalls.c
@@ -214,6 +214,9 @@ int idle_cpu(int cpu)
                 return 0;
  #endif

+       if (arch_cpu_parked(cpu))
+               return 0;
+
         return 1;
  }


> +
>   static inline int __select_idle_cpu(int cpu, struct task_struct *p)
>   {
> -	if ((available_idle_cpu(cpu) || sched_idle_cpu(cpu)) &&
> -	    sched_cpu_cookie_match(cpu_rq(cpu), p))
> +	if (is_idle_cpu_allowed(cpu) && sched_cpu_cookie_match(cpu_rq(cpu), p))
>   		return cpu;
>   
>   	return -1;
> @@ -7657,7 +7667,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>   		 */
>   		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>   			continue;
> -		if (available_idle_cpu(cpu) || sched_idle_cpu(cpu))
> +		if (is_idle_cpu_allowed(cpu))
>   			return cpu;
>   	}
>   
> @@ -7779,7 +7789,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
>   	for_each_cpu_wrap(cpu, cpus, target) {
>   		unsigned long cpu_cap = capacity_of(cpu);
>   
> -		if (!available_idle_cpu(cpu) && !sched_idle_cpu(cpu))
> +		if (!is_idle_cpu_allowed(cpu))
>   			continue;
>   
>   		fits = util_fits_cpu(task_util, util_min, util_max, cpu);
> @@ -7850,7 +7860,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	 */
>   	lockdep_assert_irqs_disabled();
>   
> -	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
> +	if (is_idle_cpu_allowed(target) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, target))
>   		return target;
>   
> @@ -7858,7 +7868,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	 * If the previous CPU is cache affine and idle, don't be stupid:
>   	 */
>   	if (prev != target && cpus_share_cache(prev, target) &&
> -	    (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
> +		is_idle_cpu_allowed(prev) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
>   
>   		if (!static_branch_unlikely(&sched_cluster_active) ||
> @@ -7890,7 +7900,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	if (recent_used_cpu != prev &&
>   	    recent_used_cpu != target &&
>   	    cpus_share_cache(recent_used_cpu, target) &&
> -	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
> +	    is_idle_cpu_allowed(recent_used_cpu) &&
>   	    cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>   
> @@ -9198,7 +9208,12 @@ enum group_type {
>   	 * The CPU is overloaded and can't provide expected CPU cycles to all
>   	 * tasks.
>   	 */
> -	group_overloaded
> +	group_overloaded,
> +	/*
> +	 * The CPU should be avoided as it can't provide expected CPU cycles
> +	 * even for small amounts of workload.
> +	 */
> +	group_parked
>   };
>   
>   enum migration_type {
> @@ -9498,7 +9513,7 @@ static int detach_tasks(struct lb_env *env)
>   	 * Source run queue has been emptied by another CPU, clear
>   	 * LBF_ALL_PINNED flag as we will not test any task.
>   	 */
> -	if (env->src_rq->nr_running <= 1) {
> +	if (env->src_rq->nr_running <= 1 && !arch_cpu_parked(env->src_cpu)) {
>   		env->flags &= ~LBF_ALL_PINNED;
>   		return 0;
>   	}
> @@ -9511,7 +9526,7 @@ static int detach_tasks(struct lb_env *env)
>   		 * We don't want to steal all, otherwise we may be treated likewise,
>   		 * which could at worst lead to a livelock crash.
>   		 */
> -		if (env->idle && env->src_rq->nr_running <= 1)
> +		if (env->idle && env->src_rq->nr_running <= 1 && !arch_cpu_parked(env->src_cpu))
>   			break;
>   
>   		env->loop++;
> @@ -9870,6 +9885,8 @@ struct sg_lb_stats {
>   	unsigned long group_runnable;		/* Total runnable time over the CPUs of the group */
>   	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
>   	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
> +	unsigned int sum_nr_parked;
> +	unsigned int parked_cpus;

Can you please explain why you need two of these? Is it to identify the 
group with most parked cpus?  maybe comments is needed.

>   	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
>   	unsigned int group_weight;
>   	enum group_type group_type;
> @@ -10127,6 +10144,9 @@ group_type group_classify(unsigned int imbalance_pct,
>   			  struct sched_group *group,
>   			  struct sg_lb_stats *sgs)
>   {
> +	if (sgs->parked_cpus)
> +		return group_parked;
> +
>   	if (group_is_overloaded(imbalance_pct, sgs))
>   		return group_overloaded;
>   
> @@ -10328,10 +10348,15 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>   		sgs->nr_numa_running += rq->nr_numa_running;
>   		sgs->nr_preferred_running += rq->nr_preferred_running;
>   #endif
> +
> +		if (rq->cfs.h_nr_running) {
> +			sgs->parked_cpus += arch_cpu_parked(i);
> +			sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
> +		}
>   		/*
>   		 * No need to call idle_cpu() if nr_running is not 0
>   		 */
> -		if (!nr_running && idle_cpu(i)) {
> +		if (!nr_running && idle_cpu(i) && !arch_cpu_parked(i)) {
>   			sgs->idle_cpus++;
>   			/* Idle cpu can't have misfit task */
>   			continue;
> @@ -10355,7 +10380,14 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>   
>   	sgs->group_capacity = group->sgc->capacity;
>   
> -	sgs->group_weight = group->group_weight;
> +	sgs->group_weight = group->group_weight - sgs->parked_cpus;
> +
> +	/*
> +	 * Only a subset of the group is parked, so the group itself has the
> +	 * capability to potentially pull tasks
> +	 */
> +	if (sgs->parked_cpus < group->group_weight)
> +		sgs->parked_cpus = 0;

Say you had a group with 4 cpus and 2 were parked CPUs. Now the 
group_weight will be 2 and it will be marked as parked. whereas if 1 CPU 
is parked group will not be marked as parked. That seems wrong.

instead mark it as parked and use the parked_cpus number to compare no?

>   
>   	/* Check if dst CPU is idle and preferred to this group */
>   	if (!local_group && env->idle && sgs->sum_h_nr_running &&
> @@ -10422,6 +10454,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
>   	 */
>   
>   	switch (sgs->group_type) {
> +	case group_parked:
> +		return sgs->sum_nr_parked > busiest->sum_nr_parked;
>   	case group_overloaded:
>   		/* Select the overloaded group with highest avg_load. */
>   		return sgs->avg_load > busiest->avg_load;
> @@ -10633,6 +10667,9 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
>   		nr_running = rq->nr_running - local;
>   		sgs->sum_nr_running += nr_running;
>   
> +		sgs->parked_cpus += arch_cpu_parked(i);
> +		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
> +
>   		/*
>   		 * No need to call idle_cpu_without() if nr_running is not 0
>   		 */
> @@ -10649,7 +10686,14 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
>   
>   	sgs->group_capacity = group->sgc->capacity;
>   
> -	sgs->group_weight = group->group_weight;
> +	sgs->group_weight = group->group_weight - sgs->parked_cpus;
> +
> +	/*
> +	 * Only a subset of the group is parked, so the group itself has the
> +	 * capability to potentially pull tasks
> +	 */
> +	if (sgs->parked_cpus < group->group_weight)
> +		sgs->parked_cpus = 0;

same comment as above.

>   
>   	sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
>   
> @@ -10680,6 +10724,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
>   	 */
>   
>   	switch (sgs->group_type) {
> +	case group_parked:
> +		return false;

Why not use the parked_cpus to compare?

>   	case group_overloaded:
>   	case group_fully_busy:
>   		/* Select the group with lowest avg_load. */
> @@ -10730,7 +10776,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
>   	unsigned long imbalance;
>   	struct sg_lb_stats idlest_sgs = {
>   			.avg_load = UINT_MAX,
> -			.group_type = group_overloaded,
> +			.group_type = group_parked,
>   	};
>   
>   	do {
> @@ -10788,6 +10834,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
>   		return idlest;
>   
>   	switch (local_sgs.group_type) {
> +	case group_parked:
> +		return idlest;
>   	case group_overloaded:
>   	case group_fully_busy:
>   
> @@ -11039,6 +11087,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>   	local = &sds->local_stat;
>   	busiest = &sds->busiest_stat;
>   
> +	if (busiest->group_type == group_parked) {
> +		env->migration_type = migrate_task;
> +		env->imbalance = busiest->sum_nr_parked;
> +		return;
> +	}
> +
>   	if (busiest->group_type == group_misfit_task) {
>   		if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
>   			/* Set imbalance to allow misfit tasks to be balanced. */
> @@ -11207,13 +11261,14 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>   /*
>    * Decision matrix according to the local and busiest group type:
>    *
> - * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded
> - * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
> - * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
> - * misfit_task      force     N/A        N/A    N/A  N/A        N/A
> - * asym_packing     force     force      N/A    N/A  force      force
> - * imbalanced       force     force      N/A    N/A  force      force
> - * overloaded       force     force      N/A    N/A  force      avg_load
> + * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded parked
> + * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced  balanced
> + * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced  balanced
> + * misfit_task      force     N/A        N/A    N/A  N/A        N/A       N/A
> + * asym_packing     force     force      N/A    N/A  force      force     balanced
> + * imbalanced       force     force      N/A    N/A  force      force     balanced
> + * overloaded       force     force      N/A    N/A  force      avg_load  balanced
> + * parked           force     force      N/A    N/A  force      force     nr_tasks

If i see the code below, if local is parked, it always goes to balanced. 
how it is nr_tasks? am i reading this table wrong?

>    *
>    * N/A :      Not Applicable because already filtered while updating
>    *            statistics.
> @@ -11222,6 +11277,8 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>    * avg_load : Only if imbalance is significant enough.
>    * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
>    *            different in groups.
> + * nr_task :  balancing can go either way depending on the number of running tasks
> + *            per group
>    */
>   
>   /**
> @@ -11252,6 +11309,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>   		goto out_balanced;
>   
>   	busiest = &sds.busiest_stat;
> +	local = &sds.local_stat;
> +
> +	if (local->group_type == group_parked)
> +		goto out_balanced;
> +
> +	if (busiest->group_type == group_parked)
> +		goto force_balance;
>   
>   	/* Misfit tasks should be dealt with regardless of the avg load */
>   	if (busiest->group_type == group_misfit_task)
> @@ -11273,7 +11337,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>   	if (busiest->group_type == group_imbalanced)
>   		goto force_balance;
>   
> -	local = &sds.local_stat;
>   	/*
>   	 * If the local group is busier than the selected busiest group
>   	 * don't try and pull any tasks.
> @@ -11386,6 +11449,8 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
>   		enum fbq_type rt;
>   
>   		rq = cpu_rq(i);
> +		if (arch_cpu_parked(i) && rq->cfs.h_nr_running)
> +			return rq;
>   		rt = fbq_classify_rq(rq);
>   
>   		/*
> @@ -11556,6 +11621,9 @@ static int need_active_balance(struct lb_env *env)
>   {
>   	struct sched_domain *sd = env->sd;
>   
> +	if (arch_cpu_parked(env->src_cpu) && !idle_cpu(env->src_cpu))
> +		return 1;
> +
>   	if (asym_active_balance(env))
>   		return 1;
>   
> @@ -11589,6 +11657,9 @@ static int should_we_balance(struct lb_env *env)
>   	struct sched_group *sg = env->sd->groups;
>   	int cpu, idle_smt = -1;
>   
> +	if (arch_cpu_parked(env->dst_cpu))
> +		return 0;
> +
>   	/*
>   	 * Ensure the balancing environment is consistent; can happen
>   	 * when the softirq triggers 'during' hotplug.
> @@ -11612,7 +11683,7 @@ static int should_we_balance(struct lb_env *env)
>   	cpumask_copy(swb_cpus, group_balance_mask(sg));
>   	/* Try to find first idle CPU */
>   	for_each_cpu_and(cpu, swb_cpus, env->cpus) {
> -		if (!idle_cpu(cpu))
> +		if (!idle_cpu(cpu) || arch_cpu_parked(cpu))
>   			continue;
>   
>   		/*
> @@ -11707,7 +11778,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>   	ld_moved = 0;
>   	/* Clear this flag as soon as we find a pullable task */
>   	env.flags |= LBF_ALL_PINNED;
> -	if (busiest->nr_running > 1) {
> +	if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {
>   		/*
>   		 * Attempt to move tasks. If sched_balance_find_src_group has found
>   		 * an imbalance but busiest->nr_running <= 1, the group is
> @@ -12721,6 +12792,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>   
>   	update_misfit_status(NULL, this_rq);
>   
> +	if (arch_cpu_parked(this_cpu))
> +		return 0;
> +
>   	/*
>   	 * There is a task waiting to run. No need to search for one.
>   	 * Return 0; the task will be enqueued when switching to idle.


