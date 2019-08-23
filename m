Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69F9AC46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 11:58:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FH0L6xdWzDqpr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 19:58:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ekdNvMXB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FGy65TY3zDrhF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 19:56:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46FGxx28jXzB09ZM;
 Fri, 23 Aug 2019 11:56:21 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ekdNvMXB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WhzafDjyESpC; Fri, 23 Aug 2019 11:56:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46FGxx16PdzB09ZC;
 Fri, 23 Aug 2019 11:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566554181; bh=ONvLcIxzAEVtmNJSxOjavRmGU5de97GfNcVGZo6Xhzs=;
 h=From:Subject:To:Cc:Date:From;
 b=ekdNvMXBWG97SjJTuHzR607lHh18oVL4JapzVN/TGslgG3zeJPxeaAfpS/xIyJiEY
 7Z8Tp5B+ndu78v35EI0ZqzNdeKnj1cpDdJfleRjC4pK+qXBqPT/aDCUwkj4WCyVG/v
 L/bDSlAown1r+aFJ/yfxvAOPbnBxV3DVQNJE6szI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 587228B874;
 Fri, 23 Aug 2019 11:56:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4myFi3CPuNci; Fri, 23 Aug 2019 11:56:22 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33B078B866;
 Fri, 23 Aug 2019 11:56:22 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0F85C6B735; Fri, 23 Aug 2019 09:56:21 +0000 (UTC)
Message-Id: <c8610942203e0d93fcb02ad20c57edd3adb4c9d3.1566554029.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: Don't populate page tables for block mapped pages
 except on the 8xx.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 23 Aug 2019 09:56:21 +0000 (UTC)
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

Commit d2f15e0979ee ("powerpc/32: always populate page tables for
Abatron BDI.") wrongly sets page tables for any PPC32 for using BDI,
and does't update them after init (remove RX on init section, set
text and rodata read-only)

Only the 8xx requires page tables to be populated for using the BDI.
They also need to be populated in order to see the mappings in
/sys/kernel/debug/kernel_page_tables

On BOOK3S_32, pages that are not mapped by page tables are mapped
by BATs. The BDI knows BATs and they can be viewed in
/sys/kernel/debug/powerpc/block_address_translation

Only set pagetables for RAM and IMMR on the 8xx and properly update
them at the end of init.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/nohash/8xx.c | 52 +++++++++++++++++++++++++++++++++++++++++---
 arch/powerpc/mm/pgtable_32.c |  5 +----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index e6918235fe04..2c98078d2ede 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -104,6 +104,19 @@ static void mmu_patch_addis(s32 *site, long simm)
 	patch_instruction_site(site, instr);
 }
 
+void __init mmu_mapin_ram_chunk(unsigned long offset, unsigned long top, pgprot_t prot)
+{
+	unsigned long s = offset;
+	unsigned long v = PAGE_OFFSET + s;
+	phys_addr_t p = memstart_addr + s;
+
+	for (; s < top; s += PAGE_SIZE) {
+		map_kernel_page(v, p, prot);
+		v += PAGE_SIZE;
+		p += PAGE_SIZE;
+	}
+}
+
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long mapped;
@@ -116,10 +129,20 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
 			mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, 0);
 	} else {
+		unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
+
 		mapped = top & ~(LARGE_PAGE_SIZE_8M - 1);
 		if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
-			mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top,
-					    _ALIGN(__pa(_einittext), 8 << 20));
+			mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, einittext8);
+
+		/*
+		 * Populate page tables to:
+		 * - have them appear in /sys/kernel/debug/kernel_page_tables
+		 * - allow the BDI to find the pages when they are not PINNED
+		 */
+		mmu_mapin_ram_chunk(0, einittext8, PAGE_KERNEL_X);
+		mmu_mapin_ram_chunk(einittext8, mapped, PAGE_KERNEL);
+		mmu_mapin_immr();
 	}
 
 	mmu_patch_cmp_limit(&patch__dtlbmiss_linmem_top, mapped);
@@ -145,18 +168,41 @@ void mmu_mark_initmem_nx(void)
 	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && CONFIG_ETEXT_SHIFT < 23)
 		mmu_patch_addis(&patch__itlbmiss_linmem_top8,
 				-((long)_etext & ~(LARGE_PAGE_SIZE_8M - 1)));
-	if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
+	if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT)) {
+		unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
+		unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
+		unsigned long etext = __pa(_etext);
+
 		mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, __pa(_etext));
+
+		/* Update page tables for PTDUMP and BDI */
+		mmu_mapin_ram_chunk(0, einittext8, __pgprot(0));
+		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
+			mmu_mapin_ram_chunk(0, etext, PAGE_KERNEL_TEXT);
+			mmu_mapin_ram_chunk(etext, einittext8, PAGE_KERNEL);
+		} else {
+			mmu_mapin_ram_chunk(0, etext8, PAGE_KERNEL_TEXT);
+			mmu_mapin_ram_chunk(etext8, einittext8, PAGE_KERNEL);
+		}
+	}
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mmu_mark_rodata_ro(void)
 {
+	unsigned long sinittext = __pa(_sinittext);
+	unsigned long etext = __pa(_etext);
+
 	if (CONFIG_DATA_SHIFT < 23)
 		mmu_patch_addis(&patch__dtlbmiss_romem_top8,
 				-__pa(((unsigned long)_sinittext) &
 				      ~(LARGE_PAGE_SIZE_8M - 1)));
 	mmu_patch_addis(&patch__dtlbmiss_romem_top, -__pa(_sinittext));
+
+	/* Update page tables for PTDUMP and BDI */
+	mmu_mapin_ram_chunk(0, sinittext, __pgprot(0));
+	mmu_mapin_ram_chunk(0, etext, PAGE_KERNEL_ROX);
+	mmu_mapin_ram_chunk(etext, sinittext, PAGE_KERNEL_RO);
 }
 #endif
 
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 97f401a06fcc..c5fc33a202aa 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -270,10 +270,7 @@ void __init mapin_ram(void)
 		if (base >= top)
 			continue;
 		base = mmu_mapin_ram(base, top);
-		if (IS_ENABLED(CONFIG_BDI_SWITCH))
-			__mapin_ram_chunk(reg->base, top);
-		else
-			__mapin_ram_chunk(base, top);
+		__mapin_ram_chunk(base, top);
 	}
 }
 
-- 
2.13.3

