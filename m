Return-Path: <linuxppc-dev+bounces-12003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BCFB51F45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSkF15Tzz3dWJ;
	Thu, 11 Sep 2025 03:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526277;
	cv=none; b=GGvcMg57kZClKQemWrN/mJ7Nf0DsZJvfSNRyONwrR1gz2/b3Jleat5NqC4Xr9JR1fSdrgaj6VxCVJz6RJ9hOvLzxR7LhuiU47DyqWUXfta2WWgLREf2b0Xn99O0GqTwWfsrRsRckSwcj4ilCCWvOGZ8i208Lf3xt7r5KPM5SgOoG6RVgCs3DVoUmIc3uX+B1yi1QfI2N5W5oTU5qesabpaNVUDPQwfqQcIdThsMCfrljrOIVw/5UxjkU0ayvN6+FwcxB4MXnXhyY5x7es6Tdr09vlGgTNMD03EYeK4a6MFbS87JbEKOWx4PV3qd6Sb+tHo4ItEeCQ9qKsrmlN5f7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526277; c=relaxed/relaxed;
	bh=GVQ1hqzlw9aa9w2q6Y+XSUdjJpH8inbqD6RyHI7XOd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvvyLI1Ik6b3TdF+lOvyNi7d/9r0oIpnB93/Qm9q/u1pqnYLNlLrEkPi/gcQp93bPwQ26j/uFSb1RwdHKmnZeaL09YmYAqZ38Sd6Ft3pKK+S0CUhp2N6qf7erHeBNmcbhRB945ljl3fbNrzATjnhsG2R+FviQYO65bwYxC6dRC0pEfMZszxrTO94hBGMR/I4EzWw71hlqe+lwTotrNpLeIbHpMrY/xwTgipy9dc4vNDRIn7SEK+iwaOudd9LdYmeW5U5bmG9/mRG+06dt8Q4dRQyYoNi33mzs/O4AiH2kb6TEOlG5MTTmYe/F8tBKmbmoMpg7cIdcDUyB3Lm+4pwPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kjspOsFT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kjspOsFT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSkD1wWkz3dSn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:36 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AEbv8x016609;
	Wed, 10 Sep 2025 17:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GVQ1hqzlw9aa9w2q6
	Y+XSUdjJpH8inbqD6RyHI7XOd4=; b=kjspOsFTj28A9EAHRoCrY+46jwET1zPX/
	kDI7MmLKqztIsHSQ1wJhm7RSCwlIWvpBwhlCEt+LC5OCSWMm/IWov4jM5SzFmYZc
	kMS5Ie3dQBiMzkvAljDqQV5FLCCnYDxWKAyJQ58ZeH01Xc7JlhzkrQPCVIy/1h4X
	/J3XYWebgz3NWHH9nN6pN/oNv+LBxSuZm8tQm+eNDm5T1LRN5Ei8RqkAWWEn8+Vg
	VP0LAQ2BDAMYpgmKyJFMRewa/qwK1i+5DbVMClsIMrmzGrxZpaTr6INvmfVr9HVf
	DM/v5RQWQxdqzQv6PrhikBQjuBthYFYqPVNBWHfrrXLlz5mee3qkA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsycnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:27 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHiQV2007284;
	Wed, 10 Sep 2025 17:44:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsycnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AEaXaR001155;
	Wed, 10 Sep 2025 17:44:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 491203heyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHiMTx59310522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0189320043;
	Wed, 10 Sep 2025 17:44:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECF8020040;
	Wed, 10 Sep 2025 17:44:15 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:44:15 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 07/10] sched/core: Push current task from paravirt CPU
Date: Wed, 10 Sep 2025 23:12:07 +0530
Message-ID: <20250910174210.1969750-8-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX+pneuObheQ8j
 S1rBg8MPGHgcjjtYFu9sLwHWptryVnNBFxs9QaXemx6kwIuw1gTybDeI24aGFdxa6FWfT8lhWZR
 JbfQyEioKskL1w4J5TZexd73u0a8nCr7NVaTyLoGoQIt3GdI6J5HR+tpqyrwwgx3pW0/4uQcuAG
 ZfLgvdJ3f4c6t+FB3lnrp+/UoXcaoIYW7XDRijxuaEPkene2OxgczXlivlI71J6reHhijfGto4d
 uchwSglLIL8eO5cmwQtm7/ImxkkHAKIS6Tvl2KypeU1PvbVrGBHZYZfR2uu24bO2yf7F8LSVOHL
 EqhBXwus9LD8gxb5Np4xXf4/YTh6gVSs42vEtR4F6NJPX8TEAoGpFG6UfxPrv0HPUZpkfQY94WP
 t+LztSvQ
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c1b8fb cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=AIB9MNvnI-Hp6IabyfQA:9
X-Proofpoint-GUID: XkCZkHzPJYv3Amm_eg5xHVRR257jFLED
X-Proofpoint-ORIG-GUID: 93Dl0DK0dHdcbRqHcc7kVvh5C1MmK7AA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Actively push out any task running on a paravirt CPU. Since the task is
running on the CPU need to spawn a stopper thread and push the task out.

If task is sleeping, when it wakes up it is expected to move out. In
case it still chooses a paravirt CPU, next tick will move it out.
However, if the task in pinned only to paravirt CPUs, it will continue
running there.

Though code is almost same as __balance_push_cpu_stop and quite close to
push_cpu_stop, it provides a cleaner implementation w.r.t to PARAVIRT
config.

Add push_task_work_done flag to protect pv_push_task_work buffer. This has
been placed at the empty slot available considering 64/128 byte
cacheline.

This currently works only FAIR and RT.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c  | 84 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  9 ++++-
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 279b0dd72b5e..1f9df5b8a3a2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5629,6 +5629,10 @@ void sched_tick(void)
 
 	sched_clock_tick();
 
+	/* push the current task out if a paravirt CPU */
+	if (is_cpu_paravirt(cpu))
+		push_current_from_paravirt_cpu(rq);
+
 	rq_lock(rq, &rf);
 	donor = rq->donor;
 
@@ -10977,4 +10981,84 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
 struct cpumask __cpu_paravirt_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_paravirt_mask);
 DEFINE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
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
+	if (!is_cpu_paravirt(rq->cpu))
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
+	preempt_disable();
+
+	get_task_struct(push_task);
+
+	rq_lock(rq, &rf);
+	rq->push_task_work_done = 1;
+	rq_unlock(rq, &rf);
+
+	stop_one_cpu_nowait(rq->cpu, paravirt_push_cpu_stop, push_task,
+			    this_cpu_ptr(&pv_push_task_work));
+	preempt_enable();
+	local_irq_restore(flags);
+}
 #endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 8f9991453d36..5077a32593da 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1187,7 +1187,9 @@ struct rq {
 
 	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
-
+#ifdef CONFIG_PARAVIRT
+	bool			push_task_work_done;
+#endif
 	unsigned long		misfit_task_load;
 
 	/* For active balancing */
@@ -3890,11 +3892,16 @@ static inline bool is_cpu_paravirt(int cpu)
 
 	return false;
 }
+
+void push_current_from_paravirt_cpu(struct rq *rq);
+
 #else	/* !CONFIG_PARAVIRT */
 static inline bool is_cpu_paravirt(int cpu)
 {
 	return false;
 }
+
+static inline void push_current_from_paravirt_cpu(struct rq *rq) { }
 #endif	/* !CONFIG_PARAVIRT */
 
 #endif /* _KERNEL_SCHED_SCHED_H */
-- 
2.47.3


