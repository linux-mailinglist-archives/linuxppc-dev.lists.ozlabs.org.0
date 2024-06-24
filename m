Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937A91507A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79lb0GThz3fnV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:46:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79kn6KHbz3clT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:46:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79kc3TKKz9vFB;
	Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VluBMLrOZH6Q; Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79kb1hcSz9vDw;
	Mon, 24 Jun 2024 16:45:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 351208B768;
	Mon, 24 Jun 2024 16:45:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FdoI1s7Iif9T; Mon, 24 Jun 2024 16:45:59 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 992808B766;
	Mon, 24 Jun 2024 16:45:58 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 01/23] powerpc/64e: Remove unused IBM HTW code
Date: Mon, 24 Jun 2024 16:45:27 +0200
Message-ID: <532ca7c0715360ef6d1b1cebc0bf78f7f0212782.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240333; l=10427; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2h8pbz81hz7A9kWlbZomb+s/bHgtRVC1UTR2w333/4M=; b=KPBRLMGG9QLiHwdGAsj2KSasjhfkyuonViIZxOVY4CJcPAG1yoXxkOiXaJxE4y/52oOkb5ihZ GpVnl0leEAbAI+Z3itlqUsFr7CFYM2ghN1Q5nzNYHT6kR0kgG44ff9s
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

The nohash HTW_IBM (Hardware Table Walk) code is unused since support
for A2 was removed in commit fb5a515704d7 ("powerpc: Remove platforms/
wsp and associated pieces") (2014).

The remaining supported CPUs use either no HTW (data_tlb_miss_bolted),
or the e6500 HTW (data_tlb_miss_e6500).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/mmu-e500.h |   3 +-
 arch/powerpc/mm/nohash/tlb.c               |  57 +-----
 arch/powerpc/mm/nohash/tlb_low_64e.S       | 195 ---------------------
 3 files changed, 2 insertions(+), 253 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/mmu-e500.h b/arch/powerpc/include/asm/nohash/mmu-e500.h
index 6ddced0415cb..7dc24b8632d7 100644
--- a/arch/powerpc/include/asm/nohash/mmu-e500.h
+++ b/arch/powerpc/include/asm/nohash/mmu-e500.h
@@ -303,8 +303,7 @@ extern unsigned long linear_map_top;
 extern int book3e_htw_mode;
 
 #define PPC_HTW_NONE	0
-#define PPC_HTW_IBM	1
-#define PPC_HTW_E6500	2
+#define PPC_HTW_E6500	1
 
 /*
  * 64-bit booke platforms don't load the tlb in the tlb miss handler code.
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5ffa0af4328a..a5bb87ec8578 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -400,9 +400,8 @@ void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
 static void __init setup_page_sizes(void)
 {
 	unsigned int tlb0cfg;
-	unsigned int tlb0ps;
 	unsigned int eptcfg;
-	int i, psize;
+	int psize;
 
 #ifdef CONFIG_PPC_E500
 	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
@@ -471,50 +470,6 @@ static void __init setup_page_sizes(void)
 		goto out;
 	}
 #endif
-
-	tlb0cfg = mfspr(SPRN_TLB0CFG);
-	tlb0ps = mfspr(SPRN_TLB0PS);
-	eptcfg = mfspr(SPRN_EPTCFG);
-
-	/* Look for supported direct sizes */
-	for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
-		struct mmu_psize_def *def = &mmu_psize_defs[psize];
-
-		if (tlb0ps & (1U << (def->shift - 10)))
-			def->flags |= MMU_PAGE_SIZE_DIRECT;
-	}
-
-	/* Indirect page sizes supported ? */
-	if ((tlb0cfg & TLBnCFG_IND) == 0 ||
-	    (tlb0cfg & TLBnCFG_PT) == 0)
-		goto out;
-
-	book3e_htw_mode = PPC_HTW_IBM;
-
-	/* Now, we only deal with one IND page size for each
-	 * direct size. Hopefully all implementations today are
-	 * unambiguous, but we might want to be careful in the
-	 * future.
-	 */
-	for (i = 0; i < 3; i++) {
-		unsigned int ps, sps;
-
-		sps = eptcfg & 0x1f;
-		eptcfg >>= 5;
-		ps = eptcfg & 0x1f;
-		eptcfg >>= 5;
-		if (!ps || !sps)
-			continue;
-		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
-			struct mmu_psize_def *def = &mmu_psize_defs[psize];
-
-			if (ps == (def->shift - 10))
-				def->flags |= MMU_PAGE_SIZE_INDIRECT;
-			if (sps == (def->shift - 10))
-				def->ind = ps + 10;
-		}
-	}
-
 out:
 	/* Cleanup array and print summary */
 	pr_info("MMU: Supported page sizes\n");
@@ -543,10 +498,6 @@ static void __init setup_mmu_htw(void)
 	 */
 
 	switch (book3e_htw_mode) {
-	case PPC_HTW_IBM:
-		patch_exception(0x1c0, exc_data_tlb_miss_htw_book3e);
-		patch_exception(0x1e0, exc_instruction_tlb_miss_htw_book3e);
-		break;
 #ifdef CONFIG_PPC_E500
 	case PPC_HTW_E6500:
 		extlb_level_exc = EX_TLB_SIZE;
@@ -577,12 +528,6 @@ static void early_init_this_mmu(void)
 		mmu_pte_psize = MMU_PAGE_2M;
 		break;
 
-	case PPC_HTW_IBM:
-		mas4 |= MAS4_INDD;
-		mas4 |=	BOOK3E_PAGESZ_1M << MAS4_TSIZED_SHIFT;
-		mmu_pte_psize = MMU_PAGE_1M;
-		break;
-
 	case PPC_HTW_NONE:
 		mas4 |=	BOOK3E_PAGESZ_4K << MAS4_TSIZED_SHIFT;
 		mmu_pte_psize = mmu_virtual_psize;
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 7e0b8fe1c279..b0eb3f7eaed1 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -893,201 +893,6 @@ virt_page_table_tlb_miss_whacko_fault:
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
 
-
-/**************************************************************
- *                                                            *
- * TLB miss handling for Book3E with hw page table support    *
- *                                                            *
- **************************************************************/
-
-
-/* Data TLB miss */
-	START_EXCEPTION(data_tlb_miss_htw)
-	TLB_MISS_PROLOG
-
-	/* Now we handle the fault proper. We only save DEAR in normal
-	 * fault case since that's the only interesting values here.
-	 * We could probably also optimize by not saving SRR0/1 in the
-	 * linear mapping case but I'll leave that for later
-	 */
-	mfspr	r14,SPRN_ESR
-	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r11,r16,44		/* get region */
-	xoris	r11,r11,0xc
-	cmpldi	cr0,r11,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r11,r16,60		/* Check for user region */
-	ld	r15,PACAPGD(r13)	/* Load user pgdir */
-	beq	htw_tlb_miss
-
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1		/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	ld	r15,PACA_KERNELPGD(r13)	/* Load kernel pgdir */
-	beq+	cr1,htw_tlb_miss
-
-	/* We got a crappy address, just fault with whatever DEAR and ESR
-	 * are here
-	 */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-
-/* Instruction TLB miss */
-	START_EXCEPTION(instruction_tlb_miss_htw)
-	TLB_MISS_PROLOG
-
-	/* If we take a recursive fault, the second level handler may need
-	 * to know whether we are handling a data or instruction fault in
-	 * order to get to the right store fault handler. We provide that
-	 * info by keeping a crazy value for ESR in r14
-	 */
-	li	r14,-1	/* store to exception frame is done later */
-
-	/* Now we handle the fault proper. We only save DEAR in the non
-	 * linear mapping case since we know the linear mapping case will
-	 * not re-enter. We could indeed optimize and also not save SRR0/1
-	 * in the linear mapping case but I'll leave that for later
-	 *
-	 * Faulting address is SRR0 which is already in r16
-	 */
-	srdi	r11,r16,44		/* get region */
-	xoris	r11,r11,0xc
-	cmpldi	cr0,r11,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r11,r16,60		/* Check for user region */
-	ld	r15,PACAPGD(r13)		/* Load user pgdir */
-	beq	htw_tlb_miss
-
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1			/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	ld	r15,PACA_KERNELPGD(r13)		/* Load kernel pgdir */
-	beq+	htw_tlb_miss
-
-	/* We got a crappy address, just fault */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-
-/*
- * This is the guts of the second-level TLB miss handler for direct
- * misses. We are entered with:
- *
- * r16 = virtual page table faulting address
- * r15 = PGD pointer
- * r14 = ESR
- * r13 = PACA
- * r12 = TLB exception frame in PACA
- * r11 = crap (free to use)
- * r10 = crap (free to use)
- *
- * It can be re-entered by the linear mapping miss handler. However, to
- * avoid too much complication, it will save/restore things for us
- */
-htw_tlb_miss:
-#ifdef CONFIG_PPC_KUAP
-	mfspr	r10,SPRN_MAS1
-	rlwinm.	r10,r10,0,0x3fff0000
-	beq-	htw_tlb_miss_fault /* KUAP fault */
-#endif
-	/* Search if we already have a TLB entry for that virtual address, and
-	 * if we do, bail out.
-	 *
-	 * MAS1:IND should be already set based on MAS4
-	 */
-	PPC_TLBSRX_DOT(0,R16)
-	beq	htw_tlb_miss_done
-
-	/* Now, we need to walk the page tables. First check if we are in
-	 * range.
-	 */
-	rldicl.	r10,r16,64-PGTABLE_EADDR_SIZE,PGTABLE_EADDR_SIZE+4
-	bne-	htw_tlb_miss_fault
-
-	/* Get the PGD pointer */
-	cmpldi	cr0,r15,0
-	beq-	htw_tlb_miss_fault
-
-	/* Get to PGD entry */
-	rldicl	r11,r16,64-(PGDIR_SHIFT-3),64-PGD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Get to PUD entry */
-	rldicl	r11,r16,64-(PUD_SHIFT-3),64-PUD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Get to PMD entry */
-	rldicl	r11,r16,64-(PMD_SHIFT-3),64-PMD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Ok, we're all right, we can now create an indirect entry for
-	 * a 1M or 256M page.
-	 *
-	 * The last trick is now that because we use "half" pages for
-	 * the HTW (1M IND is 2K and 256M IND is 32K) we need to account
-	 * for an added LSB bit to the RPN. For 64K pages, there is no
-	 * problem as we already use 32K arrays (half PTE pages), but for
-	 * 4K page we need to extract a bit from the virtual address and
-	 * insert it into the "PA52" bit of the RPN.
-	 */
-	rlwimi	r15,r16,32-9,20,20
-	/* Now we build the MAS:
-	 *
-	 * MAS 0   :	Fully setup with defaults in MAS4 and TLBnCFG
-	 * MAS 1   :	Almost fully setup
-	 *               - PID already updated by caller if necessary
-	 *               - TSIZE for now is base ind page size always
-	 * MAS 2   :	Use defaults
-	 * MAS 3+7 :	Needs to be done
-	 */
-	ori	r10,r15,(BOOK3E_PAGESZ_4K << MAS3_SPSIZE_SHIFT)
-
-	srdi	r16,r10,32
-	mtspr	SPRN_MAS3,r10
-	mtspr	SPRN_MAS7,r16
-
-	tlbwe
-
-htw_tlb_miss_done:
-	/* We don't bother with restoring DEAR or ESR since we know we are
-	 * level 0 and just going back to userland. They are only needed
-	 * if you are going to take an access fault
-	 */
-	TLB_MISS_EPILOG_SUCCESS
-	rfi
-
-htw_tlb_miss_fault:
-	/* We need to check if it was an instruction miss. We know this
-	 * though because r14 would contain -1
-	 */
-	cmpdi	cr0,r14,-1
-	beq	1f
-	mtspr	SPRN_DEAR,r16
-	mtspr	SPRN_ESR,r14
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-1:	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
 /*
  * This is the guts of "any" level TLB miss handler for kernel linear
  * mapping misses. We are entered with:
-- 
2.44.0

