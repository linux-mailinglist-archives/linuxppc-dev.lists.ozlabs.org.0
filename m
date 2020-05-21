Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A101DD463
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:30:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sc7z2VWmzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:30:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SbPP6PWczDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 02:56:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49SbNd5ttNz9v0q3;
 Thu, 21 May 2020 18:56:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jcERMmJqSzRy; Thu, 21 May 2020 18:56:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49SbNd57TJz9v0pY;
 Thu, 21 May 2020 18:56:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C0958B7DB;
 Thu, 21 May 2020 18:56:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UF0oZYlxDyeR; Thu, 21 May 2020 18:56:03 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5BB88B778;
 Thu, 21 May 2020 18:56:03 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9501A65A53; Thu, 21 May 2020 16:56:03 +0000 (UTC)
Message-Id: <7f330e971952abb2645fb9ca4310c0f527e84dcb.1590079969.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1590079968.git.christophe.leroy@csgroup.eu>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 12/13] powerpc/40x: Avoid using r12 in TLB miss handlers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Thu, 21 May 2020 16:56:03 +0000 (UTC)
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

From: Christophe Leroy <christophe.leroy@c-s.fr>

Let's reduce the number of registers used in TLB miss handlers.

We have both r9 and r12 available for any temporary use.

r9 is enough, avoid using r12.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_40x.S | 70 ++++++++++++++++------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 75238897093d..b584e81f6d19 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -255,9 +255,9 @@ _ENTRY(saved_ksp_limit)
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
 	mfcr	r11
-	mfspr	r12, SPRN_PID
+	mfspr	r9, SPRN_PID
 	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
+	mtspr	SPRN_SPRG_SCRATCH5, r9
 	mfspr	r10, SPRN_DEAR		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
@@ -280,12 +280,12 @@ _ENTRY(saved_ksp_limit)
 4:
 	tophys(r11, r11)
 	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r12, 0(r11)		/* Get L1 entry */
-	andi.	r9, r12, _PMD_PRESENT	/* Check if it points to a PTE page */
+	lwz	r11, 0(r11)		/* Get L1 entry */
+	andi.	r9, r11, _PMD_PRESENT	/* Check if it points to a PTE page */
 	beq	2f			/* Bail if no table */
 
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
+	rlwimi	r11, r10, 22, 20, 29	/* Compute PTE address */
+	lwz	r11, 0(r11)		/* Get Linux PTE */
 #ifdef CONFIG_SWAP
 	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED
 #else
@@ -301,13 +301,13 @@ _ENTRY(saved_ksp_limit)
 	/* Create TLB tag.  This is the faulting address plus a static
 	 * set of bits.  These are size, valid, E, U0.
 	*/
-	li	r12, 0x00c0
-	rlwimi	r10, r12, 0, 20, 31
+	li	r9, 0x00c0
+	rlwimi	r10, r9, 0, 20, 31
 
 	b	finish_tlb_load
 
 2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r12, 2, 22, 24
+	rlwinm.	r9, r11, 2, 22, 24
 	beq	5f
 
 	/* Create TLB tag.  This is the faulting address, plus a static
@@ -315,7 +315,6 @@ _ENTRY(saved_ksp_limit)
 	 */
 	ori	r9, r9, 0x40
 	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
 
 	b	finish_tlb_load
 
@@ -323,9 +322,9 @@ _ENTRY(saved_ksp_limit)
 	/* The bailout.  Restore registers to pre-exception conditions
 	 * and call the heavyweights to help us out.
 	 */
-	mfspr	r12, SPRN_SPRG_SCRATCH5
+	mfspr	r9, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
+	mtspr	SPRN_PID, r9
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
@@ -343,9 +342,9 @@ _ENTRY(saved_ksp_limit)
 	mtspr	SPRN_SPRG_SCRATCH3, r12
 	mtspr	SPRN_SPRG_SCRATCH4, r9
 	mfcr	r11
-	mfspr	r12, SPRN_PID
+	mfspr	r9, SPRN_PID
 	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH5, r12
+	mtspr	SPRN_SPRG_SCRATCH5, r9
 	mfspr	r10, SPRN_SRR0		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
@@ -368,12 +367,12 @@ _ENTRY(saved_ksp_limit)
 4:
 	tophys(r11, r11)
 	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r12, 0(r11)		/* Get L1 entry */
-	andi.	r9, r12, _PMD_PRESENT	/* Check if it points to a PTE page */
+	lwz	r11, 0(r11)		/* Get L1 entry */
+	andi.	r9, r11, _PMD_PRESENT	/* Check if it points to a PTE page */
 	beq	2f			/* Bail if no table */
 
-	rlwimi	r12, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r12)		/* Get Linux PTE */
+	rlwimi	r11, r10, 22, 20, 29	/* Compute PTE address */
+	lwz	r11, 0(r11)		/* Get Linux PTE */
 #ifdef CONFIG_SWAP
 	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 #else
@@ -389,13 +388,13 @@ _ENTRY(saved_ksp_limit)
 	/* Create TLB tag.  This is the faulting address plus a static
 	 * set of bits.  These are size, valid, E, U0.
 	*/
-	li	r12, 0x00c0
-	rlwimi	r10, r12, 0, 20, 31
+	li	r9, 0x00c0
+	rlwimi	r10, r9, 0, 20, 31
 
 	b	finish_tlb_load
 
 2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r12, 2, 22, 24
+	rlwinm.	r9, r11, 2, 22, 24
 	beq	5f
 
 	/* Create TLB tag.  This is the faulting address, plus a static
@@ -403,7 +402,6 @@ _ENTRY(saved_ksp_limit)
 	 */
 	ori	r9, r9, 0x40
 	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
 
 	b	finish_tlb_load
 
@@ -411,9 +409,9 @@ _ENTRY(saved_ksp_limit)
 	/* The bailout.  Restore registers to pre-exception conditions
 	 * and call the heavyweights to help us out.
 	 */
-	mfspr	r12, SPRN_SPRG_SCRATCH5
+	mfspr	r9, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
+	mtspr	SPRN_PID, r9
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
@@ -529,7 +527,7 @@ WDTException:
 	 * miss get to this point to load the TLB.
 	 * 	r10 - TLB_TAG value
 	 * 	r11 - Linux PTE
-	 *	r12, r9 - available to use
+	 *	r9 - available to use
 	 *	PID - loaded with proper value when we get here
 	 *	Upon exit, we reload everything and RFI.
 	 * Actually, it will fit now, but oh well.....a common place
@@ -538,30 +536,28 @@ WDTException:
 tlb_4xx_index:
 	.long	0
 finish_tlb_load:
-	/* load the next available TLB index.
-	*/
-	lwz	r9, tlb_4xx_index@l(0)
-	addi	r9, r9, 1
-	andi.	r9, r9, (PPC40X_TLB_SIZE-1)
-	stw	r9, tlb_4xx_index@l(0)
-
-6:
 	/*
 	 * Clear out the software-only bits in the PTE to generate the
 	 * TLB_DATA value.  These are the bottom 2 bits of the RPM, the
 	 * top 3 bits of the zone field, and M.
 	 */
-	li	r12, 0x0ce2
-	andc	r11, r11, r12
+	li	r9, 0x0ce2
+	andc	r11, r11, r9
+
+	/* load the next available TLB index. */
+	lwz	r9, tlb_4xx_index@l(0)
+	addi	r9, r9, 1
+	andi.	r9, r9, PPC40X_TLB_SIZE - 1
+	stw	r9, tlb_4xx_index@l(0)
 
 	tlbwe	r11, r9, TLB_DATA		/* Load TLB LO */
 	tlbwe	r10, r9, TLB_TAG		/* Load TLB HI */
 
 	/* Done...restore registers and get out of here.
 	*/
-	mfspr	r12, SPRN_SPRG_SCRATCH5
+	mfspr	r9, SPRN_SPRG_SCRATCH5
 	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mtspr	SPRN_PID, r12
+	mtspr	SPRN_PID, r9
 	mtcr	r11
 	mfspr	r9, SPRN_SPRG_SCRATCH4
 	mfspr	r12, SPRN_SPRG_SCRATCH3
-- 
2.25.0

