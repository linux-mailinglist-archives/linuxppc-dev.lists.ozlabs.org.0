Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BBF19A584
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:42:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sc7j03X4zDqvY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbWn68SkzDr0r
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:14:45 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03163gBT003573
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 02:14:41 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj41u05-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 02:14:40 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 07:14:23 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 07:14:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0316EXDm53805120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 06:14:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 043BEA404D;
 Wed,  1 Apr 2020 06:14:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37760A4040;
 Wed,  1 Apr 2020 06:14:29 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.48.114])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 06:14:28 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 13/16] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
Date: Wed,  1 Apr 2020 11:43:06 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040106-0020-0000-0000-000003BF6B6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040106-0021-0000-0000-000022180F6B
Message-Id: <20200401061309.92442-14-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=659 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010049
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we assume that we have only one watchpoint supported by hw.
Get rid of that assumption and use dynamic loop instead. This should
make supporting more watchpoints very easy.

With more than one watchpoint, exception handler need to know which
DAWR caused the exception, and hw currently does not provide it. So
we need sw logic for the same. To figure out which DAWR caused the
exception, check all different combinations of user specified range,
dawr address range, actual access range and dawrx constrains. For ex,
if user specified range and actual access range overlaps but dawrx is
configured for readonly watchpoint and the instruction is store, this
DAWR must not have caused exception.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h |   2 +-
 arch/powerpc/include/asm/sstep.h     |   2 +
 arch/powerpc/kernel/hw_breakpoint.c  | 396 +++++++++++++++++++++------
 arch/powerpc/kernel/process.c        |   3 -
 4 files changed, 313 insertions(+), 90 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 65b03162cd67..4bc4e4a99166 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -185,7 +185,7 @@ struct thread_struct {
 	 * Helps identify source of single-step exception and subsequent
 	 * hw-breakpoint enablement
 	 */
-	struct perf_event *last_hit_ubp;
+	struct perf_event *last_hit_ubp[HBP_NUM_MAX];
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 	struct arch_hw_breakpoint hw_brk[HBP_NUM_MAX]; /* hardware breakpoint info */
 	unsigned long	trap_nr;	/* last trap # on this thread */
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 769f055509c9..38919b27a6fa 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -48,6 +48,8 @@ enum instruction_type {
 
 #define INSTR_TYPE_MASK	0x1f
 
+#define OP_IS_LOAD(type)	((LOAD <= (type) && (type) <= LOAD_VSX) || (type) == LARX)
+#define OP_IS_STORE(type)	((STORE <= (type) && (type) <= STORE_VSX) || (type) == STCX)
 #define OP_IS_LOAD_STORE(type)	(LOAD <= (type) && (type) <= STCX)
 
 /* Compute flags, ORed in with type */
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 71274fbbac38..07a6cdea84ed 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -30,7 +30,7 @@
  * Stores the breakpoints currently in use on each breakpoint address
  * register for every cpu
  */
-static DEFINE_PER_CPU(struct perf_event *, bp_per_reg);
+static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
 
 /*
  * Returns total number of data or instruction breakpoints available.
@@ -42,6 +42,17 @@ int hw_breakpoint_slots(int type)
 	return 0;		/* no instruction breakpoints available */
 }
 
+static bool single_step_pending(void)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (current->thread.last_hit_ubp[i])
+			return true;
+	}
+	return false;
+}
+
 /*
  * Install a perf counter breakpoint.
  *
@@ -54,16 +65,26 @@ int hw_breakpoint_slots(int type)
 int arch_install_hw_breakpoint(struct perf_event *bp)
 {
 	struct arch_hw_breakpoint *info = counter_arch_bp(bp);
-	struct perf_event **slot = this_cpu_ptr(&bp_per_reg);
+	struct perf_event **slot;
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		slot = this_cpu_ptr(&bp_per_reg[i]);
+		if (!*slot) {
+			*slot = bp;
+			break;
+		}
+	}
 
-	*slot = bp;
+	if (WARN_ONCE(i == nr_wp_slots(), "Can't find any breakpoint slot"))
+		return -EBUSY;
 
 	/*
 	 * Do not install DABR values if the instruction must be single-stepped.
 	 * If so, DABR will be populated in single_step_dabr_instruction().
 	 */
-	if (current->thread.last_hit_ubp != bp)
-		__set_breakpoint(info, 0);
+	if (!single_step_pending())
+		__set_breakpoint(info, i);
 
 	return 0;
 }
@@ -79,15 +100,22 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
  */
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
-	struct perf_event **slot = this_cpu_ptr(&bp_per_reg);
+	struct arch_hw_breakpoint null_brk = {0};
+	struct perf_event **slot;
+	int i;
 
-	if (*slot != bp) {
-		WARN_ONCE(1, "Can't find the breakpoint");
-		return;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		slot = this_cpu_ptr(&bp_per_reg[i]);
+		if (*slot == bp) {
+			*slot = NULL;
+			break;
+		}
 	}
 
-	*slot = NULL;
-	hw_breakpoint_disable();
+	if (WARN_ONCE(i == nr_wp_slots(), "Can't find any breakpoint slot"))
+		return;
+
+	__set_breakpoint(&null_brk, i);
 }
 
 static bool is_ptrace_bp(struct perf_event *bp)
@@ -101,14 +129,20 @@ static bool is_ptrace_bp(struct perf_event *bp)
  */
 void arch_unregister_hw_breakpoint(struct perf_event *bp)
 {
+	int i;
+
 	/*
 	 * If the breakpoint is unregistered between a hw_breakpoint_handler()
 	 * and the single_step_dabr_instruction(), then cleanup the breakpoint
 	 * restoration variables to prevent dangling pointers.
 	 * FIXME, this should not be using bp->ctx at all! Sayeth peterz.
 	 */
-	if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L))
-		bp->ctx->task->thread.last_hit_ubp = NULL;
+	if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L)) {
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (bp->ctx->task->thread.last_hit_ubp[i] == bp)
+				bp->ctx->task->thread.last_hit_ubp[i] = NULL;
+		}
+	}
 }
 
 /*
@@ -220,90 +254,215 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 {
 	struct arch_hw_breakpoint *info;
+	int i;
 
-	if (likely(!tsk->thread.last_hit_ubp))
-		return;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (unlikely(tsk->thread.last_hit_ubp[i]))
+			goto reset;
+	}
+	return;
 
-	info = counter_arch_bp(tsk->thread.last_hit_ubp);
+reset:
 	regs->msr &= ~MSR_SE;
-	__set_breakpoint(info, 0);
-	tsk->thread.last_hit_ubp = NULL;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		info = counter_arch_bp(__this_cpu_read(bp_per_reg[i]));
+		__set_breakpoint(info, i);
+		tsk->thread.last_hit_ubp[i] = NULL;
+	}
 }
 
-static bool dar_within_range(unsigned long dar, struct arch_hw_breakpoint *info)
+static bool dar_in_user_range(unsigned long dar, struct arch_hw_breakpoint *info)
 {
 	return ((info->address <= dar) && (dar - info->address < info->len));
 }
 
-static bool
-dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
+static bool dar_user_range_overlaps(unsigned long dar, int size,
+				    struct arch_hw_breakpoint *info)
 {
 	return ((dar <= info->address + info->len - 1) &&
 		(dar + size - 1 >= info->address));
 }
 
+static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
+{
+	unsigned long hw_start_addr, hw_end_addr;
+
+	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
+	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE) - 1;
+
+	return ((hw_start_addr <= dar) && (hw_end_addr >= dar));
+}
+
+static bool dar_hw_range_overlaps(unsigned long dar, int size,
+				  struct arch_hw_breakpoint *info)
+{
+	unsigned long hw_start_addr, hw_end_addr;
+
+	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
+	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE) - 1;
+
+	return ((dar <= hw_end_addr) && (dar + size - 1 >= hw_start_addr));
+}
+
 /*
- * Handle debug exception notifications.
+ * If hw has multiple DAWR registers, we also need to check all
+ * dawrx constraint bits to confirm this is _really_ a valid event.
  */
-static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
-			     struct arch_hw_breakpoint *info)
+static bool check_dawrx_constraints(struct pt_regs *regs, int type,
+				    struct arch_hw_breakpoint *info)
 {
-	unsigned int instr = 0;
-	int ret, type, size;
-	struct instruction_op op;
-	unsigned long addr = info->address;
+	if (OP_IS_LOAD(type) && !(info->type & HW_BRK_TYPE_READ))
+		return false;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
-		goto fail;
+	if (OP_IS_STORE(type) && !(info->type & HW_BRK_TYPE_WRITE))
+		return false;
 
-	ret = analyse_instr(&op, regs, instr);
-	type = GETTYPE(op.type);
-	size = GETSIZE(op.type);
+	if (is_kernel_addr(regs->nip) && !(info->type & HW_BRK_TYPE_KERNEL))
+		return false;
 
-	if (!ret && (type == LARX || type == STCX)) {
-		printk_ratelimited("Breakpoint hit on instruction that can't be emulated."
-				   " Breakpoint at 0x%lx will be disabled.\n", addr);
-		goto disable;
-	}
+	if (user_mode(regs) && !(info->type & HW_BRK_TYPE_USER))
+		return false;
+
+	return true;
+}
+
+/*
+ * Returns true if the event is valid wrt dawr configuration,
+ * including extraneous exception. Otherwise return false.
+ */
+static bool check_constraints(struct pt_regs *regs, unsigned int instr,
+			      int type, int size,
+			      struct arch_hw_breakpoint *info)
+{
+	bool in_user_range = dar_in_user_range(regs->dar, info);
+	bool dawrx_constraints;
 
 	/*
-	 * If it's extraneous event, we still need to emulate/single-
-	 * step the instruction, but we don't generate an event.
+	 * 8xx supports only one breakpoint and thus we can
+	 * unconditionally return true.
 	 */
-	if (size && !dar_range_overlaps(regs->dar, size, info))
-		info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+	if (IS_ENABLED(CONFIG_PPC_8xx)) {
+		if (!in_user_range)
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+		return true;
+	}
 
-	/* Do not emulate user-space instructions, instead single-step them */
-	if (user_mode(regs)) {
-		current->thread.last_hit_ubp = bp;
-		regs->msr |= MSR_SE;
+	if (unlikely(instr == -1)) {
+		if (in_user_range)
+			return true;
+
+		if (dar_in_hw_range(regs->dar, info)) {
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+			return true;
+		}
 		return false;
 	}
 
-	if (!emulate_step(regs, instr))
-		goto fail;
+	dawrx_constraints = check_dawrx_constraints(regs, type, info);
 
-	return true;
+	if (dar_user_range_overlaps(regs->dar, size, info))
+		return dawrx_constraints;
+
+	if (dar_hw_range_overlaps(regs->dar, size, info)) {
+		if (dawrx_constraints) {
+			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
+			return true;
+		}
+	}
+	return false;
+}
+
+static int get_instr_detail(struct pt_regs *regs, int *type, int *size,
+			    bool *larx_stcx)
+{
+	unsigned int instr = 0;
+	struct instruction_op op;
+
+	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+		return -1;
+
+	analyse_instr(&op, regs, instr);
 
-fail:
 	/*
-	 * We've failed in reliably handling the hw-breakpoint. Unregister
-	 * it and throw a warning message to let the user know about it.
+	 * Set size = 8 if analyse_instr() fails. If it's a userspace
+	 * watchpoint(valid or extraneous), we can notify user about it.
+	 * If it's a kernel watchpoint, instruction  emulation will fail
+	 * in stepping_handler() and watchpoint will be disabled.
 	 */
-	WARN(1, "Unable to handle hardware breakpoint. Breakpoint at "
-		"0x%lx will be disabled.", addr);
+	*type = GETTYPE(op.type);
+	*size = !(*type == UNKNOWN) ? GETSIZE(op.type) : 8;
+	*larx_stcx = (*type == LARX || *type == STCX);
 
-disable:
+	return instr;
+}
+
+/*
+ * We've failed in reliably handling the hw-breakpoint. Unregister
+ * it and throw a warning message to let the user know about it.
+ */
+static void handler_error(struct perf_event *bp, struct arch_hw_breakpoint *info)
+{
+	WARN(1, "Unable to handle hardware breakpoint."
+		"Breakpoint at 0x%lx will be disabled.",
+		info->address);
+	perf_event_disable_inatomic(bp);
+}
+
+static void larx_stcx_err(struct perf_event *bp, struct arch_hw_breakpoint *info)
+{
+	printk_ratelimited("Breakpoint hit on instruction that can't "
+			   "be emulated. Breakpoint at 0x%lx will be "
+			   "disabled.\n", info->address);
 	perf_event_disable_inatomic(bp);
-	return false;
+}
+
+static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
+			     struct arch_hw_breakpoint **info, int *hit,
+			     unsigned int instr)
+{
+	int i;
+	int stepped;
+
+	/* Do not emulate user-space instructions, instead single-step them */
+	if (user_mode(regs)) {
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (!hit[i])
+				continue;
+			current->thread.last_hit_ubp[i] = bp[i];
+			info[i] = NULL;
+		}
+		regs->msr |= MSR_SE;
+		return false;
+	}
+
+	stepped = emulate_step(regs, instr);
+	if (!stepped) {
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (!hit[i])
+				continue;
+			handler_error(bp[i], info[i]);
+			info[i] = NULL;
+		}
+		return false;
+	}
+	return true;
 }
 
 int hw_breakpoint_handler(struct die_args *args)
 {
+	bool err = false;
 	int rc = NOTIFY_STOP;
-	struct perf_event *bp;
+	struct perf_event *bp[HBP_NUM_MAX] = {0};
 	struct pt_regs *regs = args->regs;
-	struct arch_hw_breakpoint *info;
+	struct arch_hw_breakpoint *info[HBP_NUM_MAX] = {0};
+	int i;
+	int hit[HBP_NUM_MAX] = {0};
+	int nr_hit = 0;
+	bool ptrace_bp = false;
+	unsigned int instr = 0;
+	int type = 0;
+	int size = 0;
+	bool larx_stcx = false;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
@@ -316,12 +475,39 @@ int hw_breakpoint_handler(struct die_args *args)
 	 */
 	rcu_read_lock();
 
-	bp = __this_cpu_read(bp_per_reg);
-	if (!bp) {
+	if (!IS_ENABLED(CONFIG_PPC_8xx))
+		instr = get_instr_detail(regs, &type, &size, &larx_stcx);
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		bp[i] = __this_cpu_read(bp_per_reg[i]);
+		if (!bp[i])
+			continue;
+
+		info[i] = counter_arch_bp(bp[i]);
+		info[i]->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
+
+		if (check_constraints(regs, instr, type, size, info[i])) {
+			if (!IS_ENABLED(CONFIG_PPC_8xx) && instr == -1) {
+				handler_error(bp[i], info[i]);
+				info[i] = NULL;
+				err = 1;
+				continue;
+			}
+
+			if (is_ptrace_bp(bp[i]))
+				ptrace_bp = true;
+			hit[i] = 1;
+			nr_hit++;
+		}
+	}
+
+	if (err)
+		goto reset;
+
+	if (!nr_hit) {
 		rc = NOTIFY_DONE;
 		goto out;
 	}
-	info = counter_arch_bp(bp);
 
 	/*
 	 * Return early after invoking user-callback function without restoring
@@ -329,29 +515,50 @@ int hw_breakpoint_handler(struct die_args *args)
 	 * one-shot mode. The ptrace-ed process will receive the SIGTRAP signal
 	 * generated in do_dabr().
 	 */
-	if (is_ptrace_bp(bp)) {
-		perf_bp_event(bp, regs);
+	if (ptrace_bp) {
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (!hit[i])
+				continue;
+			perf_bp_event(bp[i], regs);
+			info[i] = NULL;
+		}
 		rc = NOTIFY_DONE;
-		goto out;
+		goto reset;
 	}
 
-	info->type &= ~HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	if (IS_ENABLED(CONFIG_PPC_8xx)) {
-		if (!dar_within_range(regs->dar, info))
-			info->type |= HW_BRK_TYPE_EXTRANEOUS_IRQ;
-	} else {
-		if (!stepping_handler(regs, bp, info))
-			goto out;
+	if (!IS_ENABLED(CONFIG_PPC_8xx)) {
+		if (larx_stcx) {
+			for (i = 0; i < nr_wp_slots(); i++) {
+				if (!hit[i])
+					continue;
+				larx_stcx_err(bp[i], info[i]);
+				info[i] = NULL;
+			}
+			goto reset;
+		}
+
+		if (!stepping_handler(regs, bp, info, hit, instr))
+			goto reset;
 	}
 
 	/*
 	 * As a policy, the callback is invoked in a 'trigger-after-execute'
 	 * fashion
 	 */
-	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
-		perf_bp_event(bp, regs);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!hit[i])
+			continue;
+		if (!(info[i]->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
+			perf_bp_event(bp[i], regs);
+	}
+
+reset:
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!info[i])
+			continue;
+		__set_breakpoint(info[i], i);
+	}
 
-	__set_breakpoint(info, 0);
 out:
 	rcu_read_unlock();
 	return rc;
@@ -366,26 +573,43 @@ static int single_step_dabr_instruction(struct die_args *args)
 	struct pt_regs *regs = args->regs;
 	struct perf_event *bp = NULL;
 	struct arch_hw_breakpoint *info;
+	int i;
+	bool found = false;
 
-	bp = current->thread.last_hit_ubp;
 	/*
 	 * Check if we are single-stepping as a result of a
 	 * previous HW Breakpoint exception
 	 */
-	if (!bp)
-		return NOTIFY_DONE;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		bp = current->thread.last_hit_ubp[i];
+
+		if (!bp)
+			continue;
+
+		found = true;
+		info = counter_arch_bp(bp);
+
+		/*
+		 * We shall invoke the user-defined callback function in the
+		 * single stepping handler to confirm to 'trigger-after-execute'
+		 * semantics
+		 */
+		if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
+			perf_bp_event(bp, regs);
+		current->thread.last_hit_ubp[i] = NULL;
+	}
 
-	info = counter_arch_bp(bp);
+	if (!found)
+		return NOTIFY_DONE;
 
-	/*
-	 * We shall invoke the user-defined callback function in the single
-	 * stepping handler to confirm to 'trigger-after-execute' semantics
-	 */
-	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
-		perf_bp_event(bp, regs);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		bp = __this_cpu_read(bp_per_reg[i]);
+		if (!bp)
+			continue;
 
-	__set_breakpoint(info, 0);
-	current->thread.last_hit_ubp = NULL;
+		info = counter_arch_bp(bp);
+		__set_breakpoint(info, i);
+	}
 
 	/*
 	 * If the process was being single-stepped by ptrace, let the
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index cbd6e9b79401..7c64299b001a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -622,9 +622,6 @@ void do_break (struct pt_regs *regs, unsigned long address,
 	if (debugger_break_match(regs))
 		return;
 
-	/* Clear the breakpoint */
-	hw_breakpoint_disable();
-
 	/* Deliver the signal to userspace */
 	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
 }
-- 
2.21.1

