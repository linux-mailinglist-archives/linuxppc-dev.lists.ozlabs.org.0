Return-Path: <linuxppc-dev+bounces-9789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD399AE8E37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:13:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBK426n2z3bkT;
	Thu, 26 Jun 2025 05:12:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878744;
	cv=none; b=mwwZnlqp5aCqg4XEM04zhff6NqGvs4Wz/R5Y5y2qCF4Bfe23wm1naAsitiHk0TbyKDnbLp0cC7ZbOk7l6Ltwik05VBSYdPNBAZfS4wCIPUj39zE2eRxNIW56JaDsY9fFHZ1a3YjnipGu4fi5lLcHTpHUMcX74VBJG69SAgXAonrVJFEeVhoRxIibxK2GE5Ida6fedjTmdUXZ57mvrZxMJO0eNuzomHbtjAGHPCgZ13bddBwWeAUkO+6kl4TFMqBM9hiGc+47t3jv2Z/PNaWV5CooBZmzDwtrDzjQ2fKzbdhRYkqtZX7aUdZNmxdCgraB9zNBbAsj0HP+6RVXX391Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878744; c=relaxed/relaxed;
	bh=vaTKvaw0EsjGRWkOVnsWptMm4bJfQ509JCNCEZixgtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0UyzAGokrQNOjdrPnzT+SqpwsQHZ6xsLuZUbTOH/0rBOv3r7wg8999dyA1vfUNy9xsPGy/Vl/rZ0SU+R/0vAn6MlDaGPJktD56wgjGcf+snaKqE9iOZpsQLu69f3vD3IZ+eOVbW3e35pL66zBLANG9Q0XY9/lDPmtGlv8naoYvdVkpHUnYlqXVKuDtGp2iIkFhmT4SghtpsBrlgphyyEBsz8T1sAlM1nfyd+5VCaZcf/AbYpTFZnKdq4Dz6HIt8Ab53OqUFNuKxKkEoLVqs14+RUn6lHQCOezBGJR9KxAl//6Ep5MHWGXyDuWAbX9YXQc5FKJiDEIreEDRe1sjJgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXk0YosM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXk0YosM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBK33W8hz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PIMOIv027991;
	Wed, 25 Jun 2025 19:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vaTKvaw0EsjGRWkOV
	nsWptMm4bJfQ509JCNCEZixgtQ=; b=oXk0YosMHwey4Q7vVwDm/ywFDwwLgcaM2
	ducAd7zh/3MEl+B58BZoy4CWA7jHaTFB8tegFFfU0PyZUL3ENPzTke1lnGMJxCWA
	SOPZIa0wz0D7QDRzeMFXIyYHeEewnRY2RJujEnEfbWW3jVlMWehYdZ8Z9dYpIuEh
	SpcxD5wF7of00Uiv9uFCaTH3OBtJoS9cqLXr31Qw2DIjlreWyxRSheeMm5B3XZze
	AyDjEVSREz2T+7/wOP2/cV2Pfcg5pO9Knn97tkb7wVD81bx6tw4ACc6nGA3LiHpv
	mtuna7EUB7uhnzIQhFkm77lSXqvNcg/0c7kGcMIysUh691/CXGKig==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:01 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJC1xs023400;
	Wed, 25 Jun 2025 19:12:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jhhey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:01 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PJ6Xxf014748;
	Wed, 25 Jun 2025 19:12:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s2jjy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBu9O59375874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:56 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A20E20043;
	Wed, 25 Jun 2025 19:11:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F09020040;
	Wed, 25 Jun 2025 19:11:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 7/9] sched: Add static key check for cpu_avoid
Date: Thu, 26 Jun 2025 00:41:06 +0530
Message-ID: <20250625191108.1646208-8-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX19uC+xWfQaZ+ Cr7oOUbSprf6nfWvvDOnpMIJjDKjkStAY+orEf7e9QeU5WXCEJr0AleNlQ6bakna6QqkaNEiv1s WvDLTVo0GkcI1sIIsyRLwWOT1JI9r74IAgYhS0vuktKDvYd1X5cd4zLXoZmrCs8a7SBwzOUHVQ3
 rJaCZerlT1X9S60VwEKklkRU/J/tH2SXK2+WbLVRKhuPQuIIexcA5hwmdQAPaYieFbWHYebZjGX hJUevIQNSi00v8TME/EnsuorzSyZL4N3APJIWjHuIlLGuxaFdyXIIyDhtB0YPWquCIgueUNyEh8 bJEiktOUPvJGPM8qKNgw3BwCZqMrQ2Jii7Pgvo0RwDGw2QAiNHcg5JSj110FKlPQt3+QUQibXKz
 Ou4s+6iruLO2DoRI4TxDSUJiN/Cqj6UWQs0wzRwv2jp30l0ByozNU2Po9zEZHlNlDz3Jn4Bp
X-Proofpoint-GUID: 8mD_nYPjJGtKhLq4Swoqsyh9Xbkf2bkG
X-Proofpoint-ORIG-GUID: M5HFX4d2Aeu9Niu3f8a8kmAcboEwiS88
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685c4a01 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=ha0spXy-qW39NgmqIngA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Checking if a CPU is avoid can add a slight overhead and should be 
done only when necessary. 

Add a static key check which makes it almost nop when key is false. 
Arch needs to set the key when it decides to. Refer to debug patch
for example. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
This method avoids additional ifdefs. So kept it that way instead of 
CONFIG_PARAVIRT. 

Added a helper function for cpu_avoid, since including sched.h fails in 
cpumask.h

 kernel/sched/core.c  | 8 ++++----
 kernel/sched/fair.c  | 5 +++--
 kernel/sched/rt.c    | 8 ++++----
 kernel/sched/sched.h | 9 +++++++++
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index aea4232e3ec4..51426b17ef55 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -148,9 +148,9 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
  * Limited because this is done with IRQs disabled.
  */
 __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
-
 __read_mostly int scheduler_running;
 
+DEFINE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
 #ifdef CONFIG_SCHED_CORE
 
 DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
@@ -2438,7 +2438,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
 		return false;
 
 	/* CPU marked as avoid, shouldn't chosen to run any task*/
-	if (cpu_avoid(cpu))
+	if (cpu_avoid_check(cpu))
 		return false;
 
 	/* But are allowed during online. */
@@ -5578,7 +5578,7 @@ void sched_tick(void)
 	sched_clock_tick();
 
 	/* push the current task out if cpu is marked as avoid */
-	if (cpu_avoid(cpu))
+	if (cpu_avoid_check(cpu))
 		push_current_task(rq);
 
 	rq_lock(rq, &rf);
@@ -8048,7 +8048,7 @@ void push_current_task(struct rq *rq)
 	unsigned long flags;
 
 	/* idle task can't be pused out */
-	if (rq->curr == rq->idle || !cpu_avoid(rq->cpu))
+	if (rq->curr == rq->idle || !cpu_avoid_check(rq->cpu))
 		return;
 
 	/* Do for only SCHED_NORMAL AND RT for now */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 406288aef535..21370f76d61b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8547,7 +8547,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	rcu_read_unlock();
 
 	/* Don't select a CPU marked as avoid for wakeup */
-	if (cpu_avoid(new_cpu))
+	if (cpu_avoid_check(new_cpu))
 		return cpu;
 	else
 		return new_cpu;
@@ -11668,7 +11668,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
 	/* Don't spread load into CPUs marked as avoid */
-	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
+	if (static_branch_unlikely(&paravirt_cpu_avoid_enabled))
+		cpumask_andnot(cpus, cpus, cpu_avoid_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fd9df6f46135..0ab3fdf7a637 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1549,7 +1549,7 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 		if (!test && target != -1 && !rt_task_fits_capacity(p, target))
 			goto out_unlock;
 
-		if (cpu_avoid(target))
+		if (cpu_avoid_check(target))
 			goto out_unlock;
 		/*
 		 * Don't bother moving it if the destination CPU is
@@ -1873,7 +1873,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
 	for (tries = 0; tries < RT_MAX_TRIES; tries++) {
 		cpu = find_lowest_rq(task);
 
-		if ((cpu == -1) || (cpu == rq->cpu) || cpu_avoid(cpu))
+		if ((cpu == -1) || (cpu == rq->cpu) || cpu_avoid_check(cpu))
 			break;
 
 		lowest_rq = cpu_rq(cpu);
@@ -1971,7 +1971,7 @@ static int push_rt_task(struct rq *rq, bool pull)
 			return 0;
 
 		cpu = find_lowest_rq(rq->curr);
-		if (cpu == -1 || cpu == rq->cpu || cpu_avoid(cpu))
+		if (cpu == -1 || cpu == rq->cpu || cpu_avoid_check(cpu))
 			return 0;
 
 		/*
@@ -2234,7 +2234,7 @@ static void pull_rt_task(struct rq *this_rq)
 	if (likely(!rt_overload_count))
 		return;
 
-	if (cpu_avoid(this_rq->cpu))
+	if (cpu_avoid_check(this_rq->cpu))
 		return;
 
 	/*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b9614873762e..707fdfa46772 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1710,6 +1710,15 @@ struct rq_flags {
 
 extern struct balance_callback balance_push_callback;
 void push_current_task(struct rq *rq);
+DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
+
+static inline bool cpu_avoid_check(int cpu)
+{
+	if (static_branch_unlikely(&paravirt_cpu_avoid_enabled))
+		return cpu_avoid(cpu);
+
+	return false;
+}
 
 #ifdef CONFIG_SCHED_CLASS_EXT
 extern const struct sched_class ext_sched_class;
-- 
2.43.0


