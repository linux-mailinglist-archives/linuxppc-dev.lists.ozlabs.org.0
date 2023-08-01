Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E776A633
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:20:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mSRyMdCg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHNs5pYCz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:20:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mSRyMdCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL339S4z2ypy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:19 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711EX2L027575
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tDnx9ZPLGWhmsilCfZUubBFhkH2KtVg/4oce8CU7Sxc=;
 b=mSRyMdCgGoqJEMnDdU73M4YrsvgUhezxcWMIMEM7XWbkK3RUza7ZKN/S0CIroC8mZic1
 UWIQKVOeUmtRhsy7cTZjP0E5jTGRR8/DoldteOhyQTdGWgvddIQj4nL+DbXvcAyGDBT8
 /rV5dea9r2Xr7TGMOAN0x6n0tJR8bTN9eigS6gXpnD8ltggVGUoP3yhTBtJiKObzmJJc
 JjPubWToTuZwLFqbYIwny5XLEWDGRKzT9GH1/H8y40xGJZPykxBNJEKln4zud+UkuPbT
 NNnlK1Vb6ZB/6slAPAdeNz4RQToxt7GMKNHoH+bMeJtxqAmRkymEZ4N0wY6rbqL5n1k4 LA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6r78033a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:16 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VMlOjG015486
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5e3mqt0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IDjn29819350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD31120040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C38A72004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:12 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0CE8C6063C;
	Tue,  1 Aug 2023 11:18:09 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/watchpoints: Track perf single step directly on the breakpoint
Date: Tue,  1 Aug 2023 11:17:40 +1000
Message-ID: <20230801011744.153973-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4zm3nym9znabEGZjy8NUeRooHU6ZozJE
X-Proofpoint-ORIG-GUID: 4zm3nym9znabEGZjy8NUeRooHU6ZozJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a bug in the current watchpoint tracking logic, where the
teardown in arch_unregister_hw_breakpoint() uses bp->ctx->task, which it
does not have a reference of and parallel threads may be in the process
of destroying. This was partially addressed in commit fb822e6076d9
("powerpc/hw_breakpoint: Fix oops when destroying hw_breakpoint event"),
but the underlying issue of accessing a struct member in an unknown
state still remained. Syzkaller managed to trigger a null pointer
derefernce due to the race between the task destructor and checking the
pointer and dereferencing it in the loop.

While this null pointer dereference could be fixed by using READ_ONCE
to access the task up front, that just changes the error to manipulating
possbily freed memory.

Instead, the breakpoint logic needs to be reworked to remove any
dependency on a context or task struct during breakpoint removal.

The reason we have this currently is to clear thread.last_hit_ubp. This
member is used to differentiate the perf DAWR single-step sequence from
other causes of single-step, such as userspace just calling
ptrace(PTRACE_SINGLESTEP, ...). We need to differentiate them because,
when the single step interrupt is received, we need to know whether to
re-insert the DAWR breakpoint (perf) or not (ptrace / other).

arch_unregister_hw_breakpoint() needs to clear this information to
prevent dangling pointers to possibly freed memory. These pointers are
dereferenced in single_step_dabr_instruction() without a way to check
their validity.

This patch moves the tracking of this information to the breakpoint
itself. This means we no longer have to do anything special to clean up.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  1 +
 arch/powerpc/include/asm/processor.h     |  5 --
 arch/powerpc/kernel/hw_breakpoint.c      | 69 ++++++++----------------
 3 files changed, 23 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 84d39fd42f71..66db0147d5b4 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -18,6 +18,7 @@ struct arch_hw_breakpoint {
 	u16		len; /* length of the target data symbol */
 	u16		hw_len; /* length programmed in hw */
 	u8		flags;
+	bool		perf_single_step; /* temporarily uninstalled for a perf single step */
 };
 
 /* Note: Don't change the first 6 bits below as they are in the same order
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8a6754ffdc7e..9e67cb1c72e9 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -172,11 +172,6 @@ struct thread_struct {
 	unsigned int	align_ctl;	/* alignment handling control */
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	struct perf_event *ptrace_bps[HBP_NUM_MAX];
-	/*
-	 * Helps identify source of single-step exception and subsequent
-	 * hw-breakpoint enablement
-	 */
-	struct perf_event *last_hit_ubp[HBP_NUM_MAX];
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 	struct arch_hw_breakpoint hw_brk[HBP_NUM_MAX]; /* hardware breakpoint info */
 	unsigned long	trap_nr;	/* last trap # on this thread */
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index e6749642604c..624375c18882 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -43,16 +43,6 @@ int hw_breakpoint_slots(int type)
 	return 0;		/* no instruction breakpoints available */
 }
 
-static bool single_step_pending(void)
-{
-	int i;
-
-	for (i = 0; i < nr_wp_slots(); i++) {
-		if (current->thread.last_hit_ubp[i])
-			return true;
-	}
-	return false;
-}
 
 /*
  * Install a perf counter breakpoint.
@@ -84,7 +74,7 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	 * Do not install DABR values if the instruction must be single-stepped.
 	 * If so, DABR will be populated in single_step_dabr_instruction().
 	 */
-	if (!single_step_pending())
+	if (!info->perf_single_step)
 		__set_breakpoint(i, info);
 
 	return 0;
@@ -371,28 +361,6 @@ void arch_release_bp_slot(struct perf_event *bp)
 	}
 }
 
-/*
- * Perform cleanup of arch-specific counters during unregistration
- * of the perf-event
- */
-void arch_unregister_hw_breakpoint(struct perf_event *bp)
-{
-	/*
-	 * If the breakpoint is unregistered between a hw_breakpoint_handler()
-	 * and the single_step_dabr_instruction(), then cleanup the breakpoint
-	 * restoration variables to prevent dangling pointers.
-	 * FIXME, this should not be using bp->ctx at all! Sayeth peterz.
-	 */
-	if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L)) {
-		int i;
-
-		for (i = 0; i < nr_wp_slots(); i++) {
-			if (bp->ctx->task->thread.last_hit_ubp[i] == bp)
-				bp->ctx->task->thread.last_hit_ubp[i] = NULL;
-		}
-	}
-}
-
 /*
  * Check for virtual address in kernel space.
  */
@@ -510,7 +478,9 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	int i;
 
 	for (i = 0; i < nr_wp_slots(); i++) {
-		if (unlikely(tsk->thread.last_hit_ubp[i]))
+		struct perf_event *bp = __this_cpu_read(bp_per_reg[i]);
+
+		if (unlikely(bp && counter_arch_bp(bp)->perf_single_step))
 			goto reset;
 	}
 	return;
@@ -520,7 +490,7 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	for (i = 0; i < nr_wp_slots(); i++) {
 		info = counter_arch_bp(__this_cpu_read(bp_per_reg[i]));
 		__set_breakpoint(i, info);
-		tsk->thread.last_hit_ubp[i] = NULL;
+		info->perf_single_step = false;
 	}
 }
 
@@ -563,7 +533,8 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 		for (i = 0; i < nr_wp_slots(); i++) {
 			if (!hit[i])
 				continue;
-			current->thread.last_hit_ubp[i] = bp[i];
+
+			counter_arch_bp(bp[i])->perf_single_step = true;
 			bp[i] = NULL;
 		}
 		regs_set_return_msr(regs, regs->msr | MSR_SE);
@@ -770,24 +741,28 @@ NOKPROBE_SYMBOL(hw_breakpoint_handler);
 static int single_step_dabr_instruction(struct die_args *args)
 {
 	struct pt_regs *regs = args->regs;
-	struct perf_event *bp = NULL;
-	struct arch_hw_breakpoint *info;
-	int i;
 	bool found = false;
 
 	/*
 	 * Check if we are single-stepping as a result of a
 	 * previous HW Breakpoint exception
 	 */
-	for (i = 0; i < nr_wp_slots(); i++) {
-		bp = current->thread.last_hit_ubp[i];
+	for (int i = 0; i < nr_wp_slots(); i++) {
+		struct perf_event *bp;
+		struct arch_hw_breakpoint *info;
+
+		bp = __this_cpu_read(bp_per_reg[i]);
 
 		if (!bp)
 			continue;
 
-		found = true;
 		info = counter_arch_bp(bp);
 
+		if (!info->perf_single_step)
+			continue;
+
+		found = true;
+
 		/*
 		 * We shall invoke the user-defined callback function in the
 		 * single stepping handler to confirm to 'trigger-after-execute'
@@ -795,19 +770,19 @@ static int single_step_dabr_instruction(struct die_args *args)
 		 */
 		if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
 			perf_bp_event(bp, regs);
-		current->thread.last_hit_ubp[i] = NULL;
+
+		info->perf_single_step = false;
 	}
 
 	if (!found)
 		return NOTIFY_DONE;
 
-	for (i = 0; i < nr_wp_slots(); i++) {
-		bp = __this_cpu_read(bp_per_reg[i]);
+	for (int i = 0; i < nr_wp_slots(); i++) {
+		struct perf_event *bp = __this_cpu_read(bp_per_reg[i]);
 		if (!bp)
 			continue;
 
-		info = counter_arch_bp(bp);
-		__set_breakpoint(i, info);
+		__set_breakpoint(i, counter_arch_bp(bp));
 	}
 
 	/*
-- 
2.41.0

