Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463069149CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:28:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SToKp7Lz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76gS66VYz3cX6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SToKp7Lz;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76fm0fPVz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:27:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719232049;
	bh=FROEVf3UpXcDdrq+Kfh4EUYIgWJ07k/D0WBereELIuY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SToKp7LzJ2VSbmBufDakqRTJmT2U3zbAc17iQr1aVZa9kH0jQX3wpT30sfitf+DJQ
	 3qnwlW6XGbxiTgP+YQ+JSxLabCZ72UcIofsiO+E4jJzPt7jQaRkNrB3VTXkgglf1Ee
	 9k6kijv6QTv8VJH7TYDXTmnIOnFDeuPuFiXhOOWDmP2ZUdUvL+LlISSMIFOx/zxRXv
	 1k02lg7dcTETOG7OCz9Oxw4lM3rZnbE1ci9kK0+y/P0qFwXz+EgnZqk2QyCjLL/aVi
	 wIOUd6MG1hFHXK2vUQCjQUWGHE6hGmFFeeXNaxXoBD6lYYsTit+BaqAcHW/yPgRYip
	 x9QgnZw5t1+kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W76fn0P76z4wqM;
	Mon, 24 Jun 2024 22:27:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 5/7] powerpc/4xx: Remove CONFIG_BOOKE_OR_40x
Date: Mon, 24 Jun 2024 22:27:21 +1000
Message-ID: <20240624122723.134292-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624122723.134292-1-mpe@ellerman.id.au>
References: <20240624122723.134292-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that 40x is gone, replace CONFIG_BOOKE_OR_40x by CONFIG_BOOKE.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/hw_irq.h      | 8 ++++----
 arch/powerpc/include/asm/irq.h         | 2 +-
 arch/powerpc/include/asm/kup.h         | 2 +-
 arch/powerpc/include/asm/processor.h   | 2 +-
 arch/powerpc/include/asm/ptrace.h      | 2 +-
 arch/powerpc/include/asm/reg.h         | 2 +-
 arch/powerpc/kernel/asm-offsets.c      | 2 +-
 arch/powerpc/kernel/entry_32.S         | 2 +-
 arch/powerpc/kernel/epapr_hcalls.S     | 2 +-
 arch/powerpc/kernel/irq.c              | 2 +-
 arch/powerpc/kernel/kgdb.c             | 4 ++--
 arch/powerpc/kernel/process.c          | 2 +-
 arch/powerpc/kernel/setup.h            | 2 +-
 arch/powerpc/kernel/setup_32.c         | 2 +-
 arch/powerpc/kernel/time.c             | 2 +-
 arch/powerpc/mm/mmu_context.c          | 2 +-
 arch/powerpc/mm/nohash/mmu_context.c   | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 5 -----
 18 files changed, 21 insertions(+), 26 deletions(-)

v2: Rebase only.

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 317659fdeacf..569ac1165b06 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -63,7 +63,7 @@
 
 static inline void __hard_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
+	if (IS_ENABLED(CONFIG_BOOKE))
 		wrtee(MSR_EE);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_EIE);
@@ -75,7 +75,7 @@ static inline void __hard_irq_enable(void)
 
 static inline void __hard_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
+	if (IS_ENABLED(CONFIG_BOOKE))
 		wrtee(0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_EID);
@@ -87,7 +87,7 @@ static inline void __hard_irq_disable(void)
 
 static inline void __hard_EE_RI_disable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
+	if (IS_ENABLED(CONFIG_BOOKE))
 		wrtee(0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_NRI);
@@ -99,7 +99,7 @@ static inline void __hard_EE_RI_disable(void)
 
 static inline void __hard_RI_enable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
+	if (IS_ENABLED(CONFIG_BOOKE))
 		return;
 
 	if (IS_ENABLED(CONFIG_PPC_8xx))
diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index ba1a5974e714..aa3751960ffd 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -33,7 +33,7 @@ extern int distribute_irqs;
 
 struct pt_regs;
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 /*
  * Per-cpu stacks for handling critical, debug and machine check
  * level interrupts.
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index ad7e8c5aec3f..2bb03d941e3e 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -20,7 +20,7 @@ static __always_inline bool kuap_is_disabled(void);
 #include <asm/nohash/32/kup-8xx.h>
 #endif
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 #include <asm/nohash/kup-booke.h>
 #endif
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index e44cac0da346..6b94de17201c 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -159,7 +159,7 @@ struct thread_struct {
 	unsigned long	sr0;
 #endif
 #endif /* CONFIG_PPC32 */
-#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+#if defined(CONFIG_BOOKE) && defined(CONFIG_PPC_KUAP)
 	unsigned long	pid;	/* value written in PID reg. at interrupt exit */
 #endif
 	/* Debug Registers */
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index ea8f91fbc62f..7b9350756875 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -310,7 +310,7 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 
 static inline bool cpu_has_msr_ri(void)
 {
-	return !IS_ENABLED(CONFIG_BOOKE_OR_40x);
+	return !IS_ENABLED(CONFIG_BOOKE);
 }
 
 static inline bool regs_is_unrecoverable(struct pt_regs *regs)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 76c1490f5c97..0228c90bbcc7 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -18,7 +18,7 @@
 #include <asm/feature-fixups.h>
 
 /* Pickup Book E specific registers. */
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 #include <asm/reg_booke.h>
 #endif
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index f029755f9e69..23733282de4d 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -54,7 +54,7 @@
 #endif
 
 #ifdef CONFIG_PPC32
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 #include "head_booke.h"
 #endif
 #endif
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 070eab8b6a28..1522164b10e4 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -108,7 +108,7 @@ transfer_to_syscall:
 	stw	r11, 0(r1)
 	mflr	r12
 	stw	r12, _LINK(r1)
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #endif
 	lis	r12,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
diff --git a/arch/powerpc/kernel/epapr_hcalls.S b/arch/powerpc/kernel/epapr_hcalls.S
index 1a9b5ae8ccb2..6a414ed5a411 100644
--- a/arch/powerpc/kernel/epapr_hcalls.S
+++ b/arch/powerpc/kernel/epapr_hcalls.S
@@ -21,7 +21,7 @@ _GLOBAL(epapr_ev_idle)
 	ori	r4, r4,_TLF_NAPPING	/* so when we take an exception */
 	PPC_STL	r4, TI_LOCAL_FLAGS(r2)	/* it will return to our caller */
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 	wrteei	1
 #else
 	mfmsr	r4
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 7504ceec5c58..2e1600a8bbbb 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -333,7 +333,7 @@ void __init init_IRQ(void)
 		static_call_update(ppc_get_irq, ppc_md.get_irq);
 }
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 void   *critirq_ctx[NR_CPUS] __read_mostly;
 void    *dbgirq_ctx[NR_CPUS] __read_mostly;
 void *mcheckirq_ctx[NR_CPUS] __read_mostly;
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index ebe4d1645ca1..7a8bc03a00af 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -45,7 +45,7 @@ static struct hard_trap_info
 	{ 0x0800, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x0900, 0x0e /* SIGALRM */ },		/* decrementer */
 	{ 0x0c00, 0x14 /* SIGCHLD */ },		/* system call */
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 	{ 0x2002, 0x05 /* SIGTRAP */ },		/* debug */
 #if defined(CONFIG_PPC_85xx)
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* spe unavailable */
@@ -64,7 +64,7 @@ static struct hard_trap_info
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x2020, 0x08 /* SIGFPE */  },		/* ap unavailable */
 #endif
-#else /* !CONFIG_BOOKE_OR_40x */
+#else /* !CONFIG_BOOKE */
 	{ 0x0d00, 0x05 /* SIGTRAP */ },		/* single-step */
 #if defined(CONFIG_PPC_8xx)
 	{ 0x1000, 0x04 /* SIGILL */  },		/* software emulation */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a7671786764b..0e96bd38570c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1875,7 +1875,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	p->thread.kuap = KUAP_NONE;
 #endif
-#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+#if defined(CONFIG_BOOKE) && defined(CONFIG_PPC_KUAP)
 	p->thread.pid = MMU_NO_CONTEXT;
 #endif
 
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 7912bb50a7cb..385a00a2e2ca 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -29,7 +29,7 @@ void setup_tlb_core_data(void);
 static inline void setup_tlb_core_data(void) { }
 #endif
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 void exc_lvl_early_init(void);
 #else
 static inline void exc_lvl_early_init(void) { }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index b761cc1a403c..e515c1f7d8d3 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -176,7 +176,7 @@ void __init emergency_stack_init(void)
 }
 #endif
 
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 void __init exc_lvl_early_init(void)
 {
 	unsigned int i, hw_cpu;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index c0fdc6d94fee..0ff9f038e800 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -695,7 +695,7 @@ static int __init get_freq(char *name, int cells, unsigned long *val)
 
 static void start_cpu_decrementer(void)
 {
-#ifdef CONFIG_BOOKE_OR_40x
+#ifdef CONFIG_BOOKE
 	unsigned int tcr;
 
 	/* Clear any pending timer interrupts */
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index b24c19078eb1..3e3af29b4523 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -21,7 +21,7 @@ static inline void switch_mm_pgdir(struct task_struct *tsk,
 #ifdef CONFIG_PPC_BOOK3S_32
 	tsk->thread.sr0 = mm->context.sr0;
 #endif
-#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+#if defined(CONFIG_BOOKE) && defined(CONFIG_PPC_KUAP)
 	tsk->thread.pid = mm->context.id;
 #endif
 }
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 92dc028aff1f..0b181da40ddb 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -303,7 +303,7 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	if (IS_ENABLED(CONFIG_BDI_SWITCH))
 		abatron_pteptrs[1] = next->pgd;
 	set_context(id, next->pgd);
-#if defined(CONFIG_BOOKE_OR_40x) && defined(CONFIG_PPC_KUAP)
+#if defined(CONFIG_BOOKE) && defined(CONFIG_PPC_KUAP)
 	tsk->thread.pid = id;
 #endif
 	raw_spin_unlock(&context_lock);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 2b686ee2dd2b..55337628bf92 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -335,11 +335,6 @@ config BOOKE
 	depends on PPC_E500 || 44x
 	default y
 
-config BOOKE_OR_40x
-	bool
-	depends on BOOKE
-	default y
-
 config PTE_64BIT
 	bool
 	depends on 44x || PPC_E500 || PPC_86xx
-- 
2.45.2

