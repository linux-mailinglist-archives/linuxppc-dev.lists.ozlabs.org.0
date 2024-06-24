Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0D9149D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:29:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Eu8s0zVa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76j11njkz3cQL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Eu8s0zVa;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76fm5QKzz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:27:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719232049;
	bh=9z90SzhL5hUyV+ctrEXEkg6d608kqT56rYasEtyrWUs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Eu8s0zVa2M8yOXJEf5NA6lLlKeSwC/lbyp88/ef6rkh1iOJcs7uNX4OKGRZYfGmKP
	 8cd+yrkKGFJqvUtYk0RSt2v560oTTtSVKhpyd1YYoZoTbgu1Hm3WL/s5LtY9mwwcdW
	 LC0x+uScwQwgYLteA9zMVf1E9sJGrEp/wKHSiHbAYTPY1NgSeA9sYoIcZuBXO7eemk
	 BMIF8r5jIB3g9DBPUXMu5zlOP+Z9XdXhYh3Vt0zbIXLNekfe92hOWRr+Ra0ILsgSkv
	 XZIhOy19n6zsiAwwfrD0WLWrLWz44LOebGuXdFFqyW1BTwzyloXTFi0Bw724fZ7Tyu
	 3RdG1fkFAfcXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W76fn41mxz4wx6;
	Mon, 24 Jun 2024 22:27:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
Date: Mon, 24 Jun 2024 22:27:22 +1000
Message-ID: <20240624122723.134292-6-mpe@ellerman.id.au>
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

Replace 4xx usage with 44x, and replace 4xx_SOC with 44x.

Also, as pointed out by Christophe, if 44x || BOOKE can be simplified to
just test BOOKE, because 44x always selects BOOKE.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig                   | 5 +----
 arch/powerpc/include/asm/cacheflush.h  | 2 +-
 arch/powerpc/include/asm/ppc_asm.h     | 2 +-
 arch/powerpc/kernel/entry_32.S         | 6 ++----
 arch/powerpc/kernel/process.c          | 2 +-
 arch/powerpc/mm/fault.c                | 4 ++--
 arch/powerpc/mm/ptdump/Makefile        | 2 +-
 arch/powerpc/platforms/4xx/Makefile    | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 8 +-------
 arch/powerpc/sysdev/Kconfig            | 4 ++--
 10 files changed, 13 insertions(+), 24 deletions(-)

v2: Rebase, and convert 44x || BOOKE cases.

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 16d625c71dfa..f8891fbe7c16 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -490,7 +490,7 @@ source "kernel/Kconfig.hz"
 
 config MATH_EMULATION
 	bool "Math emulation"
-	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
+	depends on 44x || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
 	select PPC_FPU_REGS
 	help
 	  Some PowerPC chips designed for embedded applications do not have
@@ -1108,9 +1108,6 @@ config PPC4xx_CPM
 	  It also enables support for two different idle states (idle-wait
 	  and idle-doze).
 
-config 4xx_SOC
-	bool
-
 config FSL_LBC
 	bool "Freescale Local Bus support"
 	help
diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index ef7d2de33b89..f2656774aaa9 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -121,7 +121,7 @@ static inline void invalidate_dcache_range(unsigned long start,
 	mb();	/* sync */
 }
 
-#ifdef CONFIG_4xx
+#ifdef CONFIG_44x
 static inline void flush_instruction_cache(void)
 {
 	iccci((void *)KERNELBASE);
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 1d1018c1e482..02897f4b0dbf 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -482,7 +482,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  * and they must be used.
  */
 
-#if !defined(CONFIG_4xx) && !defined(CONFIG_PPC_8xx)
+#if !defined(CONFIG_44x) && !defined(CONFIG_PPC_8xx)
 #define tlbia					\
 	li	r4,1024;			\
 	mtctr	r4;				\
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1522164b10e4..f4a8c9877249 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -211,7 +211,7 @@ start_kernel_thread:
 
 	.globl	fast_exception_return
 fast_exception_return:
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 	andi.	r10,r9,MSR_RI		/* check for recoverable interrupt */
 	beq	3f			/* if not, we've got problems */
 #endif
@@ -365,7 +365,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	rfi
 _ASM_NOKPROBE_SYMBOL(interrupt_return)
 
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 
 /*
  * Returning from a critical interrupt in user mode doesn't need
@@ -444,7 +444,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 #define RESTORE_MMU_REGS
 #endif
 
-#ifdef CONFIG_BOOKE
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
 	RESTORE_xSRR(SRR0,SRR1);
@@ -469,4 +468,3 @@ ret_from_mcheck_exc:
 	RET_FROM_EXC_LEVEL(SPRN_MCSRR0, SPRN_MCSRR1, PPC_RFMCI)
 _ASM_NOKPROBE_SYMBOL(ret_from_mcheck_exc)
 #endif /* CONFIG_BOOKE */
-#endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 0e96bd38570c..3b506d4c55f3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1573,7 +1573,7 @@ static void __show_regs(struct pt_regs *regs)
 	if (trap == INTERRUPT_MACHINE_CHECK ||
 	    trap == INTERRUPT_DATA_STORAGE ||
 	    trap == INTERRUPT_ALIGNMENT) {
-		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
+		if (IS_ENABLED(CONFIG_BOOKE))
 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dear, regs->esr);
 		else
 			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 215690452495..81c77ddce2e3 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -368,13 +368,13 @@ static void sanity_check_fault(bool is_write, bool is_user,
  * Define the correct "is_write" bit in error_code based
  * on the processor family
  */
-#if (defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifdef CONFIG_BOOKE
 #define page_fault_is_write(__err)	((__err) & ESR_DST)
 #else
 #define page_fault_is_write(__err)	((__err) & DSISR_ISSTORE)
 #endif
 
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 #define page_fault_is_bad(__err)	(0)
 #elif defined(CONFIG_PPC_8xx)
 #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
index dc896d2874f3..0f7a050f327e 100644
--- a/arch/powerpc/mm/ptdump/Makefile
+++ b/arch/powerpc/mm/ptdump/Makefile
@@ -2,7 +2,7 @@
 
 obj-y	+= ptdump.o
 
-obj-$(CONFIG_4xx)		+= shared.o
+obj-$(CONFIG_44x)		+= shared.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_E500)		+= shared.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= shared.o
diff --git a/arch/powerpc/platforms/4xx/Makefile b/arch/powerpc/platforms/4xx/Makefile
index 2071a0abe09b..7f57c35f8dec 100644
--- a/arch/powerpc/platforms/4xx/Makefile
+++ b/arch/powerpc/platforms/4xx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y				+= uic.o machine_check.o
-obj-$(CONFIG_4xx_SOC)		+= soc.o
+obj-$(CONFIG_44x)		+= soc.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 55337628bf92..ce1ff72dc537 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -47,7 +47,6 @@ config 44x
 	bool "AMCC 44x, 46x or 47x"
 	select PPC_DCR_NATIVE
 	select PPC_UDBG_16550
-	select 4xx_SOC
 	select HAVE_PCI
 	select PHYS_64BIT
 	select PPC_KUEP
@@ -325,11 +324,6 @@ config FSL_EMB_PERF_EVENT_E500
 	depends on FSL_EMB_PERF_EVENT && PPC_E500
 	default y
 
-config 4xx
-	bool
-	depends on 44x
-	default y
-
 config BOOKE
 	bool
 	depends on PPC_E500 || 44x
@@ -564,7 +558,7 @@ config NR_CPUS
 
 config NOT_COHERENT_CACHE
 	bool
-	depends on 4xx || PPC_8xx || PPC_MPC512x || \
+	depends on 44x || PPC_8xx || PPC_MPC512x || \
 		GAMECUBE_COMMON || AMIGAONE
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
index 5aa92ff3622d..18ff2c4a814a 100644
--- a/arch/powerpc/sysdev/Kconfig
+++ b/arch/powerpc/sysdev/Kconfig
@@ -5,12 +5,12 @@
 
 config PPC4xx_PCI_EXPRESS
 	bool
-	depends on PCI && 4xx
+	depends on PCI && 44x
 
 config PPC4xx_HSTA_MSI
 	bool
 	depends on PCI_MSI
-	depends on PCI && 4xx
+	depends on PCI && 44x
 
 config PPC_MSI_BITMAP
 	bool
-- 
2.45.2

