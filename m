Return-Path: <linuxppc-dev+bounces-3929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C69EBAC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 21:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y79F373nJz2yvj;
	Wed, 11 Dec 2024 07:24:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733862263;
	cv=none; b=EuSvPzTXxW937vuXzcXb4nO9262pYp1s5lEoj8JdOIen3tU9sYYBMfnTuahm2D+VnnrR+B7Um8xRjQ+RUduhYvFBSsn7vEAwEtmbXPCqzQxdzH25PIb1Uwmay62CTKdK/RFxKaYtp1mwkGv8M0NxH3goBu3hkGvPxEnlH4drvKIKBVu2vKJvtrUQY4D1zVfTPSo0DfTmNsU3y0MS4vU2+sU4buZUyCF8J2CvDaCHw6vpxFI1Lx41hsHj9lbpY1BLB7/HzD3k2485eH/rUy+CKxWIZVSE+ZTEztGDa3j1ux1oMTXoskv6Vf67JsjLHU1FW255rP+1RiAa54pVh5C7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733862263; c=relaxed/relaxed;
	bh=2q8vTxAheHXufmEPBdGNUWKYuQANJMWD5+TNRfKqQPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2E0eB1IOHcpJmMKu0Lz+stmNUyTHj8MbVbgTimn1x5VVB8Mx4vG10VU8wUy5OhCHXkYjZYnPi62YOPZRXrFQR9CSh+Zggi9gKdLspIcJ03YSVVlIpLvY992IKe1ASSq+zbOmcT+RBHx8S7WnAtMu3tqSfZ+Gc91ncqL754ZHZySMwpwKqlwis1VJ4lwUhwThc4J0jjTX2x22OsEKnfdD82KCJAgfpPQZ1LtHj18DnkEgqWONY1q8922gjUmVXOdYDLD4kFBcz4nIFsMxDpRpWNPJU5QFggKZkukZckfACF2cy+XnMVunZj/Q2XKeqp6hrmjCIvRFsKcNiIRklW86g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WTVsmr7M; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WTVsmr7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y79F24lpsz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 07:24:21 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADrYsn005957;
	Tue, 10 Dec 2024 20:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2q8vTx
	AheHXufmEPBdGNUWKYuQANJMWD5+TNRfKqQPU=; b=WTVsmr7MvAOTRx/sGKglbT
	O96hFSaycQaOKfXF+thAXy0TvDFWE0hus9Xdr7uTvOkv9xuLm5tGCmdP4Dox+Aaz
	zx1yzqKtAHM3fTfp3c5WlVH4hgpcK7D/CEzsEyqX//3R/AugrRB6efa6x8oGxVUZ
	363OHXggD7+aSLf/l5rUw/ws2DnEJo/PrKy/my5TWF6iSZ7u/Cgf6pC6a/7M697b
	xVMtJYB4pkONVp8isAFCJTx18BlR3MOyozpcEI6Vo6fgqy5XE7NFoEVBn5etz5JQ
	9GdIiujfTaeSeDBBPgLjpVAZbCX1qQ5TCIEZbMrhUhBky5DC2FHtom2W78ndhlQQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce1vsa0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 20:24:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BAKEhZ7004397;
	Tue, 10 Dec 2024 20:24:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce1vsa0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 20:24:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAKGGVi000582;
	Tue, 10 Dec 2024 20:24:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d1pn5by5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 20:24:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BAKO5Gp56557834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 20:24:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FA2020049;
	Tue, 10 Dec 2024 20:24:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EDB220040;
	Tue, 10 Dec 2024 20:24:02 +0000 (GMT)
Received: from [9.124.213.130] (unknown [9.124.213.130])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 20:24:02 +0000 (GMT)
Message-ID: <4f3b49cb-15bc-43ef-b4cb-3af98c8a1c5f@linux.ibm.com>
Date: Wed, 11 Dec 2024 01:54:00 +0530
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
To: Tobias Huschle <huschle@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <543d376c-85a7-4628-a38e-52bc117258a5@linux.ibm.com>
 <27c4288d-5617-4195-8424-e6e346acefd0@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <27c4288d-5617-4195-8424-e6e346acefd0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZUN6nJxWn9e1I32cRwgH_nzVEJyf0_NC
X-Proofpoint-ORIG-GUID: Y-PYyUnFS4cURr2wYDEHbSXen2MFm9oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100144
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/9/24 13:35, Tobias Huschle wrote:
> 
[...]
>> So I gave it a try with using a debugfs based hint to say which CPUs 
>> are parked.
>> It is a hack to try it out. patch is below so one could try something 
>> similar is their archs
>> and see if it help if they have a use case.
>>
>> Notes:
>> 1. Arch shouldn't set cpu_parked for all CPUs at boot. It causes panic.
>> 2. Workload gets unpacked to all CPUs when changing from 40 CPUs to 80 
>> CPUs, but
>>     doesn't get packed when changing the from 80 to 40 CPUs.
> 
> With stress-ng -l 100 this can happen, I tested with stress-ng -l 50 and 
> that worked well in all cases. As mentioned above, the -l 100 case would 
> need changes to handle the no-hz scenario. I have a patch for that which 
> works, but it is a bit hacky.
> If this also happens with non-100% stressors on your end, something 
> needs ot be fixed code-wise.
> 

It was happening with 100% stress-ng case. I was wondering since i dont have no-hz full enabled.
I found out the reason why and one way to do is to trigger active load balance if there are any parked cpus
in the group. That probably needs a IS_ENABLED check not to hurt the regular case.

Also, I gave a try to include arch_cpu_parked in idle_cpu and friends. It seems to working for me.
I will attach the code below. It simplifies code quite a bit.

Also, I am thinking to rely on active balance codepath more than the regular pull model.
so this would be akin to asym packing codepaths. The below code does that too.

Feel free to take the bits as necessary if it works.

---
  include/linux/sched/topology.h | 20 ++++++++++
  kernel/sched/core.c            |  6 ++-
  kernel/sched/fair.c            | 72 ++++++++++++++++++++++++++++++++--
  kernel/sched/syscalls.c        |  3 ++
  4 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 4237daa5ac7a..cfe3c59bc329 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -270,6 +270,26 @@ unsigned long arch_scale_cpu_capacity(int cpu)
  }
  #endif
  
+#ifndef arch_cpu_parked
+/**
+ * arch_cpu_parked - Check if a given CPU is currently parked.
+ *
+ * A parked CPU cannot run any kind of workload since underlying
+ * physical CPU should not be used at the moment .
+ *
+ * @cpu: the CPU in question.
+ *
+ * By default assume CPU is not parked
+ *
+ * Return: Parked state of CPU
+ */
+static __always_inline
+unsigned long arch_cpu_parked(int cpu)
+{
+	return false;
+}
+#endif
+
  #ifndef arch_scale_hw_pressure
  static __always_inline
  unsigned long arch_scale_hw_pressure(int cpu)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5fbec67d48b2..78ca95aad66b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2437,7 +2437,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  
  	/* Non kernel threads are not allowed during either online or offline. */
  	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+		return !arch_cpu_parked(cpu) && cpu_active(cpu);
  
  	/* KTHREAD_IS_PER_CPU is always allowed. */
  	if (kthread_is_per_cpu(p))
@@ -2447,6 +2447,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  	if (cpu_dying(cpu))
  		return false;
  
+	/* CPU should be avoided at the moment */
+	if (arch_cpu_parked(cpu))
+		return false;
+
  	/* But are allowed during online. */
  	return cpu_online(cpu);
  }
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d5127d9beaea..a6216f63b756 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6898,6 +6898,9 @@ static int sched_idle_rq(struct rq *rq)
  #ifdef CONFIG_SMP
  static int sched_idle_cpu(int cpu)
  {
+	if (arch_cpu_parked(cpu))
+		return 0;
+
  	return sched_idle_rq(cpu_rq(cpu));
  }
  #endif
@@ -7415,6 +7418,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
  {
  	int target = nr_cpumask_bits;
  
+	if (arch_cpu_parked(target))
+		return prev_cpu;
+
  	if (sched_feat(WA_IDLE))
  		target = wake_affine_idle(this_cpu, prev_cpu, sync);
  
@@ -9198,7 +9204,13 @@ enum group_type {
  	 * The CPU is overloaded and can't provide expected CPU cycles to all
  	 * tasks.
  	 */
-	group_overloaded
+	group_overloaded,
+	/*
+	 * The CPU should be avoided as it can't provide expected CPU cycles
+	 * even for small amounts of workload.
+	 */
+	group_parked
+
  };
  
  enum migration_type {
@@ -9880,6 +9892,9 @@ struct sg_lb_stats {
  	unsigned int nr_numa_running;
  	unsigned int nr_preferred_running;
  #endif
+	unsigned int sum_nr_parked;
+	unsigned int parked_cpus;
+
  };
  
  /*
@@ -10127,6 +10142,9 @@ group_type group_classify(unsigned int imbalance_pct,
  			  struct sched_group *group,
  			  struct sg_lb_stats *sgs)
  {
+	if (sgs->parked_cpus)
+		return group_parked;
+
  	if (group_is_overloaded(imbalance_pct, sgs))
  		return group_overloaded;
  
@@ -10328,6 +10346,11 @@ static inline void update_sg_lb_stats(struct lb_env *env,
  		sgs->nr_numa_running += rq->nr_numa_running;
  		sgs->nr_preferred_running += rq->nr_preferred_running;
  #endif
+		if (rq->cfs.h_nr_running) {
+			sgs->parked_cpus += arch_cpu_parked(i);
+			sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
+		}
+
  		/*
  		 * No need to call idle_cpu() if nr_running is not 0
  		 */
@@ -10422,6 +10445,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
  	 */
  
  	switch (sgs->group_type) {
+	case group_parked:
+		return sgs->sum_nr_parked > busiest->sum_nr_parked;
  	case group_overloaded:
  		/* Select the overloaded group with highest avg_load. */
  		return sgs->avg_load > busiest->avg_load;
@@ -10633,6 +10658,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
  		nr_running = rq->nr_running - local;
  		sgs->sum_nr_running += nr_running;
  
+		sgs->parked_cpus += arch_cpu_parked(i);
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
  		/*
  		 * No need to call idle_cpu_without() if nr_running is not 0
  		 */
@@ -10680,6 +10707,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
  	 */
  
  	switch (sgs->group_type) {
+	case group_parked:
+		return false;
  	case group_overloaded:
  	case group_fully_busy:
  		/* Select the group with lowest avg_load. */
@@ -10730,7 +10759,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
  	unsigned long imbalance;
  	struct sg_lb_stats idlest_sgs = {
  			.avg_load = UINT_MAX,
-			.group_type = group_overloaded,
+			.group_type = group_parked,
  	};
  
  	do {
@@ -10788,6 +10817,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
  		return idlest;
  
  	switch (local_sgs.group_type) {
+	case group_parked:
+		return idlest;
  	case group_overloaded:
  	case group_fully_busy:
  
@@ -11039,6 +11070,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
  	local = &sds->local_stat;
  	busiest = &sds->busiest_stat;
  
+	if (busiest->group_type == group_parked) {
+		env->migration_type = migrate_task;
+		env->imbalance = busiest->sum_nr_parked;
+		return;
+	}
+
  	if (busiest->group_type == group_misfit_task) {
  		if (env->sd->flags & SD_ASYM_CPUCAPACITY) {
  			/* Set imbalance to allow misfit tasks to be balanced. */
@@ -11252,6 +11289,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
  		goto out_balanced;
  
  	busiest = &sds.busiest_stat;
+	local = &sds.local_stat;
+
+	if (local->group_type == group_parked)
+		goto out_balanced;
+
+	if (busiest->group_type == group_parked)
+		goto force_balance;
  
  	/* Misfit tasks should be dealt with regardless of the avg load */
  	if (busiest->group_type == group_misfit_task)
@@ -11273,7 +11317,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
  	if (busiest->group_type == group_imbalanced)
  		goto force_balance;
  
-	local = &sds.local_stat;
  	/*
  	 * If the local group is busier than the selected busiest group
  	 * don't try and pull any tasks.
@@ -11386,6 +11429,9 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
  		enum fbq_type rt;
  
  		rq = cpu_rq(i);
+		if (arch_cpu_parked(i) && rq->cfs.h_nr_running)
+			return rq;
+
  		rt = fbq_classify_rq(rq);
  
  		/*
@@ -11556,6 +11602,9 @@ static int need_active_balance(struct lb_env *env)
  {
  	struct sched_domain *sd = env->sd;
  
+	if (arch_cpu_parked(env->src_cpu))
+		return 1;
+
  	if (asym_active_balance(env))
  		return 1;
  
@@ -11588,6 +11637,20 @@ static int should_we_balance(struct lb_env *env)
  	struct cpumask *swb_cpus = this_cpu_cpumask_var_ptr(should_we_balance_tmpmask);
  	struct sched_group *sg = env->sd->groups;
  	int cpu, idle_smt = -1;
+	int cpus_parked = 0;
+
+	if (arch_cpu_parked(env->dst_cpu))
+		return 0;
+
+	for_each_cpu(cpu, sched_domain_span(env->sd)) {
+		if (arch_cpu_parked(cpu)) {
+			cpus_parked ++;
+		}
+	}
+
+	if (cpus_parked && !arch_cpu_parked(env->dst_cpu)) {
+		return 1;
+	}
  
  	/*
  	 * Ensure the balancing environment is consistent; can happen
@@ -12708,6 +12771,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
  
  	update_misfit_status(NULL, this_rq);
  
+	if (arch_cpu_parked(this_cpu))
+		return 0;
+
  	/*
  	 * There is a task waiting to run. No need to search for one.
  	 * Return 0; the task will be enqueued when switching to idle.
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index ff0e5ab4e37c..d408d87da563 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -203,6 +203,9 @@ int idle_cpu(int cpu)
  {
  	struct rq *rq = cpu_rq(cpu);
  
+	if (arch_cpu_parked(cpu))
+		return 0;
+
  	if (rq->curr != rq->idle)
  		return 0;
  
-- 
2.39.3



>>

>>
>> Set the hint as 80 initially and set to 40 midway -- *not working*
>> Average:      38   95.27    0.00    0.00    0.00    0.00    0.00 
>> 0.00    0.00    0.00    4.73
>> Average:      39   95.27    0.00    0.00    0.00    0.00    0.00 
>> 0.00    0.00    0.00    4.73
>> Average:      40   95.24    0.00    0.00    0.00    0.00    0.00 
>> 0.00    0.00    0.00    4.76
>> Average:      41   95.25    0.00    0.00    0.00    0.00    0.00 
>> 0.00    0.00    0.00    4.75
> 

Set the hint as 80 initially and set to 40 midway.

Average:      38   92.11    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    7.89
Average:      39   92.13    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    7.87
Average:      40   53.35    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   46.65
Average:      41   53.39    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   46.61

