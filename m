Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529C17DC3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 10:17:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bXgQ3HjwzF0w4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 20:17:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bXGF6tm4zDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 19:59:17 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0298oQu5056742
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 04:59:15 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8k7d63d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 04:59:14 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 9 Mar 2020 08:59:12 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 08:59:07 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0298w6sI23986432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 08:58:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3D50A405D;
 Mon,  9 Mar 2020 08:59:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 625C9A4040;
 Mon,  9 Mar 2020 08:59:03 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 08:59:03 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH 09/15] powerpc/watchpoint: Convert thread_struct->hw_brk to an
 array
Date: Mon,  9 Mar 2020 14:28:00 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030908-0016-0000-0000-000002EE81DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030908-0017-0000-0000-00003351E022
Message-Id: <20200309085806.155823-10-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-06,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090066
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
Cc: apopple@linux.ibm.com, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
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
 arch/powerpc/include/asm/processor.h |  2 +-
 arch/powerpc/kernel/process.c        | 43 ++++++++++++++++++++--------
 arch/powerpc/kernel/ptrace.c         | 42 ++++++++++++++++++++-------
 arch/powerpc/kernel/ptrace32.c       |  4 +--
 arch/powerpc/kernel/signal.c         |  9 ++++--
 5 files changed, 72 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 666b2825278c..57a8fac2e72b 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -183,7 +183,7 @@ struct thread_struct {
 	 */
 	struct perf_event *last_hit_ubp;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	struct arch_hw_breakpoint hw_brk; /* info on the hardware breakpoint */
+	struct arch_hw_breakpoint hw_brk[HBP_NUM_MAX]; /* hardware breakpoint info */
 	unsigned long	trap_nr;	/* last trap # on this thread */
 	u8 load_slb;			/* Ages out SLB preload cache entries */
 	u8 load_fp;
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index f6bb2586fa5d..42ff62ef749c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -704,21 +704,25 @@ void switch_booke_debug_regs(struct debug_reg *new_debug)
 EXPORT_SYMBOL_GPL(switch_booke_debug_regs);
 #else	/* !CONFIG_PPC_ADV_DEBUG_REGS */
 #ifndef CONFIG_HAVE_HW_BREAKPOINT
-static void set_breakpoint(struct arch_hw_breakpoint *brk)
+static void set_breakpoint(struct arch_hw_breakpoint *brk, int i)
 {
 	preempt_disable();
-	__set_breakpoint(brk, 0);
+	__set_breakpoint(brk, i);
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
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		thread->hw_brk[i].address = 0;
+		thread->hw_brk[i].type = 0;
+		thread->hw_brk[i].len = 0;
+		thread->hw_brk[i].hw_len = 0;
+		if (ppc_breakpoint_available())
+			set_breakpoint(&thread->hw_brk[i], i);
+	}
 }
 #endif /* !CONFIG_HAVE_HW_BREAKPOINT */
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
@@ -1141,6 +1145,24 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	thread_pkey_regs_restore(new_thread, old_thread);
 }
 
+#ifndef CONFIG_HAVE_HW_BREAKPOINT
+static void switch_hw_breakpoint(struct task_struct *new)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[i]),
+					   &new->thread.hw_brk[i]))) {
+			__set_breakpoint(&new->thread.hw_brk[i], i);
+		}
+	}
+}
+#else
+static void switch_hw_breakpoint(struct task_struct *new)
+{
+}
+#endif
+
 struct task_struct *__switch_to(struct task_struct *prev,
 	struct task_struct *new)
 {
@@ -1172,10 +1194,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
  * For PPC_BOOK3S_64, we use the hw-breakpoint interfaces that would
  * schedule DABR
  */
-#ifndef CONFIG_HAVE_HW_BREAKPOINT
-	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[0]), &new->thread.hw_brk)))
-		__set_breakpoint(&new->thread.hw_brk, 0);
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+	switch_hw_breakpoint(new);
 #endif
 
 	/*
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index dd46e174dbe7..f6d7955fc61e 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2382,6 +2382,11 @@ void ptrace_triggered(struct perf_event *bp,
 }
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
+/*
+ * ptrace_set_debugreg() fakes DABR and DABR is only one. So even if
+ * internal hw supports more than one watchpoint, we support only one
+ * watchpoint with this interface.
+ */
 static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 			       unsigned long data)
 {
@@ -2451,7 +2456,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 			return ret;
 		}
 		thread->ptrace_bps[0] = bp;
-		thread->hw_brk = hw_brk;
+		thread->hw_brk[0] = hw_brk;
 		return 0;
 	}
 
@@ -2473,7 +2478,7 @@ static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
 	if (set_bp && (!ppc_breakpoint_available()))
 		return -ENODEV;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	task->thread.hw_brk = hw_brk;
+	task->thread.hw_brk[0] = hw_brk;
 #else /* CONFIG_PPC_ADV_DEBUG_REGS */
 	/* As described above, it was assumed 3 bits were passed with the data
 	 *  address, but we will assume only the mode bits will be passed
@@ -2824,9 +2829,23 @@ static int set_dac_range(struct task_struct *child,
 }
 #endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
 
+#ifndef CONFIG_PPC_ADV_DEBUG_REGS
+static int empty_hw_brk(struct thread_struct *thread)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!thread->hw_brk[i].address)
+			return i;
+	}
+	return -1;
+}
+#endif
+
 static long ppc_set_hwdebug(struct task_struct *child,
 		     struct ppc_hw_breakpoint *bp_info)
 {
+	int i;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	int len = 0;
 	struct thread_struct *thread = &(child->thread);
@@ -2919,15 +2938,16 @@ static long ppc_set_hwdebug(struct task_struct *child,
 	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
 		return -EINVAL;
 
-	if (child->thread.hw_brk.address)
+	i = empty_hw_brk(&child->thread);
+	if (i < 0)
 		return -ENOSPC;
 
 	if (!ppc_breakpoint_available())
 		return -ENODEV;
 
-	child->thread.hw_brk = brk;
+	child->thread.hw_brk[i] = brk;
 
-	return 1;
+	return i + 1;
 #endif /* !CONFIG_PPC_ADV_DEBUG_DVCS */
 }
 
@@ -2955,7 +2975,7 @@ static long ppc_del_hwdebug(struct task_struct *child, long data)
 	}
 	return rc;
 #else
-	if (data != 1)
+	if (data < 1 || data > nr_wp_slots())
 		return -EINVAL;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -2967,11 +2987,11 @@ static long ppc_del_hwdebug(struct task_struct *child, long data)
 		ret = -ENOENT;
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
@@ -3124,8 +3144,8 @@ long arch_ptrace(struct task_struct *child, long request,
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 		ret = put_user(child->thread.debug.dac1, datalp);
 #else
-		dabr_fake = ((child->thread.hw_brk.address & (~HW_BRK_TYPE_DABR)) |
-			     (child->thread.hw_brk.type & HW_BRK_TYPE_DABR));
+		dabr_fake = ((child->thread.hw_brk[0].address & (~HW_BRK_TYPE_DABR)) |
+			     (child->thread.hw_brk[0].type & HW_BRK_TYPE_DABR));
 		ret = put_user(dabr_fake, datalp);
 #endif
 		break;
diff --git a/arch/powerpc/kernel/ptrace32.c b/arch/powerpc/kernel/ptrace32.c
index f37eb53de1a1..e227cd320b46 100644
--- a/arch/powerpc/kernel/ptrace32.c
+++ b/arch/powerpc/kernel/ptrace32.c
@@ -270,8 +270,8 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
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
index 8bc6cc55420a..3116896e89a6 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -107,6 +107,9 @@ static void do_signal(struct task_struct *tsk)
 	struct ksignal ksig = { .sig = 0 };
 	int ret;
 	int is32 = is_32bit_task();
+#ifndef CONFIG_PPC_ADV_DEBUG_REGS
+	int i;
+#endif
 
 	BUG_ON(tsk != current);
 
@@ -128,8 +131,10 @@ static void do_signal(struct task_struct *tsk)
 	 * user space. The DABR will have been cleared if it
 	 * triggered inside the kernel.
 	 */
-	if (tsk->thread.hw_brk.address && tsk->thread.hw_brk.type)
-		__set_breakpoint(&tsk->thread.hw_brk, 0);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (tsk->thread.hw_brk[i].address && tsk->thread.hw_brk[i].type)
+			__set_breakpoint(&tsk->thread.hw_brk[i], i);
+	}
 #endif
 	/* Re-enable the breakpoints for the signal stack */
 	thread_change_pc(tsk, tsk->thread.regs);
-- 
2.21.1

