Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C111D2EA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 13:47:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N8sK3szSzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N8Dv2RQxzDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 21:18:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EB3OUx113772; Thu, 14 May 2020 07:18:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310tjp1tfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:46 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EB3SYp114122;
 Thu, 14 May 2020 07:18:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310tjp1te9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EBFwJi015504;
 Thu, 14 May 2020 11:18:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3100ubbgt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:18:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04EBIe5K63897854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 11:18:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A763842045;
 Thu, 14 May 2020 11:18:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BCDF42042;
 Thu, 14 May 2020 11:18:37 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 11:18:36 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 13/16] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
Date: Thu, 14 May 2020 16:47:38 +0530
Message-Id: <20200514111741.97993-14-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
References: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-14,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=867 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 cotscore=-2147483648 malwarescore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005140100
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we assume that we have only one watchpoint supported by hw.
Get rid of that assumption and use dynamic loop instead. This should
make supporting more watchpoints very easy.

With more than one watchpoint, exception handler needs to know which
DAWR caused the exception, and hw currently does not provide it. So
we need sw logic for the same. To figure out which DAWR caused the
exception, check all different combinations of user specified range,
DAWR address range, actual access range and DAWRX constrains. For ex,
if user specified range and actual access range overlaps but DAWRX is
configured for readonly watchpoint and the instruction is store, this
DAWR must not have caused exception.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/processor.h |   2 +-
 arch/powerpc/include/asm/sstep.h     |   2 +
 arch/powerpc/kernel/hw_breakpoint.c  | 397 +++++++++++++++++++++------
 arch/powerpc/kernel/process.c        |   3 -
 4 files changed, 312 insertions(+), 92 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index fba6b586e3c8..4e53df163b92 100644
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
index 9b200a5f8794..3b01c69a44aa 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -49,6 +49,8 @@ enum instruction_type {
 
 #define INSTR_TYPE_MASK	0x1f
 
+#define OP_IS_LOAD(type)	((LOAD <= (type) && (type) <= LOAD_VSX) || (type) == LARX)
+#define OP_IS_STORE(type)	((STORE <= (type) && (type) <= STORE_VSX) || (type) == STCX)
 #define OP_IS_LOAD_STORE(type)	(LOAD <= (type) && (type) <= STCX)
 
 /* Compute flags, ORed in with type */
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 4366bd0c90c4..da858bc6a414 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -31,7 +31,7 @@
  * Stores the breakpoints currently in use on each breakpoint address
  * register for every cpu
  */
-static DEFINE_PER_CPU(struct perf_event *, bp_per_reg);
+static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
 
 /*
  * Returns total number of data or instruction breakpoints available.
@@ -43,6 +43,17 @@ int hw_breakpoint_slots(int type)
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
@@ -55,16 +66,26 @@ int hw_breakpoint_slots(int type)
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
-		__set_breakpoint(0, info);
+	if (!single_step_pending())
+		__set_breakpoint(i, info);
 
 	return 0;
 }
@@ -80,15 +101,22 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
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
+	__set_breakpoint(i, &null_brk);
 }
 
 static bool is_ptrace_bp(struct perf_event *bp)
@@ -108,8 +136,14 @@ void arch_unregister_hw_breakpoint(struct perf_event *bp)
 	 * restoration variables to prevent dangling pointers.
 	 * FIXME, this should not be using bp->ctx at all! Sayeth peterz.
 	 */
-	if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L))
-		bp->ctx->task->thread.last_hit_ubp = NULL;
+	if (bp->ctx && bp->ctx->task && bp->ctx->task != ((void *)-1L)) {
+		int i;
+
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (bp->ctx->task->thread.last_hit_ubp[i] == bp)
+				bp->ctx->task->thread.last_hit_ubp[i] = NULL;
+		}
+	}
 }
 
 /*
@@ -221,90 +255,211 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
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
-	__set_breakpoint(0, info);
-	tsk->thread.last_hit_ubp = NULL;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		info = counter_arch_bp(__this_cpu_read(bp_per_reg[i]));
+		__set_breakpoint(i, info);
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
+{
+	return ((dar < info->address + info->len) &&
+		(dar + size > info->address));
+}
+
+static bool dar_in_hw_range(unsigned long dar, struct arch_hw_breakpoint *info)
+{
+	unsigned long hw_start_addr, hw_end_addr;
+
+	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
+	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
+
+	return ((hw_start_addr <= dar) && (hw_end_addr > dar));
+}
+
+static bool dar_hw_range_overlaps(unsigned long dar, int size,
+				  struct arch_hw_breakpoint *info)
 {
-	return ((dar <= info->address + info->len - 1) &&
-		(dar + size - 1 >= info->address));
+	unsigned long hw_start_addr, hw_end_addr;
+
+	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
+	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
+
+	return ((dar < hw_end_addr) && (dar + size > hw_start_addr));
 }
 
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
-	struct ppc_inst instr = ppc_inst(0);
-	int ret, type, size;
-	struct instruction_op op;
-	unsigned long addr = info->address;
+	if (OP_IS_LOAD(type) && !(info->type & HW_BRK_TYPE_READ))
+		return false;
 
-	if (__get_user_instr_inatomic(instr, (void __user *)regs->nip))
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
+ * Return true if the event is valid wrt dawr configuration,
+ * including extraneous exception. Otherwise return false.
+ */
+static bool check_constraints(struct pt_regs *regs, struct ppc_inst instr,
+			      int type, int size, struct arch_hw_breakpoint *info)
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
+	if (unlikely(ppc_inst_equal(instr, ppc_inst(0)))) {
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
+static void get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
+			     int *type, int *size, bool *larx_stcx)
+{
+	struct instruction_op op;
+
+	if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
+		return;
+
+	analyse_instr(&op, regs, *instr);
 
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
 
-disable:
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
+			     struct ppc_inst instr)
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
+	struct ppc_inst instr = ppc_inst(0);
+	int type = 0;
+	int size = 0;
+	bool larx_stcx = false;
 
 	/* Disable breakpoints during exception handling */
 	hw_breakpoint_disable();
@@ -317,12 +472,40 @@ int hw_breakpoint_handler(struct die_args *args)
 	 */
 	rcu_read_lock();
 
-	bp = __this_cpu_read(bp_per_reg);
-	if (!bp) {
+	if (!IS_ENABLED(CONFIG_PPC_8xx))
+		get_instr_detail(regs, &instr, &type, &size, &larx_stcx);
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
+			if (!IS_ENABLED(CONFIG_PPC_8xx) &&
+			    ppc_inst_equal(instr, ppc_inst(0))) {
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
@@ -330,29 +513,50 @@ int hw_breakpoint_handler(struct die_args *args)
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
+		__set_breakpoint(i, info[i]);
+	}
 
-	__set_breakpoint(0, info);
 out:
 	rcu_read_unlock();
 	return rc;
@@ -367,26 +571,43 @@ static int single_step_dabr_instruction(struct die_args *args)
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
 
-	__set_breakpoint(0, info);
-	current->thread.last_hit_ubp = NULL;
+		info = counter_arch_bp(bp);
+		__set_breakpoint(i, info);
+	}
 
 	/*
 	 * If the process was being single-stepped by ptrace, let the
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9b11575dcb8a..048d64c4e115 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -629,9 +629,6 @@ void do_break (struct pt_regs *regs, unsigned long address,
 	if (debugger_break_match(regs))
 		return;
 
-	/* Clear the breakpoint */
-	hw_breakpoint_disable();
-
 	/* Deliver the signal to userspace */
 	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
 }
-- 
2.26.2

