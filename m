Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16AC9150BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79nh1tK5z3gFk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79lD6YHSz3dBw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:46:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79kj3ltVz9vFr;
	Mon, 24 Jun 2024 16:46:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2KJpFLGq-0D; Mon, 24 Jun 2024 16:46:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79kd6q9Mz9vFM;
	Mon, 24 Jun 2024 16:46:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E60548B766;
	Mon, 24 Jun 2024 16:46:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v1BSFr7pa7lq; Mon, 24 Jun 2024 16:46:01 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5807A8B768;
	Mon, 24 Jun 2024 16:46:01 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 06/23] powerpc/64e: Drop unused TLB miss handlers
Date: Mon, 24 Jun 2024 16:45:32 +0200
Message-ID: <ffad840cc73250b896ef14134a33232e361c8d73.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240333; l=10062; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Glt8MetGkZpHonWm+UTOTXuByxTy4QiXsMnaTdX/Gdg=; b=H7CfONgdaNilDSI2eCg+4cNaJoX0thnvpd3g206odCfttGRe0KD6V1wDs7Xeyl7kRZDp5RGz6 g1kFBU0C+XbBw2BYwRPzxrWX6E0sGwR/bkH23b72GnqxbyKOrUFNGWY
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

There are two possibilities for book3e_htw_mode, PPC_HTW_E6500 or
PPC_HTW_NONE.

The TLB miss handlers are patched to use, respectively:
  - exc_[data|indstruction]_tlb_miss_e6500_book3e
  - exc_[data|indstruction]_tlb_miss_bolted_book3e

Which means the default handlers are never used. Remove those, and use
the bolted handlers (PPC_HTW_NONE) by default.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/exceptions-64e.S |   4 +-
 arch/powerpc/mm/nohash/tlb_64e.c     |   4 -
 arch/powerpc/mm/nohash/tlb_low_64e.S | 226 ---------------------------
 3 files changed, 2 insertions(+), 232 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index dcf0591ad3c2..63f6b9f513a4 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -485,8 +485,8 @@ interrupt_base_book3e:					/* fake trap */
 	EXCEPTION_STUB(0x160, decrementer)		/* 0x0900 */
 	EXCEPTION_STUB(0x180, fixed_interval)		/* 0x0980 */
 	EXCEPTION_STUB(0x1a0, watchdog)			/* 0x09f0 */
-	EXCEPTION_STUB(0x1c0, data_tlb_miss)
-	EXCEPTION_STUB(0x1e0, instruction_tlb_miss)
+	EXCEPTION_STUB(0x1c0, data_tlb_miss_bolted)
+	EXCEPTION_STUB(0x1e0, instruction_tlb_miss_bolted)
 	EXCEPTION_STUB(0x200, altivec_unavailable)
 	EXCEPTION_STUB(0x220, altivec_assist)
 	EXCEPTION_STUB(0x260, perfmon)
diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index d83ecf466929..053128a5636c 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -244,10 +244,6 @@ static void __init early_init_mmu_global(void)
 		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
 		patch_exception(0x1e0, exc_instruction_tlb_miss_e6500_book3e);
 		break;
-	case PPC_HTW_NONE:
-		patch_exception(0x1c0, exc_data_tlb_miss_bolted_book3e);
-		patch_exception(0x1e0, exc_instruction_tlb_miss_bolted_book3e);
-		break;
 	}
 
 	pr_info("MMU: Book3E HW tablewalk %s\n",
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index b0eb3f7eaed1..a54e7d6c3d0b 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -511,232 +511,6 @@ itlb_miss_fault_e6500:
 	tlb_epilog_bolted
 	b	exc_instruction_storage_book3e
 
-/**********************************************************************
- *                                                                    *
- * TLB miss handling for Book3E with TLB reservation and HES support  *
- *                                                                    *
- **********************************************************************/
-
-
-/* Data TLB miss */
-	START_EXCEPTION(data_tlb_miss)
-	TLB_MISS_PROLOG
-
-	/* Now we handle the fault proper. We only save DEAR in normal
-	 * fault case since that's the only interesting values here.
-	 * We could probably also optimize by not saving SRR0/1 in the
-	 * linear mapping case but I'll leave that for later
-	 */
-	mfspr	r14,SPRN_ESR
-	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r15,r16,44		/* get region */
-	xoris	r15,r15,0xc
-	cmpldi	cr0,r15,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
-
-	/* The page tables are mapped virtually linear. At this point, though,
-	 * we don't know whether we are trying to fault in a first level
-	 * virtual address or a virtual page table address. We can get that
-	 * from bit 0x1 of the region ID which we have set for a page table
-	 */
-	andis.	r10,r15,0x1
-	bne-	virt_page_table_tlb_miss
-
-	std	r14,EX_TLB_ESR(r12);	/* save ESR */
-	std	r16,EX_TLB_DEAR(r12);	/* save DEAR */
-
-	 /* We need _PAGE_PRESENT and  _PAGE_ACCESSED set */
-	li	r11,_PAGE_PRESENT
-	oris	r11,r11,_PAGE_ACCESSED@h
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r15,r16,60		/* Check for user region */
-
-	/* We pre-test some combination of permissions to avoid double
-	 * faults:
-	 *
-	 * We move the ESR:ST bit into the position of _PAGE_BAP_SW in the PTE
-	 * ESR_ST   is 0x00800000
-	 * _PAGE_BAP_SW is 0x00000010
-	 * So the shift is >> 19. This tests for supervisor writeability.
-	 * If the page happens to be supervisor writeable and not user
-	 * writeable, we will take a new fault later, but that should be
-	 * a rare enough case.
-	 *
-	 * We also move ESR_ST in _PAGE_DIRTY position
-	 * _PAGE_DIRTY is 0x00001000 so the shift is >> 11
-	 *
-	 * MAS1 is preset for all we need except for TID that needs to
-	 * be cleared for kernel translations
-	 */
-	rlwimi	r11,r14,32-19,27,27
-	rlwimi	r11,r14,32-16,19,19
-	beq	normal_tlb_miss_user
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1		/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	beq+	cr1,normal_tlb_miss
-
-	/* We got a crappy address, just fault with whatever DEAR and ESR
-	 * are here
-	 */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-
-/* Instruction TLB miss */
-	START_EXCEPTION(instruction_tlb_miss)
-	TLB_MISS_PROLOG
-
-	/* If we take a recursive fault, the second level handler may need
-	 * to know whether we are handling a data or instruction fault in
-	 * order to get to the right store fault handler. We provide that
-	 * info by writing a crazy value in ESR in our exception frame
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
-	srdi	r15,r16,44		/* get region */
-	xoris	r15,r15,0xc
-	cmpldi	cr0,r15,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	li	r11,_PAGE_PRESENT|_PAGE_BAP_UX	/* Base perm */
-	oris	r11,r11,_PAGE_ACCESSED@h
-
-	srdi.	r15,r16,60			/* Check for user region */
-	std	r14,EX_TLB_ESR(r12)		/* write crazy -1 to frame */
-	beq	normal_tlb_miss_user
-
-	li	r11,_PAGE_PRESENT|_PAGE_BAP_SX	/* Base perm */
-	oris	r11,r11,_PAGE_ACCESSED@h
-	/* XXX replace the RMW cycles with immediate loads + writes */
-	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1			/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	beq+	cr1,normal_tlb_miss
-
-	/* We got a crappy address, just fault */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-/*
- * This is the guts of the first-level TLB miss handler for direct
- * misses. We are entered with:
- *
- * r16 = faulting address
- * r15 = region ID
- * r14 = crap (free to use)
- * r13 = PACA
- * r12 = TLB exception frame in PACA
- * r11 = PTE permission mask
- * r10 = crap (free to use)
- */
-normal_tlb_miss_user:
-#ifdef CONFIG_PPC_KUAP
-	mfspr	r14,SPRN_MAS1
-	rlwinm.	r14,r14,0,0x3fff0000
-	beq-	normal_tlb_miss_access_fault /* KUAP fault */
-#endif
-normal_tlb_miss:
-	/* So we first construct the page table address. We do that by
-	 * shifting the bottom of the address (not the region ID) by
-	 * PAGE_SHIFT-3, clearing the bottom 3 bits (get a PTE ptr) and
-	 * or'ing the fourth high bit.
-	 *
-	 * NOTE: For 64K pages, we do things slightly differently in
-	 * order to handle the weird page table format used by linux
-	 */
-	srdi	r15,r16,44
-	oris	r10,r15,0x1
-	rldicl	r14,r16,64-(PAGE_SHIFT-3),PAGE_SHIFT-3+4
-	sldi	r15,r10,44
-	clrrdi	r14,r14,19
-	or	r10,r15,r14
-
-	ld	r14,0(r10)
-
-finish_normal_tlb_miss:
-	/* Check if required permissions are met */
-	andc.	r15,r11,r14
-	bne-	normal_tlb_miss_access_fault
-
-	/* Now we build the MAS:
-	 *
-	 * MAS 0   :	Fully setup with defaults in MAS4 and TLBnCFG
-	 * MAS 1   :	Almost fully setup
-	 *               - PID already updated by caller if necessary
-	 *               - TSIZE need change if !base page size, not
-	 *                 yet implemented for now
-	 * MAS 2   :	Defaults not useful, need to be redone
-	 * MAS 3+7 :	Needs to be done
-	 *
-	 * TODO: mix up code below for better scheduling
-	 */
-	clrrdi	r10,r16,12		/* Clear low crap in EA */
-	rlwimi	r10,r14,32-19,27,31	/* Insert WIMGE */
-	mtspr	SPRN_MAS2,r10
-
-	/* Check page size, if not standard, update MAS1 */
-	rldicl	r10,r14,64-8,64-8
-	cmpldi	cr0,r10,BOOK3E_PAGESZ_4K
-	beq-	1f
-	mfspr	r11,SPRN_MAS1
-	rlwimi	r11,r14,31,21,24
-	rlwinm	r11,r11,0,21,19
-	mtspr	SPRN_MAS1,r11
-1:
-	/* Move RPN in position */
-	rldicr	r11,r14,64-(PTE_RPN_SHIFT-PAGE_SHIFT),63-PAGE_SHIFT
-	clrldi	r15,r11,12		/* Clear crap at the top */
-	rlwimi	r15,r14,32-8,22,25	/* Move in U bits */
-	rlwimi	r15,r14,32-2,26,31	/* Move in BAP bits */
-
-	/* Mask out SW and UW if !DIRTY (XXX optimize this !) */
-	andi.	r11,r14,_PAGE_DIRTY
-	bne	1f
-	li	r11,MAS3_SW|MAS3_UW
-	andc	r15,r15,r11
-1:
-	srdi	r16,r15,32
-	mtspr	SPRN_MAS3,r15
-	mtspr	SPRN_MAS7,r16
-
-	tlbwe
-
-normal_tlb_miss_done:
-	/* We don't bother with restoring DEAR or ESR since we know we are
-	 * level 0 and just going back to userland. They are only needed
-	 * if you are going to take an access fault
-	 */
-	TLB_MISS_EPILOG_SUCCESS
-	rfi
-
-normal_tlb_miss_access_fault:
-	/* We need to check if it was an instruction miss */
-	andi.	r10,r11,_PAGE_BAP_UX
-	bne	1f
-	ld	r14,EX_TLB_DEAR(r12)
-	ld	r15,EX_TLB_ESR(r12)
-	mtspr	SPRN_DEAR,r14
-	mtspr	SPRN_ESR,r15
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-1:	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-
 /*
  * This is the guts of the second-level TLB miss handler for direct
  * misses. We are entered with:
-- 
2.44.0

