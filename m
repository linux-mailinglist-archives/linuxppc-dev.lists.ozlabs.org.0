Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBAC55E585
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSGr57ZZz3fD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSDY5Nlxz3dR9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:49:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LXSD20w20z9tV9;
	Tue, 28 Jun 2022 16:49:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmtXh_qfM3gG; Tue, 28 Jun 2022 16:49:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LXSCy59Zsz9tVB;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93C5A8B788;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xt-MdVA7bk3j; Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.132])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 29DB08B787;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25SEnDQn2928214
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:49:13 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25SEnDXK2928198;
	Tue, 28 Jun 2022 16:49:13 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, dja@axtens.net
Subject: [PATCH v1 4/6] powerpc/64e: Move virtual memory closer to linear memory
Date: Tue, 28 Jun 2022 16:48:57 +0200
Message-Id: <4b225168031449fc34fc7132f3923cc8dc54af60.1656427701.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
References: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656427736; l=8104; s=20211009; h=from:subject:message-id; bh=rLHlD8KkBGgAnEOoljlDdEz+yunGULO/PeDHpayEOqk=; b=pcuy21y/eihMnBI9prpxklfcd/xmg2wfzANO9ltHP9zxCz2pDMkhlUQywHPAoVkrT3wul6E+fZsE hRvlPsaQCHnZX4PxbP3y7/QolECrYgb2MLR1Gwz/MqD4KfrfPFDd
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

Today nohash/64 have linear memory based at 0xc000000000000000 and
virtual memory based at 0x8000000000000000.

In order to implement KASAN, we need to regroup both areas.

Move virtual memmory at 0xc000100000000000.

This complicates a bit TLB miss handlers. Until now, memory region
was easily identified with the 4 higher bits of address:
- 0 ==> User
- c ==> Linear Memory
- 8 ==> Virtual Memory

Now we need to rely on the 20 higher bits, with:
- 0xxxx ==> User
- c0000 ==> Linear Memory
- c0001 ==> Virtual Memory

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
 arch/powerpc/mm/nohash/tlb_low_64e.S         | 64 +++++++++++---------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index db9770995f7c..76a144b58f9b 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -25,7 +25,7 @@
 /*
  * Define the address range of the kernel non-linear virtual area
  */
-#define KERN_VIRT_START ASM_CONST(0x8000000000000000)
+#define KERN_VIRT_START ASM_CONST(0xc000100000000000)
 #define KERN_VIRT_SIZE	ASM_CONST(0x0000100000000000)
 
 /*
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index a59485c549a7..68ffbfdba894 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -213,10 +213,11 @@ itlb_miss_kernel_bolted:
 tlb_miss_kernel_bolted:
 	mfspr	r10,SPRN_MAS1
 	ld	r14,PACA_KERNELPGD(r13)
-	cmpldi	cr0,r15,8		/* Check for vmalloc region */
+	srdi	r15,r16,44		/* get kernel region */
+	andi.	r15,r15,1		/* Check for vmalloc region */
 	rlwinm	r10,r10,0,16,1		/* Clear TID */
 	mtspr	SPRN_MAS1,r10
-	beq+	tlb_miss_common_bolted
+	bne+	tlb_miss_common_bolted
 
 tlb_miss_fault_bolted:
 	/* We need to check if it was an instruction miss */
@@ -498,7 +499,9 @@ tlb_miss_huge_e6500:
 
 tlb_miss_kernel_e6500:
 	ld	r14,PACA_KERNELPGD(r13)
-	cmpldi	cr1,r15,8		/* Check for vmalloc region */
+	srdi	r15,r16,44		/* get kernel region */
+	xoris	r15,r15,0xc		/* Check for vmalloc region */
+	cmplwi	cr1,r15,1
 	beq+	cr1,tlb_miss_common_e6500
 
 tlb_miss_fault_e6500:
@@ -532,16 +535,18 @@ itlb_miss_fault_e6500:
 	 */
 	mfspr	r14,SPRN_ESR
 	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r15,r16,60		/* get region */
-	cmpldi	cr0,r15,0xc		/* linear mapping ? */
+	srdi	r15,r16,44		/* get region */
+	xoris	r15,r15,0xc
+	cmpldi	cr0,r15,0		/* linear mapping ? */
 	beq	tlb_load_linear		/* yes -> go to linear map load */
+	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
 
 	/* The page tables are mapped virtually linear. At this point, though,
 	 * we don't know whether we are trying to fault in a first level
 	 * virtual address or a virtual page table address. We can get that
 	 * from bit 0x1 of the region ID which we have set for a page table
 	 */
-	andi.	r10,r15,0x1
+	andis.	r10,r15,0x1
 	bne-	virt_page_table_tlb_miss
 
 	std	r14,EX_TLB_ESR(r12);	/* save ESR */
@@ -553,7 +558,7 @@ itlb_miss_fault_e6500:
 
 	/* We do the user/kernel test for the PID here along with the RW test
 	 */
-	cmpldi	cr0,r15,0		/* Check for user region */
+	srdi.	r15,r16,60		/* Check for user region */
 
 	/* We pre-test some combination of permissions to avoid double
 	 * faults:
@@ -577,10 +582,9 @@ itlb_miss_fault_e6500:
 	beq	normal_tlb_miss_user
 	/* XXX replace the RMW cycles with immediate loads + writes */
 1:	mfspr	r10,SPRN_MAS1
-	cmpldi	cr0,r15,8		/* Check for vmalloc region */
 	rlwinm	r10,r10,0,16,1		/* Clear TID */
 	mtspr	SPRN_MAS1,r10
-	beq+	normal_tlb_miss
+	beq+	cr1,normal_tlb_miss
 
 	/* We got a crappy address, just fault with whatever DEAR and ESR
 	 * are here
@@ -606,16 +610,18 @@ itlb_miss_fault_e6500:
 	 *
 	 * Faulting address is SRR0 which is already in r16
 	 */
-	srdi	r15,r16,60		/* get region */
-	cmpldi	cr0,r15,0xc		/* linear mapping ? */
+	srdi	r15,r16,44		/* get region */
+	xoris	r15,r15,0xc
+	cmpldi	cr0,r15,0		/* linear mapping ? */
 	beq	tlb_load_linear		/* yes -> go to linear map load */
+	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
 
 	/* We do the user/kernel test for the PID here along with the RW test
 	 */
 	li	r11,_PAGE_PRESENT|_PAGE_BAP_UX	/* Base perm */
 	oris	r11,r11,_PAGE_ACCESSED@h
 
-	cmpldi	cr0,r15,0			/* Check for user region */
+	srdi.	r15,r16,60			/* Check for user region */
 	std	r14,EX_TLB_ESR(r12)		/* write crazy -1 to frame */
 	beq	normal_tlb_miss_user
 
@@ -623,10 +629,9 @@ itlb_miss_fault_e6500:
 	oris	r11,r11,_PAGE_ACCESSED@h
 	/* XXX replace the RMW cycles with immediate loads + writes */
 	mfspr	r10,SPRN_MAS1
-	cmpldi	cr0,r15,8			/* Check for vmalloc region */
 	rlwinm	r10,r10,0,16,1			/* Clear TID */
 	mtspr	SPRN_MAS1,r10
-	beq+	normal_tlb_miss
+	beq+	cr1,normal_tlb_miss
 
 	/* We got a crappy address, just fault */
 	TLB_MISS_EPILOG_ERROR
@@ -659,10 +664,11 @@ normal_tlb_miss:
 	 * NOTE: For 64K pages, we do things slightly differently in
 	 * order to handle the weird page table format used by linux
 	 */
-	ori	r10,r15,0x1
+	srdi	r15,r16,44
+	oris	r10,r15,0x1
 	rldicl	r14,r16,64-(PAGE_SHIFT-3),PAGE_SHIFT-3+4
-	sldi	r15,r10,60
-	clrrdi	r14,r14,3
+	sldi	r15,r10,44
+	clrrdi	r14,r14,19
 	or	r10,r15,r14
 
 	ld	r14,0(r10)
@@ -763,6 +769,7 @@ normal_tlb_miss_access_fault:
  */
 virt_page_table_tlb_miss:
 	/* Are we hitting a kernel page table ? */
+	srdi	r15,r16,60
 	andi.	r10,r15,0x8
 
 	/* The cool thing now is that r10 contains 0 for user and 8 for kernel,
@@ -791,7 +798,8 @@ virt_page_table_tlb_miss:
 	/* Now, we need to walk the page tables. First check if we are in
 	 * range.
 	 */
-	rldicl.	r10,r16,64-(VPTE_INDEX_SIZE+3),VPTE_INDEX_SIZE+3+4
+	rldicl	r10,r16,64-(VPTE_INDEX_SIZE+3),VPTE_INDEX_SIZE+3+4
+	cmpldi	r10,0x80
 	bne-	virt_page_table_tlb_miss_fault
 
 	/* Get the PGD pointer */
@@ -910,23 +918,24 @@ virt_page_table_tlb_miss_whacko_fault:
 	 */
 	mfspr	r14,SPRN_ESR
 	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r11,r16,60		/* get region */
-	cmpldi	cr0,r11,0xc		/* linear mapping ? */
+	srdi	r11,r16,44		/* get region */
+	xoris	r11,r11,0xc
+	cmpldi	cr0,r11,0		/* linear mapping ? */
 	beq	tlb_load_linear		/* yes -> go to linear map load */
+	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
 
 	/* We do the user/kernel test for the PID here along with the RW test
 	 */
-	cmpldi	cr0,r11,0		/* Check for user region */
+	srdi.	r11,r16,60		/* Check for user region */
 	ld	r15,PACAPGD(r13)	/* Load user pgdir */
 	beq	htw_tlb_miss
 
 	/* XXX replace the RMW cycles with immediate loads + writes */
 1:	mfspr	r10,SPRN_MAS1
-	cmpldi	cr0,r11,8		/* Check for vmalloc region */
 	rlwinm	r10,r10,0,16,1		/* Clear TID */
 	mtspr	SPRN_MAS1,r10
 	ld	r15,PACA_KERNELPGD(r13)	/* Load kernel pgdir */
-	beq+	htw_tlb_miss
+	beq+	cr1,htw_tlb_miss
 
 	/* We got a crappy address, just fault with whatever DEAR and ESR
 	 * are here
@@ -952,19 +961,20 @@ virt_page_table_tlb_miss_whacko_fault:
 	 *
 	 * Faulting address is SRR0 which is already in r16
 	 */
-	srdi	r11,r16,60		/* get region */
-	cmpldi	cr0,r11,0xc		/* linear mapping ? */
+	srdi	r11,r16,44		/* get region */
+	xoris	r11,r11,0xc
+	cmpldi	cr0,r11,0		/* linear mapping ? */
 	beq	tlb_load_linear		/* yes -> go to linear map load */
+	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
 
 	/* We do the user/kernel test for the PID here along with the RW test
 	 */
-	cmpldi	cr0,r11,0			/* Check for user region */
+	srdi.	r11,r16,60		/* Check for user region */
 	ld	r15,PACAPGD(r13)		/* Load user pgdir */
 	beq	htw_tlb_miss
 
 	/* XXX replace the RMW cycles with immediate loads + writes */
 1:	mfspr	r10,SPRN_MAS1
-	cmpldi	cr0,r11,8			/* Check for vmalloc region */
 	rlwinm	r10,r10,0,16,1			/* Clear TID */
 	mtspr	SPRN_MAS1,r10
 	ld	r15,PACA_KERNELPGD(r13)		/* Load kernel pgdir */
-- 
2.36.1

