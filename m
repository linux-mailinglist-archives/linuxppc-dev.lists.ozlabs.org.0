Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62A52B69B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L37y63mg7z3cNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=R+sSg56V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37wt13P3z3bwH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:08:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=R+sSg56V; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L37ws3R7Fz4xbd; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L37ws3HjDz4xZ2; Wed, 18 May 2022 20:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652868509;
 bh=LhpA1ngdlaQMT9fTA2e2iAO48sfLPS0NK4Rb245fylU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+sSg56VGlM1Ov5OtSQE+Zz3SAHtrU3ZcoSGk3FRldQe3wCF7r2clA2hLP4shjcrO
 a0kvKQAtjedddc+7JK5P3MB/qSzyhOub+3LuLcFCfAknBtS/nAIZ0EMChVptKQd5Q+
 UkGrZjhnaNLd87Bfp5gs3iucP71E2pLZdA/J8K8G9vTmYfsAcO+eFyv5wEE82h3P+2
 AOQSbedm3fhGGXB2Qn2hcPZIP3ugfqNSYQ1DwsOJZ+HtWE4107E8cbyPXln3MWQ7tV
 m0MpFQFWInSELNvbhWnUT4ESL3Ce8gxcinw5CVJSDD/BqKoDVBipRiszkeVG+ajjXf
 uTvpswFUJUyRA==
Date: Wed, 18 May 2022 20:06:17 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 4/6] powerpc/kasan: Don't instrument non-maskable or raw
 interrupts
Message-ID: <YoTFGaKM8Pd46PIK@cleo>
References: <YoTEb2BaH3MDkH+2@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Disable address sanitization for raw and non-maskable interrupt
handlers, because they can run in real mode, where we cannot access
the shadow memory.  (Note that kasan_arch_is_ready() doesn't test for
real mode, since it is a static branch for speed, and in any case not
all the entry points to the generic KASAN code are protected by
kasan_arch_is_ready guards.)

The changes to interrupt_nmi_enter/exit_prepare() look larger than
they actually are.  The changes are equivalent to adding
!IS_ENABLED(CONFIG_KASAN) to the conditions for calling nmi_enter() or
nmi_exit() in real mode.  That is, the code is equivalent to using the
following condition for calling nmi_enter/exit:

	if (((!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
			!firmware_has_feature(FW_FEATURE_LPAR) ||
			radix_enabled()) &&
		    !IS_ENABLED(CONFIG_KASAN) ||
		(mfmsr() & MSR_DR))

That unwieldy condition has been split into several statements with
comments, for easier reading.

The nmi_ipi_lock functions that call atomic functions (i.e.,
nmi_ipi_lock_start(), nmi_ipi_lock() and nmi_ipi_unlock()), besides
being marked noinstr, now call arch_atomic_* functions instead of
atomic_* functions because with KASAN enabled, the atomic_* functions
are wrappers which explicitly do address sanitization on their
arguments.  Since we are trying to avoid address sanitization, we have
to use the lower-level arch_atomic_* versions.

In hv_nmi_check_nonrecoverable(), the regs_set_unrecoverable() call
has been open-coded so as to avoid having to either trust the inlining
or mark regs_set_unrecoverable() as noinstr.

[paulus@ozlabs.org: combined a few work-in-progress commits of
 Daniel's and wrote the commit message.]

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/interrupt.h | 52 +++++++++++++++++++++-------
 arch/powerpc/kernel/smp.c            | 22 ++++++------
 arch/powerpc/kernel/traps.c          |  6 ++--
 arch/powerpc/lib/Makefile            |  3 ++
 arch/powerpc/platforms/powernv/smp.c |  2 +-
 5 files changed, 59 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc28f46d2f9d..fb244b6ca7f0 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -327,22 +327,46 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	}
 #endif
 
+	/* If data relocations are enabled, it's safe to use nmi_enter() */
+	if (mfmsr() & MSR_DR) {
+		nmi_enter();
+		return;
+	}
+
 	/*
-	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
+	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
 	 * NMI because not everything it touches is within the RMA limit.
 	 */
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
-			!firmware_has_feature(FW_FEATURE_LPAR) ||
-			radix_enabled() || (mfmsr() & MSR_DR))
-		nmi_enter();
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+	    firmware_has_feature(FW_FEATURE_LPAR) &&
+	    !radix_enabled())
+		return;
+
+	/*
+	 * Likewise, don't use it if we have some form of instrumentation (like
+	 * KASAN shadow) that is not safe to access in real mode (even on radix)
+	 */
+	if (IS_ENABLED(CONFIG_KASAN))
+		return;
+
+	/* Otherwise, it should be safe to call it */
+	nmi_enter();
 }
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
-			!firmware_has_feature(FW_FEATURE_LPAR) ||
-			radix_enabled() || (mfmsr() & MSR_DR))
+	if (mfmsr() & MSR_DR) {
+		// nmi_exit if relocations are on
 		nmi_exit();
+	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+		   firmware_has_feature(FW_FEATURE_LPAR) &&
+		   !radix_enabled()) {
+		// no nmi_exit for a pseries hash guest taking a real mode exception
+	} else if (IS_ENABLED(CONFIG_KASAN)) {
+		// no nmi_exit for KASAN in real mode
+	} else {
+		nmi_exit();
+	}
 
 	/*
 	 * nmi does not call nap_adjust_return because nmi should not create
@@ -410,7 +434,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
  * Specific handlers may have additional restrictions.
  */
 #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
-static __always_inline long ____##func(struct pt_regs *regs);		\
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs);					\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
@@ -424,7 +449,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
-static __always_inline long ____##func(struct pt_regs *regs)
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs)
 
 /**
  * DECLARE_INTERRUPT_HANDLER - Declare synchronous interrupt handler function
@@ -549,7 +575,8 @@ static __always_inline void ____##func(struct pt_regs *regs)
  * body with a pair of curly brackets.
  */
 #define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
-static __always_inline long ____##func(struct pt_regs *regs);		\
+static __always_inline __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs);					\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
@@ -566,7 +593,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
-static __always_inline long ____##func(struct pt_regs *regs)
+static __always_inline  __no_sanitize_address __no_kcsan long		\
+____##func(struct pt_regs *regs)
 
 
 /* Interrupt handlers */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b7fd6a72aa76..5fedadc27952 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -413,32 +413,32 @@ static struct cpumask nmi_ipi_pending_mask;
 static bool nmi_ipi_busy = false;
 static void (*nmi_ipi_function)(struct pt_regs *) = NULL;
 
-static void nmi_ipi_lock_start(unsigned long *flags)
+noinstr static void nmi_ipi_lock_start(unsigned long *flags)
 {
 	raw_local_irq_save(*flags);
 	hard_irq_disable();
-	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
+	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
 		raw_local_irq_restore(*flags);
-		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
+		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
 		raw_local_irq_save(*flags);
 		hard_irq_disable();
 	}
 }
 
-static void nmi_ipi_lock(void)
+noinstr static void nmi_ipi_lock(void)
 {
-	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
-		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
+	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
+		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
 }
 
-static void nmi_ipi_unlock(void)
+noinstr static void nmi_ipi_unlock(void)
 {
 	smp_mb();
-	WARN_ON(atomic_read(&__nmi_ipi_lock) != 1);
-	atomic_set(&__nmi_ipi_lock, 0);
+	WARN_ON(arch_atomic_read(&__nmi_ipi_lock) != 1);
+	arch_atomic_set(&__nmi_ipi_lock, 0);
 }
 
-static void nmi_ipi_unlock_end(unsigned long *flags)
+noinstr static void nmi_ipi_unlock_end(unsigned long *flags)
 {
 	nmi_ipi_unlock();
 	raw_local_irq_restore(*flags);
@@ -447,7 +447,7 @@ static void nmi_ipi_unlock_end(unsigned long *flags)
 /*
  * Platform NMI handler calls this to ack
  */
-int smp_handle_nmi_ipi(struct pt_regs *regs)
+noinstr int smp_handle_nmi_ipi(struct pt_regs *regs)
 {
 	void (*fn)(struct pt_regs *) = NULL;
 	unsigned long flags;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a08bb7cefdc5..3aaa50e5c72f 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -393,7 +393,7 @@ void _exception(int signr, struct pt_regs *regs, int code, unsigned long addr)
  * Builds that do not support KVM could take this second option to increase
  * the recoverability of NMIs.
  */
-void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
+noinstr void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_POWERNV
 	unsigned long kbase = (unsigned long)_stext;
@@ -433,7 +433,9 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	return;
 
 nonrecoverable:
-	regs_set_unrecoverable(regs);
+	regs->msr &= ~MSR_RI;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 #endif
 }
 DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 5d1881d2e39a..8560c912186d 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -13,6 +13,9 @@ CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
 
 KASAN_SANITIZE_code-patching.o := n
 KASAN_SANITIZE_feature-fixups.o := n
+# restart_table.o contains functions called in the NMI interrupt path
+# which can be in real mode. Disable KASAN.
+KASAN_SANITIZE_restart_table.o := n
 
 ifdef CONFIG_KASAN
 CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index cbb67813cd5d..9e1a25398f98 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -345,7 +345,7 @@ static void __init pnv_smp_probe(void)
 	}
 }
 
-static int pnv_system_reset_exception(struct pt_regs *regs)
+noinstr static int pnv_system_reset_exception(struct pt_regs *regs)
 {
 	if (smp_handle_nmi_ipi(regs))
 		return 1;
-- 
2.35.3

