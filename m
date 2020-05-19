Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 288531D9057
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:53:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R65r2w8SzDr8s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:53:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4hJ0FLSzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4hD0snqz9txm4;
 Tue, 19 May 2020 07:49:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Qg4LW-gqs4Ck; Tue, 19 May 2020 07:49:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4hD07nSz9txlx;
 Tue, 19 May 2020 07:49:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 28FA48B7A7;
 Tue, 19 May 2020 07:49:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pR9XnFpyxVVP; Tue, 19 May 2020 07:49:17 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D0C928B767;
 Tue, 19 May 2020 07:49:16 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AE0A265A4A; Tue, 19 May 2020 05:49:16 +0000 (UTC)
Message-Id: <221b7e3ead80a5969629938c023f8cfe45fdd2fb.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 33/45] powerpc/8xx: Drop special handling of Linear and
 IMMR mappings in I/D TLB handlers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:16 +0000 (UTC)
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

Up to now, linear and IMMR mappings are managed via huge TLB entries
through specific code directly in TLB miss handlers. This implies
some patching of the TLB miss handlers at startup, and a lot of
dedicated code.

Remove all this specific dedicated code.

For now we are back to normal handling via standard 4k pages. In the
next patches, linear memory mapping and IMMR mapping will be managed
through huge pages.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S |  29 +--------
 arch/powerpc/mm/nohash/8xx.c   | 106 +--------------------------------
 2 files changed, 3 insertions(+), 132 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index b0cceee6405c..d1546f379757 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -207,31 +207,21 @@ InstructionTLBMiss:
 	mfspr	r10, SPRN_SRR0	/* Get effective address of fault */
 	INVALIDATE_ADJACENT_PAGES_CPU15(r10)
 	mtspr	SPRN_MD_EPN, r10
-	/* Only modules will cause ITLB Misses as we always
-	 * pin the first 8MB of kernel memory */
 #ifdef ITLB_MISS_KERNEL
 	mfcr	r11
-#if defined(SIMPLE_KERNEL_ADDRESS) && defined(CONFIG_PIN_TLB_TEXT)
+#if defined(SIMPLE_KERNEL_ADDRESS)
 	cmpi	cr0, r10, 0	/* Address >= 0x80000000 */
 #else
 	rlwinm	r10, r10, 16, 0xfff8
 	cmpli	cr0, r10, PAGE_OFFSET@h
-#ifndef CONFIG_PIN_TLB_TEXT
-	/* It is assumed that kernel code fits into the first 32M */
-0:	cmpli	cr7, r10, (PAGE_OFFSET + 0x2000000)@h
-	patch_site	0b, patch__itlbmiss_linmem_top
-#endif
 #endif
 #endif
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
 #ifdef ITLB_MISS_KERNEL
-#if defined(SIMPLE_KERNEL_ADDRESS) && defined(CONFIG_PIN_TLB_TEXT)
+#if defined(SIMPLE_KERNEL_ADDRESS)
 	bge+	3f
 #else
 	blt+	3f
-#endif
-#ifndef CONFIG_PIN_TLB_TEXT
-	blt	cr7, ITLBMissLinear
 #endif
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
@@ -327,19 +317,9 @@ DataStoreTLBMiss:
 	mfspr	r10, SPRN_MD_EPN
 	rlwinm	r10, r10, 16, 0xfff8
 	cmpli	cr0, r10, PAGE_OFFSET@h
-#ifndef CONFIG_PIN_TLB_IMMR
-	cmpli	cr6, r10, VIRT_IMMR_BASE@h
-#endif
-0:	cmpli	cr7, r10, (PAGE_OFFSET + 0x2000000)@h
-	patch_site	0b, patch__dtlbmiss_linmem_top
 
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
 	blt+	3f
-#ifndef CONFIG_PIN_TLB_IMMR
-0:	beq-	cr6, DTLBMissIMMR
-	patch_site	0b, patch__dtlbmiss_immr_jmp
-#endif
-	blt	cr7, DTLBMissLinear
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
 3:
@@ -571,14 +551,9 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	cmpli	cr1, r11, PAGE_OFFSET@h
 	mfspr	r11, SPRN_M_TWB	/* Get level 1 table */
 	blt+	cr1, 3f
-	rlwinm	r11, r10, 16, 0xfff8
-
-0:	cmpli	cr7, r11, (PAGE_OFFSET + 0x1800000)@h
-	patch_site	0b, patch__fixupdar_linmem_top
 
 	/* create physical page address from effective address */
 	tophys(r11, r10)
-	blt-	cr7, 201f
 	mfspr	r11, SPRN_M_TWB	/* Get level 1 table */
 	rlwinm	r11, r11, 0, 20, 31
 	oris	r11, r11, (swapper_pg_dir - PAGE_OFFSET)@ha
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 2c480e35b426..b735482e1529 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -55,8 +55,6 @@ unsigned long p_block_mapped(phys_addr_t pa)
 	return 0;
 }
 
-#define LARGE_PAGE_SIZE_8M	(1<<23)
-
 /*
  * MMU_init_hw does the chip-specific initialization of the MMU hardware.
  */
@@ -81,122 +79,20 @@ void __init mmu_mapin_immr(void)
 		map_kernel_page(v + offset, p + offset, PAGE_KERNEL_NCG);
 }
 
-static void mmu_patch_cmp_limit(s32 *site, unsigned long mapped)
-{
-	modify_instruction_site(site, 0xffff, (unsigned long)__va(mapped) >> 16);
-}
-
-static void mmu_patch_addis(s32 *site, long simm)
-{
-	unsigned int instr = *(unsigned int *)patch_site_addr(site);
-
-	instr &= 0xffff0000;
-	instr |= ((unsigned long)simm) >> 16;
-	patch_instruction_site(site, ppc_inst(instr));
-}
-
-static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long top, pgprot_t prot)
-{
-	unsigned long s = offset;
-	unsigned long v = PAGE_OFFSET + s;
-	phys_addr_t p = memstart_addr + s;
-
-	for (; s < top; s += PAGE_SIZE) {
-		map_kernel_page(v, p, prot);
-		v += PAGE_SIZE;
-		p += PAGE_SIZE;
-	}
-}
-
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
-	unsigned long mapped;
-
 	mmu_mapin_immr();
 
-	if (__map_without_ltlbs) {
-		mapped = 0;
-		if (!IS_ENABLED(CONFIG_PIN_TLB_IMMR))
-			patch_instruction_site(&patch__dtlbmiss_immr_jmp, ppc_inst(PPC_INST_NOP));
-		if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
-			mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, 0);
-	} else {
-		unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
-
-		mapped = top & ~(LARGE_PAGE_SIZE_8M - 1);
-		if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
-			mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, einittext8);
-
-		/*
-		 * Populate page tables to:
-		 * - have them appear in /sys/kernel/debug/kernel_page_tables
-		 * - allow the BDI to find the pages when they are not PINNED
-		 */
-		mmu_mapin_ram_chunk(0, einittext8, PAGE_KERNEL_X);
-		mmu_mapin_ram_chunk(einittext8, mapped, PAGE_KERNEL);
-	}
-
-	mmu_patch_cmp_limit(&patch__dtlbmiss_linmem_top, mapped);
-	mmu_patch_cmp_limit(&patch__fixupdar_linmem_top, mapped);
-
-	/* If the size of RAM is not an exact power of two, we may not
-	 * have covered RAM in its entirety with 8 MiB
-	 * pages. Consequently, restrict the top end of RAM currently
-	 * allocable so that calls to the MEMBLOCK to allocate PTEs for "tail"
-	 * coverage with normal-sized pages (or other reasons) do not
-	 * attempt to allocate outside the allowed range.
-	 */
-	if (mapped)
-		memblock_set_current_limit(mapped);
-
-	block_mapped_ram = mapped;
-
-	return mapped;
+	return 0;
 }
 
 void mmu_mark_initmem_nx(void)
 {
-	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && CONFIG_ETEXT_SHIFT < 23)
-		mmu_patch_addis(&patch__itlbmiss_linmem_top8,
-				-((long)_etext & ~(LARGE_PAGE_SIZE_8M - 1)));
-	if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT)) {
-		unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
-		unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
-		unsigned long etext = __pa(_etext);
-
-		mmu_patch_cmp_limit(&patch__itlbmiss_linmem_top, __pa(_etext));
-
-		/* Update page tables for PTDUMP and BDI */
-		mmu_mapin_ram_chunk(0, einittext8, __pgprot(0));
-		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
-			mmu_mapin_ram_chunk(0, etext, PAGE_KERNEL_TEXT);
-			mmu_mapin_ram_chunk(etext, einittext8, PAGE_KERNEL);
-		} else {
-			mmu_mapin_ram_chunk(0, etext8, PAGE_KERNEL_TEXT);
-			mmu_mapin_ram_chunk(etext8, einittext8, PAGE_KERNEL);
-		}
-	}
-	_tlbil_all();
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mmu_mark_rodata_ro(void)
 {
-	unsigned long sinittext = __pa(_sinittext);
-	unsigned long etext = __pa(_etext);
-
-	if (CONFIG_DATA_SHIFT < 23)
-		mmu_patch_addis(&patch__dtlbmiss_romem_top8,
-				-__pa(((unsigned long)_sinittext) &
-				      ~(LARGE_PAGE_SIZE_8M - 1)));
-	mmu_patch_addis(&patch__dtlbmiss_romem_top, -__pa(_sinittext));
-
-	_tlbil_all();
-
-	/* Update page tables for PTDUMP and BDI */
-	mmu_mapin_ram_chunk(0, sinittext, __pgprot(0));
-	mmu_mapin_ram_chunk(0, etext, PAGE_KERNEL_ROX);
-	mmu_mapin_ram_chunk(etext, sinittext, PAGE_KERNEL_RO);
 }
 #endif
 
-- 
2.25.0

