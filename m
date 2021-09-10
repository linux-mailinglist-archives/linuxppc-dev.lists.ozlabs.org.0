Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF02406360
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5HHv4JYsz3gdB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:46:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WT9GgR61;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WT9GgR61; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Gnk2gZkz3ddX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:23:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33A68610A3;
 Fri, 10 Sep 2021 00:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233432;
 bh=gkjgP4MYAeE7b0A123y5qfFKZ9QrC/zjuy0A+ylCK+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WT9GgR61oRT17yLQBAbUspkhXt80sQ/k7KiWymz8+r5nqNgdTH1ymXngenAQNBFPL
 02RgaGriAqCBv3vZDnll9y1M1EO1xjQpcOaQJllh2gQr9smqXw3Pbc+9q/oznWlKZI
 awmilQH0TtNCj4XXhDryfeoGUUTn6+qNRpfG+Gfi0ITCPEGSY6IFhHdwr1dW4fphBK
 YX62KjPwbTypD6bKmeQc5dHrLpK4diYHe3UWCaA+7fzyh2z8P3R4TyvR7L2MZP+K5E
 0ePcQzMvYeQn11OBsjAKgHcS4Wg2gcCIuxu2caV5NqtmjW37Uc1GwkSu77RMQC87rJ
 FuQSnfPOE8oZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 10/17] powerpc/booke: Avoid link stack corruption
 in several places
Date: Thu,  9 Sep 2021 20:23:31 -0400
Message-Id: <20210910002338.176677-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002338.176677-1-sashal@kernel.org>
References: <20210910002338.176677-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit f5007dbf4da729baa850b33a64dc3cc53757bdf8 ]

Use bcl 20,31,+4 instead of bl in order to preserve link stack.

See commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
in __get_datapage()") for details.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/e9fbc285eceb720e6c0e032ef47fe8b05f669b48.1629791751.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/ppc_asm.h            | 2 +-
 arch/powerpc/kernel/exceptions-64e.S          | 6 +++---
 arch/powerpc/kernel/fsl_booke_entry_mapping.S | 8 ++++----
 arch/powerpc/kernel/head_44x.S                | 6 +++---
 arch/powerpc/kernel/head_fsl_booke.S          | 6 +++---
 arch/powerpc/mm/tlb_nohash_low.S              | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index bbd35ba36a22..10ea87f7a718 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -305,7 +305,7 @@ GLUE(.,name):
 
 /* Be careful, this will clobber the lr register. */
 #define LOAD_REG_ADDR_PIC(reg, name)		\
-	bl	0f;				\
+	bcl	20,31,$+4;			\
 0:	mflr	reg;				\
 	addis	reg,reg,(name - 0b)@ha;		\
 	addi	reg,reg,(name - 0b)@l;
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 423b5257d3a1..dc4f70609c8c 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1249,7 +1249,7 @@ found_iprot:
  * r3 = MAS0_TLBSEL (for the iprot array)
  * r4 = SPRN_TLBnCFG
  */
-	bl	invstr				/* Find our address */
+	bcl	20,31,$+4			/* Find our address */
 invstr:	mflr	r6				/* Make it accessible */
 	mfmsr	r7
 	rlwinm	r5,r7,27,31,31			/* extract MSR[IS] */
@@ -1318,7 +1318,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
 	mfmsr	r6
 	xori	r6,r6,MSR_IS
 	mtspr	SPRN_SRR1,r6
-	bl	1f		/* Find our address */
+	bcl	20,31,$+4	/* Find our address */
 1:	mflr	r6
 	addi	r6,r6,(2f - 1b)
 	mtspr	SPRN_SRR0,r6
@@ -1388,7 +1388,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
  * r4 = MAS0 w/TLBSEL & ESEL for the temp mapping
  */
 	/* Now we branch the new virtual address mapped by this entry */
-	bl	1f		/* Find our address */
+	bcl	20,31,$+4	/* Find our address */
 1:	mflr	r6
 	addi	r6,r6,(2f - 1b)
 	tovirt(r6,r6)
diff --git a/arch/powerpc/kernel/fsl_booke_entry_mapping.S b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
index 83dd0f6776b3..d9b2f50bac41 100644
--- a/arch/powerpc/kernel/fsl_booke_entry_mapping.S
+++ b/arch/powerpc/kernel/fsl_booke_entry_mapping.S
@@ -1,6 +1,6 @@
 
 /* 1. Find the index of the entry we're executing in */
-	bl	invstr				/* Find our address */
+	bcl	20,31,$+4				/* Find our address */
 invstr:	mflr	r6				/* Make it accessible */
 	mfmsr	r7
 	rlwinm	r4,r7,27,31,31			/* extract MSR[IS] */
@@ -84,7 +84,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
 	addi	r6,r6,10
 	slw	r6,r8,r6	/* convert to mask */
 
-	bl	1f		/* Find our address */
+	bcl	20,31,$+4	/* Find our address */
 1:	mflr	r7
 
 	mfspr	r8,SPRN_MAS3
@@ -116,7 +116,7 @@ skpinv:	addi	r6,r6,1				/* Increment */
 
 	xori	r6,r4,1
 	slwi	r6,r6,5		/* setup new context with other address space */
-	bl	1f		/* Find our address */
+	bcl	20,31,$+4	/* Find our address */
 1:	mflr	r9
 	rlwimi	r7,r9,0,20,31
 	addi	r7,r7,(2f - 1b)
@@ -217,7 +217,7 @@ next_tlb_setup:
 
 	lis	r7,MSR_KERNEL@h
 	ori	r7,r7,MSR_KERNEL@l
-	bl	1f			/* Find our address */
+	bcl	20,31,$+4		/* Find our address */
 1:	mflr	r9
 	rlwimi	r6,r9,0,20,31
 	addi	r6,r6,(2f - 1b)
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 37e4a7cf0065..043bb49ceebe 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -73,7 +73,7 @@ _ENTRY(_start);
  * address.
  * r21 will be loaded with the physical runtime address of _stext
  */
-	bl	0f				/* Get our runtime address */
+	bcl	20,31,$+4			/* Get our runtime address */
 0:	mflr	r21				/* Make it accessible */
 	addis	r21,r21,(_stext - 0b)@ha
 	addi	r21,r21,(_stext - 0b)@l 	/* Get our current runtime base */
@@ -864,7 +864,7 @@ _GLOBAL(init_cpu_state)
 wmmucr:	mtspr	SPRN_MMUCR,r3			/* Put MMUCR */
 	sync
 
-	bl	invstr				/* Find our address */
+	bcl	20,31,$+4			/* Find our address */
 invstr:	mflr	r5				/* Make it accessible */
 	tlbsx	r23,0,r5			/* Find entry we are in */
 	li	r4,0				/* Start at TLB entry 0 */
@@ -1056,7 +1056,7 @@ head_start_47x:
 	sync
 
 	/* Find the entry we are running from */
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r23
 	tlbsx	r23,0,r23
 	tlbre	r24,r23,0
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 60a0aeefc4a7..879b9338d0f5 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -82,7 +82,7 @@ _ENTRY(_start);
 	mr	r23,r3
 	mr	r25,r4
 
-	bl	0f
+	bcl	20,31,$+4
 0:	mflr	r8
 	addis	r3,r8,(is_second_reloc - 0b)@ha
 	lwz	r19,(is_second_reloc - 0b)@l(r3)
@@ -1147,7 +1147,7 @@ _GLOBAL(switch_to_as1)
 	bne	1b
 
 	/* Get the tlb entry used by the current running code */
-	bl	0f
+	bcl	20,31,$+4
 0:	mflr	r4
 	tlbsx	0,r4
 
@@ -1181,7 +1181,7 @@ _GLOBAL(switch_to_as1)
 _GLOBAL(restore_to_as0)
 	mflr	r0
 
-	bl	0f
+	bcl	20,31,$+4
 0:	mflr	r9
 	addi	r9,r9,1f - 0b
 
diff --git a/arch/powerpc/mm/tlb_nohash_low.S b/arch/powerpc/mm/tlb_nohash_low.S
index 204b4d9c4424..fef16a269269 100644
--- a/arch/powerpc/mm/tlb_nohash_low.S
+++ b/arch/powerpc/mm/tlb_nohash_low.S
@@ -217,7 +217,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_476_DD2)
  * Touch enough instruction cache lines to ensure cache hits
  */
 1:	mflr	r9
-	bl	2f
+	bcl	20,31,$+4
 2:	mflr	r6
 	li	r7,32
 	PPC_ICBT(0,R6,R7)		/* touch next cache line */
@@ -445,7 +445,7 @@ _GLOBAL(loadcam_multi)
 	 * Set up temporary TLB entry that is the same as what we're
 	 * running from, but in AS=1.
 	 */
-	bl	1f
+	bcl	20,31,$+4
 1:	mflr	r6
 	tlbsx	0,r8
 	mfspr	r6,SPRN_MAS1
-- 
2.30.2

