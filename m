Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37622C714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:52:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrHf4gvbzF0x1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqW91cdHzF0gv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ek/Mf3Az; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqW83mh7z9sTC; Fri, 24 Jul 2020 23:17:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqW81JjKz9sSy; Fri, 24 Jul 2020 23:17:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596660;
 bh=Ejta180xqvafy4EU3Jr1fAFNrMTUzD0Axk6TR/04XGg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ek/Mf3Az27UfyoLoINJ/rveNdG7DNSf33uNSggME/Yd0LEGiv7N0iXq4fxkrbf8wf
 wLjI2IE9OfpJoQdAA9o9DY+Ucdaox1EOnq3vjcFpZqr+BBFfwCzBB/ZAtExOj8tv6m
 V9RlNS9DHVsKYYEQjttJJZfFP7LLSGSCOZanEyghlkEbDY4WoCyW/sumCubaLHQm76
 /hAC2Lzf9fDLt1Z8rVO0kos4Rsr49YQo+XjxN0THZHJE41k6cwkR0R9xAMlmkiUMk/
 YcZVElBP20BZ+5frdgK3feoclbKBhXRvuY7wsC0Yhej4eAyMISzFdKU+vFKj03y/cA
 d/xKlU/kKK1nw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 4/9] powerpc/64e: Drop dead BOOK3E_MMU_TLB_STATS code
Date: Fri, 24 Jul 2020 23:17:23 +1000
Message-Id: <20200724131728.1643966-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This code was merged 11 years ago in commit 13363ab9b9d0 ("powerpc:
Add definitions used by exception handling on 64-bit Book3E") but was
never able to be built because CONFIG_BOOK3E_MMU_TLB_STATS never
existed. Remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/exception-64e.h | 53 +-----------------------
 arch/powerpc/mm/nohash/tlb_low_64e.S     | 47 ++-------------------
 2 files changed, 4 insertions(+), 96 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64e.h b/arch/powerpc/include/asm/exception-64e.h
index 72b6657acd2d..40cdcb2fb057 100644
--- a/arch/powerpc/include/asm/exception-64e.h
+++ b/arch/powerpc/include/asm/exception-64e.h
@@ -66,14 +66,7 @@
 #define EX_TLB_SRR0	(10 * 8)
 #define EX_TLB_SRR1	(11 * 8)
 #define EX_TLB_R7	(12 * 8)
-#ifdef CONFIG_BOOK3E_MMU_TLB_STATS
-#define EX_TLB_R8	(13 * 8)
-#define EX_TLB_R9	(14 * 8)
-#define EX_TLB_LR	(15 * 8)
-#define EX_TLB_SIZE	(16 * 8)
-#else
 #define EX_TLB_SIZE	(13 * 8)
-#endif
 
 #define	START_EXCEPTION(label)						\
 	.globl exc_##label##_book3e;					\
@@ -110,8 +103,7 @@ exc_##label##_book3e:
 	std	r11,EX_TLB_R12(r12);					    \
 	mtspr	SPRN_SPRG_TLB_EXFRAME,r14;				    \
 	std	r15,EX_TLB_SRR1(r12);					    \
-	std	r16,EX_TLB_SRR0(r12);					    \
-	TLB_MISS_PROLOG_STATS
+	std	r16,EX_TLB_SRR0(r12);
 
 /* And these are the matching epilogs that restores things
  *
@@ -143,7 +135,6 @@ exc_##label##_book3e:
 	mtspr	SPRN_SRR0,r15;						    \
 	ld	r15,EX_TLB_R15(r12);					    \
 	mtspr	SPRN_SRR1,r16;						    \
-	TLB_MISS_RESTORE_STATS						    \
 	ld	r16,EX_TLB_R16(r12);					    \
 	ld	r12,EX_TLB_R12(r12);					    \
 
@@ -158,48 +149,6 @@ exc_##label##_book3e:
 	addi	r11,r13,PACA_EXTLB;					    \
 	TLB_MISS_RESTORE(r11)
 
-#ifdef CONFIG_BOOK3E_MMU_TLB_STATS
-#define TLB_MISS_PROLOG_STATS						    \
-	mflr	r10;							    \
-	std	r8,EX_TLB_R8(r12);					    \
-	std	r9,EX_TLB_R9(r12);					    \
-	std	r10,EX_TLB_LR(r12);
-#define TLB_MISS_RESTORE_STATS					            \
-	ld	r16,EX_TLB_LR(r12);					    \
-	ld	r9,EX_TLB_R9(r12);					    \
-	ld	r8,EX_TLB_R8(r12);					    \
-	mtlr	r16;
-#define TLB_MISS_STATS_D(name)						    \
-	addi	r9,r13,MMSTAT_DSTATS+name;				    \
-	bl	tlb_stat_inc;
-#define TLB_MISS_STATS_I(name)						    \
-	addi	r9,r13,MMSTAT_ISTATS+name;				    \
-	bl	tlb_stat_inc;
-#define TLB_MISS_STATS_X(name)						    \
-	ld	r8,PACA_EXTLB+EX_TLB_ESR(r13);				    \
-	cmpdi	cr2,r8,-1;						    \
-	beq	cr2,61f;						    \
-	addi	r9,r13,MMSTAT_DSTATS+name;				    \
-	b	62f;							    \
-61:	addi	r9,r13,MMSTAT_ISTATS+name;				    \
-62:	bl	tlb_stat_inc;
-#define TLB_MISS_STATS_SAVE_INFO					    \
-	std	r14,EX_TLB_ESR(r12);	/* save ESR */
-#define TLB_MISS_STATS_SAVE_INFO_BOLTED					    \
-	std	r14,PACA_EXTLB+EX_TLB_ESR(r13);	/* save ESR */
-#else
-#define TLB_MISS_PROLOG_STATS
-#define TLB_MISS_RESTORE_STATS
-#define TLB_MISS_PROLOG_STATS_BOLTED
-#define TLB_MISS_RESTORE_STATS_BOLTED
-#define TLB_MISS_STATS_D(name)
-#define TLB_MISS_STATS_I(name)
-#define TLB_MISS_STATS_X(name)
-#define TLB_MISS_STATS_Y(name)
-#define TLB_MISS_STATS_SAVE_INFO
-#define TLB_MISS_STATS_SAVE_INFO_BOLTED
-#endif
-
 #define SET_IVOR(vector_number, vector_offset)	\
 	LOAD_REG_ADDR(r3,interrupt_base_book3e);\
 	ori	r3,r3,vector_offset@l;		\
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index d5e2704d0096..bf24451f3e71 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -71,7 +71,6 @@ START_BTB_FLUSH_SECTION
 END_BTB_FLUSH_SECTION
 	std	r7,EX_TLB_R7(r12)
 #endif
-	TLB_MISS_PROLOG_STATS
 .endm
 
 .macro tlb_epilog_bolted
@@ -85,7 +84,6 @@ END_BTB_FLUSH_SECTION
 	mtcr	r14
 	ld	r14,EX_TLB_R14(r12)
 	ld	r15,EX_TLB_R15(r12)
-	TLB_MISS_RESTORE_STATS
 	ld	r16,EX_TLB_R16(r12)
 	mfspr	r12,SPRN_SPRG_GEN_SCRATCH
 .endm
@@ -128,7 +126,6 @@ END_BTB_FLUSH_SECTION
 	ori	r10,r10,_PAGE_PRESENT
 	oris	r11,r10,_PAGE_ACCESSED@h
 
-	TLB_MISS_STATS_SAVE_INFO_BOLTED
 	bne	tlb_miss_kernel_bolted
 
 tlb_miss_common_bolted:
@@ -209,7 +206,6 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 	tlbwe
 
 tlb_miss_done_bolted:
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_NORM_OK)
 	tlb_epilog_bolted
 	rfi
 
@@ -229,11 +225,9 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 	andi.	r10,r11,_PAGE_EXEC|_PAGE_BAP_SX
 	bne	itlb_miss_fault_bolted
 dtlb_miss_fault_bolted:
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_NORM_FAULT)
 	tlb_epilog_bolted
 	b	exc_data_storage_book3e
 itlb_miss_fault_bolted:
-	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_NORM_FAULT)
 	tlb_epilog_bolted
 	b	exc_instruction_storage_book3e
 
@@ -243,7 +237,6 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 
 	rldicl.	r10,r16,64-PGTABLE_EADDR_SIZE,PGTABLE_EADDR_SIZE+4
 	srdi	r15,r16,60		/* get region */
-	TLB_MISS_STATS_SAVE_INFO_BOLTED
 	bne-	itlb_miss_fault_bolted
 
 	li	r11,_PAGE_PRESENT|_PAGE_EXEC	/* Base perm */
@@ -276,7 +269,6 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 	srdi.	r15,r16,60		/* get region */
 	ori	r16,r16,1
 
-	TLB_MISS_STATS_SAVE_INFO_BOLTED
 	bne	tlb_miss_kernel_e6500	/* user/kernel test */
 
 	b	tlb_miss_common_e6500
@@ -288,7 +280,6 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_USE_TLBRSRV)
 	srdi.	r15,r16,60		/* get region */
 	rldicr	r16,r16,0,62
 
-	TLB_MISS_STATS_SAVE_INFO_BOLTED
 	bne	tlb_miss_kernel_e6500	/* user vs kernel check */
 
 /*
@@ -460,7 +451,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	.endm
 
 	tlb_unlock_e6500
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_NORM_OK)
 	tlb_epilog_bolted
 	rfi
 
@@ -519,11 +509,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	andi.	r16,r16,1
 	bne	itlb_miss_fault_e6500
 dtlb_miss_fault_e6500:
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_NORM_FAULT)
 	tlb_epilog_bolted
 	b	exc_data_storage_book3e
 itlb_miss_fault_e6500:
-	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_NORM_FAULT)
 	tlb_epilog_bolted
 	b	exc_instruction_storage_book3e
 #endif /* CONFIG_PPC_FSL_BOOK3E */
@@ -548,7 +536,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	mfspr	r16,SPRN_DEAR		/* get faulting address */
 	srdi	r15,r16,60		/* get region */
 	cmpldi	cr0,r15,0xc		/* linear mapping ? */
-	TLB_MISS_STATS_SAVE_INFO
 	beq	tlb_load_linear		/* yes -> go to linear map load */
 
 	/* The page tables are mapped virtually linear. At this point, though,
@@ -600,7 +587,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	/* We got a crappy address, just fault with whatever DEAR and ESR
 	 * are here
 	 */
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_NORM_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
 
@@ -624,7 +610,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	 */
 	srdi	r15,r16,60		/* get region */
 	cmpldi	cr0,r15,0xc		/* linear mapping ? */
-	TLB_MISS_STATS_SAVE_INFO
 	beq	tlb_load_linear		/* yes -> go to linear map load */
 
 	/* We do the user/kernel test for the PID here along with the RW test
@@ -646,7 +631,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SMT)
 	beq+	normal_tlb_miss
 
 	/* We got a crappy address, just fault */
-	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_NORM_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_instruction_storage_book3e
 
@@ -745,7 +729,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	 * level 0 and just going back to userland. They are only needed
 	 * if you are going to take an access fault
 	 */
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_NORM_OK)
 	TLB_MISS_EPILOG_SUCCESS
 	rfi
 
@@ -757,11 +740,9 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	ld	r15,EX_TLB_ESR(r12)
 	mtspr	SPRN_DEAR,r14
 	mtspr	SPRN_ESR,r15
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_NORM_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
-1:	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_NORM_FAULT)
-	TLB_MISS_EPILOG_ERROR
+1:	TLB_MISS_EPILOG_ERROR
 	b	exc_instruction_storage_book3e
 
 
@@ -899,7 +880,6 @@ BEGIN_MMU_FTR_SECTION
 1:
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	/* Return to caller, normal case */
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_PT_OK);
 	TLB_MISS_EPILOG_SUCCESS
 	rfi
 
@@ -935,18 +915,15 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	beq	1f
 	mtspr	SPRN_DEAR,r15
 	mtspr	SPRN_ESR,r16
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_PT_FAULT);
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
-1:	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_PT_FAULT);
-	TLB_MISS_EPILOG_ERROR
+1:	TLB_MISS_EPILOG_ERROR
 	b	exc_instruction_storage_book3e
 
 virt_page_table_tlb_miss_whacko_fault:
 	/* The linear fault will restart everything so ESR and DEAR will
 	 * not have been clobbered, let's just fault with what we have
 	 */
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_PT_FAULT);
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
 
@@ -971,7 +948,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	mfspr	r16,SPRN_DEAR		/* get faulting address */
 	srdi	r11,r16,60		/* get region */
 	cmpldi	cr0,r11,0xc		/* linear mapping ? */
-	TLB_MISS_STATS_SAVE_INFO
 	beq	tlb_load_linear		/* yes -> go to linear map load */
 
 	/* We do the user/kernel test for the PID here along with the RW test
@@ -991,7 +967,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	/* We got a crappy address, just fault with whatever DEAR and ESR
 	 * are here
 	 */
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_NORM_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
 
@@ -1015,7 +990,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	 */
 	srdi	r11,r16,60		/* get region */
 	cmpldi	cr0,r11,0xc		/* linear mapping ? */
-	TLB_MISS_STATS_SAVE_INFO
 	beq	tlb_load_linear		/* yes -> go to linear map load */
 
 	/* We do the user/kernel test for the PID here along with the RW test
@@ -1033,7 +1007,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_TLBRSRV)
 	beq+	htw_tlb_miss
 
 	/* We got a crappy address, just fault */
-	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_NORM_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_instruction_storage_book3e
 
@@ -1130,7 +1103,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	 * level 0 and just going back to userland. They are only needed
 	 * if you are going to take an access fault
 	 */
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_PT_OK)
 	TLB_MISS_EPILOG_SUCCESS
 	rfi
 
@@ -1142,11 +1114,9 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	beq	1f
 	mtspr	SPRN_DEAR,r16
 	mtspr	SPRN_ESR,r14
-	TLB_MISS_STATS_D(MMSTAT_TLB_MISS_PT_FAULT)
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
-1:	TLB_MISS_STATS_I(MMSTAT_TLB_MISS_PT_FAULT)
-	TLB_MISS_EPILOG_ERROR
+1:	TLB_MISS_EPILOG_ERROR
 	b	exc_instruction_storage_book3e
 
 /*
@@ -1221,7 +1191,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	 * We do that because we can't resume a fault within a TLB
 	 * miss handler, due to MAS and TLB reservation being clobbered.
 	 */
-	TLB_MISS_STATS_X(MMSTAT_TLB_MISS_LINEAR)
 	TLB_MISS_EPILOG_ERROR
 	rfi
 
@@ -1233,13 +1202,3 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_USE_PAIRED_MAS)
 	b	exc_data_storage_book3e
 1:	TLB_MISS_EPILOG_ERROR_SPECIAL
 	b	exc_instruction_storage_book3e
-
-
-#ifdef CONFIG_BOOK3E_MMU_TLB_STATS
-.tlb_stat_inc:
-1:	ldarx	r8,0,r9
-	addi	r8,r8,1
-	stdcx.	r8,0,r9
-	bne-	1b
-	blr
-#endif
-- 
2.25.1

