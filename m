Return-Path: <linuxppc-dev+bounces-14321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91693C6CE5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHD6mmBz30TY;
	Wed, 19 Nov 2025 17:22:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533368;
	cv=none; b=FA+Ibc09Hh7oADeTsu0fxmkX2yooVMfOHD5mhzYGJESjyJS3bDDq+zfX/sIna3+nZP8RxNWLsTGruTu3g7npPZg1CI4DMwo7HBNGCpOxD1LQKzR4UVjNAEycDIIhAlV7saoQ9RmPl7QN2nGs+n87hWWyxwoD6Q0xJhlXbJAa3BQ6jJgYEmqcSmmljVgGbzlt59lZXszWq/Av21vA2tKSckGTm4qiuahDGI+MHn2oyxNHo48M8sFI+SMhpS3kI3IPalE2/HW9tHWuYzeE7RMa16LQ9gqD5hEgdYIi8XVtlBJatR/DY7ryeXKgBm3+qcBbFrtuj64FSdfmtgs/TswQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533368; c=relaxed/relaxed;
	bh=h3OXVS2Kj4+f+CFex5Qr0RvHWtEzS+b6opbzkrxYqlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy40uKGWKatUKP11oWleGiDm7Cz4B8+eX/5zQdCIslNy+TqchfAbtyop+g0IcLwOi3l4FGeATWzxdzoz/k467et+XYPCOYTz55K/R4b27AXcYllhzK9QwU+5ykI05qHqEz4fagL33/WjqZqDYRJKHtCAWIK35SPDm0V72qWFdI5otkXD2aiiQUeHTzgkYYqfBap5UU+Xmks4YE7EHtpXWGGVIaBt3KlwBVz9RK5fcV45fnjzUQ9k3DFi/JqTUf/3kMTcm+/VsN3hycVQPe3Y22k6SpgvVeUndMfeZ8JBg1URaxqxrvAGttaSewFNiiR+Cphsuo+PkQE76J4DXeRlpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bjeOrsyy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bjeOrsyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHB6CYWz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIH7gIF011149;
	Wed, 19 Nov 2025 06:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=h3OXVS2Kj4+f+CFex
	5Qr0RvHWtEzS+b6opbzkrxYqlU=; b=bjeOrsyypXAllV0yUmMY/BVFlOO3Qd9to
	zoiNZAiJ2hX74EoFc23J0HgLmOKYmqSanw647awqWU4yHS/UVBJRHApSO8kxVoQV
	ozf0BUnoWuNlMOX9Zrg8OYgfiZMb+mMYXjO3VvFPYCH1dfz5KWiNA/Ok65JVR6O7
	J+8lDXjFB/ihwkOCZtkxs9wTeO50lIgsgeHwlKmGtB0R4PEnIF1o7dl1wfCmPrnA
	1RR+uzYCIH8C3pozJv/BD2pTZZO6XRa5bpE3EARyDd6LFBQ/GlWqQvaTPSHqxJGX
	18YM19AKToEhYQtoqOMTZu2g4UMnrVtTnBbmD/+OGwG0WmmXLbYZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6MI6d024025;
	Wed, 19 Nov 2025 06:22:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ393gB010392;
	Wed, 19 Nov 2025 06:22:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3us7a5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MEUc62259594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E387520043;
	Wed, 19 Nov 2025 06:22:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21C0920040;
	Wed, 19 Nov 2025 06:22:10 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 10/17] sched/core: Push current task from paravirt CPU
Date: Wed, 19 Nov 2025 11:50:53 +0530
Message-ID: <20251119062100.1112520-11-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691d621b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=wsXCBACog4-lb1GD2tQA:9
X-Proofpoint-GUID: VzUbr3UsRPsT4BLyCRp7YPyhMackV7Ma
X-Proofpoint-ORIG-GUID: XaGPr6LY3nTEwcluM37lAWVUR7_Y7jk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX9VAv4Ja/MA8y
 UjurCTA2/vxJXpalC3ojMDotYkVuWQe+CN/AcHb3jrTqdJ0f5P3ai+YxR8b0JAnWsqOAtO92KVS
 WIj/rouNg3UWl0vsL1Ri5IX89N8VLfyyWxoL4hLmr3PdxP6696dPWff20IYCreHNxQgqY1MZxKj
 utLJhOliZlxdqRTPqwHGrjFmDM6rI7FXFvkyfL+XrBFpXYz4sg3tF61/H1o9nNDa+Jo6sY/Gamj
 NhM1PSKltlnHlznl/myVt1p/f5b2WtI2aJOgswIdLjsaVUrT3RweqxtwPfco1hT312sWpK6scqK
 NvAq/zWybMVrBQqhqefzi0bHfEzephko0bF8cZd3J14dZ0xoMvx0wRwz1+vuIPPtHpn0xgUQvnY
 ounQl2H6LbZv/RRW2M7QXFNW8s3MJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
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


