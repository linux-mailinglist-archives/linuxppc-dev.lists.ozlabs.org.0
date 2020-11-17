Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C02B590B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 06:11:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZvDs5G2jzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 16:11:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZv8n6vZlzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 16:08:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CZv8Z3LHMz9vDG5;
 Tue, 17 Nov 2020 06:07:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UimQ37rJv1fw; Tue, 17 Nov 2020 06:07:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CZv8Z1rPsz9vDG4;
 Tue, 17 Nov 2020 06:07:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE68C8B773;
 Tue, 17 Nov 2020 06:07:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n7gyFqCF1dPH; Tue, 17 Nov 2020 06:07:58 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6690D8B75F;
 Tue, 17 Nov 2020 06:07:58 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5AE3866885; Tue, 17 Nov 2020 05:07:58 +0000 (UTC)
Message-Id: <34ebc3ba2c768d97f363bd5f2deea2356e9ae127.1605589460.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc: Retire e200 core (mpc555x processor)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 17 Nov 2020 05:07:58 +0000 (UTC)
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

There is no defconfig selecting CONFIG_E200, and no platform.

e200 is an earlier version of booke, a predecessor of e500,
with some particularities like an unified cache instead of both an
instruction cache and a data cache.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                     |  1 -
 arch/powerpc/include/asm/cputable.h       | 11 -----
 arch/powerpc/include/asm/mmu.h            |  2 +-
 arch/powerpc/include/asm/reg.h            |  5 --
 arch/powerpc/include/asm/reg_booke.h      | 12 -----
 arch/powerpc/kernel/cpu_setup_fsl_booke.S |  9 ----
 arch/powerpc/kernel/cputable.c            | 46 ------------------
 arch/powerpc/kernel/head_booke.h          |  3 +-
 arch/powerpc/kernel/head_fsl_booke.S      | 57 +----------------------
 arch/powerpc/kernel/setup_32.c            |  2 -
 arch/powerpc/kernel/traps.c               | 25 ----------
 arch/powerpc/mm/nohash/fsl_booke.c        | 12 ++---
 arch/powerpc/platforms/Kconfig.cputype    | 13 ++----
 13 files changed, 11 insertions(+), 187 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a4d56f0a41d9..16b8336f91dd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -248,7 +248,6 @@ KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 cpu-as-$(CONFIG_40x)		+= -Wa,-m405
 cpu-as-$(CONFIG_44x)		+= -Wa,-m440
 cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
-cpu-as-$(CONFIG_E200)		+= -Wa,-me200
 cpu-as-$(CONFIG_E500)		+= -Wa,-me500
 
 # When using '-many -mpower4' gas will first try and find a matching power4
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 3d2f94afc13a..7d815a3e7206 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -41,7 +41,6 @@ extern int machine_check_4xx(struct pt_regs *regs);
 extern int machine_check_440A(struct pt_regs *regs);
 extern int machine_check_e500mc(struct pt_regs *regs);
 extern int machine_check_e500(struct pt_regs *regs);
-extern int machine_check_e200(struct pt_regs *regs);
 extern int machine_check_47x(struct pt_regs *regs);
 int machine_check_8xx(struct pt_regs *regs);
 int machine_check_83xx(struct pt_regs *regs);
@@ -383,10 +382,6 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_440x6	(CPU_FTR_NODSISRALIGN | CPU_FTR_NOEXECUTE | \
 	    CPU_FTR_INDEXED_DCR)
 #define CPU_FTRS_47X	(CPU_FTRS_440x6)
-#define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
-	    CPU_FTR_NODSISRALIGN | CPU_FTR_COHERENT_ICACHE | \
-	    CPU_FTR_NOEXECUTE | \
-	    CPU_FTR_DEBUG_LVL_EXC)
 #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
 	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_NODSISRALIGN | \
 	    CPU_FTR_NOEXECUTE)
@@ -535,9 +530,6 @@ enum {
 #ifdef CONFIG_PPC_47x
 	    CPU_FTRS_47X | CPU_FTR_476_DD2 |
 #endif
-#ifdef CONFIG_E200
-	    CPU_FTRS_E200 |
-#endif
 #ifdef CONFIG_E500
 	    CPU_FTRS_E500 | CPU_FTRS_E500_2 |
 #endif
@@ -608,9 +600,6 @@ enum {
 #ifdef CONFIG_44x
 	    CPU_FTRS_44X & CPU_FTRS_440x6 &
 #endif
-#ifdef CONFIG_E200
-	    CPU_FTRS_E200 &
-#endif
 #ifdef CONFIG_E500
 	    CPU_FTRS_E500 & CPU_FTRS_E500_2 &
 #endif
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 255a1837e9f7..b724c38589a1 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -166,7 +166,7 @@ enum {
 #ifdef CONFIG_44x
 		MMU_FTR_TYPE_44x |
 #endif
-#if defined(CONFIG_E200) || defined(CONFIG_E500)
+#ifdef CONFIG_E500
 		MMU_FTR_TYPE_FSL_E | MMU_FTR_BIG_PHYS | MMU_FTR_USE_TLBILX |
 #endif
 #ifdef CONFIG_PPC_47x
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f877a576b338..3c81a6efaf23 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1232,14 +1232,9 @@
 #define SPRN_SPRG_WSCRATCH_MC	SPRN_SPRG1
 #define SPRN_SPRG_RSCRATCH4	SPRN_SPRG7R
 #define SPRN_SPRG_WSCRATCH4	SPRN_SPRG7W
-#ifdef CONFIG_E200
-#define SPRN_SPRG_RSCRATCH_DBG	SPRN_SPRG6R
-#define SPRN_SPRG_WSCRATCH_DBG	SPRN_SPRG6W
-#else
 #define SPRN_SPRG_RSCRATCH_DBG	SPRN_SPRG9
 #define SPRN_SPRG_WSCRATCH_DBG	SPRN_SPRG9
 #endif
-#endif
 
 #ifdef CONFIG_PPC_8xx
 #define SPRN_SPRG_SCRATCH0	SPRN_SPRG0
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index 29a948e0c0f2..262782f08fd4 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -281,18 +281,6 @@
 #define MSRP_PMMP	0x00000004 /* Protect MSR[PMM] */
 #endif
 
-#ifdef CONFIG_E200
-#define MCSR_MCP 	0x80000000UL /* Machine Check Input Pin */
-#define MCSR_CP_PERR 	0x20000000UL /* Cache Push Parity Error */
-#define MCSR_CPERR 	0x10000000UL /* Cache Parity Error */
-#define MCSR_EXCP_ERR 	0x08000000UL /* ISI, ITLB, or Bus Error on 1st insn
-					fetch for an exception handler */
-#define MCSR_BUS_IRERR 	0x00000010UL /* Read Bus Error on instruction fetch*/
-#define MCSR_BUS_DRERR 	0x00000008UL /* Read Bus Error on data load */
-#define MCSR_BUS_WRERR 	0x00000004UL /* Write Bus Error on buffered
-					store or cache line push */
-#endif
-
 /* Bit definitions for the HID1 */
 #ifdef CONFIG_E500
 /* e500v1/v2 */
diff --git a/arch/powerpc/kernel/cpu_setup_fsl_booke.S b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
index 1d308780e0d3..4bf33f1b4193 100644
--- a/arch/powerpc/kernel/cpu_setup_fsl_booke.S
+++ b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
@@ -108,15 +108,6 @@ _GLOBAL(__setup_cpu_e6500)
 #endif /* CONFIG_PPC_E500MC */
 
 #ifdef CONFIG_PPC32
-#ifdef CONFIG_E200
-_GLOBAL(__setup_cpu_e200)
-	/* enable dedicated debug exception handling resources (Debug APU) */
-	mfspr	r3,SPRN_HID0
-	ori	r3,r3,HID0_DAPUEN@l
-	mtspr	SPRN_HID0,r3
-	b	__setup_e200_ivors
-#endif /* CONFIG_E200 */
-
 #ifdef CONFIG_E500
 #ifndef CONFIG_PPC_E500MC
 _GLOBAL(__setup_cpu_e500v1)
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 29de58d4dfb7..38871c8a69e2 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -36,7 +36,6 @@ const char *powerpc_base_platform;
  * and ppc64
  */
 #ifdef CONFIG_PPC32
-extern void __setup_cpu_e200(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_e500v1(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_e500v2(unsigned long offset, struct cpu_spec* spec);
 extern void __setup_cpu_e500mc(unsigned long offset, struct cpu_spec* spec);
@@ -1893,51 +1892,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.platform		= "ppc440",
 	}
 #endif /* CONFIG_44x */
-#ifdef CONFIG_E200
-	{	/* e200z5 */
-		.pvr_mask		= 0xfff00000,
-		.pvr_value		= 0x81000000,
-		.cpu_name		= "e200z5",
-		/* xxx - galak: add CPU_FTR_MAYBE_CAN_DOZE */
-		.cpu_features		= CPU_FTRS_E200,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_EFP_SINGLE |
-			PPC_FEATURE_UNIFIED_CACHE,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_e200,
-		.platform		= "ppc5554",
-	},
-	{	/* e200z6 */
-		.pvr_mask		= 0xfff00000,
-		.pvr_value		= 0x81100000,
-		.cpu_name		= "e200z6",
-		/* xxx - galak: add CPU_FTR_MAYBE_CAN_DOZE */
-		.cpu_features		= CPU_FTRS_E200,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_SPE_COMP |
-			PPC_FEATURE_HAS_EFP_SINGLE_COMP |
-			PPC_FEATURE_UNIFIED_CACHE,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_e200,
-		.platform		= "ppc5554",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic E200 PPC)",
-		.cpu_features		= CPU_FTRS_E200,
-		.cpu_user_features	= COMMON_USER_BOOKE |
-			PPC_FEATURE_HAS_EFP_SINGLE |
-			PPC_FEATURE_UNIFIED_CACHE,
-		.mmu_features		= MMU_FTR_TYPE_FSL_E,
-		.dcache_bsize		= 32,
-		.cpu_setup		= __setup_cpu_e200,
-		.machine_check		= machine_check_e200,
-		.platform		= "ppc5554",
-	}
-#endif /* CONFIG_E200 */
 #endif /* CONFIG_PPC32 */
 #ifdef CONFIG_E500
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 71c359d438b5..2ffbe924ec83 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -185,7 +185,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
  *
  * On 40x critical is the only additional level
  * On 44x/e500 we have critical and machine check
- * On e200 we have critical and debug (machine check occurs via critical)
  *
  * Additionally we reserve a SPRG for each priority level so we can free up a
  * GPR to use as the base for indirect access to the exception stacks.  This
@@ -201,7 +200,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #define MC_STACK_BASE		mcheckirq_ctx
 #define CRIT_STACK_BASE		critirq_ctx
 
-/* only on e500mc/e200 */
+/* only on e500mc */
 #define DBG_STACK_BASE		dbgirq_ctx
 
 #define EXC_LVL_FRAME_OVERHEAD	(THREAD_SIZE - INT_FRAME_SIZE - EXC_LVL_SIZE)
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 586a6ac501e9..fdd4d274c245 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -187,9 +187,6 @@ set_ivor:
 
 	/* Setup the defaults for TLB entries */
 	li	r2,(MAS4_TSIZED(BOOK3E_PAGESZ_4K))@l
-#ifdef CONFIG_E200
-	oris	r2,r2,MAS4_TLBSELD(1)@h
-#endif
 	mtspr	SPRN_MAS4, r2
 
 #if !defined(CONFIG_BDI_SWITCH)
@@ -362,13 +359,7 @@ interrupt_base:
 	CRITICAL_EXCEPTION(0x0100, CRITICAL, CriticalInput, unknown_exception)
 
 	/* Machine Check Interrupt */
-#ifdef CONFIG_E200
-	/* no RFMCI, MCSRRs on E200 */
-	CRITICAL_EXCEPTION(0x0200, MACHINE_CHECK, MachineCheck, \
-			   machine_check_exception)
-#else
 	MCHECK_EXCEPTION(0x0200, MachineCheck, machine_check_exception)
-#endif
 
 	/* Data Storage Interrupt */
 	START_EXCEPTION(DataStorage)
@@ -399,15 +390,9 @@ interrupt_base:
 	/* Floating Point Unavailable Interrupt */
 #ifdef CONFIG_PPC_FPU
 	FP_UNAVAILABLE_EXCEPTION
-#else
-#ifdef CONFIG_E200
-	/* E200 treats 'normal' floating point instructions as FP Unavail exception */
-	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, \
-		  program_check_exception, EXC_XFER_STD)
 #else
 	EXCEPTION(0x0800, FP_UNAVAIL, FloatingPointUnavailable, \
 		  unknown_exception, EXC_XFER_STD)
-#endif
 #endif
 
 	/* System Call Interrupt */
@@ -625,7 +610,7 @@ END_BTB_FLUSH_SECTION
 	mfspr	r10, SPRN_SPRG_RSCRATCH0
 	b	InstructionStorage
 
-/* Define SPE handlers for e200 and e500v2 */
+/* Define SPE handlers for e500v2 */
 #ifdef CONFIG_SPE
 	/* SPE Unavailable */
 	START_EXCEPTION(SPEUnavailable)
@@ -807,31 +792,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_BIG_PHYS)
 #endif
 3:	mtspr	SPRN_MAS2, r12
 
-#ifdef CONFIG_E200
-	/* Round robin TLB1 entries assignment */
-	mfspr	r12, SPRN_MAS0
-
-	/* Extract TLB1CFG(NENTRY) */
-	mfspr	r11, SPRN_TLB1CFG
-	andi.	r11, r11, 0xfff
-
-	/* Extract MAS0(NV) */
-	andi.	r13, r12, 0xfff
-	addi	r13, r13, 1
-	cmpw	0, r13, r11
-	addi	r12, r12, 1
-
-	/* check if we need to wrap */
-	blt	7f
-
-	/* wrap back to first free tlbcam entry */
-	lis	r13, tlbcam_index@ha
-	lwz	r13, tlbcam_index@l(r13)
-	rlwimi	r12, r13, 0, 20, 31
-7:
-	mtspr	SPRN_MAS0,r12
-#endif /* CONFIG_E200 */
-
 tlb_write_entry:
 	tlbwe
 
@@ -933,21 +893,6 @@ get_phys_addr:
  * Global functions
  */
 
-#ifdef CONFIG_E200
-/* Adjust or setup IVORs for e200 */
-_GLOBAL(__setup_e200_ivors)
-	li	r3,DebugDebug@l
-	mtspr	SPRN_IVOR15,r3
-	li	r3,SPEUnavailable@l
-	mtspr	SPRN_IVOR32,r3
-	li	r3,SPEFloatingPointData@l
-	mtspr	SPRN_IVOR33,r3
-	li	r3,SPEFloatingPointRound@l
-	mtspr	SPRN_IVOR34,r3
-	sync
-	blr
-#endif
-
 #ifdef CONFIG_E500
 #ifndef CONFIG_PPC_E500MC
 /* Adjust or setup IVORs for e500v1/v2 */
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 057d6b8e9bb0..416e2c7a8b0a 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -223,6 +223,4 @@ __init void initialize_cache_info(void)
 	dcache_bsize = cur_cpu_spec->dcache_bsize;
 	icache_bsize = cur_cpu_spec->icache_bsize;
 	ucache_bsize = 0;
-	if (IS_ENABLED(CONFIG_E200))
-		ucache_bsize = icache_bsize = dcache_bsize;
 }
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 5006dcbe1d9f..129d2d72b336 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -757,31 +757,6 @@ int machine_check_generic(struct pt_regs *regs)
 {
 	return 0;
 }
-#elif defined(CONFIG_E200)
-int machine_check_e200(struct pt_regs *regs)
-{
-	unsigned long reason = mfspr(SPRN_MCSR);
-
-	printk("Machine check in kernel mode.\n");
-	printk("Caused by (from MCSR=%lx): ", reason);
-
-	if (reason & MCSR_MCP)
-		pr_cont("Machine Check Signal\n");
-	if (reason & MCSR_CP_PERR)
-		pr_cont("Cache Push Parity Error\n");
-	if (reason & MCSR_CPERR)
-		pr_cont("Cache Parity Error\n");
-	if (reason & MCSR_EXCP_ERR)
-		pr_cont("ISI, ITLB, or Bus Error on first instruction fetch for an exception handler\n");
-	if (reason & MCSR_BUS_IRERR)
-		pr_cont("Bus - Read Bus Error on instruction fetch\n");
-	if (reason & MCSR_BUS_DRERR)
-		pr_cont("Bus - Read Bus Error on data load\n");
-	if (reason & MCSR_BUS_WRERR)
-		pr_cont("Bus - Write Bus Error on buffered store or cache line push\n");
-
-	return 0;
-}
 #elif defined(CONFIG_PPC32)
 int machine_check_generic(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
index 36bda962d3b3..03dacbe940e5 100644
--- a/arch/powerpc/mm/nohash/fsl_booke.c
+++ b/arch/powerpc/mm/nohash/fsl_booke.c
@@ -223,15 +223,9 @@ void flush_instruction_cache(void)
 {
 	unsigned long tmp;
 
-	if (IS_ENABLED(CONFIG_E200)) {
-		tmp = mfspr(SPRN_L1CSR0);
-		tmp |= L1CSR0_CFI | L1CSR0_CLFC;
-		mtspr(SPRN_L1CSR0, tmp);
-	} else {
-		tmp = mfspr(SPRN_L1CSR1);
-		tmp |= L1CSR1_ICFI | L1CSR1_ICLFR;
-		mtspr(SPRN_L1CSR1, tmp);
-	}
+	tmp = mfspr(SPRN_L1CSR1);
+	tmp |= L1CSR1_ICFI | L1CSR1_ICLFR;
+	mtspr(SPRN_L1CSR1, tmp);
 	isync();
 }
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index c194c4ae8bc7..7d8526cd011e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -23,7 +23,7 @@ choice
 	  The most common ones are the desktop and server CPUs (603,
 	  604, 740, 750, 74xx) CPUs from Freescale and IBM, with their
 	  embedded 512x/52xx/82xx/83xx/86xx counterparts.
-	  The other embedded parts, namely 4xx, 8xx, e200 (55xx) and e500
+	  The other embedded parts, namely 4xx, 8xx and e500
 	  (85xx) each form a family of their own that is not compatible
 	  with the others.
 
@@ -66,9 +66,6 @@ config 44x
 	select HAVE_PCI
 	select PHYS_64BIT
 
-config E200
-	bool "Freescale e200"
-
 endchoice
 
 choice
@@ -247,12 +244,12 @@ config 4xx
 
 config BOOKE
 	bool
-	depends on E200 || E500 || 44x || PPC_BOOK3E
+	depends on E500 || 44x || PPC_BOOK3E
 	default y
 
 config FSL_BOOKE
 	bool
-	depends on (E200 || E500) && PPC32
+	depends on E500 && PPC32
 	default y
 
 # this is for common code between PPC32 & PPC64 FSL BOOKE
@@ -317,7 +314,7 @@ config VSX
 
 config SPE_POSSIBLE
 	def_bool y
-	depends on E200 || (E500 && !PPC_E500MC)
+	depends on E500 && !PPC_E500MC
 
 config SPE
 	bool "SPE Support"
@@ -464,7 +461,7 @@ config NR_CPUS
 
 config NOT_COHERENT_CACHE
 	bool
-	depends on 4xx || PPC_8xx || E200 || PPC_MPC512x || \
+	depends on 4xx || PPC_8xx || PPC_MPC512x || \
 		GAMECUBE_COMMON || AMIGAONE
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
-- 
2.25.0

