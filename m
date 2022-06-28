Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E668355E576
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSFP6Vthz3f0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSDD2D6kz3cLy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:49:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LXSCz2zgMz9tVC;
	Tue, 28 Jun 2022 16:49:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgEPKXmACJVG; Tue, 28 Jun 2022 16:49:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LXSCx5FBjz9tV2;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 946048B765;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QtIPTCYcEWMM; Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.132])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7DE8B788;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25SEn7ZS2928191
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:49:07 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25SEn7n32928190;
	Tue, 28 Jun 2022 16:49:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, dja@axtens.net
Subject: [PATCH v1 2/6] powerpc/64e: Remove MMU_FTR_USE_TLBRSRV and MMU_FTR_USE_PAIRED_MAS
Date: Tue, 28 Jun 2022 16:48:55 +0200
Message-Id: <cfd5a0ecdb1598da968832e1bddf7431ec267200.1656427701.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
References: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656427736; l=7719; s=20211009; h=from:subject:message-id; bh=6O+2LGROlq8cYgMZPnAykzMw47G21WuDMBnFa3gf3/U=; b=LnJPaMLJ8fgqliM3V9Q5E9GsA5EZMCSfpJahTikyB580JJ5Bs8kY+3bd6uS78/3xeJrrIWciBTBS eDefnTWqBq/5q2vQyhu9CNGKlkBpgFo6FwoxMFACeWcYHKZNdzfu
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

Commit fb5a515704d7 ("powerpc: Remove platforms/wsp and associated
pieces") removed the last CPU having features MMU_FTRS_A2 and
commit cd68098bcedd ("powerpc: Clean up MMU_FTRS_A2 and
MMU_FTR_TYPE_3E") removed MMU_FTRS_A2 which was the last user of
MMU_FTR_USE_TLBRSRV and MMU_FTR_USE_PAIRED_MAS.

Remove all code that relies on MMU_FTR_USE_TLBRSRV and
MMU_FTR_USE_PAIRED_MAS.

With this change done, TLB miss can happen before the mmu feature
fixups.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mmu.h              | 12 ----
 arch/powerpc/kernel/setup_64.c              |  1 -
 arch/powerpc/mm/nohash/book3e_hugetlbpage.c | 30 +++-------
 arch/powerpc/mm/nohash/tlb_low_64e.S        | 66 ---------------------
 4 files changed, 8 insertions(+), 101 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 5f41565a1e5d..860d0290ca4d 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -96,15 +96,6 @@
  */
 #define MMU_FTR_NEED_DTLB_SW_LRU	ASM_CONST(0x00200000)
 
-/* Enable use of TLB reservation.  Processor should support tlbsrx.
- * instruction and MAS0[WQ].
- */
-#define MMU_FTR_USE_TLBRSRV		ASM_CONST(0x00800000)
-
-/* Use paired MAS registers (MAS7||MAS3, etc.)
- */
-#define MMU_FTR_USE_PAIRED_MAS		ASM_CONST(0x01000000)
-
 /* Doesn't support the B bit (1T segment) in SLBIE
  */
 #define MMU_FTR_NO_SLBIE_B		ASM_CONST(0x02000000)
@@ -180,9 +171,6 @@ enum {
 #ifdef CONFIG_PPC_83xx
 		MMU_FTR_NEED_DTLB_SW_LRU |
 #endif
-#ifdef CONFIG_PPC_BOOK3E_64
-		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
-#endif
 #ifdef CONFIG_PPC_BOOK3S_64
 		MMU_FTR_KERNEL_RO |
 #ifdef CONFIG_PPC_64S_HASH_MMU
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 5761f08dae95..2b2d0b0fbb30 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -113,7 +113,6 @@ void __init setup_tlb_core_data(void)
 		 * Should we panic instead?
 		 */
 		WARN_ONCE(smt_enabled_at_boot >= 2 &&
-			  !mmu_has_feature(MMU_FTR_USE_TLBRSRV) &&
 			  book3e_htw_mode != PPC_HTW_E6500,
 			  "%s: unsupported MMU configuration\n", __func__);
 	}
diff --git a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
index 307ca919d393..c7d4b317a823 100644
--- a/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/book3e_hugetlbpage.c
@@ -103,21 +103,11 @@ static inline int book3e_tlb_exists(unsigned long ea, unsigned long pid)
 	int found = 0;
 
 	mtspr(SPRN_MAS6, pid << 16);
-	if (mmu_has_feature(MMU_FTR_USE_TLBRSRV)) {
-		asm volatile(
-			"li	%0,0\n"
-			"tlbsx.	0,%1\n"
-			"bne	1f\n"
-			"li	%0,1\n"
-			"1:\n"
-			: "=&r"(found) : "r"(ea));
-	} else {
-		asm volatile(
-			"tlbsx	0,%1\n"
-			"mfspr	%0,0x271\n"
-			"srwi	%0,%0,31\n"
-			: "=&r"(found) : "r"(ea));
-	}
+	asm volatile(
+		"tlbsx	0,%1\n"
+		"mfspr	%0,0x271\n"
+		"srwi	%0,%0,31\n"
+		: "=&r"(found) : "r"(ea));
 
 	return found;
 }
@@ -169,13 +159,9 @@ book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
 	mtspr(SPRN_MAS1, mas1);
 	mtspr(SPRN_MAS2, mas2);
 
-	if (mmu_has_feature(MMU_FTR_USE_PAIRED_MAS)) {
-		mtspr(SPRN_MAS7_MAS3, mas7_3);
-	} else {
-		if (mmu_has_feature(MMU_FTR_BIG_PHYS))
-			mtspr(SPRN_MAS7, upper_32_bits(mas7_3));
-		mtspr(SPRN_MAS3, lower_32_bits(mas7_3));
-	}
+	if (mmu_has_feature(MMU_FTR_BIG_PHYS))
+		mtspr(SPRN_MAS7, upper_32_bits(mas7_3));
+	mtspr(SPRN_MAS3, lower_32_bits(mas7_3));
 
 	asm volatile ("tlbwe");
 
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 9e9ab3803fb2..a59485c549a7 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -152,16 +152,7 @@ tlb_miss_common_bolted:
 	clrrdi	r15,r15,3
 	beq	tlb_miss_fault_bolted	/* No PGDIR, bail */
 
-BEGIN_MMU_FTR_SECTION
-	/* Set the TLB reservation and search for existing entry. Then load
-	 * the entry.
-	 */
-	PPC_TLBSRX_DOT(0,R16)
-	ldx	r14,r14,r15		/* grab pgd entry */
-	beq	tlb_miss_done_bolted	/* tlb exists already, bail */
-MMU_FTR_SECTION_ELSE
 	ldx	r14,r14,r15		/* grab pgd entry */
-ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 
 	rldicl	r15,r16,64-PUD_SHIFT+3,64-PUD_INDEX_SIZE-3
 	clrrdi	r15,r15,3
@@ -674,16 +665,7 @@ normal_tlb_miss:
 	clrrdi	r14,r14,3
 	or	r10,r15,r14
 
-BEGIN_MMU_FTR_SECTION
-	/* Set the TLB reservation and search for existing entry. Then load
-	 * the entry.
-	 */
-	PPC_TLBSRX_DOT(0,R16)
 	ld	r14,0(r10)
-	beq	normal_tlb_miss_done
-MMU_FTR_SECTION_ELSE
-	ld	r14,0(r10)
-ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 
 finish_normal_tlb_miss:
 	/* Check if required permissions are met */
@@ -727,13 +709,9 @@ finish_normal_tlb_miss:
 	li	r11,MAS3_SW|MAS3_UW
 	andc	r15,r15,r11
 1:
-BEGIN_MMU_FTR_SECTION
 	srdi	r16,r15,32
 	mtspr	SPRN_MAS3,r15
 	mtspr	SPRN_MAS7,r16
-MMU_FTR_SECTION_ELSE
-	mtspr	SPRN_MAS7_MAS3,r15
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 
 	tlbwe
 
@@ -809,13 +787,6 @@ virt_page_table_tlb_miss:
 #else
 1:
 #endif
-BEGIN_MMU_FTR_SECTION
-	/* Search if we already have a TLB entry for that virtual address, and
-	 * if we do, bail out.
-	 */
-	PPC_TLBSRX_DOT(0,R16)
-	beq	virt_page_table_tlb_miss_done
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 
 	/* Now, we need to walk the page tables. First check if we are in
 	 * range.
@@ -866,41 +837,12 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	clrldi	r11,r15,4		/* remove region ID from RPN */
 	ori	r10,r11,1		/* Or-in SR */
 
-BEGIN_MMU_FTR_SECTION
 	srdi	r16,r10,32
 	mtspr	SPRN_MAS3,r10
 	mtspr	SPRN_MAS7,r16
-MMU_FTR_SECTION_ELSE
-	mtspr	SPRN_MAS7_MAS3,r10
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 
 	tlbwe
 
-BEGIN_MMU_FTR_SECTION
-virt_page_table_tlb_miss_done:
-
-	/* We have overridden MAS2:EPN but currently our primary TLB miss
-	 * handler will always restore it so that should not be an issue,
-	 * if we ever optimize the primary handler to not write MAS2 on
-	 * some cases, we'll have to restore MAS2:EPN here based on the
-	 * original fault's DEAR. If we do that we have to modify the
-	 * ITLB miss handler to also store SRR0 in the exception frame
-	 * as DEAR.
-	 *
-	 * However, one nasty thing we did is we cleared the reservation
-	 * (well, potentially we did). We do a trick here thus if we
-	 * are not a level 0 exception (we interrupted the TLB miss) we
-	 * offset the return address by -4 in order to replay the tlbsrx
-	 * instruction there
-	 */
-	subf	r10,r13,r12
-	cmpldi	cr0,r10,PACA_EXTLB+EX_TLB_SIZE
-	bne-	1f
-	ld	r11,PACA_EXTLB+EX_TLB_SIZE+EX_TLB_SRR0(r13)
-	addi	r10,r11,-4
-	std	r10,PACA_EXTLB+EX_TLB_SIZE+EX_TLB_SRR0(r13)
-1:
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	/* Return to caller, normal case */
 	TLB_MISS_EPILOG_SUCCESS
 	rfi
@@ -1115,13 +1057,9 @@ htw_tlb_miss:
 	 */
 	ori	r10,r15,(BOOK3E_PAGESZ_4K << MAS3_SPSIZE_SHIFT)
 
-BEGIN_MMU_FTR_SECTION
 	srdi	r16,r10,32
 	mtspr	SPRN_MAS3,r10
 	mtspr	SPRN_MAS7,r16
-MMU_FTR_SECTION_ELSE
-	mtspr	SPRN_MAS7_MAS3,r10
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 
 	tlbwe
 
@@ -1202,13 +1140,9 @@ tlb_load_linear:
 	clrldi	r10,r10,4		/* clear region bits */
 	ori	r10,r10,MAS3_SR|MAS3_SW|MAS3_SX
 
-BEGIN_MMU_FTR_SECTION
 	srdi	r16,r10,32
 	mtspr	SPRN_MAS3,r10
 	mtspr	SPRN_MAS7,r16
-MMU_FTR_SECTION_ELSE
-	mtspr	SPRN_MAS7_MAS3,r10
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 
 	tlbwe
 
-- 
2.36.1

