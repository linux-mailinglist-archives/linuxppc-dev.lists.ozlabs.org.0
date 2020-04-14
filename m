Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 975731A75FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:26:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491dqV6vTXzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:26:14 +1000 (AEST)
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
 header.s=mail header.b=cvrVe0cq; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgc5PKPzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgV2Yjpz9v1Fh;
 Tue, 14 Apr 2020 10:19:18 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cvrVe0cq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cr-ssWed6tv9; Tue, 14 Apr 2020 10:19:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgV1XGvz9ty3F;
 Tue, 14 Apr 2020 10:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852358; bh=b5rTmlcr3VntZTQ0P0m2nQnrwBhA8x8uGnMvNjNdhas=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cvrVe0cqwVoC+vrv12jNqYRAAfdXNTtUY3SKQ7l8eGxQxmrtyTTXKx1eqYoRlF9Wd
 CDru2pXLTQcQOX9YwmhL4i2KkQnh3+HiQVZuSRqndDqrqdwecy4BD9Kd3EFNlptFxy
 teMZIMeyDf+U7GPF6VMVweaN6whACIzJ47M8QOgM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B8068B796;
 Tue, 14 Apr 2020 10:19:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0EkyqAUYEpS9; Tue, 14 Apr 2020 10:19:19 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE30D8B797;
 Tue, 14 Apr 2020 10:19:18 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 7F3C66578B; Tue, 14 Apr 2020 08:19:18 +0000 (UTC)
Message-Id: <9988528a455bb8c9962e2ea9e8df06ebca8cded1.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 02/13] powerpc/40x: Rework 40x PTE access and TLB miss
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:18 +0000 (UTC)
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

Commit 1bc54c03117b ("powerpc: rework 4xx PTE access and TLB miss")
reworked 44x PTE access to avoid atomic pte updates, and
left 8xx, 40x and fsl booke with atomic pte updates.
Commit 6cfd8990e27d ("powerpc: rework FSL Book-E PTE access and TLB
miss") removed atomic pte updates on fsl booke.
It went away on 8xx with commit ddfc20a3b9ae ("powerpc/8xx: Remove
PTE_ATOMIC_UPDATES").

40x is the last platform setting PTE_ATOMIC_UPDATES.

Rework PTE access and TLB miss to remove PTE_ATOMIC_UPDATES for 40x:
- Always handle DSI as a fault.
- Bail out of TLB miss handler when CONFIG_SWAP is set and
_PAGE_ACCESSED is not set.
- Bail out of ITLB miss handler when _PAGE_EXEC is not set.
- Only set WR bit when both _PAGE_RW and _PAGE_DIRTY are set.
- Remove _PAGE_HWWRITE
- Don't require PTE_ATOMIC_UPDATES anymore

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/pte-40x.h |  23 +--
 arch/powerpc/include/asm/nohash/pgtable.h    |   2 -
 arch/powerpc/kernel/head_40x.S               | 177 +++----------------
 arch/powerpc/mm/nohash/40x.c                 |   4 +-
 4 files changed, 34 insertions(+), 172 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
index 12c6811e344b..2d3153cfc0d7 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-40x.h
@@ -44,9 +44,8 @@
 #define	_PAGE_WRITETHRU	0x008	/* W: caching is write-through */
 #define	_PAGE_USER	0x010	/* matches one of the zone permission bits */
 #define	_PAGE_SPECIAL	0x020	/* software: Special page */
-#define	_PAGE_RW	0x040	/* software: Writes permitted */
 #define	_PAGE_DIRTY	0x080	/* software: dirty page */
-#define _PAGE_HWWRITE	0x100	/* hardware: Dirty & RW, set in exception */
+#define _PAGE_RW	0x100	/* hardware: WR, anded with dirty in exception */
 #define _PAGE_EXEC	0x200	/* hardware: EX permission */
 #define _PAGE_ACCESSED	0x400	/* software: R: page referenced */
 
@@ -58,8 +57,8 @@
 
 #define _PAGE_KERNEL_RO		0
 #define _PAGE_KERNEL_ROX	_PAGE_EXEC
-#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW | _PAGE_HWWRITE)
-#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_HWWRITE | _PAGE_EXEC)
+#define _PAGE_KERNEL_RW		(_PAGE_DIRTY | _PAGE_RW)
+#define _PAGE_KERNEL_RWX	(_PAGE_DIRTY | _PAGE_RW | _PAGE_EXEC)
 
 #define _PMD_PRESENT	0x400	/* PMD points to page of PTEs */
 #define _PMD_PRESENT_MASK	_PMD_PRESENT
@@ -85,21 +84,5 @@
 #define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_USER)
 #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 
-#ifndef __ASSEMBLY__
-static inline pte_t pte_wrprotect(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~(_PAGE_RW | _PAGE_HWWRITE));
-}
-
-#define pte_wrprotect pte_wrprotect
-
-static inline pte_t pte_mkclean(pte_t pte)
-{
-	return __pte(pte_val(pte) & ~(_PAGE_DIRTY | _PAGE_HWWRITE));
-}
-
-#define pte_mkclean pte_mkclean
-#endif
-
 #endif /* __KERNEL__ */
 #endif /*  _ASM_POWERPC_NOHASH_32_PTE_40x_H */
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7fed9dc0f147..21e4d0d3eb3b 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -130,12 +130,10 @@ static inline pte_t pte_exprotect(pte_t pte)
 	return __pte(pte_val(pte) & ~_PAGE_EXEC);
 }
 
-#ifndef pte_mkclean
 static inline pte_t pte_mkclean(pte_t pte)
 {
 	return __pte(pte_val(pte) & ~_PAGE_DIRTY);
 }
-#endif
 
 static inline pte_t pte_mkold(pte_t pte)
 {
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 9bb663977e84..08cf4cf083b1 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -176,135 +176,16 @@ _ENTRY(saved_ksp_limit)
  * 0x0300 - Data Storage Exception
  * This happens for just a few reasons.  U0 set (but we don't do that),
  * or zone protection fault (user violation, write to protected page).
- * If this is just an update of modified status, we do that quickly
- * and exit.  Otherwise, we call heavywight functions to do the work.
+ * The other Data TLB exceptions bail out to this point
+ * if they can't resolve the lightweight TLB fault.
  */
 	START_EXCEPTION(0x0300,	DataStorage)
-	mtspr	SPRN_SPRG_SCRATCH0, r10 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH1, r11
-#ifdef CONFIG_403GCX
-	stw     r12, 0(r0)
-	stw     r9, 4(r0)
-	mfcr    r11
-	mfspr   r12, SPRN_PID
-	stw     r11, 8(r0)
-	stw     r12, 12(r0)
-#else
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r11
-	mfspr	r12, SPRN_PID
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
-#endif
-
-	/* First, check if it was a zone fault (which means a user
-	* tried to access a kernel or read-protected page - always
-	* a SEGV).  All other faults here must be stores, so no
-	* need to check ESR_DST as well. */
-	mfspr	r10, SPRN_ESR
-	andis.	r10, r10, ESR_DIZ@h
-	bne	2f
-
-	mfspr	r10, SPRN_DEAR		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r11, 0(r11)		/* Get L1 entry */
-	rlwinm.	r12, r11, 0, 0, 19	/* Extract L2 (pte) base address */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
-
-	andi.	r9, r11, _PAGE_RW	/* Is it writeable? */
-	beq	2f			/* Bail if not */
-
-	/* Update 'changed'.
-	*/
-	ori	r11, r11, _PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_HWWRITE
-	stw	r11, 0(r12)		/* Update Linux page table */
-
-	/* Most of the Linux PTE is ready to load into the TLB LO.
-	 * We set ZSEL, where only the LS-bit determines user access.
-	 * We set execute, because we don't have the granularity to
-	 * properly set this at the page level (Linux problem).
-	 * If shared is set, we cause a zero PID->TID load.
-	 * Many of these bits are software only.  Bits we don't set
-	 * here we (properly should) assume have the appropriate value.
-	 */
-	li	r12, 0x0ce2
-	andc	r11, r11, r12		/* Make sure 20, 21 are zero */
-
-	/* find the TLB index that caused the fault.  It has to be here.
-	*/
-	tlbsx	r9, 0, r10
-
-	tlbwe	r11, r9, TLB_DATA		/* Load TLB LO */
-
-	/* Done...restore registers and get out of here.
-	*/
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	PPC405_ERR77_SYNC
-	rfi			/* Should sync shadow TLBs */
-	b	.		/* prevent prefetch past rfi */
-
-2:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-#ifdef CONFIG_403GCX
-	lwz     r12, 12(r0)
-	lwz     r11, 8(r0)
-	mtspr   SPRN_PID, r12
-	mtcr    r11
-	lwz     r9, 4(r0)
-	lwz     r12, 0(r0)
-#else
-	mfspr	r12, SPRN_SPRG_SCRATCH5
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
-	mtcr	r11
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-#endif
-	mfspr	r11, SPRN_SPRG_SCRATCH1
-	mfspr	r10, SPRN_SPRG_SCRATCH0
-	b	DataAccess
+	EXCEPTION_PROLOG
+	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
+	stw	r5, _ESR(r11)
+	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
+	stw	r4, _DEAR(r11)
+	EXC_XFER_LITE(0x300, handle_page_fault)
 
 /*
  * 0x0400 - Instruction Storage Exception
@@ -414,11 +295,17 @@ _ENTRY(saved_ksp_limit)
 
 	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
 	lwz	r11, 0(r12)		/* Get Linux PTE */
-	andi.	r9, r11, _PAGE_PRESENT
-	beq	5f
+#ifdef CONFIG_SWAP
+	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED
+#else
+	li	r9, _PAGE_PRESENT
+#endif
+	andc.	r9, r9, r11		/* Check permission */
+	bne	5f
 
-	ori	r11, r11, _PAGE_ACCESSED
-	stw	r11, 0(r12)
+	rlwinm	r9, r11, 1, _PAGE_RW	/* dirty => rw */
+	and	r9, r9, r11		/* hwwrite = dirty & rw */
+	rlwimi	r11, r9, 0, _PAGE_RW	/* replace rw by hwwrite */
 
 	/* Create TLB tag.  This is the faulting address plus a static
 	 * set of bits.  These are size, valid, E, U0.
@@ -462,7 +349,7 @@ _ENTRY(saved_ksp_limit)
 #endif
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
-	b	DataAccess
+	b	DataStorage
 
 /* 0x1200 - Instruction TLB Miss Exception
  * Nearly the same as above, except we get our information from different
@@ -514,11 +401,17 @@ _ENTRY(saved_ksp_limit)
 
 	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
 	lwz	r11, 0(r12)		/* Get Linux PTE */
-	andi.	r9, r11, _PAGE_PRESENT
-	beq	5f
+#ifdef CONFIG_SWAP
+	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
+#else
+	li	r9, _PAGE_PRESENT | _PAGE_EXEC
+#endif
+	andc.	r9, r9, r11		/* Check permission */
+	bne	5f
 
-	ori	r11, r11, _PAGE_ACCESSED
-	stw	r11, 0(r12)
+	rlwinm	r9, r11, 1, _PAGE_RW	/* dirty => rw */
+	and	r9, r9, r11		/* hwwrite = dirty & rw */
+	rlwimi	r11, r9, 0, _PAGE_RW	/* replace rw by hwwrite */
 
 	/* Create TLB tag.  This is the faulting address plus a static
 	 * set of bits.  These are size, valid, E, U0.
@@ -668,18 +561,6 @@ WDTException:
 	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
 			  crit_transfer_to_handler, ret_from_crit_exc)
 
-/*
- * The other Data TLB exceptions bail out to this point
- * if they can't resolve the lightweight TLB fault.
- */
-DataAccess:
-	EXCEPTION_PROLOG
-	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
-	stw	r5,_ESR(r11)
-	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
-	stw	r4, _DEAR(r11)
-	EXC_XFER_LITE(0x300, handle_page_fault)
-
 /* Other PowerPC processors, namely those derived from the 6xx-series
  * have vectors from 0x2100 through 0x2F00 defined, but marked as reserved.
  * However, for the 4xx-series processors these are neither defined nor
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index 82862723ab42..3eee9cc28c51 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -102,7 +102,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 
 	while (s >= LARGE_PAGE_SIZE_16M) {
 		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_HWWRITE;
+		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_RW
 
 		pmdp = pmd_ptr_k(v);
 		*pmdp++ = __pmd(val);
@@ -117,7 +117,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 
 	while (s >= LARGE_PAGE_SIZE_4M) {
 		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_HWWRITE;
+		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_RW;
 
 		pmdp = pmd_ptr_k(v);
 		*pmdp = __pmd(val);
-- 
2.25.0

