Return-Path: <linuxppc-dev+bounces-6265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E741EA381C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 12:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxLBD1k4mz30NY;
	Mon, 17 Feb 2025 22:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739791988;
	cv=none; b=FQgFOTw4BtnruGUlYghTL3qc7qMrBT7bRrYRbDQ+y2FWV9RiC+JFK2SDfbMEplGvsxz0flg/GzlsMh1hG9tQtEf+eFIlpoCu2A+5cSZdW9Nkd8/qqewUWacCU+H/vqr1rClcqfsQuMN+/HFwKVwkbSxEvkvP95mk1gAX7HxE8Qdq25xJrpIFHDFDZfZ2/R/SydqKB61H4Yo2d23fjIyH9KhlO4GktfAJEs2SO1ytNr5QFYMc6vTp/I1iFsxTjU3ukw1I+ZEz3vSWsVr9+c6g+yUlCx1mFdFI4KLXOYcs/F/E8bdg7zsc786aOzcUNUP2375W50Ua/NtGmyRadIxr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739791988; c=relaxed/relaxed;
	bh=GFSuTL0wVA4W2BUlB1YYfOi/uI+wmRuBbqHr7tg5pYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwPclID5VXX4z2f21LWqthbjZt4OgBrDPn6oOlHfox84Bd9ABMSXgmXb6O8gxqijnC78bvlthr7ruZg0djqb8Mbdlow6DlGsi51vZWUUxWSps+l1J7/80WIKenwFWJG7oKFFnh55NADvlerxwhHV/QhtaXLBVaH7tcKTE2nrbI7hJNTEvX3K5btkkwbf9qVFbbrIw/tpuO5uMGBGSAxqe9o0OAUZA0xziEl2etxEfWq5ef/4K9B4GyonvtgoUQxT3tUek6apvYeNtUmhgyPwoxxcL1bQi3qhzY6WoO3KglpAEb8vyNMFUNDGOVUNPkE+gqxrKbeLcZeb62sV9CA8iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ocS2SR5A; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ocS2SR5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxLBC1qL7z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 22:33:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HBBpht029270;
	Mon, 17 Feb 2025 11:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GFSuTL0wVA4W2BUlB
	1YYfOi/uI+wmRuBbqHr7tg5pYE=; b=ocS2SR5ACZOBwB7B2mDwfqtZZTp1TsiCi
	mq1rQQYmG/z/04k80bQGHvh6yX8SbASn341RGwOyA2+oVmPR/cZqDL2iMWYif8SC
	FruDPhbvxxlM8sm2qm/ILkz+GAinV2+PwLU3QZTDDHxbh6Hp8+R7DKjTmfcIDymJ
	Wa51Wa4ZFQguRDYhpBCK9efCnxUlKzDOQwk4ZESUdS+Lct8VmNU+xxfdfiO7v4f8
	Lcd5ZAIscNaBVwGeIrITRp/Jw8InR65EjncrGNfe0V2oq6lcZnD1AXmzX+fnVIsJ
	HjeQvb6SEWMbAWYbo58hL7HZn0Q6Pc1++nlHb5heHAzhhucbllS6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44us5a2wp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HBUh8Y007167;
	Mon, 17 Feb 2025 11:32:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44us5a2wny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H8MxhW001633;
	Mon, 17 Feb 2025 11:32:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u5myny43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HBWoJ944630472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 11:32:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D2B920043;
	Mon, 17 Feb 2025 11:32:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BD0020040;
	Mon, 17 Feb 2025 11:32:49 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.179.18.115])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 11:32:49 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [RFC PATCH v2 1/3] sched/fair: introduce new scheduler group type group_parked
Date: Mon, 17 Feb 2025 12:32:50 +0100
Message-Id: <20250217113252.21796-2-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217113252.21796-1-huschle@linux.ibm.com>
References: <20250217113252.21796-1-huschle@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hDK-16KfeOMKP6pgds0BtC2jX-sFUjhu
X-Proofpoint-GUID: 3BKwwwBUdmo_HOKfdKUzZ0Vmszjf5Ei0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A parked CPU is considered to be flagged as unsuitable to process
workload at the moment, but might be become usable anytime. Depending on
the necessity for additional computation power and/or available capacity
of the underlying hardware.

A scheduler group is considered to be parked, if there are tasks queued
on parked CPUs and there are no idle CPUs, i.e. all non parked CPUs are
busy or there are only parked CPUs. A scheduler group with parked tasks
can be considered to not be parked, if it has idle CPUs which can pick
up the parked tasks. A parked scheduler group is considered to be busier
than another if it runs more tasks on parked CPUs than another parked
scheduler group.

A parked CPU must keep its scheduler tick (or have it re-enabled if
necessary) in order to make sure that parked CPUs which only run a
single task which does not give up its runtime voluntarily is still
evacuated as it would otherwise go into NO_HZ.

The status of the underlying hardware must be considered to be
architecture dependent. Therefore the check whether a CPU is parked is
architecture specific. For architectures not relying on this feature,
the check is mostly a NOP.

This is more efficient and non-disruptive compared to CPU hotplug in
environments where such changes can be necessary on a frequent basis.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 include/linux/sched/topology.h | 19 ++++++++
 kernel/sched/core.c            | 13 ++++-
 kernel/sched/fair.c            | 86 +++++++++++++++++++++++++++++-----
 kernel/sched/syscalls.c        |  3 ++
 4 files changed, 109 insertions(+), 12 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 7f3dbafe1817..2a4730729988 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -265,6 +265,25 @@ unsigned long arch_scale_cpu_capacity(int cpu)
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
+static __always_inline bool arch_cpu_parked(int cpu)
+{
+	return false;
+}
+#endif
+
 #ifndef arch_scale_hw_pressure
 static __always_inline
 unsigned long arch_scale_hw_pressure(int cpu)
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..9ed15911ec60 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1352,6 +1352,9 @@ bool sched_can_stop_tick(struct rq *rq)
 	if (rq->cfs.h_nr_queued > 1)
 		return false;
 
+	if (rq->cfs.nr_running > 0 && arch_cpu_parked(cpu_of(rq)))
+		return false;
+
 	/*
 	 * If there is one task and it has CFS runtime bandwidth constraints
 	 * and it's on the cpu now we don't want to stop the tick.
@@ -2443,7 +2446,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 
 	/* Non kernel threads are not allowed during either online or offline. */
 	if (!(p->flags & PF_KTHREAD))
-		return cpu_active(cpu);
+		return !arch_cpu_parked(cpu) && cpu_active(cpu);
 
 	/* KTHREAD_IS_PER_CPU is always allowed. */
 	if (kthread_is_per_cpu(p))
@@ -2453,6 +2456,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 	if (cpu_dying(cpu))
 		return false;
 
+	/* CPU should be avoided at the moment */
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	/* But are allowed during online. */
 	return cpu_online(cpu);
 }
@@ -3930,6 +3937,10 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
 	if (task_on_scx(p))
 		return false;
 
+	/* The task should not be queued onto a parked CPU. */
+	if (arch_cpu_parked(cpu))
+		return false;
+
 	/*
 	 * Do not complicate things with the async wake_list while the CPU is
 	 * in hotplug state.
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c0ef435a7aa..5eb1a3113704 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6871,6 +6871,8 @@ static int sched_idle_rq(struct rq *rq)
 #ifdef CONFIG_SMP
 static int sched_idle_cpu(int cpu)
 {
+	if (arch_cpu_parked(cpu))
+		return 0;
 	return sched_idle_rq(cpu_rq(cpu));
 }
 #endif
@@ -7399,6 +7401,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 {
 	int target = nr_cpumask_bits;
 
+	if (arch_cpu_parked(target))
+		return prev_cpu;
+
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
@@ -9182,7 +9187,12 @@ enum group_type {
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
 };
 
 enum migration_type {
@@ -9902,6 +9912,7 @@ struct sg_lb_stats {
 	unsigned long group_runnable;		/* Total runnable time over the CPUs of the group */
 	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
 	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
+	unsigned int sum_nr_parked;
 	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
 	unsigned int group_weight;
 	enum group_type group_type;
@@ -10159,6 +10170,9 @@ group_type group_classify(unsigned int imbalance_pct,
 			  struct sched_group *group,
 			  struct sg_lb_stats *sgs)
 {
+	if (sgs->sum_nr_parked && !sgs->idle_cpus)
+		return group_parked;
+
 	if (group_is_overloaded(imbalance_pct, sgs))
 		return group_overloaded;
 
@@ -10354,6 +10368,8 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		if (cpu_overutilized(i))
 			*sg_overutilized = 1;
 
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
 		 */
@@ -10459,6 +10475,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return sgs->sum_nr_parked > busiest->sum_nr_parked;
 	case group_overloaded:
 		/* Select the overloaded group with highest avg_load. */
 		return sgs->avg_load > busiest->avg_load;
@@ -10622,6 +10640,9 @@ static int idle_cpu_without(int cpu, struct task_struct *p)
 {
 	struct rq *rq = cpu_rq(cpu);
 
+	if (arch_cpu_parked(cpu))
+		return 0;
+
 	if (rq->curr != rq->idle && rq->curr != p)
 		return 0;
 
@@ -10670,6 +10691,8 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		nr_running = rq->nr_running - local;
 		sgs->sum_nr_running += nr_running;
 
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_queued;
+
 		/*
 		 * No need to call idle_cpu_without() if nr_running is not 0
 		 */
@@ -10717,6 +10740,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return false;
 	case group_overloaded:
 	case group_fully_busy:
 		/* Select the group with lowest avg_load. */
@@ -10767,7 +10792,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	unsigned long imbalance;
 	struct sg_lb_stats idlest_sgs = {
 			.avg_load = UINT_MAX,
-			.group_type = group_overloaded,
+			.group_type = group_parked,
 	};
 
 	do {
@@ -10825,6 +10850,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		return idlest;
 
 	switch (local_sgs.group_type) {
+	case group_parked:
+		return idlest;
 	case group_overloaded:
 	case group_fully_busy:
 
@@ -11076,6 +11103,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
@@ -11244,13 +11277,14 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 /*
  * Decision matrix according to the local and busiest group type:
  *
- * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded
- * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced
- * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced
- * misfit_task      force     N/A        N/A    N/A  N/A        N/A
- * asym_packing     force     force      N/A    N/A  force      force
- * imbalanced       force     force      N/A    N/A  force      force
- * overloaded       force     force      N/A    N/A  force      avg_load
+ * busiest \ local has_spare fully_busy misfit asym imbalanced overloaded parked
+ * has_spare        nr_idle   balanced   N/A    N/A  balanced   balanced  balanced
+ * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   balanced  balanced
+ * misfit_task      force     N/A        N/A    N/A  N/A        N/A       N/A
+ * asym_packing     force     force      N/A    N/A  force      force     balanced
+ * imbalanced       force     force      N/A    N/A  force      force     balanced
+ * overloaded       force     force      N/A    N/A  force      avg_load  balanced
+ * parked           force     force      N/A    N/A  force      force     balanced
  *
  * N/A :      Not Applicable because already filtered while updating
  *            statistics.
@@ -11259,6 +11293,8 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
  * avg_load : Only if imbalance is significant enough.
  * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
  *            different in groups.
+ * nr_task :  balancing can go either way depending on the number of running tasks
+ *            per group
  */
 
 /**
@@ -11289,6 +11325,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
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
@@ -11310,7 +11353,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_imbalanced)
 		goto force_balance;
 
-	local = &sds.local_stat;
 	/*
 	 * If the local group is busier than the selected busiest group
 	 * don't try and pull any tasks.
@@ -11423,6 +11465,9 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 		enum fbq_type rt;
 
 		rq = cpu_rq(i);
+		if (arch_cpu_parked(i) && rq->cfs.h_nr_queued)
+			return rq;
+
 		rt = fbq_classify_rq(rq);
 
 		/*
@@ -11593,6 +11638,9 @@ static int need_active_balance(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
 
+	if (arch_cpu_parked(env->src_cpu) && cpu_rq(env->src_cpu)->cfs.h_nr_queued)
+		return 1;
+
 	if (asym_active_balance(env))
 		return 1;
 
@@ -11626,6 +11674,14 @@ static int should_we_balance(struct lb_env *env)
 	struct sched_group *sg = env->sd->groups;
 	int cpu, idle_smt = -1;
 
+	if (arch_cpu_parked(env->dst_cpu))
+		return 0;
+
+	for_each_cpu(cpu, sched_domain_span(env->sd)) {
+		if (arch_cpu_parked(cpu) && cpu_rq(cpu)->cfs.h_nr_queued)
+			return 1;
+	}
+
 	/*
 	 * Ensure the balancing environment is consistent; can happen
 	 * when the softirq triggers 'during' hotplug.
@@ -11766,7 +11822,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	ld_moved = 0;
 	/* Clear this flag as soon as we find a pullable task */
 	env.flags |= LBF_ALL_PINNED;
-	if (busiest->nr_running > 1) {
+	if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {
 		/*
 		 * Attempt to move tasks. If sched_balance_find_src_group has found
 		 * an imbalance but busiest->nr_running <= 1, the group is
@@ -12356,6 +12412,11 @@ static void nohz_balancer_kick(struct rq *rq)
 	if (time_before(now, nohz.next_balance))
 		goto out;
 
+	if (!idle_cpu(rq->cpu)) {
+		flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
+		goto out;
+	}
+
 	if (rq->nr_running >= 2) {
 		flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
 		goto out;
@@ -12767,6 +12828,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 	update_misfit_status(NULL, this_rq);
 
+	if (arch_cpu_parked(this_cpu))
+		return 0;
+
 	/*
 	 * There is a task waiting to run. No need to search for one.
 	 * Return 0; the task will be enqueued when switching to idle.
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 456d339be98f..7efd76a30be7 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -214,6 +214,9 @@ int idle_cpu(int cpu)
 		return 0;
 #endif
 
+	if (arch_cpu_parked(cpu))
+		return 0;
+
 	return 1;
 }
 
-- 
2.34.1


