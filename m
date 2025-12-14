Return-Path: <linuxppc-dev+bounces-14751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF2CBBAF3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1h13KSz2yfs;
	Mon, 15 Dec 2025 00:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717496;
	cv=none; b=KN/bWRf3NrZsbSYNWeTmAl+AN4i3tQljvWd74BulURJRq61udUbun/Aln0WbJQHndX1IoKYvHqnVK79UH0aRx8qkZA0MenjQvZNWVmgu6hAzrJ7YiXyb2Hq3JuMIGCwHooDeF7GXtxDHg4ZBga1Q6LFejYB4atp6kHSaLJ60MHXD+AJp6khwuwXzRQoDsNxNVBxWI4ShLYbLCBCCjG5fZU7oZPIqbSCVX+EhCqNyuvJK4r4pqWU/um0jpK63nUbOUySK6/6DlajvGSoazRQEUPuBAbZzm4PeG2THRvP4gAUk9v4IGXZHtE1TZba5KLjIgUTBlfqC1mZrV4lI2lc1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717496; c=relaxed/relaxed;
	bh=XD8MAQ+pIJ7zb85pNWD8Io82WknO/T67EC6Jg/LJLCA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cu4p8kmJX5Wl8ZQszb8NK5YXnDBuiEoh7h5qwaR21zygmC1Z/4qx6wgniram7fr2xpHEzQz5TPvTdY81SffPatp0snNYQ1nfqpYrxWQ+bdEWtK3ZV7GlmE6aCm3UA75PiEYCq/TAk+k4fgIlk0hdJ3ZAVmy02TdJpwpABIqe9dXNTV55U92MHpTHdGJb7Imr3i+Vmgo50RK3Hzl4Lad4wKvCQjdkr0Ib6dozZrKAGCZNSzllYJ+4KgN7eHgj8/KxlGJW5hyx71PJefkJGMBsAOtbo0Zc1B6JPnVb7IzTZsqOfNemx/hijxU5Yij9Lcx9O7fDuOLJwGqbrwfXJ6XfBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=td7pzOzI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=td7pzOzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1g0tKRz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BDM8rfE029519;
	Sun, 14 Dec 2025 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XD8MAQ
	+pIJ7zb85pNWD8Io82WknO/T67EC6Jg/LJLCA=; b=td7pzOzIRseus8QiOajBCP
	SUaiPLkLuvpEVNV0ZVfIeEZUYVmgXitQiH937/SvqhnvxUbLEVEtm8+KvYXCmMsW
	pRAxJNRE1lF170is2oOQo3whleBrUxbC0J+CPiKrx2mIsKF25QcfchOsUEjn/+m1
	Zez2RaXp56DlCMlsUjHbjnQblG2OI5Q5+d+4c15aY/ohaGjHsm7JOwcZHiiuBzMM
	jePpccYTzGTAoZTaIqwXzpw7pyNr9JQAKOa2wntLVw9nhRAUbJ99xaa24NMZ70BT
	PjeydGrbP/QApJ/I0DppqEciAWI4wEdr2bUFOPOfhhjuONiLE2JiJhDp8Dr/EkOQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:31 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED06R1029583;
	Sun, 14 Dec 2025 13:04:30 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt159hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE9JPIx005690;
	Sun, 14 Dec 2025 13:04:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1tgngjbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED4Pr245482280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:04:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D7F720043;
	Sun, 14 Dec 2025 13:04:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1268120040;
	Sun, 14 Dec 2025 13:04:19 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:04:18 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
Date: Sun, 14 Dec 2025 18:32:43 +0530
Message-ID: <20251214130245.43664-8-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214130245.43664-1-mkchauras@linux.ibm.com>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UwG_wH-8PPbf7_bWUmohQ2ubP2UD1nif
X-Proofpoint-ORIG-GUID: 73Zalvo_9tc3E3H-2Ekim4efjDiRzmL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXwrcV25jmKld6
 Id8iUL8ob4NYzmF4VgTCoBlttUEzfsYN9MQVGL3K4ZvSA+hevTc40HpOkU0r41JMbjsvUhN4tE/
 Ct32gqQPL84y1iNrUknaZChryJ4g2pDAOeTVE5cEGd8MtOtkcrK7UGyb0WCSKJApyoTryx5urrW
 xjQ7e9CYlewJbGgeYHsCLU51xvbnLG53gFT1Z8865EqkeNTnPB5vzSF5R2IDJsbC1yFVh6lKWcm
 j6kfCIeumcl5Qc3S0NOo1dlLyIGq6DUKOr3WYvXjXy5BrO6jyQ3h7/L9bEUr3esfF1NSWBbjFtD
 FsR6sgzLN9KiREhEuDLYU4bU344lsGTOj9Mh/xKKvPJcRtteck9ITZvXOuTpbRdGyChetf9d3Es
 +7O0XquM2U6C5I+5D5Nq18L/U4HA1g==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=693eb5df cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=NIz8WlYnyIp8l4wp2tMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Enable the generic IRQ entry/exit infrastructure on PowerPC by selecting
GENERIC_IRQ_ENTRY and integrating the architecture-specific interrupt
handlers with the generic entry/exit APIs.

This change replaces PowerPC’s local interrupt entry/exit handling with
calls to the generic irqentry_* helpers, aligning the architecture with
the common kernel entry model. The macros that define interrupt, async,
and NMI handlers are updated to use irqentry_enter()/irqentry_exit()
and irqentry_nmi_enter()/irqentry_nmi_exit() where applicable.

Key updates include:
 - Select GENERIC_IRQ_ENTRY in Kconfig.
 - Replace interrupt_enter/exit_prepare() with arch_interrupt_* helpers.
 - Integrate irqentry_enter()/exit() in standard and async interrupt paths.
 - Integrate irqentry_nmi_enter()/exit() in NMI handlers.
 - Remove redundant irq_enter()/irq_exit() calls now handled generically.
 - Use irqentry_exit_cond_resched() for preemption checks.

This change establishes the necessary wiring for PowerPC to use the
generic IRQ entry/exit framework while maintaining existing semantics.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/Kconfig                    |   1 +
 arch/powerpc/include/asm/entry-common.h |  66 +---
 arch/powerpc/include/asm/interrupt.h    | 499 +++---------------------
 arch/powerpc/kernel/interrupt.c         |  13 +-
 4 files changed, 74 insertions(+), 505 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885a..b0c602c3bbe1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -206,6 +206,7 @@ config PPC
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index e8bde4c67eaf..e2ae7416dee1 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -257,6 +257,17 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
  */
 static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
 {
+	if (user_mode(regs)) {
+		BUG_ON(regs_is_unrecoverable(regs));
+		BUG_ON(regs_irqs_disabled(regs));
+		/*
+		 * We don't need to restore AMR on the way back to userspace for KUAP.
+		 * AMR can only have been unlocked if we interrupted the kernel.
+		 */
+		kuap_assert_locked();
+
+		local_irq_disable();
+	}
 }
 
 static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
@@ -275,7 +286,6 @@ static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
 	    !test_thread_local_flags(_TLF_RUNLATCH))
 		__ppc64_runlatch_on();
 #endif
-	irq_enter();
 }
 
 static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
@@ -288,7 +298,6 @@ static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
 	 */
 	nap_adjust_return(regs);
 
-	irq_exit();
 	arch_interrupt_exit_prepare(regs);
 }
 
@@ -354,59 +363,11 @@ static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
 		this_cpu_set_ftrace_enabled(0);
 	}
 #endif
-
-	/* If data relocations are enabled, it's safe to use nmi_enter() */
-	if (mfmsr() & MSR_DR) {
-		nmi_enter();
-		return;
-	}
-
-	/*
-	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
-	 * NMI because not everything it touches is within the RMA limit.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-	    firmware_has_feature(FW_FEATURE_LPAR) &&
-	    !radix_enabled())
-		return;
-
-	/*
-	 * Likewise, don't use it if we have some form of instrumentation (like
-	 * KASAN shadow) that is not safe to access in real mode (even on radix)
-	 */
-	if (IS_ENABLED(CONFIG_KASAN))
-		return;
-
-	/*
-	 * Likewise, do not use it in real mode if percpu first chunk is not
-	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
-	 * are chances where percpu allocation can come from vmalloc area.
-	 */
-	if (percpu_first_chunk_is_paged)
-		return;
-
-	/* Otherwise, it should be safe to call it */
-	nmi_enter();
 }
 
 static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
 					      struct interrupt_nmi_state *state)
 {
-	if (mfmsr() & MSR_DR) {
-		// nmi_exit if relocations are on
-		nmi_exit();
-	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-		   firmware_has_feature(FW_FEATURE_LPAR) &&
-		   !radix_enabled()) {
-		// no nmi_exit for a pseries hash guest taking a real mode exception
-	} else if (IS_ENABLED(CONFIG_KASAN)) {
-		// no nmi_exit for KASAN in real mode
-	} else if (percpu_first_chunk_is_paged) {
-		// no nmi_exit if percpu first chunk is not embedded
-	} else {
-		nmi_exit();
-	}
-
 	/*
 	 * nmi does not call nap_adjust_return because nmi should not create
 	 * new work to do (must use irq_work for that).
@@ -435,6 +396,8 @@ static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
 
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 {
+	kuap_lock();
+
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
@@ -467,11 +430,8 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 	} else
 #endif
 		kuap_assert_locked();
-
 	booke_restore_dbcr0();
-
 	account_cpu_user_entry();
-
 	account_stolen_time();
 
 	/*
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 77ff8e33f8cd..e2376de85370 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -66,433 +66,10 @@
 
 #ifndef __ASSEMBLER__
 
-#include <linux/context_tracking.h>
-#include <linux/hardirq.h>
 #include <linux/sched/debug.h> /* for show_regs */
+#include <linux/irq-entry-common.h>
 
-#include <asm/cputime.h>
-#include <asm/firmware.h>
-#include <asm/ftrace.h>
 #include <asm/kprobes.h>
-#include <asm/runlatch.h>
-
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-/*
- * WARN/BUG is handled with a program interrupt so minimise checks here to
- * avoid recursion and maximise the chance of getting the first oops handled.
- */
-#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
-do {									\
-	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
-		BUG_ON(cond);						\
-} while (0)
-#else
-#define INT_SOFT_MASK_BUG_ON(regs, cond)
-#endif
-
-#ifdef CONFIG_PPC_BOOK3S_64
-extern char __end_soft_masked[];
-bool search_kernel_soft_mask_table(unsigned long addr);
-unsigned long search_kernel_restart_table(unsigned long addr);
-
-DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
-
-static inline bool is_implicit_soft_masked(struct pt_regs *regs)
-{
-	if (user_mode(regs))
-		return false;
-
-	if (regs->nip >= (unsigned long)__end_soft_masked)
-		return false;
-
-	return search_kernel_soft_mask_table(regs->nip);
-}
-
-static inline void srr_regs_clobbered(void)
-{
-	local_paca->srr_valid = 0;
-	local_paca->hsrr_valid = 0;
-}
-#else
-static inline unsigned long search_kernel_restart_table(unsigned long addr)
-{
-	return 0;
-}
-
-static inline bool is_implicit_soft_masked(struct pt_regs *regs)
-{
-	return false;
-}
-
-static inline void srr_regs_clobbered(void)
-{
-}
-#endif
-
-static inline void nap_adjust_return(struct pt_regs *regs)
-{
-#ifdef CONFIG_PPC_970_NAP
-	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
-		/* Can avoid a test-and-clear because NMIs do not call this */
-		clear_thread_local_flags(_TLF_NAPPING);
-		regs_set_return_ip(regs, (unsigned long)power4_idle_nap_return);
-	}
-#endif
-}
-
-static inline void booke_load_dbcr0(void)
-{
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	unsigned long dbcr0 = current->thread.debug.dbcr0;
-
-	if (likely(!(dbcr0 & DBCR0_IDM)))
-		return;
-
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	mtmsr(mfmsr() & ~MSR_DE);
-	if (IS_ENABLED(CONFIG_PPC32)) {
-		isync();
-		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
-	}
-	mtspr(SPRN_DBCR0, dbcr0);
-	mtspr(SPRN_DBSR, -1);
-#endif
-}
-
-static inline void booke_restore_dbcr0(void)
-{
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	unsigned long dbcr0 = current->thread.debug.dbcr0;
-
-	if (IS_ENABLED(CONFIG_PPC32) && unlikely(dbcr0 & DBCR0_IDM)) {
-		mtspr(SPRN_DBSR, -1);
-		mtspr(SPRN_DBCR0, global_dbcr0[smp_processor_id()]);
-	}
-#endif
-}
-
-static inline void check_return_regs_valid(struct pt_regs *regs)
-{
-#ifdef CONFIG_PPC_BOOK3S_64
-	unsigned long trap, srr0, srr1;
-	static bool warned;
-	u8 *validp;
-	char *h;
-
-	if (trap_is_scv(regs))
-		return;
-
-	trap = TRAP(regs);
-	// EE in HV mode sets HSRRs like 0xea0
-	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
-		trap = 0xea0;
-
-	switch (trap) {
-	case 0x980:
-	case INTERRUPT_H_DATA_STORAGE:
-	case 0xe20:
-	case 0xe40:
-	case INTERRUPT_HMI:
-	case 0xe80:
-	case 0xea0:
-	case INTERRUPT_H_FAC_UNAVAIL:
-	case 0x1200:
-	case 0x1500:
-	case 0x1600:
-	case 0x1800:
-		validp = &local_paca->hsrr_valid;
-		if (!READ_ONCE(*validp))
-			return;
-
-		srr0 = mfspr(SPRN_HSRR0);
-		srr1 = mfspr(SPRN_HSRR1);
-		h = "H";
-
-		break;
-	default:
-		validp = &local_paca->srr_valid;
-		if (!READ_ONCE(*validp))
-			return;
-
-		srr0 = mfspr(SPRN_SRR0);
-		srr1 = mfspr(SPRN_SRR1);
-		h = "";
-		break;
-	}
-
-	if (srr0 == regs->nip && srr1 == regs->msr)
-		return;
-
-	/*
-	 * A NMI / soft-NMI interrupt may have come in after we found
-	 * srr_valid and before the SRRs are loaded. The interrupt then
-	 * comes in and clobbers SRRs and clears srr_valid. Then we load
-	 * the SRRs here and test them above and find they don't match.
-	 *
-	 * Test validity again after that, to catch such false positives.
-	 *
-	 * This test in general will have some window for false negatives
-	 * and may not catch and fix all such cases if an NMI comes in
-	 * later and clobbers SRRs without clearing srr_valid, but hopefully
-	 * such things will get caught most of the time, statistically
-	 * enough to be able to get a warning out.
-	 */
-	if (!READ_ONCE(*validp))
-		return;
-
-	if (!data_race(warned)) {
-		data_race(warned = true);
-		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
-		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
-		show_regs(regs);
-	}
-
-	WRITE_ONCE(*validp, 0); /* fixup */
-#endif
-}
-
-static inline void interrupt_enter_prepare(struct pt_regs *regs)
-{
-#ifdef CONFIG_PPC64
-	irq_soft_mask_set(IRQS_ALL_DISABLED);
-
-	/*
-	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
-	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
-	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
-	 * soft-masked. The interrupt handler may later call
-	 * interrupt_cond_local_irq_enable() to achieve a regular process
-	 * context.
-	 */
-	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
-		INT_SOFT_MASK_BUG_ON(regs, !(regs->msr & MSR_EE));
-		__hard_irq_enable();
-	} else {
-		__hard_RI_enable();
-	}
-	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
-#endif
-
-	if (!regs_irqs_disabled(regs))
-		trace_hardirqs_off();
-
-	if (user_mode(regs)) {
-		kuap_lock();
-		CT_WARN_ON(ct_state() != CT_STATE_USER);
-		user_exit_irqoff();
-
-		account_cpu_user_entry();
-		account_stolen_time();
-	} else {
-		kuap_save_and_lock(regs);
-		/*
-		 * CT_WARN_ON comes here via program_check_exception,
-		 * so avoid recursion.
-		 */
-		if (TRAP(regs) != INTERRUPT_PROGRAM)
-			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
-				   ct_state() != CT_STATE_IDLE);
-		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
-		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
-				     search_kernel_restart_table(regs->nip));
-	}
-	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
-			     !(regs->msr & MSR_EE));
-
-	booke_restore_dbcr0();
-}
-
-/*
- * Care should be taken to note that interrupt_exit_prepare and
- * interrupt_async_exit_prepare do not necessarily return immediately to
- * regs context (e.g., if regs is usermode, we don't necessarily return to
- * user mode). Other interrupts might be taken between here and return,
- * context switch / preemption may occur in the exit path after this, or a
- * signal may be delivered, etc.
- *
- * The real interrupt exit code is platform specific, e.g.,
- * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
- *
- * However interrupt_nmi_exit_prepare does return directly to regs, because
- * NMIs do not do "exit work" or replay soft-masked interrupts.
- */
-static inline void interrupt_exit_prepare(struct pt_regs *regs)
-{
-}
-
-static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
-{
-#ifdef CONFIG_PPC64
-	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-#endif
-	interrupt_enter_prepare(regs);
-#ifdef CONFIG_PPC_BOOK3S_64
-	/*
-	 * RI=1 is set by interrupt_enter_prepare, so this thread flags access
-	 * has to come afterward (it can cause SLB faults).
-	 */
-	if (cpu_has_feature(CPU_FTR_CTRL) &&
-	    !test_thread_local_flags(_TLF_RUNLATCH))
-		__ppc64_runlatch_on();
-#endif
-	irq_enter();
-}
-
-static inline void interrupt_async_exit_prepare(struct pt_regs *regs)
-{
-	/*
-	 * Adjust at exit so the main handler sees the true NIA. This must
-	 * come before irq_exit() because irq_exit can enable interrupts, and
-	 * if another interrupt is taken before nap_adjust_return has run
-	 * here, then that interrupt would return directly to idle nap return.
-	 */
-	nap_adjust_return(regs);
-
-	irq_exit();
-	interrupt_exit_prepare(regs);
-}
-
-struct interrupt_nmi_state {
-#ifdef CONFIG_PPC64
-	u8 irq_soft_mask;
-	u8 irq_happened;
-	u8 ftrace_enabled;
-	u64 softe;
-#endif
-};
-
-static inline bool nmi_disables_ftrace(struct pt_regs *regs)
-{
-	/* Allow DEC and PMI to be traced when they are soft-NMI */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
-		if (TRAP(regs) == INTERRUPT_DECREMENTER)
-		       return false;
-		if (TRAP(regs) == INTERRUPT_PERFMON)
-		       return false;
-	}
-	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
-		if (TRAP(regs) == INTERRUPT_PERFMON)
-			return false;
-	}
-
-	return true;
-}
-
-static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
-{
-#ifdef CONFIG_PPC64
-	state->irq_soft_mask = local_paca->irq_soft_mask;
-	state->irq_happened = local_paca->irq_happened;
-	state->softe = regs->softe;
-
-	/*
-	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
-	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
-	 * because that goes through irq tracing which we don't want in NMI.
-	 */
-	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
-	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
-		/*
-		 * Adjust regs->softe to be soft-masked if it had not been
-		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
-		 * not yet set disabled), or if it was in an implicit soft
-		 * masked state. This makes regs_irqs_disabled(regs)
-		 * behave as expected.
-		 */
-		regs->softe = IRQS_ALL_DISABLED;
-	}
-
-	__hard_RI_enable();
-
-	/* Don't do any per-CPU operations until interrupt state is fixed */
-
-	if (nmi_disables_ftrace(regs)) {
-		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
-		this_cpu_set_ftrace_enabled(0);
-	}
-#endif
-
-	/* If data relocations are enabled, it's safe to use nmi_enter() */
-	if (mfmsr() & MSR_DR) {
-		nmi_enter();
-		return;
-	}
-
-	/*
-	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
-	 * NMI because not everything it touches is within the RMA limit.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-	    firmware_has_feature(FW_FEATURE_LPAR) &&
-	    !radix_enabled())
-		return;
-
-	/*
-	 * Likewise, don't use it if we have some form of instrumentation (like
-	 * KASAN shadow) that is not safe to access in real mode (even on radix)
-	 */
-	if (IS_ENABLED(CONFIG_KASAN))
-		return;
-
-	/*
-	 * Likewise, do not use it in real mode if percpu first chunk is not
-	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
-	 * are chances where percpu allocation can come from vmalloc area.
-	 */
-	if (percpu_first_chunk_is_paged)
-		return;
-
-	/* Otherwise, it should be safe to call it */
-	nmi_enter();
-}
-
-static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
-{
-	if (mfmsr() & MSR_DR) {
-		// nmi_exit if relocations are on
-		nmi_exit();
-	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-		   firmware_has_feature(FW_FEATURE_LPAR) &&
-		   !radix_enabled()) {
-		// no nmi_exit for a pseries hash guest taking a real mode exception
-	} else if (IS_ENABLED(CONFIG_KASAN)) {
-		// no nmi_exit for KASAN in real mode
-	} else if (percpu_first_chunk_is_paged) {
-		// no nmi_exit if percpu first chunk is not embedded
-	} else {
-		nmi_exit();
-	}
-
-	/*
-	 * nmi does not call nap_adjust_return because nmi should not create
-	 * new work to do (must use irq_work for that).
-	 */
-
-#ifdef CONFIG_PPC64
-#ifdef CONFIG_PPC_BOOK3S
-	if (regs_irqs_disabled(regs)) {
-		unsigned long rst = search_kernel_restart_table(regs->nip);
-		if (rst)
-			regs_set_return_ip(regs, rst);
-	}
-#endif
-
-	if (nmi_disables_ftrace(regs))
-		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
-
-	/* Check we didn't change the pending interrupt mask. */
-	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
-	regs->softe = state->softe;
-	local_paca->irq_happened = state->irq_happened;
-	local_paca->irq_soft_mask = state->irq_soft_mask;
-#endif
-}
 
 /*
  * Don't use noinstr here like x86, but rather add NOKPROBE_SYMBOL to each
@@ -574,11 +151,14 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
-	interrupt_enter_prepare(regs);					\
-									\
+	irqentry_state_t state;						\
+	arch_interrupt_enter_prepare(regs);				\
+	state = irqentry_enter(regs);					\
+	instrumentation_begin();					\
 	____##func (regs);						\
-									\
-	interrupt_exit_prepare(regs);					\
+	instrumentation_end();						\
+	arch_interrupt_exit_prepare(regs);				\
+	irqentry_exit(regs, state);					\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
@@ -608,12 +188,15 @@ static __always_inline long ____##func(struct pt_regs *regs);		\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
+	irqentry_state_t state;						\
 									\
-	interrupt_enter_prepare(regs);					\
-									\
+	arch_interrupt_enter_prepare(regs);				\
+	state = irqentry_enter(regs);					\
+	instrumentation_begin();					\
 	ret = ____##func (regs);					\
-									\
-	interrupt_exit_prepare(regs);					\
+	instrumentation_end();						\
+	arch_interrupt_exit_prepare(regs);				\
+	irqentry_exit(regs, state);					\
 									\
 	return ret;							\
 }									\
@@ -642,11 +225,16 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
-	interrupt_async_enter_prepare(regs);				\
-									\
+	irqentry_state_t state;						\
+	arch_interrupt_async_enter_prepare(regs);			\
+	state = irqentry_enter(regs);					\
+	instrumentation_begin();					\
+	irq_enter_rcu();						\
 	____##func (regs);						\
-									\
-	interrupt_async_exit_prepare(regs);				\
+	irq_exit_rcu();							\
+	instrumentation_end();						\
+	arch_interrupt_async_exit_prepare(regs);			\
+	irqentry_exit(regs, state);					\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
@@ -676,14 +264,43 @@ ____##func(struct pt_regs *regs);					\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
-	struct interrupt_nmi_state state;				\
+	irqentry_state_t state;						\
+	struct interrupt_nmi_state nmi_state;				\
 	long ret;							\
 									\
-	interrupt_nmi_enter_prepare(regs, &state);			\
-									\
+	arch_interrupt_nmi_enter_prepare(regs, &nmi_state);		\
+	if (mfmsr() & MSR_DR) {						\
+		/* nmi_entry if relocations are on */			\
+		state = irqentry_nmi_enter(regs);			\
+	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&			\
+		   firmware_has_feature(FW_FEATURE_LPAR) &&		\
+		   !radix_enabled()) {					\
+		/* no nmi_entry for a pseries hash guest		\
+		 * taking a real mode exception */			\
+	} else if (IS_ENABLED(CONFIG_KASAN)) {				\
+		/* no nmi_entry for KASAN in real mode */		\
+	} else if (percpu_first_chunk_is_paged) {			\
+		/* no nmi_entry if percpu first chunk is not embedded */\
+	} else {							\
+		state = irqentry_nmi_enter(regs);			\
+	}								\
 	ret = ____##func (regs);					\
-									\
-	interrupt_nmi_exit_prepare(regs, &state);			\
+	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
+	if (mfmsr() & MSR_DR) {						\
+		/* nmi_exit if relocations are on */			\
+		irqentry_nmi_exit(regs, state);				\
+	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&			\
+		   firmware_has_feature(FW_FEATURE_LPAR) &&		\
+		   !radix_enabled()) {					\
+		/* no nmi_exit for a pseries hash guest			\
+		 * taking a real mode exception */			\
+	} else if (IS_ENABLED(CONFIG_KASAN)) {				\
+		/* no nmi_exit for KASAN in real mode */		\
+	} else if (percpu_first_chunk_is_paged) {			\
+		/* no nmi_exit if percpu first chunk is not embedded */	\
+	} else {							\
+		irqentry_nmi_exit(regs, state);				\
+	}								\
 									\
 	return ret;							\
 }									\
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f53d432f6087..7f67f0b9d627 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -24,10 +24,6 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
-#if defined(CONFIG_PREEMPT_DYNAMIC)
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
@@ -297,13 +293,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (need_irq_preemption()) {
-			/* Return to preemptible kernel context */
-			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
-				if (preempt_count() == 0)
-					preempt_schedule_irq();
-			}
-		}
+		if (need_irq_preemption())
+			irqentry_exit_cond_resched();
 
 		check_return_regs_valid(regs);
 
-- 
2.52.0


