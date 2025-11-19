Return-Path: <linuxppc-dev+bounces-14357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26386C6E8F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnV024nz3f3g;
	Wed, 19 Nov 2025 23:46:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556365;
	cv=none; b=LYXJdepJX93EOIcYpbh3KMr5t+LmoKD37Igh/sfVgm55etHcSDMZorSUCWMqsV0C3d4q5A7MvsIJ2BQBEXkvCSL5yW/gCEBI5V+yJ6/3aV1ip1YCiufBcTX5hzllMYT6dz6BzJuLcpsPheS4GOCHZFhGBcciJ8SJkUDaAa4gIAFHwGTTkoNl+MtlAG5B8Pz7sZ2WJhrpnZ/u2aF93BOXrX9hU+wrZQGeBnlVgec7m2Yngu+Ma713FH26RKER1FMpanuFxPCQnOPqPURSVyfhBwpA+7j7P70Tdfuw2OsahXqdX6PxWLKebzca9MpWcHP5U3qujUwrFiZkluEIbvQLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556365; c=relaxed/relaxed;
	bh=h3OXVS2Kj4+f+CFex5Qr0RvHWtEzS+b6opbzkrxYqlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olYnqfIDacIF3haJDeyoK38dBsYoC+GN93Su2uqwSz93OtE18AjGu7wNOYd+B24cVoXJKCGoYbvg/WehTPOkTEF7ZeuBJ1QaCVL8YiGRvNlN1aqnfTDKIupx8YGfjl1a0JczJHowP+zwR6K3KbfPtUUcpW2jPWG6IFuRqK68dNtlRvwgf9i8il6DN/oYIo/eWQz0Ql35Fh6zv0Zxj3Ibn/A6eLKkR3Gif4fysQNuILyapNeCWe/YF6ZQ2mq1X4y2j7vodlwA2csLdD9Pisz1DUK7s2eeOJxrW1yiaHL/y6CR5gELA9w+jZqOUzderbWV20GSxQOJWblfy+o2vAgtmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AQ6hPHaG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AQ6hPHaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnT2jQLz3cYB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:05 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJAbAx9004368;
	Wed, 19 Nov 2025 12:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=h3OXVS2Kj4+f+CFex
	5Qr0RvHWtEzS+b6opbzkrxYqlU=; b=AQ6hPHaGY8LXJrvPlZvmdg1jMez0Jmgx5
	OCfFbOXw/maPyunBXxilxTKL/HzGfQK7pmkKxv14s9MzAcCXZzNLNMLnhwVMwleg
	xG+5Lik1R02dgtLtwDqWqpggBPlv1jsjOVqdYRPB0qP950cYvgHsGkHB4YtFVBb8
	+SoV0YkaZw5CMV4GcN02kDX9fMQiCJBgsug7m/BD1UJChCfvmOeJRtdfBbhcZht0
	5EfjZekzeda3Afy3nqGhxz9nH6L5/gDy3FvAed4eXk+vgLD04eoE/g/5YPelalzP
	AHYLt36QqCHSIoofDuwmVcLBlPRU/EOT17leP9BClptO5gzeNTaLg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:49 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCgfDH007736;
	Wed, 19 Nov 2025 12:45:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBV30G005118;
	Wed, 19 Nov 2025 12:45:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk8mkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:47 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjhBq27787826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0266920043;
	Wed, 19 Nov 2025 12:45:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0240D20040;
	Wed, 19 Nov 2025 12:45:39 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:38 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 10/17] sched/core: Push current task from paravirt CPU
Date: Wed, 19 Nov 2025 18:14:42 +0530
Message-ID: <20251119124449.1149616-11-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691dbbfd cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=wsXCBACog4-lb1GD2tQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX1vSJx3eeGgza
 PWRvAYsu5WG+amo38IyG8Rg8JkP0dtnW1QEgNrh56hrQ+HliCt00W5hDUINaMFV76CsllhUVOi1
 I9jxwc5oRwp17/kTwjVQjlNa4lCnabTzuLrBCzcsdGNHGJ92ed2+vgtLxK9rBPcuCOvCOXb5zpY
 mUlj7abl9JzoYoj2DsZqt7BZp9A9UynipYwSXmSqAg05XSD2ZtfYB9Vtqb9UVVHphNHd1f6enq7
 qy9yshOmK/DBSafMg0kJN3ZwkuWlo22DCu6id3FPMAD9pRk1EYaKdvDx//7KgYsKYui29rWUP+4
 FeKT36PIqOWJ2hQ0hgJCcf1nUfFExCkvQlb9ulvX+qnrX1eJ/FA0mrqHkEtQG1tkkYF7CI+Lugv
 XiXYT9l5JxhS1Fdt0IUV8L06oR7ung==
X-Proofpoint-GUID: zxdjMTHSYMi08NSJODlWOoyordflGmsQ
X-Proofpoint-ORIG-GUID: TTLZnAZf-SZOJeJGuWzf3mpam8NCTSr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Actively push out RT/CFS running on a paravirt CPU. Since the task is
running on the CPU, need to stop the cpu and push the task out.
However, if the task in pinned only to paravirt CPUs, it will continue
running there.

Though code is almost same as __balance_push_cpu_stop and quite close to
push_cpu_stop, it provides a cleaner implementation w.r.t to PARAVIRT config.

Add push_task_work_done flag to protect pv_push_task_work buffer.
This currently works only FAIR and RT.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c  | 83 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  9 +++++
 2 files changed, 92 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 73d1d49a3c72..65c247c24191 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5521,6 +5521,10 @@ void sched_tick(void)
 	unsigned long hw_pressure;
 	u64 resched_latency;
 
+	/* push the current task out if a paravirt CPU */
+	if (cpu_paravirt(cpu))
+		push_current_from_paravirt_cpu(rq);
+
 	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 		arch_scale_freq_tick();
 
@@ -10869,4 +10873,83 @@ void sched_change_end(struct sched_change_ctx *ctx)
 #ifdef CONFIG_PARAVIRT
 struct cpumask __cpu_paravirt_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_paravirt_mask);
+
+static DEFINE_PER_CPU(struct cpu_stop_work, pv_push_task_work);
+
+static int paravirt_push_cpu_stop(void *arg)
+{
+	struct task_struct *p = arg;
+	struct rq *rq = this_rq();
+	struct rq_flags rf;
+	int cpu;
+
+	raw_spin_lock_irq(&p->pi_lock);
+	rq_lock(rq, &rf);
+	rq->push_task_work_done = 0;
+
+	update_rq_clock(rq);
+
+	if (task_rq(p) == rq && task_on_rq_queued(p)) {
+		cpu = select_fallback_rq(rq->cpu, p);
+		rq = __migrate_task(rq, &rf, p, cpu);
+	}
+
+	rq_unlock(rq, &rf);
+	raw_spin_unlock_irq(&p->pi_lock);
+	put_task_struct(p);
+
+	return 0;
+}
+
+/* A CPU is marked as Paravirt when there is contention for underlying
+ * physical CPU and using this CPU will lead to hypervisor preemptions.
+ * It is better not to use this CPU.
+ *
+ * In case any task is scheduled on such CPU, move it out. In
+ * select_fallback_rq a non paravirt CPU will be chosen and henceforth
+ * task shouldn't come back to this CPU
+ */
+void push_current_from_paravirt_cpu(struct rq *rq)
+{
+	struct task_struct *push_task = rq->curr;
+	unsigned long flags;
+	struct rq_flags rf;
+
+	if (!cpu_paravirt(rq->cpu))
+		return;
+
+	/* Idle task can't be pused out */
+	if (rq->curr == rq->idle)
+		return;
+
+	/* Do for only SCHED_NORMAL AND RT for now */
+	if (push_task->sched_class != &fair_sched_class &&
+	    push_task->sched_class != &rt_sched_class)
+		return;
+
+	if (kthread_is_per_cpu(push_task) ||
+	    is_migration_disabled(push_task))
+		return;
+
+	/* Is it affine to only paravirt cpus? */
+	if (cpumask_subset(push_task->cpus_ptr, cpu_paravirt_mask))
+		return;
+
+	/* There is already a stopper thread for this. Dont race with it */
+	if (rq->push_task_work_done == 1)
+		return;
+
+	local_irq_save(flags);
+
+	get_task_struct(push_task);
+	schedstat_inc(push_task->stats.nr_migrations_paravirt);
+
+	rq_lock(rq, &rf);
+	rq->push_task_work_done = 1;
+	rq_unlock(rq, &rf);
+
+	stop_one_cpu_nowait(rq->cpu, paravirt_push_cpu_stop, push_task,
+			    this_cpu_ptr(&pv_push_task_work));
+	local_irq_restore(flags);
+}
 #endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b419a4d98461..42984a65384c 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1214,6 +1214,9 @@ struct rq {
 	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
 
+#ifdef CONFIG_PARAVIRT
+	bool			push_task_work_done;
+#endif
 	unsigned long		misfit_task_load;
 
 	/* For active balancing */
@@ -4017,6 +4020,12 @@ extern bool dequeue_task(struct rq *rq, struct task_struct *p, int flags);
 extern struct balance_callback *splice_balance_callbacks(struct rq *rq);
 extern void balance_callbacks(struct rq *rq, struct balance_callback *head);
 
+#ifdef CONFIG_PARAVIRT
+void push_current_from_paravirt_cpu(struct rq *rq);
+#else
+static inline void push_current_from_paravirt_cpu(struct rq *rq) { }
+#endif
+
 /*
  * The 'sched_change' pattern is the safe, easy and slow way of changing a
  * task's scheduling properties. It dequeues a task, such that the scheduler
-- 
2.47.3


