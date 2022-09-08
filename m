Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87635B250B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 19:43:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNmgF4VFRz3dsc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 03:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNmZm5chpz3chs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 03:39:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNmYt1Tj4z9smW;
	Thu,  8 Sep 2022 19:38:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIZvxFbUFS_c; Thu,  8 Sep 2022 19:38:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNmYg5KVxz9smK;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B0DF08B763;
	Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jHq6Q3XsG7ga; Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BACA98B798;
	Thu,  8 Sep 2022 19:38:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 288HcBDb3449169
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 19:38:11 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 288HcBu63449168;
	Thu, 8 Sep 2022 19:38:11 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 09/19] powerpc: Remove CONFIG_PPC_BOOK3E
Date: Thu,  8 Sep 2022 19:37:42 +0200
Message-Id: <ddcea353b7c0bd3151264eb7b6fb8a88109ad2d2.1662658653.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
References: <4e7e6259e5af0e0e171f19ee1f85ab5b2553723f.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662658668; l=22792; s=20211009; h=from:subject:message-id; bh=OUhkzILGmz9x5JmP0immgwc/z6tCf68FN6vBmSqN2TE=; b=UamOd2D3IgRGb0C99r8+Lcedkzoqp34inuymj1OUYO5F1PL3tEuNoVv1MhZDsFuwcN6DXfDLGdaR 3bBbG0k3B5NdbXoM/WOutBHzEEaa2YP737EkfYcTGCh9I1CfWT7X
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_BOOK3E is redundant with CONFIG_PPC_BOOK3E_64.

The later is more explicit about the fact that it's a 64 bits target.

Remove CONFIG_PPC_BOOK3E.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                      |  2 +-
 arch/powerpc/include/asm/cputable.h       |  4 +--
 arch/powerpc/include/asm/interrupt.h      |  2 +-
 arch/powerpc/include/asm/nohash/pgalloc.h |  2 +-
 arch/powerpc/include/asm/paca.h           |  8 ++---
 arch/powerpc/include/asm/ppc_asm.h        |  4 +--
 arch/powerpc/kernel/asm-offsets.c         |  6 ++--
 arch/powerpc/kernel/entry_64.S            |  6 ++--
 arch/powerpc/kernel/head_64.S             | 40 +++++++++++------------
 arch/powerpc/kernel/misc_64.S             |  6 ++--
 arch/powerpc/kernel/paca.c                |  6 ++--
 arch/powerpc/kernel/setup.h               |  2 +-
 arch/powerpc/kernel/setup_64.c            |  8 ++---
 arch/powerpc/kernel/vmlinux.lds.S         |  2 +-
 arch/powerpc/kexec/core_64.c              |  2 +-
 arch/powerpc/mm/mmu_decl.h                |  6 ++--
 arch/powerpc/mm/nohash/tlb_low.S          |  2 +-
 arch/powerpc/platforms/85xx/Kconfig       |  2 +-
 arch/powerpc/platforms/Kconfig.cputype    | 10 ++----
 arch/powerpc/xmon/xmon.c                  | 16 ++++-----
 20 files changed, 66 insertions(+), 70 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7fe522b0946b..94a614bb1581 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -548,7 +548,7 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 
 config KEXEC
 	bool "kexec system call"
-	depends on (PPC_BOOK3S || PPC_85xx || (44x && !SMP)) || PPC_BOOK3E
+	depends on (PPC_BOOK3S || PPC_85xx || (44x && !SMP)) || PPC_BOOK3E_64
 	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index ae8c3e13cfce..27875f0b7bc7 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -463,7 +463,7 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_COMPATIBLE	(CPU_FTR_PPCAS_ARCH_V2)
 
 #ifdef CONFIG_PPC64
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 #define CPU_FTRS_POSSIBLE	(CPU_FTRS_E6500 | CPU_FTRS_E5500)
 #else
 #ifdef CONFIG_CPU_LITTLE_ENDIAN
@@ -521,7 +521,7 @@ enum {
 #endif /* __powerpc64__ */
 
 #ifdef CONFIG_PPC64
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 #define CPU_FTRS_ALWAYS		(CPU_FTRS_E6500 & CPU_FTRS_E5500)
 #else
 
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8069dbc4b8d1..84a1cdc3204c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -281,7 +281,7 @@ static inline bool nmi_disables_ftrace(struct pt_regs *regs)
 		if (TRAP(regs) == INTERRUPT_PERFMON)
 		       return false;
 	}
-	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
 		if (TRAP(regs) == INTERRUPT_PERFMON)
 			return false;
 	}
diff --git a/arch/powerpc/include/asm/nohash/pgalloc.h b/arch/powerpc/include/asm/nohash/pgalloc.h
index 29c43665a753..4b62376318e1 100644
--- a/arch/powerpc/include/asm/nohash/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/pgalloc.h
@@ -15,7 +15,7 @@ static inline void tlb_flush_pgtable(struct mmu_gather *tlb,
 {
 
 }
-#endif /* !CONFIG_PPC_BOOK3E */
+#endif /* !CONFIG_PPC_BOOK3E_64 */
 
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 4d7aaab82702..14e5d23fcdd7 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -18,7 +18,7 @@
 #include <asm/lppaca.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 #include <asm/exception-64e.h>
 #else
 #include <asm/exception-64s.h>
@@ -127,7 +127,7 @@ struct paca_struct {
 #endif
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	u64 exgen[8] __aligned(0x40);
 	/* Keep pgd in the same cacheline as the start of extlb */
 	pgd_t *pgd __aligned(0x40); /* Current PGD */
@@ -151,7 +151,7 @@ struct paca_struct {
 	void *dbg_kstack;
 
 	struct tlb_core_data tcd;
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
@@ -168,7 +168,7 @@ struct paca_struct {
 #ifdef CONFIG_PPC64
 	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
 #endif
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 83c02f5a7f2a..55149a0384db 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -709,7 +709,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
  * kernel is built for.
  */
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 #define FIXUP_ENDIAN
 #else
 /*
@@ -749,7 +749,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	.long 0x2402004c; /* hrfid				*/ \
 191:
 
-#endif /* !CONFIG_PPC_BOOK3E */
+#endif /* !CONFIG_PPC_BOOK3E_64 */
 
 #endif /*  __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8c10f536e478..10ce03052a19 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -197,7 +197,7 @@ int main(void)
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	OFFSET(PACAPGD, paca_struct, pgd);
 	OFFSET(PACA_KERNELPGD, paca_struct, kernel_pgd);
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
@@ -213,7 +213,7 @@ int main(void)
 	OFFSET(TCD_ESEL_NEXT, tlb_core_data, esel_next);
 	OFFSET(TCD_ESEL_MAX, tlb_core_data, esel_max);
 	OFFSET(TCD_ESEL_FIRST, tlb_core_data, esel_first);
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	OFFSET(PACA_EXGEN, paca_struct, exgen);
@@ -248,7 +248,7 @@ int main(void)
 #ifdef CONFIG_PPC64
 	OFFSET(PACA_EXIT_SAVE_R1, paca_struct, exit_save_r1);
 #endif
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
 #endif
 	OFFSET(PACA_SPRG_VDSO, paca_struct, sprg_vdso);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 01ace4c56104..3e2e37e6ecab 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -292,16 +292,16 @@ _GLOBAL(enter_prom)
 
 	/* Prepare a 32-bit mode big endian MSR
 	 */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	rlwinm	r11,r11,0,1,31
 	mtsrr1	r11
 	rfi
-#else /* CONFIG_PPC_BOOK3E */
+#else /* CONFIG_PPC_BOOK3E_64 */
 	LOAD_REG_IMMEDIATE(r12, MSR_SF | MSR_LE)
 	andc	r11,r11,r12
 	mtsrr1	r11
 	RFI_TO_KERNEL
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 1:	/* Return from OF */
 	FIXUP_ENDIAN
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..da544ea0ce01 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -143,7 +143,7 @@ DEFINE_FIXED_SYMBOL(__run_at_load, first_256B)
 	.globl	__secondary_hold
 __secondary_hold:
 	FIXUP_ENDIAN
-#ifndef CONFIG_PPC_BOOK3E
+#ifndef CONFIG_PPC_BOOK3E_64
 	mfmsr	r24
 	ori	r24,r24,MSR_RI
 	mtmsrd	r24			/* RI on */
@@ -160,7 +160,7 @@ __secondary_hold:
 	sync
 
 	li	r26,0
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	tovirt(r26,r26)
 #endif
 	/* All secondary cpus wait here until told to start. */
@@ -169,7 +169,7 @@ __secondary_hold:
 	beq	100b
 
 #if defined(CONFIG_SMP) || defined(CONFIG_KEXEC_CORE)
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	tovirt(r12,r12)
 #endif
 	mtctr	r12
@@ -178,7 +178,7 @@ __secondary_hold:
 	 * it may be the case that other platforms have r4 right to
 	 * begin with, this gives us some safety in case it is not
 	 */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	mr	r4,r25
 #else
 	li	r4,0
@@ -214,7 +214,7 @@ USE_TEXT_SECTION()
 
 #include "interrupt_64.S"
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 /*
  * The booting_thread_hwid holds the thread id we want to boot in cpu
  * hotplug case. It is set by cpu hotplug code, and is invalid by default.
@@ -322,7 +322,7 @@ _GLOBAL(fsl_secondary_thread_init)
 	bl	book3e_secondary_thread_init
 	b	generic_secondary_common_init
 
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 /*
  * On pSeries and most other platforms, secondary processors spin
@@ -345,7 +345,7 @@ _GLOBAL(generic_secondary_smp_init)
 	bl	relative_toc
 	tovirt(r2,r2)
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	/* Book3E initialization */
 	mr	r3,r24
 	mr	r4,r25
@@ -417,7 +417,7 @@ generic_secondary_common_init:
 	b	kexec_wait		/* next kernel might do better	 */
 
 2:	SET_PACA(r13)
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	addi	r12,r13,PACA_EXTLB	/* and TLB exc frame in another  */
 	mtspr	SPRN_SPRG_TLB_EXFRAME,r12
 #endif
@@ -519,7 +519,7 @@ __start_initialization_multiplatform:
 	mr	r29,r9
 #endif
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	bl	start_initialization_book3e
 	b	__after_prom_start
 #else
@@ -540,7 +540,7 @@ __start_initialization_multiplatform:
 	/* Switch off MMU if not already off */
 	bl	__mmu_off
 	b	__after_prom_start
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 __REF
 __boot_from_prom:
@@ -587,11 +587,11 @@ __after_prom_start:
 	/* process relocations for the final address of the kernel */
 	lis	r25,PAGE_OFFSET@highest	/* compute virtual base of kernel */
 	sldi	r25,r25,32
-#if defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3E_64)
 	tovirt(r26,r26)		/* on booke, we already run at PAGE_OFFSET */
 #endif
 	lwz	r7,(FIXED_SYMBOL_ABS_ADDR(__run_at_load))(r26)
-#if defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3E_64)
 	tophys(r26,r26)
 #endif
 	cmplwi	cr0,r7,1	/* flagged to stay where we are ? */
@@ -599,7 +599,7 @@ __after_prom_start:
 	add	r25,r25,r26
 1:	mr	r3,r25
 	bl	relocate
-#if defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3E_64)
 	/* IVPR needs to be set after relocation. */
 	bl	init_core_book3e
 #endif
@@ -613,11 +613,11 @@ __after_prom_start:
  * Note: This process overwrites the OF exception vectors.
  */
 	li	r3,0			/* target addr */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	tovirt(r3,r3)		/* on booke, we already run at PAGE_OFFSET */
 #endif
 	mr.	r4,r26			/* In some cases the loader may  */
-#if defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3E_64)
 	tovirt(r4,r4)
 #endif
 	beq	9f			/* have already put us at zero */
@@ -630,14 +630,14 @@ __after_prom_start:
  * variable __run_at_load, if it is set the kernel is treated as relocatable
  * kernel, otherwise it will be moved to PHYSICAL_START
  */
-#if defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC_BOOK3E_64)
 	tovirt(r26,r26)		/* on booke, we already run at PAGE_OFFSET */
 #endif
 	lwz	r7,(FIXED_SYMBOL_ABS_ADDR(__run_at_load))(r26)
 	cmplwi	cr0,r7,1
 	bne	3f
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	LOAD_REG_ADDR(r5, __end_interrupts)
 	LOAD_REG_ADDR(r11, _stext)
 	sub	r5,r5,r11
@@ -871,10 +871,10 @@ _GLOBAL(start_secondary_resume)
  */
 enable_64b_mode:
 	mfmsr	r11			/* grab the current MSR */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	oris	r11,r11,0x8000		/* CM bit set, we'll set ICM later */
 	mtmsr	r11
-#else /* CONFIG_PPC_BOOK3E */
+#else /* CONFIG_PPC_BOOK3E_64 */
 	LOAD_REG_IMMEDIATE(r12, MSR_64BIT)
 	or	r11,r11,r12
 	mtmsrd	r11
@@ -940,7 +940,7 @@ start_here_multiplatform:
 	std	r29,8(r11);
 #endif
 
-#ifndef CONFIG_PPC_BOOK3E
+#ifndef CONFIG_PPC_BOOK3E_64
 	mfmsr	r6
 	ori	r6,r6,MSR_RI
 	mtmsrd	r6			/* RI on */
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index fd6d8d3a548e..36184cada00b 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -286,7 +286,7 @@ kexec_flag:
 
 
 #ifdef CONFIG_KEXEC_CORE
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 /*
  * BOOK3E has no real MMU mode, so we have to setup the initial TLB
  * for a core to identity map v:0 to p:0.  This current implementation
@@ -354,7 +354,7 @@ _GLOBAL(kexec_smp_wait)
  * don't overwrite r3 here, it is live for kexec_wait above.
  */
 real_mode:	/* assume normal blr return */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	/* Create an identity mapping. */
 	b	kexec_create_tlb
 #else
@@ -413,7 +413,7 @@ _GLOBAL(kexec_sequence)
 	lhz	r25,PACAHWCPUID(r13)	/* get our phys cpu from paca */
 
 	/* disable interrupts, we are overwriting kernel data next */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	wrteei	0
 #else
 	mfmsr	r3
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index ba593fd60124..e3f7471112ef 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -211,7 +211,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 #ifdef CONFIG_PPC_PSERIES
 	new_paca->lppaca_ptr = NULL;
 #endif
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	new_paca->kernel_pgd = swapper_pg_dir;
 #endif
 	new_paca->lock_token = 0x8000;
@@ -228,7 +228,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 	new_paca->slb_shadow_ptr = NULL;
 #endif
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	/* For now -- if we have threads this will be adjusted later */
 	new_paca->tcd_ptr = &new_paca->tcd;
 #endif
@@ -244,7 +244,7 @@ void setup_paca(struct paca_struct *new_paca)
 	/* Setup r13 */
 	local_paca = new_paca;
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	/* On Book3E, initialize the TLB miss exception frames */
 	mtspr(SPRN_SPRG_TLB_EXFRAME, local_paca->extlb);
 #else
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 93f22da12abe..7912bb50a7cb 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -23,7 +23,7 @@ void check_smt_enabled(void);
 static inline void check_smt_enabled(void) { }
 #endif
 
-#if defined(CONFIG_PPC_BOOK3E) && defined(CONFIG_SMP)
+#if defined(CONFIG_PPC_BOOK3E_64) && defined(CONFIG_SMP)
 void setup_tlb_core_data(void);
 #else
 static inline void setup_tlb_core_data(void) { }
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2b2d0b0fbb30..6434a3f6acb5 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -86,7 +86,7 @@ struct ppc64_caches ppc64_caches = {
 };
 EXPORT_SYMBOL_GPL(ppc64_caches);
 
-#if defined(CONFIG_PPC_BOOK3E) && defined(CONFIG_SMP)
+#if defined(CONFIG_PPC_BOOK3E_64) && defined(CONFIG_SMP)
 void __init setup_tlb_core_data(void)
 {
 	int cpu;
@@ -673,7 +673,7 @@ void __init initialize_cache_info(void)
  */
 __init u64 ppc64_bolted_size(void)
 {
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	/* Freescale BookE bolts the entire linear mapping */
 	/* XXX: BookE ppc64_rma_limit setup seems to disagree? */
 	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E))
@@ -723,7 +723,7 @@ void __init irqstack_early_init(void)
 	}
 }
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 void __init exc_lvl_early_init(void)
 {
 	unsigned int i;
@@ -825,7 +825,7 @@ void __init setup_per_cpu_areas(void)
 	/*
 	 * BookE and BookS radix are historical values and should be revisited.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
 		atom_size = SZ_1M;
 	} else if (radix_enabled()) {
 		atom_size = PAGE_SIZE;
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index fe22d940412f..8bb5f081ee31 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -67,7 +67,7 @@ SECTIONS
 	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {
 #ifdef CONFIG_PPC64
 		KEEP(*(.head.text.first_256B));
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 #else
 		KEEP(*(.head.text.real_vectors));
 		*(.head.text.real_trampolines);
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index c2bea9db1c1e..a79e28c91e2b 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -360,7 +360,7 @@ void default_machine_kexec(struct kimage *image)
 	 * the RMA. On BookE there is no real MMU off mode, so we have to
 	 * keep it enabled as well (but then we have bolted TLB entries).
 	 */
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	copy_with_mmu_off = false;
 #else
 	copy_with_mmu_off = radix_enabled() ||
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 3c799d7860f8..ff231c26fa5b 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -38,7 +38,7 @@ static inline void _tlbil_pid(unsigned int pid)
 #else /* CONFIG_40x || CONFIG_PPC_8xx */
 extern void _tlbil_all(void);
 extern void _tlbil_pid(unsigned int pid);
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 extern void _tlbil_pid_noind(unsigned int pid);
 #else
 #define _tlbil_pid_noind(pid)	_tlbil_pid(pid)
@@ -55,7 +55,7 @@ static inline void _tlbil_va(unsigned long address, unsigned int pid,
 	asm volatile ("tlbie %0; sync" : : "r" (address) : "memory");
 	trace_tlbie(0, 0, address, pid, 0, 0, 0);
 }
-#elif defined(CONFIG_PPC_BOOK3E)
+#elif defined(CONFIG_PPC_BOOK3E_64)
 extern void _tlbil_va(unsigned long address, unsigned int pid,
 		      unsigned int tsize, unsigned int ind);
 #else
@@ -67,7 +67,7 @@ static inline void _tlbil_va(unsigned long address, unsigned int pid,
 }
 #endif /* CONFIG_PPC_8xx */
 
-#if defined(CONFIG_PPC_BOOK3E) || defined(CONFIG_PPC_47x)
+#if defined(CONFIG_PPC_BOOK3E_64) || defined(CONFIG_PPC_47x)
 extern void _tlbivax_bcast(unsigned long address, unsigned int pid,
 			   unsigned int tsize, unsigned int ind);
 #else
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index d378031246ab..6914bc8e4ead 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -294,7 +294,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_TLBILX)
 	isync
 1:	wrtee	r10
 	blr
-#elif defined(CONFIG_PPC_BOOK3E)
+#elif defined(CONFIG_PPC_BOOK3E_64)
 /*
  * New Book3E (>= 2.06) implementation
  *
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index be16eba0f704..069628670a0c 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig FSL_SOC_BOOKE
 	bool "Freescale Book-E Machine Type"
-	depends on PPC_85xx || PPC_BOOK3E
+	depends on PPC_85xx || PPC_BOOK3E_64
 	select FSL_SOC
 	select PPC_UDBG_16550
 	select MPIC
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 11780074eb23..d63b6386a974 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -257,10 +257,6 @@ config PPC_BOOK3S
 	def_bool y
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
 
-config PPC_BOOK3E
-	def_bool y
-	depends on PPC_BOOK3E_64
-
 config E500
 	select FSL_EMB_PERFMON
 	select PPC_FSL_BOOK3E
@@ -316,7 +312,7 @@ config 4xx
 
 config BOOKE
 	bool
-	depends on E500 || 44x || PPC_BOOK3E
+	depends on E500 || 44x || PPC_BOOK3E_64
 	default y
 
 config BOOKE_OR_40x
@@ -480,7 +476,7 @@ config PPC_MMU_NOHASH
 
 config PPC_BOOK3E_MMU
 	def_bool y
-	depends on PPC_85xx || PPC_BOOK3E
+	depends on PPC_85xx || PPC_BOOK3E_64
 
 config PPC_HAVE_PMU_SUPPORT
 	bool
@@ -503,7 +499,7 @@ config FORCE_SMP
 	select SMP
 
 config SMP
-	depends on PPC_BOOK3S || PPC_BOOK3E || PPC_85xx || PPC_47x
+	depends on PPC_BOOK3S || PPC_BOOK3E_64 || PPC_85xx || PPC_47x
 	select GENERIC_IRQ_MIGRATION
 	bool "Symmetric multi-processing support" if !FORCE_SMP
 	help
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 26ef3388c24c..e6d678d27b0f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -195,7 +195,7 @@ static int do_spu_cmd(void);
 #ifdef CONFIG_44x
 static void dump_tlb_44x(void);
 #endif
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 static void dump_tlb_book3e(void);
 #endif
 
@@ -288,11 +288,11 @@ Commands:\n\
   t	print backtrace\n\
   x	exit monitor and recover\n\
   X	exit monitor and don't recover\n"
-#if defined(CONFIG_PPC64) && !defined(CONFIG_PPC_BOOK3E)
+#if defined(CONFIG_PPC64) && !defined(CONFIG_PPC_BOOK3E_64)
 "  u	dump segment table or SLB\n"
 #elif defined(CONFIG_PPC_BOOK3S_32)
 "  u	dump segment registers\n"
-#elif defined(CONFIG_44x) || defined(CONFIG_PPC_BOOK3E)
+#elif defined(CONFIG_44x) || defined(CONFIG_PPC_BOOK3E_64)
 "  u	dump TLB\n"
 #endif
 "  U	show uptime information\n"
@@ -1166,7 +1166,7 @@ cmds(struct pt_regs *excp)
 		case 'u':
 			dump_tlb_44x();
 			break;
-#elif defined(CONFIG_PPC_BOOK3E)
+#elif defined(CONFIG_PPC_BOOK3E_64)
 		case 'u':
 			dump_tlb_book3e();
 			break;
@@ -2686,7 +2686,7 @@ static void dump_one_paca(int cpu)
 	DUMP(p, rfi_flush_fallback_area, "%-*px");
 #endif
 	DUMP(p, dscr_default, "%#-*llx");
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	DUMP(p, pgd, "%-*px");
 	DUMP(p, kernel_pgd, "%-*px");
 	DUMP(p, tcd_ptr, "%-*px");
@@ -2701,7 +2701,7 @@ static void dump_one_paca(int cpu)
 	DUMP(p, canary, "%#-*lx");
 #endif
 	DUMP(p, saved_r1, "%#-*llx");
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 	DUMP(p, trap_save, "%#-*x");
 #endif
 	DUMP(p, irq_soft_mask, "%#-*x");
@@ -3823,7 +3823,7 @@ static void dump_tlb_44x(void)
 }
 #endif /* CONFIG_44x */
 
-#ifdef CONFIG_PPC_BOOK3E
+#ifdef CONFIG_PPC_BOOK3E_64
 static void dump_tlb_book3e(void)
 {
 	u32 mmucfg, pidmask, lpidmask;
@@ -3965,7 +3965,7 @@ static void dump_tlb_book3e(void)
 		}
 	}
 }
-#endif /* CONFIG_PPC_BOOK3E */
+#endif /* CONFIG_PPC_BOOK3E_64 */
 
 static void xmon_init(int enable)
 {
-- 
2.37.1

