Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2B1C78C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 19:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HPRj0WFSzDrBf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 03:56:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMx404X9zDqkW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMwz19vGz9v4kH;
 Wed,  6 May 2020 18:48:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iUF0f3o94ubZ; Wed,  6 May 2020 18:48:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMwy6B6mz9v4kD;
 Wed,  6 May 2020 18:48:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FFB38B7C6;
 Wed,  6 May 2020 18:48:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uvUbkd_IMxd3; Wed,  6 May 2020 18:48:36 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CA168B7C5;
 Wed,  6 May 2020 18:48:36 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id EC7FE65911; Wed,  6 May 2020 16:48:35 +0000 (UTC)
Message-Id: <e75326c43ef65f38e36b1ddd5aeda48f2a53b4eb.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 30/45] powerpc/8xx: Add function to set pinned TLBs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:35 +0000 (UTC)
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

Pinned TLBs cannot be modified when the MMU is enabled.

Create a function to rewrite the pinned TLB entries with MMU off.

To set pinned TLB, we have to turn off MMU, disable pinning,
do a TLB flush (Either with tlbie and tlbia) then reprogam
the TLB entries, enable pinning and turn on MMU.

If using tlbie, it cleared entries in both instruction and data
TLB regardless whether pinning is disabled or not.
If using tlbia, it clears all entries of the TLB which has
disabled pinning.

To make it easy, just clear all entries in both TLBs, and
reprogram them.

The function takes two arguments, the top of the memory to
consider and whether data is RO under _sinittext.
When DEBUG_PAGEALLOC is set, the top is the end of kernel rodata.
Otherwise, that's the top of physical RAM.

Everything below _sinittext is set RX, over _sinittext that's RW.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Function rewritten to manage all entries at once.
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |   2 +
 arch/powerpc/kernel/head_8xx.S               | 103 +++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index a092e6434bda..4d3ef3841b00 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -193,6 +193,8 @@
 
 #include <linux/mmdebug.h>
 
+void mmu_pin_tlb(unsigned long top, bool readonly);
+
 typedef struct {
 	unsigned int id;
 	unsigned int active;
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 423465b10c82..c9e3d54e6a6f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -16,6 +16,7 @@
 
 #include <linux/init.h>
 #include <linux/magic.h>
+#include <linux/sizes.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -866,6 +867,108 @@ initial_mmu:
 	mtspr	SPRN_DER, r8
 	blr
 
+#ifdef CONFIG_PIN_TLB
+_GLOBAL(mmu_pin_tlb)
+	lis	r9, (1f - PAGE_OFFSET)@h
+	ori	r9, r9, (1f - PAGE_OFFSET)@l
+	mfmsr	r10
+	mflr	r11
+	li	r12, MSR_KERNEL & ~(MSR_IR | MSR_DR | MSR_RI)
+	rlwinm	r0, r10, 0, ~MSR_RI
+	rlwinm	r0, r0, 0, ~MSR_EE
+	mtmsr	r0
+	isync
+	.align	4
+	mtspr	SPRN_SRR0, r9
+	mtspr	SPRN_SRR1, r12
+	rfi
+1:
+	li	r5, 0
+	lis	r6, MD_TWAM@h
+	mtspr	SPRN_MI_CTR, r5
+	mtspr	SPRN_MD_CTR, r6
+	tlbia
+
+#ifdef CONFIG_PIN_TLB_TEXT
+	LOAD_REG_IMMEDIATE(r5, 28 << 8)
+	LOAD_REG_IMMEDIATE(r6, PAGE_OFFSET)
+	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG)
+	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_RO | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
+	LOAD_REG_ADDR(r9, _sinittext)
+	li	r0, 4
+	mtctr	r0
+
+2:	ori	r0, r6, MI_EVALID
+	mtspr	SPRN_MI_CTR, r5
+	mtspr	SPRN_MI_EPN, r0
+	mtspr	SPRN_MI_TWC, r7
+	mtspr	SPRN_MI_RPN, r8
+	addi	r5, r5, 0x100
+	addis	r6, r6, SZ_8M@h
+	addis	r8, r8, SZ_8M@h
+	cmplw	r6, r9
+	bdnzt	lt, 2b
+	lis	r0, MI_RSV4I@h
+	mtspr	SPRN_MI_CTR, r0
+#endif
+	LOAD_REG_IMMEDIATE(r5, 28 << 8 | MD_TWAM)
+#ifdef CONFIG_PIN_TLB_DATA
+	LOAD_REG_IMMEDIATE(r6, PAGE_OFFSET)
+	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG)
+#ifdef CONFIG_PIN_TLB_IMMR
+	li	r0, 3
+#else
+	li	r0, 4
+#endif
+	mtctr	r0
+	cmpwi	r4, 0
+	beq	4f
+	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_RO | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
+	LOAD_REG_ADDR(r9, _sinittext)
+
+2:	ori	r0, r6, MD_EVALID
+	mtspr	SPRN_MD_CTR, r5
+	mtspr	SPRN_MD_EPN, r0
+	mtspr	SPRN_MD_TWC, r7
+	mtspr	SPRN_MD_RPN, r8
+	addi	r5, r5, 0x100
+	addis	r6, r6, SZ_8M@h
+	addis	r8, r8, SZ_8M@h
+	cmplw	r6, r9
+	bdnzt	lt, 2b
+
+4:	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
+2:	ori	r0, r6, MD_EVALID
+	mtspr	SPRN_MD_CTR, r5
+	mtspr	SPRN_MD_EPN, r0
+	mtspr	SPRN_MD_TWC, r7
+	mtspr	SPRN_MD_RPN, r8
+	addi	r5, r5, 0x100
+	addis	r6, r6, SZ_8M@h
+	addis	r8, r8, SZ_8M@h
+	cmplw	r6, r3
+	bdnzt	lt, 2b
+#endif
+#ifdef CONFIG_PIN_TLB_IMMR
+	LOAD_REG_IMMEDIATE(r0, VIRT_IMMR_BASE | MD_EVALID)
+	LOAD_REG_IMMEDIATE(r7, MD_SVALID | MD_PS512K | MD_GUARDED)
+	mfspr   r8, SPRN_IMMR
+	rlwinm	r8, r8, 0, 0xfff80000
+	ori	r8, r8, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | \
+			_PAGE_NO_CACHE | _PAGE_PRESENT
+	mtspr	SPRN_MD_CTR, r5
+	mtspr	SPRN_MD_EPN, r0
+	mtspr	SPRN_MD_TWC, r7
+	mtspr	SPRN_MD_RPN, r8
+#endif
+#if defined(CONFIG_PIN_TLB_IMMR) || defined(CONFIG_PIN_TLB_DATA)
+	lis	r0, (MD_RSV4I | MD_TWAM)@h
+	mtspr	SPRN_MI_CTR, r0
+#endif
+	mtspr	SPRN_SRR1, r10
+	mtspr	SPRN_SRR0, r11
+	rfi
+#endif /* CONFIG_PIN_TLB */
 
 /*
  * We put a few things here that have to be page-aligned.
-- 
2.25.0

