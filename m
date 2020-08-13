Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F811243DBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:53:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSCM81Y2mzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 02:53:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSBzc3htlzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 02:36:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSBzT25S4z9vCyL;
 Thu, 13 Aug 2020 18:36:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dw4bfvH8BGbZ; Thu, 13 Aug 2020 18:36:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSBzT1HKlz9vCyK;
 Thu, 13 Aug 2020 18:36:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D61A58B7A6;
 Thu, 13 Aug 2020 18:36:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mec3xZjbXGo5; Thu, 13 Aug 2020 18:36:38 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 396158B7A1;
 Thu, 13 Aug 2020 18:36:38 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BDDA965C8D; Thu, 13 Aug 2020 16:36:37 +0000 (UTC)
Message-Id: <021e538bd4d30336f588313d5710247c2af6b5dc.1597336548.git.christophe.leroy@csgroup.eu>
In-Reply-To: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
References: <11a330af231af22874c006302a945388846f8112.1597336548.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 6/9] powerpc: Remove support for PowerPC 601
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 13 Aug 2020 16:36:37 +0000 (UTC)
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

PowerPC 601 has been retired.

Remove all associated specific code.

CPU_FTRS_PPC601 has CPU_FTR_COHERENT_ICACHE and CPU_FTR_COMMON.

CPU_FTR_COMMON is already present via other CPU_FTRS.
None of the remaining CPU selects CPU_FTR_COHERENT_ICACHE.

So CPU_FTRS_PPC601 can be removed from the possible features,
hence can be removed completely.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/boot/util.S                | 15 +------
 arch/powerpc/include/asm/cputable.h     | 12 ++---
 arch/powerpc/include/asm/ppc_asm.h      |  3 +-
 arch/powerpc/include/asm/ptrace.h       |  4 --
 arch/powerpc/include/asm/time.h         |  2 +-
 arch/powerpc/include/asm/timex.h        |  3 --
 arch/powerpc/kernel/btext.c             |  8 +---
 arch/powerpc/kernel/entry_32.S          | 18 --------
 arch/powerpc/kernel/head_32.S           | 44 ++----------------
 arch/powerpc/kernel/setup_32.c          |  2 +-
 arch/powerpc/kernel/traps.c             |  4 --
 arch/powerpc/kernel/vdso32/datapage.S   |  2 -
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  2 -
 arch/powerpc/mm/book3s32/mmu.c          | 39 +++-------------
 arch/powerpc/mm/ptdump/bats.c           | 59 -------------------------
 arch/powerpc/platforms/powermac/setup.c |  2 +-
 arch/powerpc/platforms/powermac/smp.c   |  4 --
 17 files changed, 17 insertions(+), 206 deletions(-)

diff --git a/arch/powerpc/boot/util.S b/arch/powerpc/boot/util.S
index f11f0589a669..d03cdb7606dc 100644
--- a/arch/powerpc/boot/util.S
+++ b/arch/powerpc/boot/util.S
@@ -18,7 +18,7 @@
 
 	.text
 
-/* udelay (on non-601 processors) needs to know the period of the
+/* udelay needs to know the period of the
  * timebase in nanoseconds.  This used to be hardcoded to be 60ns
  * (period of 66MHz/4).  Now a variable is used that is initialized to
  * 60 for backward compatibility, but it can be overridden as necessary
@@ -37,19 +37,6 @@ timebase_period_ns:
  */
 	.globl	udelay
 udelay:
-	mfspr	r4,SPRN_PVR
-	srwi	r4,r4,16
-	cmpwi	0,r4,1		/* 601 ? */
-	bne	.Ludelay_not_601
-00:	li	r0,86	/* Instructions / microsecond? */
-	mtctr	r0
-10:	addi	r0,r0,0 /* NOP */
-	bdnz	10b
-	subic.	r3,r3,1
-	bne	00b
-	blr
-
-.Ludelay_not_601:
 	mulli	r4,r3,1000	/* nanoseconds */
 	/*  Change r4 to be the number of ticks using:
 	 *	(nanoseconds + (timebase_period_ns - 1 )) / timebase_period_ns
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index fdddb822d564..76ce0ffd8af0 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -294,8 +294,6 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTR_MAYBE_CAN_NAP	0
 #endif
 
-#define CPU_FTRS_PPC601	(CPU_FTR_COMMON | \
-	CPU_FTR_COHERENT_ICACHE)
 #define CPU_FTRS_603	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | \
 	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_604	(CPU_FTR_COMMON | CPU_FTR_PPC_LE)
@@ -511,10 +509,8 @@ static inline void cpu_feature_keys_init(void) { }
 #else
 enum {
 	CPU_FTRS_POSSIBLE =
-#ifdef CONFIG_PPC_BOOK3S_601
-	    CPU_FTRS_PPC601 |
-#elif defined(CONFIG_PPC_BOOK3S_32)
-	    CPU_FTRS_PPC601 | CPU_FTRS_603 | CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
+#ifdef CONFIG_PPC_BOOK3S_32
+	    CPU_FTRS_603 | CPU_FTRS_604 | CPU_FTRS_740_NOTAU |
 	    CPU_FTRS_740 | CPU_FTRS_750 | CPU_FTRS_750FX1 |
 	    CPU_FTRS_750FX2 | CPU_FTRS_750FX | CPU_FTRS_750GX |
 	    CPU_FTRS_7400_NOTAU | CPU_FTRS_7400 | CPU_FTRS_7450_20 |
@@ -589,9 +585,7 @@ enum {
 #else
 enum {
 	CPU_FTRS_ALWAYS =
-#ifdef CONFIG_PPC_BOOK3S_601
-	    CPU_FTRS_PPC601 &
-#elif defined(CONFIG_PPC_BOOK3S_32)
+#ifdef CONFIG_PPC_BOOK3S_32
 	    CPU_FTRS_603 & CPU_FTRS_604 & CPU_FTRS_740_NOTAU &
 	    CPU_FTRS_740 & CPU_FTRS_750 & CPU_FTRS_750FX1 &
 	    CPU_FTRS_750FX2 & CPU_FTRS_750FX & CPU_FTRS_750GX &
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 67a421b81a50..511786f0e40d 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -401,8 +401,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define MFTBU(dest)			mfspr dest, SPRN_TBRU
 #endif
 
-/* tlbsync is not implemented on 601 */
-#if !defined(CONFIG_SMP) || defined(CONFIG_PPC_BOOK3S_601)
+#ifndef CONFIG_SMP
 #define TLBSYNC
 #else
 #define TLBSYNC		tlbsync; sync
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 155a197c0aa1..e2c778c176a3 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -243,11 +243,7 @@ static inline void set_trap_norestart(struct pt_regs *regs)
 }
 
 #define arch_has_single_step()	(1)
-#ifndef CONFIG_PPC_BOOK3S_601
 #define arch_has_block_step()	(true)
-#else
-#define arch_has_block_step()	(false)
-#endif
 #define ARCH_HAS_USER_SINGLE_STEP_REPORT
 
 /*
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index cb326720a8a1..ce065589192a 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -39,7 +39,7 @@ struct div_result {
 };
 
 /* Accessor functions for the timebase (RTC on 601) registers. */
-#define __USE_RTC()	(IS_ENABLED(CONFIG_PPC_BOOK3S_601))
+#define __USE_RTC()	(0)
 
 #ifdef CONFIG_PPC64
 
diff --git a/arch/powerpc/include/asm/timex.h b/arch/powerpc/include/asm/timex.h
index 6047402b0a4d..95988870a57b 100644
--- a/arch/powerpc/include/asm/timex.h
+++ b/arch/powerpc/include/asm/timex.h
@@ -17,9 +17,6 @@ typedef unsigned long cycles_t;
 
 static inline cycles_t get_cycles(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		return 0;
-
 	return mftb();
 }
 
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 02300edc6989..b609fb39dba8 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -95,18 +95,12 @@ void __init btext_prepare_BAT(void)
 		boot_text_mapped = 0;
 		return;
 	}
-	if (PVR_VER(mfspr(SPRN_PVR)) != 1) {
+	{
 		/* 603, 604, G3, G4, ... */
 		lowbits = addr & ~0xFF000000UL;
 		addr &= 0xFF000000UL;
 		disp_BAT[0] = vaddr | (BL_16M<<2) | 2;
 		disp_BAT[1] = addr | (_PAGE_NO_CACHE | _PAGE_GUARDED | BPP_RW);	
-	} else {
-		/* 601 */
-		lowbits = addr & ~0xFF800000UL;
-		addr &= 0xFF800000UL;
-		disp_BAT[0] = vaddr | (_PAGE_NO_CACHE | PP_RWXX) | 4;
-		disp_BAT[1] = addr | BL_8M | 0x40;
 	}
 	logicalDisplayBase = (void *) (vaddr + lowbits);
 }
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index f25ea188ecd3..8cdc8bcde703 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -811,19 +811,11 @@ _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 1:	lis	r3,exc_exit_restart_end@ha
 	addi	r3,r3,exc_exit_restart_end@l
 	cmplw	r12,r3
-#ifdef CONFIG_PPC_BOOK3S_601
-	bge	2b
-#else
 	bge	3f
-#endif
 	lis	r4,exc_exit_restart@ha
 	addi	r4,r4,exc_exit_restart@l
 	cmplw	r12,r4
-#ifdef CONFIG_PPC_BOOK3S_601
-	blt	2b
-#else
 	blt	3f
-#endif
 	lis	r3,fee_restarts@ha
 	tophys(r3,r3)
 	lwz	r5,fee_restarts@l(r3)
@@ -840,7 +832,6 @@ fee_restarts:
 
 /* aargh, a nonrecoverable interrupt, panic */
 /* aargh, we don't know which trap this is */
-/* but the 601 doesn't implement the RI bit, so assume it's OK */
 3:
 	li	r10,-1
 	stw	r10,_TRAP(r11)
@@ -1302,19 +1293,11 @@ nonrecoverable:
 	lis	r10,exc_exit_restart_end@ha
 	addi	r10,r10,exc_exit_restart_end@l
 	cmplw	r12,r10
-#ifdef CONFIG_PPC_BOOK3S_601
-	bgelr
-#else
 	bge	3f
-#endif
 	lis	r11,exc_exit_restart@ha
 	addi	r11,r11,exc_exit_restart@l
 	cmplw	r12,r11
-#ifdef CONFIG_PPC_BOOK3S_601
-	bltlr
-#else
 	blt	3f
-#endif
 	lis	r10,ee_restarts@ha
 	lwz	r12,ee_restarts@l(r10)
 	addi	r12,r12,1
@@ -1322,7 +1305,6 @@ nonrecoverable:
 	mr	r12,r11		/* restart at exc_exit_restart */
 	blr
 3:	/* OK, we can't recover, kill this process */
-	/* but the 601 doesn't implement the RI bit, so assume it's OK */
 	lwz	r3,_TRAP(r1)
 	andi.	r0,r3,1
 	beq	5f
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 0865e2152d22..a7be9b76ff84 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -34,16 +34,6 @@
 
 #include "head_32.h"
 
-/* 601 only have IBAT */
-#ifdef CONFIG_PPC_BOOK3S_601
-#define LOAD_BAT(n, reg, RA, RB)	\
-	li	RA,0;			\
-	mtspr	SPRN_IBAT##n##U,RA;	\
-	lwz	RA,(n*16)+0(reg);	\
-	lwz	RB,(n*16)+4(reg);	\
-	mtspr	SPRN_IBAT##n##U,RA;	\
-	mtspr	SPRN_IBAT##n##L,RB
-#else
 #define LOAD_BAT(n, reg, RA, RB)	\
 	/* see the comment for clear_bats() -- Cort */ \
 	li	RA,0;			\
@@ -57,7 +47,6 @@
 	lwz	RB,(n*16)+12(reg);	\
 	mtspr	SPRN_DBAT##n##U,RA;	\
 	mtspr	SPRN_DBAT##n##L,RB
-#endif
 
 	__HEAD
 	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
@@ -438,7 +427,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 SystemCall:
 	SYSCALL_ENTRY	0xc00
 
-/* Single step - not used on 601 */
 	EXCEPTION(0xd00, SingleStep, single_step_exception, EXC_XFER_STD)
 	EXCEPTION(0xe00, Trap_0e, unknown_exception, EXC_XFER_STD)
 
@@ -980,8 +968,7 @@ load_up_mmu:
 	lwz	r6,_SDR1@l(r6)
 	mtspr	SPRN_SDR1,r6
 
-/* Load the BAT registers with the values set up by MMU_init.
-   MMU_init takes care of whether we're on a 601 or not. */
+/* Load the BAT registers with the values set up by MMU_init. */
 	lis	r3,BATS@ha
 	addi	r3,r3,BATS@l
 	tophys(r3,r3)
@@ -1158,7 +1145,6 @@ EXPORT_SYMBOL(switch_mmu_context)
 clear_bats:
 	li	r10,0
 
-#ifndef CONFIG_PPC_BOOK3S_601
 	mtspr	SPRN_DBAT0U,r10
 	mtspr	SPRN_DBAT0L,r10
 	mtspr	SPRN_DBAT1U,r10
@@ -1167,7 +1153,6 @@ clear_bats:
 	mtspr	SPRN_DBAT2L,r10
 	mtspr	SPRN_DBAT3U,r10
 	mtspr	SPRN_DBAT3L,r10
-#endif
 	mtspr	SPRN_IBAT0U,r10
 	mtspr	SPRN_IBAT0L,r10
 	mtspr	SPRN_IBAT1U,r10
@@ -1258,26 +1243,9 @@ mmu_off:
 	sync
 	RFI
 
-/*
- * On 601, we use 3 BATs to map up to 24M of RAM at _PAGE_OFFSET
- * (we keep one for debugging) and on others, we use one 256M BAT.
- */
+/* We use one BAT to map up to 256M of RAM at _PAGE_OFFSET */
 initial_bats:
 	lis	r11,PAGE_OFFSET@h
-#ifdef CONFIG_PPC_BOOK3S_601
-	ori	r11,r11,4		/* set up BAT registers for 601 */
-	li	r8,0x7f			/* valid, block length = 8MB */
-	mtspr	SPRN_IBAT0U,r11		/* N.B. 601 has valid bit in */
-	mtspr	SPRN_IBAT0L,r8		/* lower BAT register */
-	addis	r11,r11,0x800000@h
-	addis	r8,r8,0x800000@h
-	mtspr	SPRN_IBAT1U,r11
-	mtspr	SPRN_IBAT1L,r8
-	addis	r11,r11,0x800000@h
-	addis	r8,r8,0x800000@h
-	mtspr	SPRN_IBAT2U,r11
-	mtspr	SPRN_IBAT2L,r8
-#else
 	tophys(r8,r11)
 #ifdef CONFIG_SMP
 	ori	r8,r8,0x12		/* R/W access, M=1 */
@@ -1286,11 +1254,10 @@ initial_bats:
 #endif /* CONFIG_SMP */
 	ori	r11,r11,BL_256M<<2|0x2	/* set up BAT registers for 604 */
 
-	mtspr	SPRN_DBAT0L,r8		/* N.B. 6xx (not 601) have valid */
+	mtspr	SPRN_DBAT0L,r8		/* N.B. 6xx have valid */
 	mtspr	SPRN_DBAT0U,r11		/* bit in upper BAT register */
 	mtspr	SPRN_IBAT0L,r8
 	mtspr	SPRN_IBAT0U,r11
-#endif
 	isync
 	blr
 
@@ -1308,13 +1275,8 @@ setup_disp_bat:
 	beqlr
 	lwz	r11,0(r8)
 	lwz	r8,4(r8)
-#ifndef CONFIG_PPC_BOOK3S_601
 	mtspr	SPRN_DBAT3L,r8
 	mtspr	SPRN_DBAT3U,r11
-#else
-	mtspr	SPRN_IBAT3L,r8
-	mtspr	SPRN_IBAT3U,r11
-#endif
 	blr
 #endif /* CONFIG_BOOTX_TEXT */
 
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 1823706ae076..057d6b8e9bb0 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -223,6 +223,6 @@ __init void initialize_cache_info(void)
 	dcache_bsize = cur_cpu_spec->dcache_bsize;
 	icache_bsize = cur_cpu_spec->icache_bsize;
 	ucache_bsize = 0;
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601) || IS_ENABLED(CONFIG_E200))
+	if (IS_ENABLED(CONFIG_E200))
 		ucache_bsize = icache_bsize = dcache_bsize;
 }
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d1ebe152f210..c5f39f13e96e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -529,9 +529,6 @@ void system_reset_exception(struct pt_regs *regs)
  * Check if the NIP corresponds to the address of a sync
  * instruction for which there is an entry in the exception
  * table.
- * Note that the 601 only takes a machine check on TEA
- * (transfer error ack) signal assertion, and does not
- * set any of the top 16 bits of SRR1.
  *  -- paulus.
  */
 static inline int check_io_access(struct pt_regs *regs)
@@ -796,7 +793,6 @@ int machine_check_generic(struct pt_regs *regs)
 	case 0x80000:
 		pr_cont("Machine check signal\n");
 		break;
-	case 0:		/* for 601 */
 	case 0x40000:
 	case 0x140000:	/* 7450 MSS error and TEA */
 		pr_cont("Transfer error ack signal\n");
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 217bb630f8f9..1d23e2771dba 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -47,7 +47,6 @@ V_FUNCTION_END(__kernel_get_syscall_map)
  *
  * returns the timebase frequency in HZ
  */
-#ifndef CONFIG_PPC_BOOK3S_601
 V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
@@ -60,4 +59,3 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_get_tbfreq)
-#endif
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 4c985467a668..bf1c28741c7e 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -145,13 +145,11 @@ VERSION
 		__kernel_datapage_offset;
 
 		__kernel_get_syscall_map;
-#ifndef CONFIG_PPC_BOOK3S_601
 		__kernel_gettimeofday;
 		__kernel_clock_gettime;
 		__kernel_clock_getres;
 		__kernel_time;
 		__kernel_get_tbfreq;
-#endif
 		__kernel_sync_dicache;
 		__kernel_sync_dicache_p5;
 		__kernel_sigtramp32;
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index c0162911f6cb..f42b718ea971 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -74,14 +74,7 @@ static int find_free_bat(void)
 {
 	int b;
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601)) {
-		for (b = 0; b < 4; b++) {
-			struct ppc_bat *bat = BATS[b];
-
-			if (!(bat[0].batl & 0x40))
-				return b;
-		}
-	} else {
+	{
 		int n = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
 
 		for (b = 0; b < n; b++) {
@@ -97,7 +90,7 @@ static int find_free_bat(void)
 /*
  * This function calculates the size of the larger block usable to map the
  * beginning of an area based on the start address and size of that area:
- * - max block size is 8M on 601 and 256 on other 6xx.
+ * - max block size is 256 on 6xx.
  * - base address must be aligned to the block size. So the maximum block size
  *   is identified by the lowest bit set to 1 in the base address (for instance
  *   if base is 0x16000000, max size is 0x02000000).
@@ -106,7 +99,7 @@ static int find_free_bat(void)
  */
 static unsigned int block_size(unsigned long base, unsigned long top)
 {
-	unsigned int max_size = IS_ENABLED(CONFIG_PPC_BOOK3S_601) ? SZ_8M : SZ_256M;
+	unsigned int max_size = SZ_256M;
 	unsigned int base_shift = (ffs(base) - 1) & 31;
 	unsigned int block_shift = (fls(top - base) - 1) & 31;
 
@@ -117,7 +110,6 @@ static unsigned int block_size(unsigned long base, unsigned long top)
  * Set up one of the IBAT (block address translation) register pairs.
  * The parameters are not checked; in particular size must be a power
  * of 2 between 128k and 256M.
- * Only for 603+ ...
  */
 static void setibat(int index, unsigned long virt, phys_addr_t phys,
 		    unsigned int size, pgprot_t prot)
@@ -207,9 +199,6 @@ void mmu_mark_initmem_nx(void)
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
 	unsigned long size;
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		return;
-
 	for (i = 0; i < nb - 1 && base < top && top - base > (128 << 10);) {
 		size = block_size(base, top);
 		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
@@ -246,9 +235,6 @@ void mmu_mark_rodata_ro(void)
 	int nb = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
 	int i;
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		return;
-
 	for (i = 0; i < nb; i++) {
 		struct ppc_bat *bat = BATS[i];
 
@@ -287,8 +273,7 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 		flags &= ~_PAGE_COHERENT;
 
 	bl = (size >> 17) - 1;
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_601)) {
-		/* 603, 604, etc. */
+	{
 		/* Do DBAT first */
 		wimgxpp = flags & (_PAGE_WRITETHRU | _PAGE_NO_CACHE
 				   | _PAGE_COHERENT | _PAGE_GUARDED);
@@ -305,16 +290,6 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 			bat[0] = bat[1];
 		else
 			bat[0].batu = bat[0].batl = 0;
-	} else {
-		/* 601 cpu */
-		if (bl > BL_8M)
-			bl = BL_8M;
-		wimgxpp = flags & (_PAGE_WRITETHRU | _PAGE_NO_CACHE
-				   | _PAGE_COHERENT);
-		wimgxpp |= (flags & _PAGE_RW)?
-			((flags & _PAGE_USER)? PP_RWRW: PP_RWXX): PP_RXRX;
-		bat->batu = virt | wimgxpp | 4;	/* Ks=0, Ku=1 */
-		bat->batl = phys | bl | 0x40;	/* V=1 */
 	}
 
 	bat_addrs[index].start = virt;
@@ -467,11 +442,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 */
 	BUG_ON(first_memblock_base != 0);
 
-	/* 601 can only access 16MB at the moment */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		memblock_set_current_limit(min_t(u64, first_memblock_size, 0x01000000));
-	else /* Anything else has 256M mapped */
-		memblock_set_current_limit(min_t(u64, first_memblock_size, 0x10000000));
+	memblock_set_current_limit(min_t(u64, first_memblock_size, SZ_256M));
 }
 
 void __init print_system_hash_info(void)
diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index e29b338d499f..c4c628b03cf8 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -12,62 +12,6 @@
 
 #include "ptdump.h"
 
-static char *pp_601(int k, int pp)
-{
-	if (pp == 0)
-		return k ? "   " : "rwx";
-	if (pp == 1)
-		return k ? "r x" : "rwx";
-	if (pp == 2)
-		return "rwx";
-	return "r x";
-}
-
-static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
-{
-	u32 blpi = upper & 0xfffe0000;
-	u32 k = (upper >> 2) & 3;
-	u32 pp = upper & 3;
-	phys_addr_t pbn = PHYS_BAT_ADDR(lower);
-	u32 bsm = lower & 0x3ff;
-	u32 size = (bsm + 1) << 17;
-
-	seq_printf(m, "%d: ", idx);
-	if (!(lower & 0x40)) {
-		seq_puts(m, "        -\n");
-		return;
-	}
-
-	seq_printf(m, "0x%08x-0x%08x ", blpi, blpi + size - 1);
-#ifdef CONFIG_PHYS_64BIT
-	seq_printf(m, "0x%016llx ", pbn);
-#else
-	seq_printf(m, "0x%08x ", pbn);
-#endif
-	pt_dump_size(m, size);
-
-	seq_printf(m, "Kernel %s User %s", pp_601(k & 2, pp), pp_601(k & 1, pp));
-
-	seq_puts(m, lower & _PAGE_WRITETHRU ? "w " : "  ");
-	seq_puts(m, lower & _PAGE_NO_CACHE ? "i " : "  ");
-	seq_puts(m, lower & _PAGE_COHERENT ? "m " : "  ");
-	seq_puts(m, "\n");
-}
-
-#define BAT_SHOW_601(_m, _n, _l, _u) bat_show_601(_m, _n, mfspr(_l), mfspr(_u))
-
-static int bats_show_601(struct seq_file *m, void *v)
-{
-	seq_puts(m, "---[ Block Address Translation ]---\n");
-
-	BAT_SHOW_601(m, 0, SPRN_IBAT0L, SPRN_IBAT0U);
-	BAT_SHOW_601(m, 1, SPRN_IBAT1L, SPRN_IBAT1U);
-	BAT_SHOW_601(m, 2, SPRN_IBAT2L, SPRN_IBAT2U);
-	BAT_SHOW_601(m, 3, SPRN_IBAT3L, SPRN_IBAT3U);
-
-	return 0;
-}
-
 static void bat_show_603(struct seq_file *m, int idx, u32 lower, u32 upper, bool is_d)
 {
 	u32 bepi = upper & 0xfffe0000;
@@ -146,9 +90,6 @@ static int bats_show_603(struct seq_file *m, void *v)
 
 static int bats_open(struct inode *inode, struct file *file)
 {
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
-		return single_open(file, bats_show_601, NULL);
-
 	return single_open(file, bats_show_603, NULL);
 }
 
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index f002b0fa69b8..2e2cc0c75d87 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -284,7 +284,7 @@ static void __init pmac_setup_arch(void)
 				/* 604, G3, G4 etc. */
 				loops_per_jiffy = *fp / HZ;
 			else
-				/* 601, 603, etc. */
+				/* 603, etc. */
 				loops_per_jiffy = *fp / (2 * HZ);
 			of_node_put(cpu);
 			break;
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index eb23264910e1..02f79396a284 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -270,10 +270,6 @@ static void __init smp_psurge_probe(void)
 	int i, ncpus;
 	struct device_node *dn;
 
-	/* We don't do SMP on the PPC601 -- paulus */
-	if (PVR_VER(mfspr(SPRN_PVR)) == 1)
-		return;
-
 	/*
 	 * The powersurge cpu board can be used in the generation
 	 * of powermacs that have a socket for an upgradeable cpu card,
-- 
2.25.0

