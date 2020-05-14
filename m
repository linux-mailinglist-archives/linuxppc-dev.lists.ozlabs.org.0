Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E67BF1D2E83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 13:39:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N8hY1VW3zDqXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:39:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N8Dd6LSkzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 21:18:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EB3FkA065548; Thu, 14 May 2020 07:18:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310tcmskhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:30 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EB3qCm068682;
 Thu, 14 May 2020 07:18:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310tcmskgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EBFwJe015504;
 Thu, 14 May 2020 11:18:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3100ubbgsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:18:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04EBIPr559572412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 11:18:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35AA42041;
 Thu, 14 May 2020 11:18:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B89E42047;
 Thu, 14 May 2020 11:18:21 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 11:18:21 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 09/16] powerpc/watchpoint: Convert thread_struct->hw_brk to
 an array
Date: Thu, 14 May 2020 16:47:34 +0530
Message-Id: <20200514111741.97993-10-ravi.bangoria@linux.ibm.com>
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
 mlxlogscore=999
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
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

So far powerpc hw supported only one watchpoint. But Power10 is
introducing 2nd DAWR. Convert thread_struct->hw_brk into an array.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/processor.h      |  2 +-
 arch/powerpc/kernel/process.c             | 60 ++++++++++++++---------
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 40 ++++++++++-----
 arch/powerpc/kernel/ptrace/ptrace32.c     |  4 +-
 arch/powerpc/kernel/signal.c              | 13 +++--
 5 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index f209c5703ee2..fba6b586e3c8 100644
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
index f303aea61794..d94d8925711c 100644
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
index 8e29138a344a..b4143b6ff093 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -265,15 +265,20 @@ static void do_signal(struct task_struct *tsk)
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
+		int i;
+
+		for (i = 0; i < nr_wp_slots(); i++) {
+			if (tsk->thread.hw_brk[i].address && tsk->thread.hw_brk[i].type)
+				__set_breakpoint(i, &tsk->thread.hw_brk[i]);
+		}
+	}
+
 	/* Re-enable the breakpoints for the signal stack */
 	thread_change_pc(tsk, tsk->thread.regs);
 
-- 
2.26.2

