Return-Path: <linuxppc-dev+bounces-3863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C07319E8D28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 09:18:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6F9d4QLSz2yVt;
	Mon,  9 Dec 2024 19:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733732293;
	cv=none; b=W2nmVwj2I5U37yKHCsFFrlNYYhcYcVzLoXpc4Zc4gzmwetnbTGnohPsdFWwLOMY4abYfbHdItEPVGfmcjttiKf9W7gGtn66YsDSkzkQnvw6RU9nIfuvXFNyDXlAfgHOEjRWrIu1fGQBS6vxEZnnmyOLhyKa7CeewE/IZ1XF9Sa1Z71E0LvZMnvXNgY/60H1g0QYzGZcvIUFeAoML5hQkhkUCQszEUdEWs2apRBjICCOVJj9XPCVpO2iskNB3FbfSRTy3Rfq1SGNAnvZQ3e3YGyPnlOHmNO/fX6tsNIrrx9Ajdq7ug5VaZe1bdKR/HI+HqTJlpAUYb+GXoNmiChm1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733732293; c=relaxed/relaxed;
	bh=IhKAkRBbuSgxLD3v/DHg421/fE+9khw6lByrJXagpYI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=koxtXA1YUuUun/2jeQySMCceKeCiEKjegfVAP9d9kKYmc0d9S0c0r9P+vGggNHxAZLvjKzugclfmUHoDOWxLou8iE/T/rP1qIs6P6v7Th30ligTwslB/s8YetneB2m9UuFdwEBGyj7QTdd49Nc+UAtc7PqnQFlNq+87Y05S7wWLC/nsTPeyuDGz6Da4L+/wyMabbJGjwr3sisLs9/eVju7DjTrWZ7fRIrw4hM65bxEdzDQqwwzjhy0DYaIQt/H+ne1KV73q4R3+BeJMzusEhX7xbAm5UlWaFM/e9Lsiy6vcu5RdR6mkS+n/JnAUAJnvyT/W1VbS694USJkUcff+aDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qHeZ7AOT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qHeZ7AOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6F9c1Q6Rz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 19:18:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B970MXN024510;
	Mon, 9 Dec 2024 08:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IhKAkR
	BbuSgxLD3v/DHg421/fE+9khw6lByrJXagpYI=; b=qHeZ7AOTOIanE/ioMBg6SP
	g7Gp01Vb5OnUNgkrk3ZIw4tkz2o5qgJh71IyT8/kGfxAtUKrbX5r1ndSaqrtYWw0
	bGG2mIW86X+gIS0laUk12FN22z0OnkMdLfTypxiEQMC1ytCS9PznULdNo+LaBUeO
	PM+IfXihS0F92go4Vm0mAYHPbX3klB410d7Gme0/PNdiJMZUNEsocdadHAXmZvm+
	hhoXOmbCxayEbVxlURQ0OoFh4BnD1QlyKyXprvfJyigBy3oYqPY6T19AVudC1NGM
	jtAfFdQCtbC2PF6ZCL8H9T2JZa4FbLo9frBF8ocHTFpzYMcGtyjsjmZDq4hZ3IGg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsj7dcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:17:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B98E5W7001257;
	Mon, 9 Dec 2024 08:17:39 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsj7dcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:17:39 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B970Wku018605;
	Mon, 9 Dec 2024 08:17:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d26k5k77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:17:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B98HaZo53739830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 08:17:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EFEC2004B;
	Mon,  9 Dec 2024 08:17:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EEA520043;
	Mon,  9 Dec 2024 08:17:35 +0000 (GMT)
Received: from [9.171.77.252] (unknown [9.171.77.252])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Dec 2024 08:17:35 +0000 (GMT)
Message-ID: <72103fc4-518c-4168-a623-741d557944da@linux.ibm.com>
Date: Mon, 9 Dec 2024 09:17:38 +0100
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
From: Tobias Huschle <huschle@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] sched/fair: introduce new scheduler group type
 group_parked
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <20241204112149.25872-2-huschle@linux.ibm.com>
 <5f8584e4-d180-4f65-ab42-9b0348b703d5@linux.ibm.com>
In-Reply-To: <5f8584e4-d180-4f65-ab42-9b0348b703d5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dx5WJGh9W2AdYTM5fEV54A4xE8cISplv
X-Proofpoint-ORIG-GUID: I7Ekzx-ogqg5jG_E2S5oyEOPW_4hVBBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412090061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 05/12/2024 19:04, Shrikanth Hegde wrote:
> 
> 
> On 12/4/24 16:51, Tobias Huschle wrote:
>> A parked CPU is considered to be flagged as unsuitable to process
>> workload at the moment, but might be become usable anytime. Depending on
>> the necessity for additional computation power and/or available capacity
>> of the underlying hardware.
>>
>> A scheduler group is considered to be parked if it only contains parked
>> CPUs. A parked scheduler group is considered to be busier than another
>> if it runs more tasks than the other parked scheduler group.
>>
>> Indicators whether a CPU should be parked depend on the underlying
>> hardware and must be considered to be architecture dependent.
>> Therefore the check whether a CPU is parked is architecture specific.
>> For architectures not relying on this feature, the check is a NOP.
>>
>> This is more efficient and non-disruptive compared to CPU hotplug in
>> environments where such changes can be necessary on a frequent basis.
>>
>> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
>> ---
>>   include/linux/sched/topology.h |  20 ++++++
>>   kernel/sched/core.c            |  10 ++-
>>   kernel/sched/fair.c            | 122 ++++++++++++++++++++++++++-------
>>   3 files changed, 127 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/linux/sched/topology.h b/include/linux/sched/ 
>> topology.h
>> index 4237daa5ac7a..cfe3c59bc329 100644
>> --- a/include/linux/sched/topology.h
>> +++ b/include/linux/sched/topology.h
>> @@ -270,6 +270,26 @@ unsigned long arch_scale_cpu_capacity(int cpu)
>>   }
>>   #endif
>> +#ifndef arch_cpu_parked
>> +/**
>> + * arch_cpu_parked - Check if a given CPU is currently parked.
>> + *
>> + * A parked CPU cannot run any kind of workload since underlying
>> + * physical CPU should not be used at the moment .
>> + *
>> + * @cpu: the CPU in question.
>> + *
>> + * By default assume CPU is not parked
>> + *
>> + * Return: Parked state of CPU
>> + */
>> +static __always_inline
>> +unsigned long arch_cpu_parked(int cpu)
> 
> bool instead?
+1
> 
>> +{
>> +    return false;
>> +}
>> +#endif
>> +
>>   #ifndef arch_scale_hw_pressure
>>   static __always_inline
>>   unsigned long arch_scale_hw_pressure(int cpu)
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 1dee3f5ef940..8f9aeb97c396 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -2437,7 +2437,7 @@ static inline bool is_cpu_allowed(struct 
>> task_struct *p, int cpu)
>>       /* Non kernel threads are not allowed during either online or 
>> offline. */
>>       if (!(p->flags & PF_KTHREAD))
>> -        return cpu_active(cpu);
>> +        return !arch_cpu_parked(cpu) && cpu_active(cpu);
>>       /* KTHREAD_IS_PER_CPU is always allowed. */
>>       if (kthread_is_per_cpu(p))
>> @@ -2447,6 +2447,10 @@ static inline bool is_cpu_allowed(struct 
>> task_struct *p, int cpu)
>>       if (cpu_dying(cpu))
>>           return false;
>> +    /* CPU should be avoided at the moment */
>> +    if (arch_cpu_parked(cpu))
>> +        return false;
>> +
>>       /* But are allowed during online. */
>>       return cpu_online(cpu);
>>   }
>> @@ -3924,6 +3928,10 @@ static inline bool ttwu_queue_cond(struct 
>> task_struct *p, int cpu)
>>       if (task_on_scx(p))
>>           return false;
>> +    /* The task should not be queued onto a parked CPU. */
>> +    if (arch_cpu_parked(cpu))
>> +        return false;
>> +
> 
> When it comes here, likely cpu is not parked since wakeup path has those 
> checks.
+1
> 
>>       /*
>>        * Do not complicate things with the async wake_list while the 
>> CPU is
>>        * in hotplug state.
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 4283c818bbd1..fa1c19d285de 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -7415,6 +7415,9 @@ static int wake_affine(struct sched_domain *sd, 
>> struct task_struct *p,
>>   {
>>       int target = nr_cpumask_bits;
>> +    if (arch_cpu_parked(target))
>> +        return prev_cpu;
>> +
>>       if (sched_feat(WA_IDLE))
>>           target = wake_affine_idle(this_cpu, prev_cpu, sync);
>> @@ -7454,6 +7457,9 @@ sched_balance_find_dst_group_cpu(struct 
>> sched_group *group, struct task_struct *
>>       for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
>>           struct rq *rq = cpu_rq(i);
>> +        if (arch_cpu_parked(i))
>> +            continue;
>> +
>>           if (!sched_core_cookie_match(rq, p))
>>               continue;
>> @@ -7546,10 +7552,14 @@ static inline int 
>> sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
>>       return new_cpu;
>>   }
>> +static inline bool is_idle_cpu_allowed(int cpu)
>> +{
>> +    return !arch_cpu_parked(cpu) && (available_idle_cpu(cpu) || 
>> sched_idle_cpu(cpu));
>> +}
> 
> How about adding below code, it could simplify the code quite a bit. no? 
> sched_idle_rq also might need the same check though.
> 
> +++ b/kernel/sched/syscalls.c
> @@ -214,6 +214,9 @@ int idle_cpu(int cpu)
>                  return 0;
>   #endif
> 
> +       if (arch_cpu_parked(cpu))
> +               return 0;
> +
>          return 1;
>   }
> 
will give that one a go
> 
>> +
>>   static inline int __select_idle_cpu(int cpu, struct task_struct *p)
>>   {
>> -    if ((available_idle_cpu(cpu) || sched_idle_cpu(cpu)) &&
>> -        sched_cpu_cookie_match(cpu_rq(cpu), p))
>> +    if (is_idle_cpu_allowed(cpu) && 
>> sched_cpu_cookie_match(cpu_rq(cpu), p))
>>           return cpu;
>>       return -1;
>> @@ -7657,7 +7667,7 @@ static int select_idle_smt(struct task_struct 
>> *p, struct sched_domain *sd, int t
>>            */
>>           if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>>               continue;
>> -        if (available_idle_cpu(cpu) || sched_idle_cpu(cpu))
>> +        if (is_idle_cpu_allowed(cpu))
>>               return cpu;
>>       }
>> @@ -7779,7 +7789,7 @@ select_idle_capacity(struct task_struct *p, 
>> struct sched_domain *sd, int target)
>>       for_each_cpu_wrap(cpu, cpus, target) {
>>           unsigned long cpu_cap = capacity_of(cpu);
>> -        if (!available_idle_cpu(cpu) && !sched_idle_cpu(cpu))
>> +        if (!is_idle_cpu_allowed(cpu))
>>               continue;
>>           fits = util_fits_cpu(task_util, util_min, util_max, cpu);
>> @@ -7850,7 +7860,7 @@ static int select_idle_sibling(struct 
>> task_struct *p, int prev, int target)
>>        */
>>       lockdep_assert_irqs_disabled();
>> -    if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
>> +    if (is_idle_cpu_allowed(target) &&
>>           asym_fits_cpu(task_util, util_min, util_max, target))
>>           return target;
>> @@ -7858,7 +7868,7 @@ static int select_idle_sibling(struct 
>> task_struct *p, int prev, int target)
>>        * If the previous CPU is cache affine and idle, don't be stupid:
>>        */
>>       if (prev != target && cpus_share_cache(prev, target) &&
>> -        (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
>> +        is_idle_cpu_allowed(prev) &&
>>           asym_fits_cpu(task_util, util_min, util_max, prev)) {
>>           if (!static_branch_unlikely(&sched_cluster_active) ||
>> @@ -7890,7 +7900,7 @@ static int select_idle_sibling(struct 
>> task_struct *p, int prev, int target)
>>       if (recent_used_cpu != prev &&
>>           recent_used_cpu != target &&
>>           cpus_share_cache(recent_used_cpu, target) &&
>> -        (available_idle_cpu(recent_used_cpu) || 
>> sched_idle_cpu(recent_used_cpu)) &&
>> +        is_idle_cpu_allowed(recent_used_cpu) &&
>>           cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
>>           asym_fits_cpu(task_util, util_min, util_max, 
>> recent_used_cpu)) {
>> @@ -9198,7 +9208,12 @@ enum group_type {
>>        * The CPU is overloaded and can't provide expected CPU cycles 
>> to all
>>        * tasks.
>>        */
>> -    group_overloaded
>> +    group_overloaded,
>> +    /*
>> +     * The CPU should be avoided as it can't provide expected CPU cycles
>> +     * even for small amounts of workload.
>> +     */
>> +    group_parked
>>   };
>>   enum migration_type {
>> @@ -9498,7 +9513,7 @@ static int detach_tasks(struct lb_env *env)
>>        * Source run queue has been emptied by another CPU, clear
>>        * LBF_ALL_PINNED flag as we will not test any task.
>>        */
>> -    if (env->src_rq->nr_running <= 1) {
>> +    if (env->src_rq->nr_running <= 1 && !arch_cpu_parked(env- 
>> >src_cpu)) {
>>           env->flags &= ~LBF_ALL_PINNED;
>>           return 0;
>>       }
>> @@ -9511,7 +9526,7 @@ static int detach_tasks(struct lb_env *env)
>>            * We don't want to steal all, otherwise we may be treated 
>> likewise,
>>            * which could at worst lead to a livelock crash.
>>            */
>> -        if (env->idle && env->src_rq->nr_running <= 1)
>> +        if (env->idle && env->src_rq->nr_running <= 1 && ! 
>> arch_cpu_parked(env->src_cpu))
>>               break;
>>           env->loop++;
>> @@ -9870,6 +9885,8 @@ struct sg_lb_stats {
>>       unsigned long group_runnable;        /* Total runnable time over 
>> the CPUs of the group */
>>       unsigned int sum_nr_running;        /* Nr of all tasks running 
>> in the group */
>>       unsigned int sum_h_nr_running;        /* Nr of CFS tasks running 
>> in the group */
>> +    unsigned int sum_nr_parked;
>> +    unsigned int parked_cpus;
> 
> Can you please explain why you need two of these? Is it to identify the 
> group with most parked cpus?  maybe comments is needed.
> 

parked_cpus counts how many CPUs are parked in a scheduler group, which 
is used to determine if a scheduler group consists of only parked CPUs.

sum_nr_parked is meant to be the tie-breaker if there are multiple 
parked scheduler groups. Mind you, a scheduler group is only considered 
parked if all included CPUs are parked.

>>       unsigned int idle_cpus;                 /* Nr of idle 
>> CPUs         in the group */
>>       unsigned int group_weight;
>>       enum group_type group_type;
>> @@ -10127,6 +10144,9 @@ group_type group_classify(unsigned int 
>> imbalance_pct,
>>                 struct sched_group *group,
>>                 struct sg_lb_stats *sgs)
>>   {
>> +    if (sgs->parked_cpus)
>> +        return group_parked;
>> +
>>       if (group_is_overloaded(imbalance_pct, sgs))
>>           return group_overloaded;
>> @@ -10328,10 +10348,15 @@ static inline void update_sg_lb_stats(struct 
>> lb_env *env,
>>           sgs->nr_numa_running += rq->nr_numa_running;
>>           sgs->nr_preferred_running += rq->nr_preferred_running;
>>   #endif
>> +
>> +        if (rq->cfs.h_nr_running) {
>> +            sgs->parked_cpus += arch_cpu_parked(i);
>> +            sgs->sum_nr_parked += arch_cpu_parked(i) * rq- 
>> >cfs.h_nr_running;
>> +        }
>>           /*
>>            * No need to call idle_cpu() if nr_running is not 0
>>            */
>> -        if (!nr_running && idle_cpu(i)) {
>> +        if (!nr_running && idle_cpu(i) && !arch_cpu_parked(i)) {
>>               sgs->idle_cpus++;
>>               /* Idle cpu can't have misfit task */
>>               continue;
>> @@ -10355,7 +10380,14 @@ static inline void update_sg_lb_stats(struct 
>> lb_env *env,
>>       sgs->group_capacity = group->sgc->capacity;
>> -    sgs->group_weight = group->group_weight;
>> +    sgs->group_weight = group->group_weight - sgs->parked_cpus;
>> +
>> +    /*
>> +     * Only a subset of the group is parked, so the group itself has the
>> +     * capability to potentially pull tasks
>> +     */
>> +    if (sgs->parked_cpus < group->group_weight)
>> +        sgs->parked_cpus = 0;
> 
> Say you had a group with 4 cpus and 2 were parked CPUs. Now the 
> group_weight will be 2 and it will be marked as parked. whereas if 1 CPU 
> is parked group will not be marked as parked. That seems wrong.

sgs->group_weight = group->group_weight - sgs->parked_cpus;
--> that line would need to go or be moved, my train of thought was, 
that parked CPUs should not contribute to the weight of a group

> 
> instead mark it as parked and use the parked_cpus number to compare no?

The reasoning behind not marking partially parked groups as parked is 
that those groups still have the potential to pull tasks to its 
non-parked CPUs. If those partially parked groups get flagged as parked, 
the non-parked groups will try to pull tasks, which is not ideal.

Instead, the partially parked group should move all tasks internally to 
its non-parked CPUs. Those might then get overloaded and only then, the 
other non-parked groups should start pulling.

> 
>>       /* Check if dst CPU is idle and preferred to this group */
>>       if (!local_group && env->idle && sgs->sum_h_nr_running &&
>> @@ -10422,6 +10454,8 @@ static bool update_sd_pick_busiest(struct 
>> lb_env *env,
>>        */
>>       switch (sgs->group_type) {
>> +    case group_parked:
>> +        return sgs->sum_nr_parked > busiest->sum_nr_parked;
>>       case group_overloaded:
>>           /* Select the overloaded group with highest avg_load. */
>>           return sgs->avg_load > busiest->avg_load;
>> @@ -10633,6 +10667,9 @@ static inline void 
>> update_sg_wakeup_stats(struct sched_domain *sd,
>>           nr_running = rq->nr_running - local;
>>           sgs->sum_nr_running += nr_running;
>> +        sgs->parked_cpus += arch_cpu_parked(i);
>> +        sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
>> +
>>           /*
>>            * No need to call idle_cpu_without() if nr_running is not 0
>>            */
>> @@ -10649,7 +10686,14 @@ static inline void 
>> update_sg_wakeup_stats(struct sched_domain *sd,
>>       sgs->group_capacity = group->sgc->capacity;
>> -    sgs->group_weight = group->group_weight;
>> +    sgs->group_weight = group->group_weight - sgs->parked_cpus;
>> +
>> +    /*
>> +     * Only a subset of the group is parked, so the group itself has the
>> +     * capability to potentially pull tasks
>> +     */
>> +    if (sgs->parked_cpus < group->group_weight)
>> +        sgs->parked_cpus = 0;
> 
> same comment as above.
+1
> 
>>       sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
>> @@ -10680,6 +10724,8 @@ static bool update_pick_idlest(struct 
>> sched_group *idlest,
>>        */
>>       switch (sgs->group_type) {
>> +    case group_parked:
>> +        return false;
> 
> Why not use the parked_cpus to compare?

It doesn't make much sense to determine whether one parked group might 
be more idle that another. Neither of them should pull tasks (iff the 
assumption is kept, that only groups that contain only parked CPUs are 
considered to be parked.

> 
>>       case group_overloaded:
>>       case group_fully_busy:
>>           /* Select the group with lowest avg_load. */
>> @@ -10730,7 +10776,7 @@ sched_balance_find_dst_group(struct 
>> sched_domain *sd, struct task_struct *p, int
>>       unsigned long imbalance;
>>       struct sg_lb_stats idlest_sgs = {
>>               .avg_load = UINT_MAX,
>> -            .group_type = group_overloaded,
>> +            .group_type = group_parked,
>>       };
>>       do {
>> @@ -10788,6 +10834,8 @@ sched_balance_find_dst_group(struct 
>> sched_domain *sd, struct task_struct *p, int
>>           return idlest;
>>       switch (local_sgs.group_type) {
>> +    case group_parked:
>> +        return idlest;
>>       case group_overloaded:
>>       case group_fully_busy:
>> @@ -11039,6 +11087,12 @@ static inline void calculate_imbalance(struct 
>> lb_env *env, struct sd_lb_stats *s
>>       local = &sds->local_stat;
>>       busiest = &sds->busiest_stat;
>> +    if (busiest->group_type == group_parked) {
>> +        env->migration_type = migrate_task;
>> +        env->imbalance = busiest->sum_nr_parked;
>> +        return;
>> +    }
>> +
>>       if (busiest->group_type == group_misfit_task) {
>>           if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
>>               /* Set imbalance to allow misfit tasks to be balanced. */
>> @@ -11207,13 +11261,14 @@ static inline void 
>> calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>>   /*
>>    * Decision matrix according to the local and busiest group type:
>>    *
>> - * busiest \ local has_spare fully_busy misfit asym imbalanced 
>> overloaded
>> - * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
>> - * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
>> - * misfit_task      force     N/A        N/A    N/A  N/A        N/A
>> - * asym_packing     force     force      N/A    N/A  force      force
>> - * imbalanced       force     force      N/A    N/A  force      force
>> - * overloaded       force     force      N/A    N/A  force      avg_load
>> + * busiest \ local has_spare fully_busy misfit asym imbalanced 
>> overloaded parked
>> + * has_spare        nr_idle   balanced   N/A    N/A  balanced   
>> balanced  balanced
>> + * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   
>> balanced  balanced
>> + * misfit_task      force     N/A        N/A    N/A  N/A        N/ 
>> A       N/A
>> + * asym_packing     force     force      N/A    N/A  force      
>> force     balanced
>> + * imbalanced       force     force      N/A    N/A  force      
>> force     balanced
>> + * overloaded       force     force      N/A    N/A  force      
>> avg_load  balanced
>> + * parked           force     force      N/A    N/A  force      
>> force     nr_tasks
> 
> If i see the code below, if local is parked, it always goes to balanced. 
> how it is nr_tasks? am i reading this table wrong?
> 

update_sd_lb_stats ends up calling update_sd_pick_busiest which then 
compares the number of tasks. But re-reading it I got the comment wrong 
as it does not describe how the busiest group is defined but only how 
busiest compares to local.

>>    *
>>    * N/A :      Not Applicable because already filtered while updating
>>    *            statistics.
>> @@ -11222,6 +11277,8 @@ static inline void calculate_imbalance(struct 
>> lb_env *env, struct sd_lb_stats *s
>>    * avg_load : Only if imbalance is significant enough.
>>    * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
>>    *            different in groups.
>> + * nr_task :  balancing can go either way depending on the number of 
>> running tasks
>> + *            per group
>>    */
>>   /**
>> @@ -11252,6 +11309,13 @@ static struct sched_group 
>> *sched_balance_find_src_group(struct lb_env *env)
>>           goto out_balanced;
>>       busiest = &sds.busiest_stat;
>> +    local = &sds.local_stat;
>> +
>> +    if (local->group_type == group_parked)
>> +        goto out_balanced;
>> +
>> +    if (busiest->group_type == group_parked)
>> +        goto force_balance;
>>       /* Misfit tasks should be dealt with regardless of the avg load */
>>       if (busiest->group_type == group_misfit_task)
>> @@ -11273,7 +11337,6 @@ static struct sched_group 
>> *sched_balance_find_src_group(struct lb_env *env)
>>       if (busiest->group_type == group_imbalanced)
>>           goto force_balance;
>> -    local = &sds.local_stat;
>>       /*
>>        * If the local group is busier than the selected busiest group
>>        * don't try and pull any tasks.
>> @@ -11386,6 +11449,8 @@ static struct rq 
>> *sched_balance_find_src_rq(struct lb_env *env,
>>           enum fbq_type rt;
>>           rq = cpu_rq(i);
>> +        if (arch_cpu_parked(i) && rq->cfs.h_nr_running)
>> +            return rq;
>>           rt = fbq_classify_rq(rq);
>>           /*
>> @@ -11556,6 +11621,9 @@ static int need_active_balance(struct lb_env 
>> *env)
>>   {
>>       struct sched_domain *sd = env->sd;
>> +    if (arch_cpu_parked(env->src_cpu) && !idle_cpu(env->src_cpu))
>> +        return 1;
>> +
>>       if (asym_active_balance(env))
>>           return 1;
>> @@ -11589,6 +11657,9 @@ static int should_we_balance(struct lb_env *env)
>>       struct sched_group *sg = env->sd->groups;
>>       int cpu, idle_smt = -1;
>> +    if (arch_cpu_parked(env->dst_cpu))
>> +        return 0;
>> +
>>       /*
>>        * Ensure the balancing environment is consistent; can happen
>>        * when the softirq triggers 'during' hotplug.
>> @@ -11612,7 +11683,7 @@ static int should_we_balance(struct lb_env *env)
>>       cpumask_copy(swb_cpus, group_balance_mask(sg));
>>       /* Try to find first idle CPU */
>>       for_each_cpu_and(cpu, swb_cpus, env->cpus) {
>> -        if (!idle_cpu(cpu))
>> +        if (!idle_cpu(cpu) || arch_cpu_parked(cpu))
>>               continue;
>>           /*
>> @@ -11707,7 +11778,7 @@ static int sched_balance_rq(int this_cpu, 
>> struct rq *this_rq,
>>       ld_moved = 0;
>>       /* Clear this flag as soon as we find a pullable task */
>>       env.flags |= LBF_ALL_PINNED;
>> -    if (busiest->nr_running > 1) {
>> +    if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {
>>           /*
>>            * Attempt to move tasks. If sched_balance_find_src_group 
>> has found
>>            * an imbalance but busiest->nr_running <= 1, the group is
>> @@ -12721,6 +12792,9 @@ static int sched_balance_newidle(struct rq 
>> *this_rq, struct rq_flags *rf)
>>       update_misfit_status(NULL, this_rq);
>> +    if (arch_cpu_parked(this_cpu))
>> +        return 0;
>> +
>>       /*
>>        * There is a task waiting to run. No need to search for one.
>>        * Return 0; the task will be enqueued when switching to idle.


