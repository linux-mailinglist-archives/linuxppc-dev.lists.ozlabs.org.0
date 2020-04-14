Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF11A71CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:33:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491WKg48kwzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:33:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491W252KcWzDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 13:19:57 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E33YF4101625
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:19:55 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30b96thsn8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:19:55 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 14 Apr 2020 04:19:48 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 04:19:43 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03E3IeFG40173994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 03:18:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE4A5204E;
 Tue, 14 Apr 2020 03:19:45 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.60.157])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 70F875204F;
 Tue, 14 Apr 2020 03:19:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 06/16] powerpc/watchpoint: Provide DAWR number to
 __set_breakpoint
Date: Tue, 14 Apr 2020 08:46:49 +0530
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041403-0028-0000-0000-000003F7CE1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041403-0029-0000-0000-000024BD78E9
Message-Id: <20200414031659.58875-7-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_11:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=994
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Introduce new parameter 'nr' to __set_breakpoint() which indicates
which DAWR should be programed. Also convert current_brk variable
to an array.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/debug.h         |  2 +-
 arch/powerpc/include/asm/hw_breakpoint.h |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c      |  8 ++++----
 arch/powerpc/kernel/process.c            | 14 +++++++-------
 arch/powerpc/kernel/signal.c             |  2 +-
 arch/powerpc/xmon/xmon.c                 |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 7756026b95ca..ec57daf87f40 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -45,7 +45,7 @@ static inline int debugger_break_match(struct pt_regs *regs) { return 0; }
 static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
-void __set_breakpoint(struct arch_hw_breakpoint *brk);
+void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 5b3b02834e0b..1120c7d9db58 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -85,7 +85,7 @@ static inline void hw_breakpoint_disable(void)
 	brk.len = 0;
 	brk.hw_len = 0;
 	if (ppc_breakpoint_available())
-		__set_breakpoint(&brk);
+		__set_breakpoint(0, &brk);
 }
 extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
 int hw_breakpoint_handler(struct die_args *args);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 4120349e2abe..5826f1f2cab9 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -63,7 +63,7 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	 * If so, DABR will be populated in single_step_dabr_instruction().
 	 */
 	if (current->thread.last_hit_ubp != bp)
-		__set_breakpoint(info);
+		__set_breakpoint(0, info);
 
 	return 0;
 }
@@ -221,7 +221,7 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 
 	info = counter_arch_bp(tsk->thread.last_hit_ubp);
 	regs->msr &= ~MSR_SE;
-	__set_breakpoint(info);
+	__set_breakpoint(0, info);
 	tsk->thread.last_hit_ubp = NULL;
 }
 
@@ -346,7 +346,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
 		perf_bp_event(bp, regs);
 
-	__set_breakpoint(info);
+	__set_breakpoint(0, info);
 out:
 	rcu_read_unlock();
 	return rc;
@@ -379,7 +379,7 @@ static int single_step_dabr_instruction(struct die_args *args)
 	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
 		perf_bp_event(bp, regs);
 
-	__set_breakpoint(info);
+	__set_breakpoint(0, info);
 	current->thread.last_hit_ubp = NULL;
 
 	/*
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 14aba1295b10..1d9d382517ae 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -637,7 +637,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
 }
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
 
-static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk);
+static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk[HBP_NUM_MAX]);
 
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 /*
@@ -714,7 +714,7 @@ EXPORT_SYMBOL_GPL(switch_booke_debug_regs);
 static void set_breakpoint(struct arch_hw_breakpoint *brk)
 {
 	preempt_disable();
-	__set_breakpoint(brk);
+	__set_breakpoint(0, brk);
 	preempt_enable();
 }
 
@@ -800,13 +800,13 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
-void __set_breakpoint(struct arch_hw_breakpoint *brk)
+void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
-	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
+	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
 
 	if (dawr_enabled())
 		// Power8 or later
-		set_dawr(0, brk);
+		set_dawr(nr, brk);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		set_breakpoint_8xx(brk);
 	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
@@ -1174,8 +1174,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
  * schedule DABR
  */
 #ifndef CONFIG_HAVE_HW_BREAKPOINT
-	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk), &new->thread.hw_brk)))
-		__set_breakpoint(&new->thread.hw_brk);
+	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[0]), &new->thread.hw_brk)))
+		__set_breakpoint(0, &new->thread.hw_brk);
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 #endif
 
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index a264989626fd..1a04a4b18741 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -269,7 +269,7 @@ static void do_signal(struct task_struct *tsk)
 	 * triggered inside the kernel.
 	 */
 	if (tsk->thread.hw_brk.address && tsk->thread.hw_brk.type)
-		__set_breakpoint(&tsk->thread.hw_brk);
+		__set_breakpoint(0, &tsk->thread.hw_brk);
 #endif
 	/* Re-enable the breakpoints for the signal stack */
 	thread_change_pc(tsk, tsk->thread.regs);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index d4dba8ea8995..d8c0f01e4b24 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -935,7 +935,7 @@ static void insert_cpu_bpts(void)
 		brk.address = dabr.address;
 		brk.type = (dabr.enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
 		brk.len = DABR_MAX_LEN;
-		__set_breakpoint(&brk);
+		__set_breakpoint(0, &brk);
 	}
 
 	if (iabr)
-- 
2.21.1

