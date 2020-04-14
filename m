Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F51A71FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:44:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491WZR6PY1zDqFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:44:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491W3l0np8zDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 13:21:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E33l97125123
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:21:21 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30bad8842k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:21:20 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 14 Apr 2020 04:20:45 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 04:20:42 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03E3LDsX58392604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 03:21:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A725D5205A;
 Tue, 14 Apr 2020 03:21:13 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.60.157])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 88B395204E;
 Tue, 14 Apr 2020 03:20:52 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 09/16] powerpc/watchpoint: Convert thread_struct->hw_brk to
 an array
Date: Tue, 14 Apr 2020 08:46:52 +0530
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041403-4275-0000-0000-000003BF6AA1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041403-4276-0000-0000-000038D4DB4F
Message-Id: <20200414031659.58875-10-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_11:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140024
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

So far powerpc hw supported only one watchpoint. But Future Power
architecture is introducing 2nd DAWR. Convert thread_struct->hw_brk
into an array.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h      |  2 +-
 arch/powerpc/kernel/process.c             | 60 ++++++++++++++---------
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 40 ++++++++++-----
 arch/powerpc/kernel/ptrace/ptrace32.c     |  4 +-
 arch/powerpc/kernel/signal.c              | 12 +++--
 5 files changed, 77 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 90f6dbc7ff00..65b03162cd67 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -187,7 +187,7 @@ struct thread_struct {
 	 */
 	struct perf_event *last_hit_ubp;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	struct arch_hw_breakpoint hw_brk; /* info on the hardware breakpoint */
+	struct arch_hw_breakpoint hw_brk[HBP_NUM_MAX]; /* hardware breakpoint info */
 	unsigned long	trap_nr;	/* last trap # on this thread */
 	u8 load_slb;			/* Ages out SLB preload cache entries */
 	u8 load_fp;
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1d9d382517ae..5ad23ac2c9d9 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -711,21 +711,49 @@ void switch_booke_debug_regs(struct debug_reg *new_debug)
 EXPORT_SYMBOL_GPL(switch_booke_debug_regs);
 #else	/* !CONFIG_PPC_ADV_DEBUG_REGS */
 #ifndef CONFIG_HAVE_HW_BREAKPOINT
-static void set_breakpoint(struct arch_hw_breakpoint *brk)
+static void set_breakpoint(int i, struct arch_hw_breakpoint *brk)
 {
 	preempt_disable();
-	__set_breakpoint(0, brk);
+	__set_breakpoint(i, brk);
 	preempt_enable();
 }
 
 static void set_debug_reg_defaults(struct thread_struct *thread)
 {
-	thread->hw_brk.address = 0;
-	thread->hw_brk.type = 0;
-	thread->hw_brk.len = 0;
-	thread->hw_brk.hw_len = 0;
-	if (ppc_breakpoint_available())
-		set_breakpoint(&thread->hw_brk);
+	int i;
+	struct arch_hw_breakpoint null_brk = {0};
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		thread->hw_brk[i] = null_brk;
+		if (ppc_breakpoint_available())
+			set_breakpoint(i, &thread->hw_brk[i]);
+	}
+}
+
+static inline bool hw_brk_match(struct arch_hw_breakpoint *a,
+				struct arch_hw_breakpoint *b)
+{
+	if (a->address != b->address)
+		return false;
+	if (a->type != b->type)
+		return false;
+	if (a->len != b->len)
+		return false;
+	/* no need to check hw_len. it's calculated from address and len */
+	return true;
+}
+
+static void switch_hw_breakpoint(struct task_struct *new)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (likely(hw_brk_match(this_cpu_ptr(&current_brk[i]),
+					&new->thread.hw_brk[i])))
+			continue;
+
+		__set_breakpoint(i, &new->thread.hw_brk[i]);
+	}
 }
 #endif /* !CONFIG_HAVE_HW_BREAKPOINT */
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
@@ -829,19 +857,6 @@ bool ppc_breakpoint_available(void)
 }
 EXPORT_SYMBOL_GPL(ppc_breakpoint_available);
 
-static inline bool hw_brk_match(struct arch_hw_breakpoint *a,
-			      struct arch_hw_breakpoint *b)
-{
-	if (a->address != b->address)
-		return false;
-	if (a->type != b->type)
-		return false;
-	if (a->len != b->len)
-		return false;
-	/* no need to check hw_len. it's calculated from address and len */
-	return true;
-}
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
 static inline bool tm_enabled(struct task_struct *tsk)
@@ -1174,8 +1189,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
  * schedule DABR
  */
 #ifndef CONFIG_HAVE_HW_BREAKPOINT
-	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[0]), &new->thread.hw_brk)))
-		__set_breakpoint(0, &new->thread.hw_brk);
+	switch_hw_breakpoint(new);
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #endif
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 12962302d6a4..0dbb35392dd2 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -67,11 +67,16 @@ int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 	/* We only support one DABR and no IABRS at the moment */
 	if (addr > 0)
 		return -EINVAL;
-	dabr_fake = ((child->thread.hw_brk.address & (~HW_BRK_TYPE_DABR)) |
-		     (child->thread.hw_brk.type & HW_BRK_TYPE_DABR));
+	dabr_fake = ((child->thread.hw_brk[0].address & (~HW_BRK_TYPE_DABR)) |
+		     (child->thread.hw_brk[0].type & HW_BRK_TYPE_DABR));
 	return put_user(dabr_fake, datalp);
 }
 
+/*
+ * ptrace_set_debugreg() fakes DABR and DABR is only one. So even if
+ * internal hw supports more than one watchpoint, we support only one
+ * watchpoint with this interface.
+ */
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
 {
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -137,7 +142,7 @@ int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned l
 			return ret;
 
 		thread->ptrace_bps[0] = bp;
-		thread->hw_brk = hw_brk;
+		thread->hw_brk[0] = hw_brk;
 		return 0;
 	}
 
@@ -159,12 +164,24 @@ int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned l
 	if (set_bp && (!ppc_breakpoint_available()))
 		return -ENODEV;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	task->thread.hw_brk = hw_brk;
+	task->thread.hw_brk[0] = hw_brk;
 	return 0;
 }
 
+static int find_empty_hw_brk(struct thread_struct *thread)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!thread->hw_brk[i].address)
+			return i;
+	}
+	return -1;
+}
+
 long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
 {
+	int i;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	int len = 0;
 	struct thread_struct *thread = &child->thread;
@@ -223,15 +240,16 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
 		return -EINVAL;
 
-	if (child->thread.hw_brk.address)
+	i = find_empty_hw_brk(&child->thread);
+	if (i < 0)
 		return -ENOSPC;
 
 	if (!ppc_breakpoint_available())
 		return -ENODEV;
 
-	child->thread.hw_brk = brk;
+	child->thread.hw_brk[i] = brk;
 
-	return 1;
+	return i + 1;
 }
 
 long ppc_del_hwdebug(struct task_struct *child, long data)
@@ -241,7 +259,7 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
 	struct thread_struct *thread = &child->thread;
 	struct perf_event *bp;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	if (data != 1)
+	if (data < 1 || data > nr_wp_slots())
 		return -EINVAL;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -254,11 +272,11 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
 	}
 	return ret;
 #else /* CONFIG_HAVE_HW_BREAKPOINT */
-	if (child->thread.hw_brk.address == 0)
+	if (child->thread.hw_brk[data - 1].address == 0)
 		return -ENOENT;
 
-	child->thread.hw_brk.address = 0;
-	child->thread.hw_brk.type = 0;
+	child->thread.hw_brk[data - 1].address = 0;
+	child->thread.hw_brk[data - 1].type = 0;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
 	return 0;
diff --git a/arch/powerpc/kernel/ptrace/ptrace32.c b/arch/powerpc/kernel/ptrace/ptrace32.c
index 7976ddf29c0e..7589a9665ffb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace32.c
+++ b/arch/powerpc/kernel/ptrace/ptrace32.c
@@ -259,8 +259,8 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		ret = put_user(child->thread.debug.dac1, (u32 __user *)data);
 #else
 		dabr_fake = (
-			(child->thread.hw_brk.address & (~HW_BRK_TYPE_DABR)) |
-			(child->thread.hw_brk.type & HW_BRK_TYPE_DABR));
+			(child->thread.hw_brk[0].address & (~HW_BRK_TYPE_DABR)) |
+			(child->thread.hw_brk[0].type & HW_BRK_TYPE_DABR));
 		ret = put_user(dabr_fake, (u32 __user *)data);
 #endif
 		break;
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 1a04a4b18741..cd9008e751d7 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -247,6 +247,7 @@ static void do_signal(struct task_struct *tsk)
 	sigset_t *oldset = sigmask_to_save();
 	struct ksignal ksig = { .sig = 0 };
 	int ret;
+	int i;
 
 	BUG_ON(tsk != current);
 
@@ -262,15 +263,18 @@ static void do_signal(struct task_struct *tsk)
 		return;               /* no signals delivered */
 	}
 
-#ifndef CONFIG_PPC_ADV_DEBUG_REGS
         /*
 	 * Reenable the DABR before delivering the signal to
 	 * user space. The DABR will have been cleared if it
 	 * triggered inside the kernel.
 	 */
-	if (tsk->thread.hw_brk.address && tsk->thread.hw_brk.type)
-		__set_breakpoint(0, &tsk->thread.hw_brk);
-#endif
+	if (!IS_ENABLED(CONFIG_PPC_ADV_DEBUG_REGS)) {
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (tsk->thread.hw_brk[i].address && tsk->thread.hw_brk[i].type)
+				__set_breakpoint(i, &tsk->thread.hw_brk[i]);
+		}
+	}
+
 	/* Re-enable the breakpoints for the signal stack */
 	thread_change_pc(tsk, tsk->thread.regs);
 
-- 
2.21.1

