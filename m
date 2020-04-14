Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D00991A7665
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:47:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fJP1Q9CzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:47:49 +1000 (AEST)
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
 header.s=mail header.b=j9MwsfIH; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgm45kYzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgh4HZgz9tydb;
 Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=j9MwsfIH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id c9dJ3zgKXtqA; Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgh3FwMz9tydZ;
 Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852368; bh=RUmmSE4SKMielW2ISC19QNrNt3/ueQMF3PWOzmpD06c=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=j9MwsfIH3nWFE1igjBKZgdgskNriih7bxaDuDyM89cbEDpWdtXtdLJYust9+y/OPY
 MiP+kBziU0Dtdi80yXmukkcFigoi8luWhId5E807VKnUmPv/VFQS32AIkOn3s/MA6Q
 /6NT+MQ2NxLgWVCwhLZZDsGes0f4w/+elan4xP8A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68CA68B797;
 Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8bWpocRHmh1z; Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 128708B796;
 Tue, 14 Apr 2020 10:19:29 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id D96B26578A; Tue, 14 Apr 2020 08:19:28 +0000 (UTC)
Message-Id: <fbf530f7a8f6b709b34826f8906d6b7a4773abee.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 12/13] powerpc/40x: Avoid using r12 in TLB miss handlers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:28 +0000 (UTC)
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

Let's reduce the number of registers used in TLB miss handlers.

We have both r9 and r12 available for any temporary use.

r9 is enough, avoid using r12.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_40x.S | 70 ++++++++++++++++------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index afa93a36437b..804cbd0899ac 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -254,9 +254,9 @@ _ENTRY(saved_ksp_limit)
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
@@ -279,12 +279,12 @@ _ENTRY(saved_ksp_limit)
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
@@ -300,13 +300,13 @@ _ENTRY(saved_ksp_limit)
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
@@ -314,7 +314,6 @@ _ENTRY(saved_ksp_limit)
 	 */
 	ori	r9, r9, 0x40
 	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
 
 	b	finish_tlb_load
 
@@ -322,9 +321,9 @@ _ENTRY(saved_ksp_limit)
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
@@ -342,9 +341,9 @@ _ENTRY(saved_ksp_limit)
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
@@ -367,12 +366,12 @@ _ENTRY(saved_ksp_limit)
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
@@ -388,13 +387,13 @@ _ENTRY(saved_ksp_limit)
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
@@ -402,7 +401,6 @@ _ENTRY(saved_ksp_limit)
 	 */
 	ori	r9, r9, 0x40
 	rlwimi	r10, r9, 0, 20, 31
-	mr	r11, r12
 
 	b	finish_tlb_load
 
@@ -410,9 +408,9 @@ _ENTRY(saved_ksp_limit)
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
@@ -528,7 +526,7 @@ WDTException:
 	 * miss get to this point to load the TLB.
 	 * 	r10 - TLB_TAG value
 	 * 	r11 - Linux PTE
-	 *	r12, r9 - available to use
+	 *	r9 - available to use
 	 *	PID - loaded with proper value when we get here
 	 *	Upon exit, we reload everything and RFI.
 	 * Actually, it will fit now, but oh well.....a common place
@@ -537,30 +535,28 @@ WDTException:
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

