Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B5198C65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:36:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s03K6DM3zDr8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=cTRngNRJ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rznv3NcCzDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:24:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rznq1TR0z9v0KH;
 Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cTRngNRJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XqSunprEEBns; Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rznq0LSSz9v0KC;
 Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585635887; bh=a+rydWCh9pn98MSeGCVoXQz+TAyLPsryyIR1ae0aULI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cTRngNRJMvTSxdHijMd4vOp3TopcCKl8/P/KOERm/B7CDUNuIbtDYOBduf0CTc4tJ
 bGNIjt2RLbaEnKafnEGBdXV9RIMA9+pPpvCj3sp2Ko0s3/Oc8JssJQ9xIq+cfl2UbN
 qMy+oWBGS6JAY1JrNCydCdkUwux1R2cZMtJt5Hb0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CDDD88B784;
 Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xyfMMNd4cOoU; Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D3038B752;
 Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6CF1665674; Tue, 31 Mar 2020 06:24:47 +0000 (UTC)
Message-Id: <f8541c115b65b511a77d19a4b70700e63d882ca1.1585635837.git.christophe.leroy@c-s.fr>
In-Reply-To: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
References: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 07/10] powerpc/4xx: Remove CONFIG_4xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Mar 2020 06:24:47 +0000 (UTC)
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

CONFIG_4xx was corresponding to CONFIG_40x | CONFIG_44x.

As CONFIG_40x is gone, CONFIG_4xx and CONFIG_44x are now equivalent.
And CONFIG_BOOKE is also set when CONFIG_44x is set.

Replace (CONFIG_4xx | CONFIG_BOOKE) by CONFIG_BOOKE
Replace other CONFIG_4xx by CONFIG_44x
Remove CONFIG_4xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig                   |  2 +-
 arch/powerpc/Makefile                  |  2 +-
 arch/powerpc/include/asm/ppc_asm.h     |  2 +-
 arch/powerpc/kernel/asm-offsets.c      |  2 +-
 arch/powerpc/kernel/entry_32.S         | 16 ++++++++--------
 arch/powerpc/kernel/misc_32.S          |  4 ++--
 arch/powerpc/kernel/process.c          |  2 +-
 arch/powerpc/mm/fault.c                |  2 +-
 arch/powerpc/mm/ptdump/Makefile        |  2 +-
 arch/powerpc/platforms/Kconfig.cputype |  7 +------
 arch/powerpc/platforms/Makefile        |  3 +--
 arch/powerpc/sysdev/Kconfig            |  6 +++---
 arch/powerpc/xmon/xmon.c               |  2 +-
 13 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d84844e07d6e..5a83a7559afd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -407,7 +407,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 
 config MATH_EMULATION
 	bool "Math emulation"
-	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
+	depends on PPC_8xx || PPC_MPC832x || BOOKE
 	help
 	  Some PowerPC chips designed for embedded applications do not have
 	  a floating-point unit and therefore do not implement the
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 76e13d1c3fec..6d85a066b145 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -248,7 +248,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
 # often slow when they are implemented at all
 KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 
-cpu-as-$(CONFIG_4xx)		+= -Wa,-m405
+cpu-as-$(CONFIG_44x)		+= -Wa,-m405
 cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
 cpu-as-$(CONFIG_E200)		+= -Wa,-me200
 cpu-as-$(CONFIG_E500)		+= -Wa,-me500
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 4a4345bec441..e97a5ecc15e9 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -434,7 +434,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  * and they must be used.
  */
 
-#if !defined(CONFIG_4xx) && !defined(CONFIG_PPC_8xx)
+#if !defined(CONFIG_44x) && !defined(CONFIG_PPC_8xx)
 #define tlbia					\
 	li	r4,1024;			\
 	mtctr	r4;				\
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 9f92ba40ba8b..63c3b69a590b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -152,7 +152,7 @@ int main(void)
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	OFFSET(THREAD_DBCR0, thread_struct, debug.dbcr0);
 #endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1fa899aa0399..cae0bdc013e5 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -401,7 +401,7 @@ syscall_exit_cont:
 	lwz	r3,GPR3(r1)
 1:
 #endif /* CONFIG_TRACE_IRQFLAGS */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	/* If the process has its own DBCR0 value, load it up.  The internal
 	   debug mode bit tells us that dbcr0 should be loaded. */
 	lwz	r0,THREAD+THREAD_DBCR0(r2)
@@ -554,7 +554,7 @@ syscall_exit_work:
 ret_from_kernel_syscall:
 	mfspr	r9, SPRN_SRR0
 	mfspr	r10, SPRN_SRR1
-#if !defined(CONFIG_4xx) && !defined(CONFIG_BOOKE)
+#ifndef CONFIG_BOOKE
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR|MSR_DR))
 	mtmsr	r11
 #endif
@@ -749,7 +749,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 
 	.globl	fast_exception_return
 fast_exception_return:
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 	andi.	r10,r9,MSR_RI		/* check for recoverable interrupt */
 	beq	1f			/* if not, we've got problems */
 #endif
@@ -775,7 +775,7 @@ fast_exception_return:
 	SYNC
 	RFI
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 /* check if the exception happened in a restartable section */
 1:	lis	r3,exc_exit_restart_end@ha
 	addi	r3,r3,exc_exit_restart_end@l
@@ -847,7 +847,7 @@ user_exc_return:		/* r10 contains MSR_KERNEL here */
 	bne	do_work
 
 restore_user:
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 	/* Check whether this process has its own DBCR0 value.  The internal
 	   debug mode bit tells us that dbcr0 should be loaded. */
 	lwz	r0,THREAD+THREAD_DBCR0(r2)
@@ -974,7 +974,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	stwcx.	r0,0,r1			/* to clear the reservation */
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
+#ifndef CONFIG_BOOKE
 	andi.	r10,r9,MSR_RI		/* check if this exception occurred */
 	beql	nonrecoverable		/* at a bad place (MSR:RI = 0) */
 
@@ -1010,7 +1010,7 @@ exc_exit_restart_end:
 	SYNC
 	RFI
 
-#else /* !(CONFIG_4xx || CONFIG_BOOKE) */
+#else /* !CONFIG_BOOKE */
 	/*
 	 * This is a bit different on 4xx/Book-E because it doesn't have
 	 * the RI bit in the MSR.
@@ -1187,7 +1187,7 @@ load_dbcr0:
 global_dbcr0:
 	.space	8*NR_CPUS
 	.previous
-#endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
+#endif /* !CONFIG_BOOKE */
 
 do_work:			/* r10 contains MSR_KERNEL here */
 	andi.	r0,r9,_TIF_NEED_RESCHED
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index db5ab092b36b..e9bdf6c36c18 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -234,7 +234,7 @@ _GLOBAL(_nmask_and_or_msr)
  */
 #ifndef CONFIG_PPC_8xx
 _GLOBAL(flush_instruction_cache)
-#if defined(CONFIG_4xx)
+#ifdef CONFIG_44x
 	lis	r3, KERNELBASE@h
 	iccci	0,r3
 #elif defined(CONFIG_FSL_BOOKE)
@@ -256,7 +256,7 @@ _GLOBAL(flush_instruction_cache)
 	mfspr	r3,SPRN_HID0
 	ori	r3,r3,HID0_ICFI
 	mtspr	SPRN_HID0,r3
-#endif /* CONFIG_4xx */
+#endif /* CONFIG_44x */
 	isync
 	blr
 EXPORT_SYMBOL(flush_instruction_cache)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 110db94cdf3c..30ecc827624b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1408,7 +1408,7 @@ void show_regs(struct pt_regs * regs)
 	if ((TRAP(regs) != 0xc00) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
 	if (trap == 0x200 || trap == 0x300 || trap == 0x600)
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE
 		pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
 #else
 		pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8db0507619e2..28e765de6933 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -402,7 +402,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
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
index 1055175cd026..08b0d12a0a9d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -240,11 +240,6 @@ config FSL_EMB_PERF_EVENT_E500
 	depends on FSL_EMB_PERF_EVENT && E500
 	default y
 
-config 4xx
-	bool
-	depends on 44x
-	default y
-
 config BOOKE
 	bool
 	depends on E200 || E500 || 44x || PPC_BOOK3E
@@ -464,7 +459,7 @@ config NR_CPUS
 
 config NOT_COHERENT_CACHE
 	bool
-	depends on 4xx || PPC_8xx || E200 || PPC_MPC512x || \
+	depends on 44x || PPC_8xx || E200 || PPC_MPC512x || \
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
index ea303b7e4e29..ef1f11e3f816 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -477,7 +477,7 @@ static inline void release_output_lock(void) {}
 
 static inline int unrecoverable_excp(struct pt_regs *regs)
 {
-#if defined(CONFIG_4xx) || defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_44x) || defined(CONFIG_PPC_BOOK3E)
 	/* We have no MSR_RI bit on 4xx or Book3e, so we simply return false */
 	return 0;
 #else
-- 
2.25.0

