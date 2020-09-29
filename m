Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237627BCDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 08:12:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0pw447N3zDqNV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 16:12:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pr43fYQzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 16:09:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C0pqz3M2Bz9tyZ1;
 Tue, 29 Sep 2020 08:09:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iu73tuj2Jr4o; Tue, 29 Sep 2020 08:09:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C0pqz2Sd7z9tyYp;
 Tue, 29 Sep 2020 08:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 713DE8B7A0;
 Tue, 29 Sep 2020 08:09:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AFlAFzv7RxxL; Tue, 29 Sep 2020 08:09:20 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 209478B79F;
 Tue, 29 Sep 2020 08:09:20 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 04EC365E8A; Tue, 29 Sep 2020 06:09:20 +0000 (UTC)
Message-Id: <7990bb63fc53e460bfa94f8040184881d9e6fbc3.1601359702.git.christophe.leroy@csgroup.eu>
In-Reply-To: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
References: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/7] powerpc: Drop SYNC_601() ISYNC_601() and SYNC()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Sep 2020 06:09:20 +0000 (UTC)
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

Those macros are now empty at all time. Drop them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h  |  4 ----
 arch/powerpc/kernel/entry_32.S      | 17 +----------------
 arch/powerpc/kernel/fpu.S           |  1 -
 arch/powerpc/kernel/head_32.S       |  9 ---------
 arch/powerpc/kernel/head_32.h       |  1 -
 arch/powerpc/kernel/l2cr_6xx.S      |  3 +--
 arch/powerpc/mm/book3s32/hash_low.S | 12 ------------
 7 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 0b9dc814b81c..67a421b81a50 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -382,10 +382,6 @@ GLUE(.,name):
 #endif
 
 /* various errata or part fixups */
-#define	SYNC
-#define SYNC_601
-#define ISYNC_601
-
 #if defined(CONFIG_PPC_CELL) || defined(CONFIG_PPC_FSL_BOOK3E)
 #define MFTB(dest)			\
 90:	mfspr dest, SPRN_TBRL;		\
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index f4d0af8e1136..f25ea188ecd3 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -234,7 +234,6 @@ transfer_to_handler_cont:
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r10
 	mtlr	r9
-	SYNC
 	RFI				/* jump to handler, enable MMU */
 
 #if defined (CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
@@ -264,7 +263,6 @@ _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 	LOAD_REG_IMMEDIATE(r0, MSR_KERNEL)
 	mtspr	SPRN_SRR0,r12
 	mtspr	SPRN_SRR1,r0
-	SYNC
 	RFI
 
 reenable_mmu:
@@ -323,7 +321,6 @@ stack_ovf:
 #endif
 	mtspr	SPRN_SRR0,r9
 	mtspr	SPRN_SRR1,r10
-	SYNC
 	RFI
 _ASM_NOKPROBE_SYMBOL(stack_ovf)
 #endif
@@ -411,7 +408,6 @@ ret_from_syscall:
 	/* disable interrupts so current_thread_info()->flags can't change */
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
 	/* Note: We don't bother telling lockdep about it */
-	SYNC
 	mtmsr	r10
 	lwz	r9,TI_FLAGS(r2)
 	li	r8,-MAX_ERRNO
@@ -474,7 +470,6 @@ syscall_exit_finish:
 #endif
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
-	SYNC
 	RFI
 _ASM_NOKPROBE_SYMBOL(syscall_exit_finish)
 #ifdef CONFIG_44x
@@ -567,7 +562,6 @@ syscall_exit_work:
 	 * lockdep as we are supposed to have IRQs on at this point
 	 */
 	ori	r10,r10,MSR_EE
-	SYNC
 	mtmsr	r10
 
 	/* Save NVGPRS if they're not saved already */
@@ -606,7 +600,6 @@ ret_from_kernel_syscall:
 #endif
 	mtspr	SPRN_SRR0, r9
 	mtspr	SPRN_SRR1, r10
-	SYNC
 	RFI
 _ASM_NOKPROBE_SYMBOL(ret_from_kernel_syscall)
 
@@ -810,7 +803,6 @@ fast_exception_return:
 	REST_GPR(9, r11)
 	REST_GPR(12, r11)
 	lwz	r11,GPR11(r11)
-	SYNC
 	RFI
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
@@ -872,7 +864,6 @@ ret_from_except:
 	 * from the interrupt. */
 	/* Note: We don't bother telling lockdep about it */
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	SYNC			/* Some chip revs have problems here... */
 	mtmsr	r10		/* disable interrupts */
 
 	lwz	r3,_MSR(r1)	/* Returning to user mode? */
@@ -1035,7 +1026,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	 * exc_exit_restart below.  -- paulus
 	 */
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL & ~MSR_RI)
-	SYNC
 	mtmsr	r10		/* clear the RI bit */
 	.globl exc_exit_restart
 exc_exit_restart:
@@ -1046,7 +1036,6 @@ exc_exit_restart:
 	lwz	r1,GPR1(r1)
 	.globl exc_exit_restart_end
 exc_exit_restart_end:
-	SYNC
 	RFI
 _ASM_NOKPROBE_SYMBOL(exc_exit_restart)
 _ASM_NOKPROBE_SYMBOL(exc_exit_restart_end)
@@ -1274,7 +1263,6 @@ do_resched:			/* r10 contains MSR_KERNEL here */
 	mfmsr	r10
 #endif
 	ori	r10,r10,MSR_EE
-	SYNC
 	mtmsr	r10		/* hard-enable interrupts */
 	bl	schedule
 recheck:
@@ -1283,7 +1271,6 @@ recheck:
 	 * TI_FLAGS aren't advertised.
 	 */
 	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	SYNC
 	mtmsr	r10		/* disable interrupts */
 	lwz	r9,TI_FLAGS(r2)
 	andi.	r0,r9,_TIF_NEED_RESCHED
@@ -1292,7 +1279,6 @@ recheck:
 	beq	restore_user
 do_user_signal:			/* r10 contains MSR_KERNEL here */
 	ori	r10,r10,MSR_EE
-	SYNC
 	mtmsr	r10		/* hard-enable interrupts */
 	/* save r13-r31 in the exception frame, if not already done */
 	lwz	r3,_TRAP(r1)
@@ -1382,8 +1368,7 @@ _GLOBAL(enter_rtas)
 	mfmsr	r9
 	stw	r9,8(r1)
 	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
-	SYNC			/* disable interrupts so SRR0/1 */
-	mtmsr	r0		/* don't get trashed */
+	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
 	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
 	mtlr	r6
 	stw	r7, THREAD + RTAS_SP(r2)
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 825893d4cb59..3ff9a8fafa46 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -87,7 +87,6 @@ BEGIN_FTR_SECTION
 	oris	r5,r5,MSR_VSX@h
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	SYNC
 	MTMSRD(r5)			/* enable use of fpu now */
 	isync
 	/* enable use of FP after return */
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 2bd0aa3a4cc7..48cde60334a2 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -219,7 +219,6 @@ turn_on_mmu:
 	lis	r0,start_here@h
 	ori	r0,r0,start_here@l
 	mtspr	SPRN_SRR0,r0
-	SYNC
 	RFI				/* enables MMU */
 
 /*
@@ -784,14 +783,12 @@ fast_hash_page_return:
 	mtcr	r11
 	lwz	r11, THR11(r10)
 	mfspr	r10, SPRN_SPRG_SCRATCH0
-	SYNC
 	RFI
 
 1:	/* ISI */
 	mtcr	r11
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
-	SYNC
 	RFI
 
 stack_overflow:
@@ -882,7 +879,6 @@ __secondary_start_pmac_0:
 	   set to map the 0xf0000000 - 0xffffffff region */
 	mfmsr	r0
 	rlwinm	r0,r0,0,28,26		/* clear DR (0x10) */
-	SYNC
 	mtmsr	r0
 	isync
 
@@ -930,7 +926,6 @@ __secondary_start:
 	ori	r3,r3,start_secondary@l
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
-	SYNC
 	RFI
 #endif /* CONFIG_SMP */
 
@@ -1074,7 +1069,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	.align	4
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r3
-	SYNC
 	RFI
 /* Load up the kernel context */
 2:	bl	load_up_mmu
@@ -1099,7 +1093,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	ori	r3,r3,start_kernel@l
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
-	SYNC
 	RFI
 
 /*
@@ -1217,7 +1210,6 @@ _ENTRY(update_bats)
 	.align	4
 	mtspr	SPRN_SRR0, r4
 	mtspr	SPRN_SRR1, r3
-	SYNC
 	RFI
 1:	bl	clear_bats
 	lis	r3, BATS@ha
@@ -1237,7 +1229,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 	mtmsr	r3
 	mtspr	SPRN_SRR0, r7
 	mtspr	SPRN_SRR1, r6
-	SYNC
 	RFI
 
 flush_tlbs:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index cc36998c5541..7c767765071d 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -222,7 +222,6 @@
 #endif
 	mtspr	SPRN_SRR1,r10
 	mtspr	SPRN_SRR0,r11
-	SYNC
 	RFI				/* jump to handler, enable MMU */
 99:	b	ret_from_kernel_syscall
 .endm
diff --git a/arch/powerpc/kernel/l2cr_6xx.S b/arch/powerpc/kernel/l2cr_6xx.S
index 5f07aa5e9851..225511d73bef 100644
--- a/arch/powerpc/kernel/l2cr_6xx.S
+++ b/arch/powerpc/kernel/l2cr_6xx.S
@@ -256,7 +256,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPEC7450)
 	sync
 
 	/* Restore MSR (restores EE and DR bits to original state) */
-	SYNC
 	mtmsr	r7
 	isync
 
@@ -377,7 +376,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_L3CR)
 1:	bdnz	1b
 
 	/* Restore MSR (restores EE and DR bits to original state) */
-4:	SYNC
+4:
 	mtmsr	r7
 	isync
 	blr
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 1690d369688b..3143de6ae769 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -199,11 +199,9 @@ _GLOBAL(add_hash_page)
 	 * covered by a BAT).  -- paulus
 	 */
 	mfmsr	r9
-	SYNC
 	rlwinm	r0,r9,0,17,15		/* clear bit 16 (MSR_EE) */
 	rlwinm	r0,r0,0,28,26		/* clear MSR_DR */
 	mtmsr	r0
-	SYNC_601
 	isync
 
 #ifdef CONFIG_SMP
@@ -262,7 +260,6 @@ _GLOBAL(add_hash_page)
 
 	/* reenable interrupts and DR */
 	mtmsr	r9
-	SYNC_601
 	isync
 
 	lwz	r0,4(r1)
@@ -506,11 +503,9 @@ _GLOBAL(flush_hash_pages)
 	 * covered by a BAT).  -- paulus
 	 */
 	mfmsr	r10
-	SYNC
 	rlwinm	r0,r10,0,17,15		/* clear bit 16 (MSR_EE) */
 	rlwinm	r0,r0,0,28,26		/* clear MSR_DR */
 	mtmsr	r0
-	SYNC_601
 	isync
 
 	/* First find a PTE in the range that has _PAGE_HASHPTE set */
@@ -629,7 +624,6 @@ _GLOBAL(flush_hash_pages)
 #endif
 
 19:	mtmsr	r10
-	SYNC_601
 	isync
 	blr
 EXPORT_SYMBOL(flush_hash_pages)
@@ -643,11 +637,9 @@ _GLOBAL(_tlbie)
 	lwz	r8,TASK_CPU(r2)
 	oris	r8,r8,11
 	mfmsr	r10
-	SYNC
 	rlwinm	r0,r10,0,17,15		/* clear bit 16 (MSR_EE) */
 	rlwinm	r0,r0,0,28,26		/* clear DR */
 	mtmsr	r0
-	SYNC_601
 	isync
 	lis	r9,mmu_hash_lock@h
 	ori	r9,r9,mmu_hash_lock@l
@@ -664,7 +656,6 @@ _GLOBAL(_tlbie)
 	li	r0,0
 	stw	r0,0(r9)		/* clear mmu_hash_lock */
 	mtmsr	r10
-	SYNC_601
 	isync
 #else /* CONFIG_SMP */
 	tlbie	r3
@@ -681,11 +672,9 @@ _GLOBAL(_tlbia)
 	lwz	r8,TASK_CPU(r2)
 	oris	r8,r8,10
 	mfmsr	r10
-	SYNC
 	rlwinm	r0,r10,0,17,15		/* clear bit 16 (MSR_EE) */
 	rlwinm	r0,r0,0,28,26		/* clear DR */
 	mtmsr	r0
-	SYNC_601
 	isync
 	lis	r9,mmu_hash_lock@h
 	ori	r9,r9,mmu_hash_lock@l
@@ -709,7 +698,6 @@ _GLOBAL(_tlbia)
 	li	r0,0
 	stw	r0,0(r9)		/* clear mmu_hash_lock */
 	mtmsr	r10
-	SYNC_601
 	isync
 #endif /* CONFIG_SMP */
 	blr
-- 
2.25.0

