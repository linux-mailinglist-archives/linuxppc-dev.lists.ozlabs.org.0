Return-Path: <linuxppc-dev+bounces-6308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F957A392DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 06:45:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxpQF1GKjz3005;
	Tue, 18 Feb 2025 16:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739857509;
	cv=none; b=ZASyPYEJ5BYRVx61wSW4M5Fydzi3pLqhqPFyHPx16x1yXdoQgmJvQYnQMcOWfwDoCaGyiACTech+JVOeG4e/djfduG7DVCmSgWorobzEvNqskdrmclWgHADs3MKIe0A87Ay1pHo5bUkpZ1tEUlLA0XUZFWsMtDJkULnZ8vCwpnABukrlcL7svRKEygadDpWCEyeeR3Iothl4Rht4gC5zDf8myuTAo4QRYeI0x3LiDfpudtclTNH0WO/482I1rl2/2SSABHy6n24Dxg9RjyzhfprwHhEUgna1EzyPUoo1ckPXS2RruXTWi2p2Zu28kiwbwEpleKb0um1wPMFn9fMVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739857509; c=relaxed/relaxed;
	bh=pSkpIRkXBMR+N2jNPwNvVAH5sFpj81q4WOq+masxKM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NclfnqPUfrEQnxOSUrbst7+X/SCtY8gdDtm3tpRYx55CtlUXVaZBeoDNGrWpUsEnS2cdPLvBsZ90JdIUC+JtPHk0IMI23cWlpOLrpoJ/LMNZugukfsBDW3OwNN/qp7XfWIDEPDDmFLYJfpDJAJCuxYum+8cPxQuwO1RLxA+Df1mDBqkZJ8MTMSdE0R4EfYqGn1fFuFwVxPn+V/ktdcVStTKanJTyaZITih+NvHPB1XMr25qSTbmcw6R7gJcWDgXwAXMtOhQxZkyf9xzq2X/s0hF2R8GAyU6Ke6N5QAtBOqX+LZ/A3P9ZEgWEvdPO+pcfefVx2LOZem4EZ1WXIJAQog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZJajjzZ9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZJajjzZ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxpQD0Pqsz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 16:45:07 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HMnRxf014574;
	Tue, 18 Feb 2025 05:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pSkpIR
	kXBMR+N2jNPwNvVAH5sFpj81q4WOq+masxKM0=; b=ZJajjzZ9hp+JogsL3ESEY6
	6WBNfxhK3FR0LZOUAZp/HYsycRISDEdcm7+k4d6WIhEMHoCrPWyujN9AVIOLu3Fu
	RIB2tQAzvn7tpNng/LT9WXKU4oR3IpzzWMttqLDV+mc5aEEBuPSWQHy3zh8o2pAN
	O4p4smYMi+Su2ZbiFrNjMLdJIyoE/jdopoTOIfHcSyZDvOGDiFheanSAH9deFZDI
	WU1WSJsaqM8Rbj7L2ttpAsxFYF9cpVs8Qsuk+2I1KiP66Il5ToSxKKao7mWNIxRW
	jJ/M/ladcSJNYXdlbG1lwKNoenDIjos6JniooBUE3Ng8GGeuld/8pwGQdDgZxi6Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ve8a9as3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 05:44:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51I5iuLU013341;
	Tue, 18 Feb 2025 05:44:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ve8a9ary-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 05:44:55 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51I1DgkK008124;
	Tue, 18 Feb 2025 05:44:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u58thpcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 05:44:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51I5irnR39452986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 05:44:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CE5E20043;
	Tue, 18 Feb 2025 05:44:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 530F720040;
	Tue, 18 Feb 2025 05:44:50 +0000 (GMT)
Received: from [9.124.222.120] (unknown [9.124.222.120])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Feb 2025 05:44:50 +0000 (GMT)
Message-ID: <ee74de65-1b9d-4c40-aa57-52682801260a@linux.ibm.com>
Date: Tue, 18 Feb 2025 11:14:48 +0530
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
Subject: Re: [RFC PATCH v2 1/3] sched/fair: introduce new scheduler group type
 group_parked
To: Tobias Huschle <huschle@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217113252.21796-1-huschle@linux.ibm.com>
 <20250217113252.21796-2-huschle@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250217113252.21796-2-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lCs1rUKIpdVZO_cXeWv80lt_eDJZcZqZ
X-Proofpoint-ORIG-GUID: Qk1VhEyLEtaBqXzmxW-wFj9HH2Af7XMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180039
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Tobias.

On 2/17/25 17:02, Tobias Huschle wrote:
> A parked CPU is considered to be flagged as unsuitable to process
> workload at the moment, but might be become usable anytime. Depending on
> the necessity for additional computation power and/or available capacity
> of the underlying hardware.
> 
> A scheduler group is considered to be parked, if there are tasks queued
> on parked CPUs and there are no idle CPUs, i.e. all non parked CPUs are
> busy or there are only parked CPUs. A scheduler group with parked tasks
> can be considered to not be parked, if it has idle CPUs which can pick
> up the parked tasks. A parked scheduler group is considered to be busier
> than another if it runs more tasks on parked CPUs than another parked
> scheduler group.
> 
> A parked CPU must keep its scheduler tick (or have it re-enabled if
> necessary) in order to make sure that parked CPUs which only run a
> single task which does not give up its runtime voluntarily is still
> evacuated as it would otherwise go into NO_HZ.
> 
> The status of the underlying hardware must be considered to be
> architecture dependent. Therefore the check whether a CPU is parked is
> architecture specific. For architectures not relying on this feature,
> the check is mostly a NOP.
> 
> This is more efficient and non-disruptive compared to CPU hotplug in
> environments where such changes can be necessary on a frequent basis.
> 
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>   include/linux/sched/topology.h | 19 ++++++++
>   kernel/sched/core.c            | 13 ++++-
>   kernel/sched/fair.c            | 86 +++++++++++++++++++++++++++++-----
>   kernel/sched/syscalls.c        |  3 ++
>   4 files changed, 109 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 7f3dbafe1817..2a4730729988 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -265,6 +265,25 @@ unsigned long arch_scale_cpu_capacity(int cpu)
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
> +static __always_inline bool arch_cpu_parked(int cpu)
> +{
> +	return false;
> +}
> +#endif
> +
>   #ifndef arch_scale_hw_pressure
>   static __always_inline
>   unsigned long arch_scale_hw_pressure(int cpu)
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 165c90ba64ea..9ed15911ec60 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1352,6 +1352,9 @@ bool sched_can_stop_tick(struct rq *rq)
>   	if (rq->cfs.h_nr_queued > 1)
>   		return false;
>   
> +	if (rq->cfs.nr_running > 0 && arch_cpu_parked(cpu_of(rq)))
> +		return false;
> +

you mean rq->cfs.h_nr_queued or rq->nr_running ?

>   	/*
>   	 * If there is one task and it has CFS runtime bandwidth constraints
>   	 * and it's on the cpu now we don't want to stop the tick.
> @@ -2443,7 +2446,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>   
>   	/* Non kernel threads are not allowed during either online or offline. */
>   	if (!(p->flags & PF_KTHREAD))
> -		return cpu_active(cpu);
> +		return !arch_cpu_parked(cpu) && cpu_active(cpu);
>   
>   	/* KTHREAD_IS_PER_CPU is always allowed. */
>   	if (kthread_is_per_cpu(p))
> @@ -2453,6 +2456,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
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
> @@ -3930,6 +3937,10 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
>   	if (task_on_scx(p))
>   		return false;
>   
> +	/* The task should not be queued onto a parked CPU. */
> +	if (arch_cpu_parked(cpu))
> +		return false;
> +
>   	/*
>   	 * Do not complicate things with the async wake_list while the CPU is
>   	 * in hotplug state.
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 1c0ef435a7aa..5eb1a3113704 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6871,6 +6871,8 @@ static int sched_idle_rq(struct rq *rq)
>   #ifdef CONFIG_SMP
>   static int sched_idle_cpu(int cpu)
>   {
> +	if (arch_cpu_parked(cpu))
> +		return 0;
>   	return sched_idle_rq(cpu_rq(cpu));
>   }
>   #endif
> @@ -7399,6 +7401,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
>   {
>   	int target = nr_cpumask_bits;
>   
> +	if (arch_cpu_parked(target))
> +		return prev_cpu;
> +
>   	if (sched_feat(WA_IDLE))
>   		target = wake_affine_idle(this_cpu, prev_cpu, sync);
>   
> @@ -9182,7 +9187,12 @@ enum group_type {
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
> @@ -9902,6 +9912,7 @@ struct sg_lb_stats {
>   	unsigned long group_runnable;		/* Total runnable time over the CPUs of the group */
>   	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
>   	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
> +	unsigned int sum_nr_parked;
>   	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
>   	unsigned int group_weight;
>   	enum group_type group_type;
> @@ -10159,6 +10170,9 @@ group_type group_classify(unsigned int imbalance_pct,
>   			  struct sched_group *group,
>   			  struct sg_lb_stats *sgs)
>   {
> +	if (sgs->sum_nr_parked && !sgs->idle_cpus)
> +		return group_parked;
> +
>   	if (group_is_overloaded(imbalance_pct, sgs))
>   		return group_overloaded;
>   
> @@ -10354,6 +10368,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>   		if (cpu_overutilized(i))
>   			*sg_overutilized = 1;
>   
> +		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
> +
>   		/*
>   		 * No need to call idle_cpu() if nr_running is not 0
>   		 */
> @@ -10459,6 +10475,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
>   	 */
>   
>   	switch (sgs->group_type) {
> +	case group_parked:
> +		return sgs->sum_nr_parked > busiest->sum_nr_parked;
>   	case group_overloaded:
>   		/* Select the overloaded group with highest avg_load. */
>   		return sgs->avg_load > busiest->avg_load;
> @@ -10622,6 +10640,9 @@ static int idle_cpu_without(int cpu, struct task_struct *p)
>   {
>   	struct rq *rq = cpu_rq(cpu);
>   
> +	if (arch_cpu_parked(cpu))
> +		return 0;
> +
>   	if (rq->curr != rq->idle && rq->curr != p)
>   		return 0;
>   
> @@ -10670,6 +10691,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
>   		nr_running = rq->nr_running - local;
>   		sgs->sum_nr_running += nr_running;
>   
> +		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
> +
>   		/*
>   		 * No need to call idle_cpu_without() if nr_running is not 0
>   		 */
> @@ -10717,6 +10740,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
>   	 */
>   
>   	switch (sgs->group_type) {
> +	case group_parked:
> +		return false;
>   	case group_overloaded:
>   	case group_fully_busy:
>   		/* Select the group with lowest avg_load. */
> @@ -10767,7 +10792,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
>   	unsigned long imbalance;
>   	struct sg_lb_stats idlest_sgs = {
>   			.avg_load = UINT_MAX,
> -			.group_type = group_overloaded,
> +			.group_type = group_parked,
>   	};
>   
>   	do {
> @@ -10825,6 +10850,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
>   		return idlest;
>   
>   	switch (local_sgs.group_type) {
> +	case group_parked:
> +		return idlest;
>   	case group_overloaded:
>   	case group_fully_busy:
>   
> @@ -11076,6 +11103,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
> @@ -11244,13 +11277,14 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
> + * parked           force     force      N/A    N/A  force      force     balanced
>    *
>    * N/A :      Not Applicable because already filtered while updating
>    *            statistics.
> @@ -11259,6 +11293,8 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>    * avg_load : Only if imbalance is significant enough.
>    * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
>    *            different in groups.
> + * nr_task :  balancing can go either way depending on the number of running tasks
> + *            per group
>    */

This comment on nr_task can be removed as it is not present in the list.

>   /**
> @@ -11289,6 +11325,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
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
> @@ -11310,7 +11353,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>   	if (busiest->group_type == group_imbalanced)
>   		goto force_balance;
>   
> -	local = &sds.local_stat;
>   	/*
>   	 * If the local group is busier than the selected busiest group
>   	 * don't try and pull any tasks.
> @@ -11423,6 +11465,9 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
>   		enum fbq_type rt;
>   
>   		rq = cpu_rq(i);
> +		if (arch_cpu_parked(i) && rq->cfs.h_nr_queued)
> +			return rq;
> +
>   		rt = fbq_classify_rq(rq);
>   
>   		/*
> @@ -11593,6 +11638,9 @@ static int need_active_balance(struct lb_env *env)
>   {
>   	struct sched_domain *sd = env->sd;
>   
> +	if (arch_cpu_parked(env->src_cpu) && cpu_rq(env->src_cpu)->cfs.h_nr_queued)
> +		return 1;
> +
>   	if (asym_active_balance(env))
>   		return 1;
>   
> @@ -11626,6 +11674,14 @@ static int should_we_balance(struct lb_env *env)
>   	struct sched_group *sg = env->sd->groups;
>   	int cpu, idle_smt = -1;
>   
> +	if (arch_cpu_parked(env->dst_cpu))
> +		return 0;
> +
> +	for_each_cpu(cpu, sched_domain_span(env->sd)) {
> +		if (arch_cpu_parked(cpu) && cpu_rq(cpu)->cfs.h_nr_queued)
> +			return 1;
> +	}
> +
>   	/*
>   	 * Ensure the balancing environment is consistent; can happen
>   	 * when the softirq triggers 'during' hotplug.
> @@ -11766,7 +11822,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>   	ld_moved = 0;
>   	/* Clear this flag as soon as we find a pullable task */
>   	env.flags |= LBF_ALL_PINNED;
> -	if (busiest->nr_running > 1) {
> +	if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {

Since there is reliance on active balance if there is single task, it 
think above isn't needed. Is there any usecase for it?

>   		/*
>   		 * Attempt to move tasks. If sched_balance_find_src_group has found
>   		 * an imbalance but busiest->nr_running <= 1, the group is
> @@ -12356,6 +12412,11 @@ static void nohz_balancer_kick(struct rq *rq)
>   	if (time_before(now, nohz.next_balance))
>   		goto out;
>   
> +	if (!idle_cpu(rq->cpu)) {
> +		flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
> +		goto out;
> +	}
> +

This could be agrressive. Note when the code comes here, it is not idle. 
It would bail out early if it is idle.

>   	if (rq->nr_running >= 2) {
>   		flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
>   		goto out;
> @@ -12767,6 +12828,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>   
>   	update_misfit_status(NULL, this_rq);
>   
> +	if (arch_cpu_parked(this_cpu))
> +		return 0;
> +
>   	/*
>   	 * There is a task waiting to run. No need to search for one.
>   	 * Return 0; the task will be enqueued when switching to idle.
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 456d339be98f..7efd76a30be7 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -214,6 +214,9 @@ int idle_cpu(int cpu)
>   		return 0;
>   #endif
>   
> +	if (arch_cpu_parked(cpu))
> +		return 0;
> +
>   	return 1;
>   }
>   


