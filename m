Return-Path: <linuxppc-dev+bounces-3789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839329E38AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 12:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3FVg1WhPz30WW;
	Wed,  4 Dec 2024 22:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733311355;
	cv=none; b=C73DMcyubfB/xTFRFBELMQZNvCo286cT2yF8WFKka6lPZf2TYa9mB5jJh9UurHa26wWB096hGuUrwiPK1RrNMaoAYKX5aJSmOT89ggowQsNi9k3OxEoqNj/ZDAvKMQCULv3C3Q/j4i0WLWAxqwzYlOxe10D1JwC6vdPkXmbs7K4qvgA5RWVVr4STgwTYyfxkybNeJtaqoPGaKtmBlgqDDBOwX4/aEHewDnfP0BPdITB/b1wL6xgfCZ2Jqd/63MjhsIsRCCS7SNM5dynnejs0N4NhaYzFu8DOknw779aT/UILQnlWCNk+2mki8WiYSlBBpinhuiMeZRrdvHIz71vAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733311355; c=relaxed/relaxed;
	bh=x9adoXeHN0gWd9vIJn+XlnfsB8ML8qkIqqiURRv5I0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VuBlOAbZw6s7qAOv2cyFMy6AG4Qfa6pKXiRxnFo6YTN19XT0We55KlgZZdmN82DlN7R686U4t02GVOXZu+Nai4rKfsC6y5MaZbfmot5djPIJgehY4Bzd2+S6q/xrdyeE0FgNNswYqWvms7hnFaZflRxZ6W1lKR3u7ZKpbrWRCf4yp1iJA6LklJCIQoBpGzvNqM9gxcg1k6d9HtTbGionoXFY8mHaD7BkasnYcEUlz1UtOOyEet69PdlO9jw4cjvWd7WJ82eq66xae7+zZWis1RY2pB2kijfj0t8s3basiZPtGIFHcSjJ+tz25Jn1jNNVGfrHcvVteP/pl452KRFVYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=glk1pJYl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=glk1pJYl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3FVc69kXz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 22:22:32 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B47YwYr005437;
	Wed, 4 Dec 2024 11:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=x9adoXeHN0gWd9vIJ
	n+XlnfsB8ML8qkIqqiURRv5I0A=; b=glk1pJYlQMzcALSRy0uVG4yEMu9dWIjit
	p6bmeKPtLXj0AxTTWfZnT0B/CfgLCcPpncbF2uUJgfP7BD7jpHwrrV028fGlzxKa
	EPbgYJoPc2UTXbDko8pELkJl8Xw/kim4RE/Q9tgrsSo7Sp5ym8Ozxsnmt4kqMZdb
	qzm5tBObUJGmEd6pByB8NmrhxJlclvEVy94N0Ck3jqtTEhukj99piaTMI7SwOmJk
	Ivr3Unt/jEvUOLkANKfAxeAKIFpyTFb3eHYzozhQLA0cTtEMdfp6TKLzLB6zBG/G
	/GrhEGLSQSS0yhbq6G7x7l73bseLza6awHoUTTZTwhrNj98K6NK0Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437te985nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B4BHVvA030492;
	Wed, 4 Dec 2024 11:21:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437te985nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4AMf3w006840;
	Wed, 4 Dec 2024 11:21:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 438f8jmfj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B4BLq9d13631820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 11:21:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D0C920040;
	Wed,  4 Dec 2024 11:21:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E90F2004D;
	Wed,  4 Dec 2024 11:21:51 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.171.34.7])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Dec 2024 11:21:51 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Subject: [RFC PATCH 1/2] sched/fair: introduce new scheduler group type group_parked
Date: Wed,  4 Dec 2024 12:21:48 +0100
Message-Id: <20241204112149.25872-2-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204112149.25872-1-huschle@linux.ibm.com>
References: <20241204112149.25872-1-huschle@linux.ibm.com>
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
X-Proofpoint-GUID: qLlBvRaXmycuCFWlePYJllfHZYjls4A6
X-Proofpoint-ORIG-GUID: bg091gQDuB65HHjsqJRR5Gszz81P3mEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040086
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A parked CPU is considered to be flagged as unsuitable to process
workload at the moment, but might be become usable anytime. Depending on
the necessity for additional computation power and/or available capacity
of the underlying hardware.

A scheduler group is considered to be parked if it only contains parked
CPUs. A parked scheduler group is considered to be busier than another
if it runs more tasks than the other parked scheduler group.

Indicators whether a CPU should be parked depend on the underlying 
hardware and must be considered to be architecture dependent. 
Therefore the check whether a CPU is parked is architecture specific. 
For architectures not relying on this feature, the check is a NOP.

This is more efficient and non-disruptive compared to CPU hotplug in
environments where such changes can be necessary on a frequent basis.

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 include/linux/sched/topology.h |  20 ++++++
 kernel/sched/core.c            |  10 ++-
 kernel/sched/fair.c            | 122 ++++++++++++++++++++++++++-------
 3 files changed, 127 insertions(+), 25 deletions(-)

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
index 1dee3f5ef940..8f9aeb97c396 100644
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
@@ -3924,6 +3928,10 @@ static inline bool ttwu_queue_cond(struct task_struct *p, int cpu)
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
index 4283c818bbd1..fa1c19d285de 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7415,6 +7415,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 {
 	int target = nr_cpumask_bits;
 
+	if (arch_cpu_parked(target))
+		return prev_cpu;
+
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
@@ -7454,6 +7457,9 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
 	for_each_cpu_and(i, sched_group_span(group), p->cpus_ptr) {
 		struct rq *rq = cpu_rq(i);
 
+		if (arch_cpu_parked(i))
+			continue;
+
 		if (!sched_core_cookie_match(rq, p))
 			continue;
 
@@ -7546,10 +7552,14 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
 	return new_cpu;
 }
 
+static inline bool is_idle_cpu_allowed(int cpu)
+{
+	return !arch_cpu_parked(cpu) && (available_idle_cpu(cpu) || sched_idle_cpu(cpu));
+}
+
 static inline int __select_idle_cpu(int cpu, struct task_struct *p)
 {
-	if ((available_idle_cpu(cpu) || sched_idle_cpu(cpu)) &&
-	    sched_cpu_cookie_match(cpu_rq(cpu), p))
+	if (is_idle_cpu_allowed(cpu) && sched_cpu_cookie_match(cpu_rq(cpu), p))
 		return cpu;
 
 	return -1;
@@ -7657,7 +7667,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
 		 */
 		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
 			continue;
-		if (available_idle_cpu(cpu) || sched_idle_cpu(cpu))
+		if (is_idle_cpu_allowed(cpu))
 			return cpu;
 	}
 
@@ -7779,7 +7789,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	for_each_cpu_wrap(cpu, cpus, target) {
 		unsigned long cpu_cap = capacity_of(cpu);
 
-		if (!available_idle_cpu(cpu) && !sched_idle_cpu(cpu))
+		if (!is_idle_cpu_allowed(cpu))
 			continue;
 
 		fits = util_fits_cpu(task_util, util_min, util_max, cpu);
@@ -7850,7 +7860,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	 */
 	lockdep_assert_irqs_disabled();
 
-	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
+	if (is_idle_cpu_allowed(target) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
 		return target;
 
@@ -7858,7 +7868,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	 * If the previous CPU is cache affine and idle, don't be stupid:
 	 */
 	if (prev != target && cpus_share_cache(prev, target) &&
-	    (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
+		is_idle_cpu_allowed(prev) &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
@@ -7890,7 +7900,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	if (recent_used_cpu != prev &&
 	    recent_used_cpu != target &&
 	    cpus_share_cache(recent_used_cpu, target) &&
-	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
+	    is_idle_cpu_allowed(recent_used_cpu) &&
 	    cpumask_test_cpu(recent_used_cpu, p->cpus_ptr) &&
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
 
@@ -9198,7 +9208,12 @@ enum group_type {
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
@@ -9498,7 +9513,7 @@ static int detach_tasks(struct lb_env *env)
 	 * Source run queue has been emptied by another CPU, clear
 	 * LBF_ALL_PINNED flag as we will not test any task.
 	 */
-	if (env->src_rq->nr_running <= 1) {
+	if (env->src_rq->nr_running <= 1 && !arch_cpu_parked(env->src_cpu)) {
 		env->flags &= ~LBF_ALL_PINNED;
 		return 0;
 	}
@@ -9511,7 +9526,7 @@ static int detach_tasks(struct lb_env *env)
 		 * We don't want to steal all, otherwise we may be treated likewise,
 		 * which could at worst lead to a livelock crash.
 		 */
-		if (env->idle && env->src_rq->nr_running <= 1)
+		if (env->idle && env->src_rq->nr_running <= 1 && !arch_cpu_parked(env->src_cpu))
 			break;
 
 		env->loop++;
@@ -9870,6 +9885,8 @@ struct sg_lb_stats {
 	unsigned long group_runnable;		/* Total runnable time over the CPUs of the group */
 	unsigned int sum_nr_running;		/* Nr of all tasks running in the group */
 	unsigned int sum_h_nr_running;		/* Nr of CFS tasks running in the group */
+	unsigned int sum_nr_parked;
+	unsigned int parked_cpus;
 	unsigned int idle_cpus;                 /* Nr of idle CPUs         in the group */
 	unsigned int group_weight;
 	enum group_type group_type;
@@ -10127,6 +10144,9 @@ group_type group_classify(unsigned int imbalance_pct,
 			  struct sched_group *group,
 			  struct sg_lb_stats *sgs)
 {
+	if (sgs->parked_cpus)
+		return group_parked;
+
 	if (group_is_overloaded(imbalance_pct, sgs))
 		return group_overloaded;
 
@@ -10328,10 +10348,15 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		sgs->nr_numa_running += rq->nr_numa_running;
 		sgs->nr_preferred_running += rq->nr_preferred_running;
 #endif
+
+		if (rq->cfs.h_nr_running) {
+			sgs->parked_cpus += arch_cpu_parked(i);
+			sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
+		}
 		/*
 		 * No need to call idle_cpu() if nr_running is not 0
 		 */
-		if (!nr_running && idle_cpu(i)) {
+		if (!nr_running && idle_cpu(i) && !arch_cpu_parked(i)) {
 			sgs->idle_cpus++;
 			/* Idle cpu can't have misfit task */
 			continue;
@@ -10355,7 +10380,14 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 
 	sgs->group_capacity = group->sgc->capacity;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
+
+	/*
+	 * Only a subset of the group is parked, so the group itself has the
+	 * capability to potentially pull tasks
+	 */
+	if (sgs->parked_cpus < group->group_weight)
+		sgs->parked_cpus = 0;
 
 	/* Check if dst CPU is idle and preferred to this group */
 	if (!local_group && env->idle && sgs->sum_h_nr_running &&
@@ -10422,6 +10454,8 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return sgs->sum_nr_parked > busiest->sum_nr_parked;
 	case group_overloaded:
 		/* Select the overloaded group with highest avg_load. */
 		return sgs->avg_load > busiest->avg_load;
@@ -10633,6 +10667,9 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		nr_running = rq->nr_running - local;
 		sgs->sum_nr_running += nr_running;
 
+		sgs->parked_cpus += arch_cpu_parked(i);
+		sgs->sum_nr_parked += arch_cpu_parked(i) * rq->cfs.h_nr_running;
+
 		/*
 		 * No need to call idle_cpu_without() if nr_running is not 0
 		 */
@@ -10649,7 +10686,14 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	sgs->group_capacity = group->sgc->capacity;
 
-	sgs->group_weight = group->group_weight;
+	sgs->group_weight = group->group_weight - sgs->parked_cpus;
+
+	/*
+	 * Only a subset of the group is parked, so the group itself has the
+	 * capability to potentially pull tasks
+	 */
+	if (sgs->parked_cpus < group->group_weight)
+		sgs->parked_cpus = 0;
 
 	sgs->group_type = group_classify(sd->imbalance_pct, group, sgs);
 
@@ -10680,6 +10724,8 @@ static bool update_pick_idlest(struct sched_group *idlest,
 	 */
 
 	switch (sgs->group_type) {
+	case group_parked:
+		return false;
 	case group_overloaded:
 	case group_fully_busy:
 		/* Select the group with lowest avg_load. */
@@ -10730,7 +10776,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	unsigned long imbalance;
 	struct sg_lb_stats idlest_sgs = {
 			.avg_load = UINT_MAX,
-			.group_type = group_overloaded,
+			.group_type = group_parked,
 	};
 
 	do {
@@ -10788,6 +10834,8 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		return idlest;
 
 	switch (local_sgs.group_type) {
+	case group_parked:
+		return idlest;
 	case group_overloaded:
 	case group_fully_busy:
 
@@ -11039,6 +11087,12 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
@@ -11207,13 +11261,14 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
+ * parked           force     force      N/A    N/A  force      force     nr_tasks
  *
  * N/A :      Not Applicable because already filtered while updating
  *            statistics.
@@ -11222,6 +11277,8 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
  * avg_load : Only if imbalance is significant enough.
  * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
  *            different in groups.
+ * nr_task :  balancing can go either way depending on the number of running tasks
+ *            per group
  */
 
 /**
@@ -11252,6 +11309,13 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
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
@@ -11273,7 +11337,6 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_imbalanced)
 		goto force_balance;
 
-	local = &sds.local_stat;
 	/*
 	 * If the local group is busier than the selected busiest group
 	 * don't try and pull any tasks.
@@ -11386,6 +11449,8 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 		enum fbq_type rt;
 
 		rq = cpu_rq(i);
+		if (arch_cpu_parked(i) && rq->cfs.h_nr_running)
+			return rq;
 		rt = fbq_classify_rq(rq);
 
 		/*
@@ -11556,6 +11621,9 @@ static int need_active_balance(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
 
+	if (arch_cpu_parked(env->src_cpu) && !idle_cpu(env->src_cpu))
+		return 1;
+
 	if (asym_active_balance(env))
 		return 1;
 
@@ -11589,6 +11657,9 @@ static int should_we_balance(struct lb_env *env)
 	struct sched_group *sg = env->sd->groups;
 	int cpu, idle_smt = -1;
 
+	if (arch_cpu_parked(env->dst_cpu))
+		return 0;
+
 	/*
 	 * Ensure the balancing environment is consistent; can happen
 	 * when the softirq triggers 'during' hotplug.
@@ -11612,7 +11683,7 @@ static int should_we_balance(struct lb_env *env)
 	cpumask_copy(swb_cpus, group_balance_mask(sg));
 	/* Try to find first idle CPU */
 	for_each_cpu_and(cpu, swb_cpus, env->cpus) {
-		if (!idle_cpu(cpu))
+		if (!idle_cpu(cpu) || arch_cpu_parked(cpu))
 			continue;
 
 		/*
@@ -11707,7 +11778,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	ld_moved = 0;
 	/* Clear this flag as soon as we find a pullable task */
 	env.flags |= LBF_ALL_PINNED;
-	if (busiest->nr_running > 1) {
+	if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {
 		/*
 		 * Attempt to move tasks. If sched_balance_find_src_group has found
 		 * an imbalance but busiest->nr_running <= 1, the group is
@@ -12721,6 +12792,9 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 	update_misfit_status(NULL, this_rq);
 
+	if (arch_cpu_parked(this_cpu))
+		return 0;
+
 	/*
 	 * There is a task waiting to run. No need to search for one.
 	 * Return 0; the task will be enqueued when switching to idle.
-- 
2.34.1


