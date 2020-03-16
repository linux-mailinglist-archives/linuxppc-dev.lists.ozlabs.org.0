Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDCB186E66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:18:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h0LT4SsmzDqHj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:18:25 +1100 (AEDT)
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
 header.s=mail header.b=XdSkYLFn; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlf6QY5zDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlV5cxXz9v02r;
 Mon, 16 Mar 2020 13:36:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XdSkYLFn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NL9ck2uB04TY; Mon, 16 Mar 2020 13:36:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlV49yyz9v02f;
 Mon, 16 Mar 2020 13:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362182; bh=QhSYlRLL0xRZScGqt7FSniEp4HbS3pbCmHQIkLwD9dU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XdSkYLFnrWLiVRagGCCS4CtcT+w+lWmgk3NpU8QeRtLKSf9ziLChlQZsoBlm+FEnm
 9JrStua5Yz3yR7K/CeT1SU9fTmXzxec+zG/oXa1oi383sIw5vxaQFh/j4UO8EJm06A
 tPZQIBtHdBFgcqKtGWHHrsMH/uqeXiXocXqmj4UY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CC138B7D0;
 Mon, 16 Mar 2020 13:36:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ty8EPjbuA8A6; Mon, 16 Mar 2020 13:36:27 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EF1A8B7CB;
 Mon, 16 Mar 2020 13:36:27 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 51EEB65595; Mon, 16 Mar 2020 12:36:27 +0000 (UTC)
Message-Id: <4672c1a9720c4b4d6bd382602478ce22ed9d001a.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 41/46] powerpc/8xx: Map linear memory with huge pages
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:27 +0000 (UTC)
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

Map linear memory space with 512k and 8M pages whenever
possible.

Three mappings are performed:
- One for kernel text
- One for RO data
- One for the rest

Separating the mappings is done to be able to update the
protection later when using STRICT_KERNEL_RWX.

The ITLB miss handler now need to also handle huge TLBs
unless kernel text in pinned.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/head_8xx.S |  4 +--
 arch/powerpc/mm/nohash/8xx.c   | 50 +++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 410cb48ab36f..49b9eee7dd57 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -223,7 +223,7 @@ InstructionTLBMiss:
 3:
 	mtcr	r11
 #endif
-#ifdef CONFIG_HUGETLBFS
+#if defined(CONFIG_HUGETLBFS) || !defined(CONFIG_PIN_TLB_TEXT)
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
 	mtspr	SPRN_MD_TWC, r11
 #else
@@ -233,7 +233,7 @@ InstructionTLBMiss:
 #endif
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
-#ifdef CONFIG_HUGETLBFS
+#if defined(CONFIG_HUGETLBFS) || !defined(CONFIG_PIN_TLB_TEXT)
 	rlwimi	r11, r10, 32 - 9, _PMD_PAGE_512K
 	mtspr	SPRN_MI_TWC, r11
 #endif
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 57e0c7496a6a..d670f3f82091 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -126,20 +126,68 @@ void __init mmu_mapin_immr(void)
 				    PAGE_KERNEL_NCG, MMU_PAGE_512K, true);
 }
 
+static void __init mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
+				       pgprot_t prot, bool new)
+{
+	unsigned long v = PAGE_OFFSET + offset;
+	unsigned long p = offset;
+
+	WARN_ON(!IS_ALIGNED(offset, SZ_512K) || !IS_ALIGNED(top, SZ_512K));
+
+	for (; p < ALIGN(p, SZ_8M) && p < top; p += SZ_512K, v += SZ_512K)
+		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top; p += SZ_8M, v += SZ_8M)
+		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
+	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top; p += SZ_512K, v += SZ_512K)
+		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+
+	if (!new)
+		flush_tlb_kernel_range(PAGE_OFFSET + v, PAGE_OFFSET + top);
+}
+
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
+	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
+	unsigned long sinittext = __pa(_sinittext);
+	unsigned long boundary = strict_kernel_rwx_enabled() ? sinittext : etext8;
+	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
+
+	WARN_ON(top < einittext8);
+
 	mmu_mapin_immr();
 
-	return 0;
+	if (__map_without_ltlbs)
+		return 0;
+
+	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, true);
+	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL_TEXT, true);
+	mmu_mapin_ram_chunk(einittext8, top, PAGE_KERNEL, true);
+
+	if (top > SZ_32M)
+		memblock_set_current_limit(top);
+
+	block_mapped_ram = top;
+
+	return top;
 }
 
 void mmu_mark_initmem_nx(void)
 {
+	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
+	unsigned long sinittext = __pa(_sinittext);
+	unsigned long boundary = strict_kernel_rwx_enabled() ? sinittext : etext8;
+	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
+
+	mmu_mapin_ram_chunk(0, boundary, PAGE_KERNEL_TEXT, false);
+	mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mmu_mark_rodata_ro(void)
 {
+	unsigned long sinittext = __pa(_sinittext);
+
+	mmu_mapin_ram_chunk(0, sinittext, PAGE_KERNEL_ROX, false);
 }
 #endif
 
-- 
2.25.0

