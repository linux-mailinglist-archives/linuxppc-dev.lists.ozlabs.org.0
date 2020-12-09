Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 924722D4326
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 14:27:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrdBw2LzJzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 00:27:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crchl0vXPzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 00:04:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Crchd0STjz9tx0L;
 Wed,  9 Dec 2020 14:04:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qLYKu9zIFoDq; Wed,  9 Dec 2020 14:04:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Crchc6NJjz9tx0J;
 Wed,  9 Dec 2020 14:04:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C5748B7F2;
 Wed,  9 Dec 2020 14:04:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Dyuyd4ThGwbD; Wed,  9 Dec 2020 14:04:49 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE4BF8B7EF;
 Wed,  9 Dec 2020 14:04:49 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 770B9606AF; Wed,  9 Dec 2020 13:04:49 +0000 (UTC)
Message-Id: <4b2148bb494688650cbe181a167b92e0e81a2a0a.1607519069.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8f378fb93b8b180501443056a4d791b8d8335339.1607519069.git.christophe.leroy@csgroup.eu>
References: <8f378fb93b8b180501443056a4d791b8d8335339.1607519069.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 4/5] powerpc/4xx: Remove CONFIG_4xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  9 Dec 2020 13:04:49 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

CONFIG_4xx was corresponding to CONFIG_40x | CONFIG_44x.

As CONFIG_40x is gone, CONFIG_4xx and CONFIG_44x are now equivalent.
And CONFIG_BOOKE is also set when CONFIG_44x is set.

Replace (CONFIG_4xx | CONFIG_BOOKE) by CONFIG_BOOKE
Replace other CONFIG_4xx by CONFIG_44x
Remove CONFIG_4xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                   |  2 +-
 arch/powerpc/Makefile                  |  1 -
 arch/powerpc/include/asm/ppc_asm.h     |  2 +-
 arch/powerpc/kernel/asm-offsets.c      |  2 +-
 arch/powerpc/kernel/entry_32.S         | 16 ++++++++--------
 arch/powerpc/kernel/process.c          |  2 +-
 arch/powerpc/mm/fault.c                |  2 +-
 arch/powerpc/mm/ptdump/Makefile        |  2 +-
 arch/powerpc/platforms/Kconfig.cputype |  7 +------
 arch/powerpc/platforms/Makefile        |  3 +--
 arch/powerpc/sysdev/Kconfig            |  6 +++---
 arch/powerpc/xmon/xmon.c               |  2 +-
 12 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e97fa9020951..1c0c912d9efa 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -425,7 +425,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 
 config MATH_EMULATION
 	bool "Math emulation"
-	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
+	depends on PPC_8xx || PPC_MPC832x || BOOKE
 	select PPC_FPU_REGS
 	help
 	  Some PowerPC chips designed for embedded applications do not have
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c799a88b867c..99df16694d39 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -245,7 +245,6 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 # often slow when they are implemented at all
 KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 
-cpu-as-$(CONFIG_40x)		+= -Wa,-m405
 cpu-as-$(CONFIG_44x)		+= -Wa,-m440
 cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
 cpu-as-$(CONFIG_E500)		+= -Wa,-me500
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index cfa814824285..f661a9dc2dd2 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -425,7 +425,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  * and they must be used.
  */
 
-#if !defined(CONFIG_4xx) && !defined(CONFIG_PPC_8xx)
+#if !defined(CONFIG_44x) && !defined(CONFIG_PPC_8xx)
 #define tlbia					\
 	li	r4,1024;			\
 	mtctr	r4;				\
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e5caefb72a69..4ae2acd54ea4 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -157,7 +157,7 @@ int main(void)
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	OFFSET(THREAD_DBCR0, thread_struct, debug.dbcr0);
 #endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index c203cc4a81c8..1de884143940 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -410,7 +410,7 @@ syscall_exit_cont:
 	lwz	r3,GPR3(r1)
 1:
 #endif /* CONFIG_TRACE_IRQFLAGS */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	/* If the process has its own DBCR0 value, load it up.  The internal
 	   debug mode bit tells us that dbcr0 should be loaded. */
 	lwz	r0,THREAD+THREAD_DBCR0(r2)
@@ -561,7 +561,7 @@ syscall_exit_work:
 ret_from_kernel_syscall:
 	mfspr	r9, SPRN_SRR0
 	mfspr	r10, SPRN_SRR1
-#if !defined(CONFIG_4xx) && !defined(CONFIG_BOOKE)
+#ifndef CONFIG_BOOKE
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR|MSR_DR))
 	mtmsr	r11
 #endif
@@ -756,7 +756,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 
 	.globl	fast_exception_return
 fast_exception_return:
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 	andi.	r10,r9,MSR_RI		/* check for recoverable interrupt */
 	beq	1f			/* if not, we've got problems */
 #endif
@@ -782,7 +782,7 @@ fast_exception_return:
 	rfi
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 /* check if the exception happened in a restartable section */
 1:	lis	r3,exc_exit_restart_end@ha
 	addi	r3,r3,exc_exit_restart_end@l
@@ -844,7 +844,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
 	bne	do_work
 
 restore_user:
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	/* Check whether this process has its own DBCR0 value.  The internal
 	   debug mode bit tells us that dbcr0 should be loaded. */
 	lwz	r0,THREAD+THREAD_DBCR0(r2)
@@ -968,7 +968,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	stwcx.	r0,0,r1			/* to clear the reservation */
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 	andi.	r10,r9,MSR_RI		/* check if this exception occurred */
 	beql	nonrecoverable		/* at a bad place (MSR:RI = 0) */
 
@@ -1004,7 +1004,7 @@ exc_exit_restart_end:
 _ASM_NOKPROBE_SYMBOL(exc_exit_restart)
 _ASM_NOKPROBE_SYMBOL(exc_exit_restart_end)
 
-#else /* !(CONFIG_4xx || CONFIG_BOOKE) */
+#else /* !CONFIG_BOOKE */
 	/*
 	 * This is a bit different on 4xx/Book-E because it doesn't have
 	 * the RI bit in the MSR.
@@ -1184,7 +1184,7 @@ load_dbcr0:
 global_dbcr0:
 	.space	8*NR_CPUS
 	.previous
-#endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
+#endif /* !CONFIG_BOOKE */
 
 do_work:			/* r10 contains MSR_KERNEL here */
 	andi.	r0,r9,_TIF_NEED_RESCHED
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 96bb10d00d9c..ff9ee4d72a4e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1477,7 +1477,7 @@ static void __show_regs(struct pt_regs *regs)
 	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
 	if (trap == 0x200 || trap == 0x300 || trap == 0x600) {
-		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
+		if (IS_ENABLED(CONFIG_BOOKE))
 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
 		else
 			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c91621df0c61..9ace4807c42f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -363,7 +363,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
  * Define the correct "is_write" bit in error_code based
  * on the processor family
  */
-#if (defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifdef CONFIG_BOOKE
 #define page_fault_is_write(__err)	((__err) & ESR_DST)
 #define page_fault_is_bad(__err)	(0)
 #else
diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
index 712762be3cb1..3cf759e639a1 100644
--- a/arch/powerpc/mm/ptdump/Makefile
+++ b/arch/powerpc/mm/ptdump/Makefile
@@ -2,7 +2,7 @@
 
 obj-y	+= ptdump.o
 
-obj-$(CONFIG_4xx)		+= shared.o
+obj-$(CONFIG_44x)		+= shared.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3E_MMU)	+= shared.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= shared.o bats.o segment_regs.o
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 150d0c704f6e..c74bdfabb0ab 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -241,11 +241,6 @@ config FSL_EMB_PERF_EVENT_E500
 	depends on FSL_EMB_PERF_EVENT && E500
 	default y
 
-config 4xx
-	bool
-	depends on 44x
-	default y
-
 config BOOKE
 	bool
 	depends on E500 || 44x || PPC_BOOK3E
@@ -470,7 +465,7 @@ config NR_CPUS
 
 config NOT_COHERENT_CACHE
 	bool
-	depends on 4xx || PPC_8xx || PPC_MPC512x || \
+	depends on 44x || PPC_8xx || PPC_MPC512x || \
 		GAMECUBE_COMMON || AMIGAONE
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index cae14326bc49..f67b7fabac4e 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -4,8 +4,7 @@ obj-$(CONFIG_FSL_ULI1575)	+= fsl_uli1575.o
 
 obj-$(CONFIG_PPC_PMAC)		+= powermac/
 obj-$(CONFIG_PPC_CHRP)		+= chrp/
-obj-$(CONFIG_4xx)		+= 4xx/
-obj-$(CONFIG_44x)		+= 44x/
+obj-$(CONFIG_44x)		+= 4xx/ 44x/
 obj-$(CONFIG_PPC_MPC512x)	+= 512x/
 obj-$(CONFIG_PPC_MPC52xx)	+= 52xx/
 obj-$(CONFIG_PPC_8xx)		+= 8xx/
diff --git a/arch/powerpc/sysdev/Kconfig b/arch/powerpc/sysdev/Kconfig
index 9ebcc1337560..7b3a0fc3eadf 100644
--- a/arch/powerpc/sysdev/Kconfig
+++ b/arch/powerpc/sysdev/Kconfig
@@ -5,17 +5,17 @@
 
 config PPC4xx_PCI_EXPRESS
 	bool
-	depends on PCI && 4xx
+	depends on PCI && 44x
 
 config PPC4xx_HSTA_MSI
 	bool
 	depends on PCI_MSI
-	depends on PCI && 4xx
+	depends on PCI && 44x
 
 config PPC4xx_MSI
 	bool
 	depends on PCI_MSI
-	depends on PCI && 4xx
+	depends on PCI && 44x
 
 config PPC_MSI_BITMAP
 	bool
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dcd817ca2edf..8445d6397824 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -473,7 +473,7 @@ static inline void release_output_lock(void) {}
 
 static inline int unrecoverable_excp(struct pt_regs *regs)
 {
-#if defined(CONFIG_4xx) || defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_44x) || defined(CONFIG_PPC_BOOK3E)
 	/* We have no MSR_RI bit on 4xx or Book3e, so we simply return false */
 	return 0;
 #else
-- 
2.25.0

