Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A45186DC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 15:50:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gzkV5gxXzDqJV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 01:50:42 +1100 (AEDT)
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
 header.s=mail header.b=dngXK29n; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlW5gzkzDqLK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlL4WLDz9v02h;
 Mon, 16 Mar 2020 13:36:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dngXK29n; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AFRMHRxVMBQw; Mon, 16 Mar 2020 13:36:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlL3TnCz9v02f;
 Mon, 16 Mar 2020 13:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362174; bh=gY/Mk0vN0+WJ+x6VBQ4y39+tHOIY/jIZw/0BD7lLXqs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=dngXK29n8HICIfD/xjA8bDnNz6ijvMJckhWYhogCaKZ+b+L7EyR+6eINlGZ5TU+Eb
 LlmFEc4kDgFyfA4cnroaSFhPLz3hDla21xLgutr0jgUpBYFF72fhKz+di9FZrX4HNL
 dMKR0dOofSjBH/FAcS+PVB0un73ZSr5lu05pj4OM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 572C68B7D0;
 Mon, 16 Mar 2020 13:36:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DB5y7GiQf_Ej; Mon, 16 Mar 2020 13:36:19 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29C0C8B7CB;
 Mon, 16 Mar 2020 13:36:19 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1DFC265595; Mon, 16 Mar 2020 12:36:19 +0000 (UTC)
Message-Id: <bfbb669ff325953110f0fd9282699471e19abfa5.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 33/46] powerpc/8xx: Always pin TLBs at startup.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:19 +0000 (UTC)
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

At startup, map 32 Mbytes of memory through 4 pages of 8M,
and PIN them inconditionnaly. They need to be pinned because
KASAN is using page tables early and the TLBs might be
dynamically replaced otherwise.

Remove RSV4I flag after installing mappings unless
CONFIG_PIN_TLB_XXXX is selected.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S | 31 +++++++++++++++++--------------
 arch/powerpc/mm/nohash/8xx.c   | 19 +------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 6a1a74e9b011..7ed866e83545 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -761,6 +761,14 @@ start_here:
 	ori	r0, r0, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | \
 			_PAGE_NO_CACHE | _PAGE_PRESENT
 	mtspr	SPRN_MD_RPN, r0
+#endif
+#ifndef CONFIG_PIN_TLB_TEXT
+	li	r0, 0
+	mtspr	SPRN_MI_CTR, r0
+#endif
+#if !defined(CONFIG_PIN_TLB_DATA) && !defined(CONFIG_PIN_TLB_IMMR)
+	lis	r0, MD_TWAM@h
+	mtspr	SPRN_MD_CTR, r0
 #endif
 	tlbia			/* Clear all TLB entries */
 	sync			/* wait for tlbia/tlbie to finish */
@@ -798,10 +806,6 @@ initial_mmu:
 	mtspr	SPRN_MD_CTR, r10	/* remove PINNED DTLB entries */
 
 	tlbia			/* Invalidate all TLB entries */
-#ifdef CONFIG_PIN_TLB_DATA
-	oris	r10, r10, MD_RSV4I@h
-	mtspr	SPRN_MD_CTR, r10	/* Set data TLB control */
-#endif
 
 	lis	r8, MI_APG_INIT@h	/* Set protection modes */
 	ori	r8, r8, MI_APG_INIT@l
@@ -810,33 +814,32 @@ initial_mmu:
 	ori	r8, r8, MD_APG_INIT@l
 	mtspr	SPRN_MD_AP, r8
 
-	/* Now map the lower RAM (up to 32 Mbytes) into the ITLB. */
-#ifdef CONFIG_PIN_TLB_TEXT
+	/* Map the lower RAM (up to 32 Mbytes) into the ITLB and DTLB */
 	lis	r8, MI_RSV4I@h
 	ori	r8, r8, 0x1c00
-#endif
+	oris	r12, r10, MD_RSV4I@h
+	ori	r12, r12, 0x1c00
 	li	r9, 4				/* up to 4 pages of 8M */
 	mtctr	r9
 	lis	r9, KERNELBASE@h		/* Create vaddr for TLB */
 	li	r10, MI_PS8MEG | MI_SVALID	/* Set 8M byte page */
 	li	r11, MI_BOOTINIT		/* Create RPN for address 0 */
-	lis	r12, _einittext@h
-	ori	r12, r12, _einittext@l
 1:
-#ifdef CONFIG_PIN_TLB_TEXT
 	mtspr	SPRN_MI_CTR, r8	/* Set instruction MMU control */
 	addi	r8, r8, 0x100
-#endif
-
 	ori	r0, r9, MI_EVALID		/* Mark it valid */
 	mtspr	SPRN_MI_EPN, r0
 	mtspr	SPRN_MI_TWC, r10
 	mtspr	SPRN_MI_RPN, r11		/* Store TLB entry */
+	mtspr	SPRN_MD_CTR, r12
+	addi	r12, r12, 0x100
+	mtspr	SPRN_MD_EPN, r0
+	mtspr	SPRN_MD_TWC, r10
+	mtspr	SPRN_MD_RPN, r11
 	addis	r9, r9, 0x80
 	addis	r11, r11, 0x80
 
-	cmpl	cr0, r9, r12
-	bdnzf	gt, 1b
+	bdnz	1b
 
 	/* Since the cache is enabled according to the information we
 	 * just loaded into the TLB, invalidate and enable the caches here.
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 2a55904986c6..0956bc92b19c 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -61,23 +61,6 @@ unsigned long p_block_mapped(phys_addr_t pa)
  */
 void __init MMU_init_hw(void)
 {
-	/* PIN up to the 3 first 8Mb after IMMR in DTLB table */
-	if (IS_ENABLED(CONFIG_PIN_TLB_DATA)) {
-		unsigned long ctr = mfspr(SPRN_MD_CTR) & 0xfe000000;
-		unsigned long flags = 0xf0 | MD_SPS16K | _PAGE_SH | _PAGE_DIRTY;
-		int i = 28;
-		unsigned long addr = 0;
-		unsigned long mem = total_lowmem;
-
-		for (; i < 32 && mem >= LARGE_PAGE_SIZE_8M; i++) {
-			mtspr(SPRN_MD_CTR, ctr | (i << 8));
-			mtspr(SPRN_MD_EPN, (unsigned long)__va(addr) | MD_EVALID);
-			mtspr(SPRN_MD_TWC, MD_PS8MEG | MD_SVALID);
-			mtspr(SPRN_MD_RPN, addr | flags | _PAGE_PRESENT);
-			addr += LARGE_PAGE_SIZE_8M;
-			mem -= LARGE_PAGE_SIZE_8M;
-		}
-	}
 }
 
 static bool immr_is_mapped __initdata;
@@ -222,7 +205,7 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	BUG_ON(first_memblock_base != 0);
 
 	/* 8xx can only access 32MB at the moment */
-	memblock_set_current_limit(min_t(u64, first_memblock_size, 0x02000000));
+	memblock_set_current_limit(min_t(u64, first_memblock_size, SZ_32M));
 }
 
 /*
-- 
2.25.0

