Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660C1D9051
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:51:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R63w4483zDrBc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:51:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4hG0QC5zDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4hB1177z9txm0;
 Tue, 19 May 2020 07:49:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IHLo3eE-kpTY; Tue, 19 May 2020 07:49:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4hB08ZHz9txlx;
 Tue, 19 May 2020 07:49:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 22CB28B7A7;
 Tue, 19 May 2020 07:49:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pfuUbpNAUf7d; Tue, 19 May 2020 07:49:15 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C15508B767;
 Tue, 19 May 2020 07:49:14 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9EF5565A4A; Tue, 19 May 2020 05:49:14 +0000 (UTC)
Message-Id: <13c1e8539fdf363d3146f4884e5c3c76c6c308b5.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 31/45] powerpc/8xx: Don't set IMMR map anymore at boot
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:14 +0000 (UTC)
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

Only early debug requires IMMR to be mapped early.

No need to set it up and pin it in assembly. Map it
through page tables at udbg init when necessary.

If CONFIG_PIN_TLB_IMMR is selected, pin it once we
don't need the 32 Mb pinned RAM anymore.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Disable TLB reservation to modify entry 31
---
 arch/powerpc/kernel/head_8xx.S     | 39 +++++++++++++-----------------
 arch/powerpc/mm/mmu_decl.h         |  4 +++
 arch/powerpc/mm/nohash/8xx.c       | 15 +++++++++---
 arch/powerpc/platforms/8xx/Kconfig |  2 +-
 arch/powerpc/sysdev/cpm_common.c   |  2 ++
 5 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index c9e3d54e6a6f..d607f4b53e0f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -749,6 +749,23 @@ start_here:
 	rfi
 /* Load up the kernel context */
 2:
+#ifdef CONFIG_PIN_TLB_IMMR
+	lis	r0, MD_TWAM@h
+	oris	r0, r0, 0x1f00
+	mtspr	SPRN_MD_CTR, r0
+	LOAD_REG_IMMEDIATE(r0, VIRT_IMMR_BASE | MD_EVALID)
+	tlbie	r0
+	mtspr	SPRN_MD_EPN, r0
+	LOAD_REG_IMMEDIATE(r0, MD_SVALID | MD_PS512K | MD_GUARDED)
+	mtspr	SPRN_MD_TWC, r0
+	mfspr   r0, SPRN_IMMR
+	rlwinm	r0, r0, 0, 0xfff80000
+	ori	r0, r0, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | \
+			_PAGE_NO_CACHE | _PAGE_PRESENT
+	mtspr	SPRN_MD_RPN, r0
+	lis	r0, (MD_TWAM | MD_RSV4I)@h
+	mtspr	SPRN_MD_CTR, r0
+#endif
 	tlbia			/* Clear all TLB entries */
 	sync			/* wait for tlbia/tlbie to finish */
 
@@ -797,28 +814,6 @@ initial_mmu:
 	ori	r8, r8, MD_APG_INIT@l
 	mtspr	SPRN_MD_AP, r8
 
-	/* Map a 512k page for the IMMR to get the processor
-	 * internal registers (among other things).
-	 */
-#ifdef CONFIG_PIN_TLB_IMMR
-	oris	r10, r10, MD_RSV4I@h
-	ori	r10, r10, 0x1c00
-	mtspr	SPRN_MD_CTR, r10
-
-	mfspr	r9, 638			/* Get current IMMR */
-	andis.	r9, r9, 0xfff8		/* Get 512 kbytes boundary */
-
-	lis	r8, VIRT_IMMR_BASE@h	/* Create vaddr for TLB */
-	ori	r8, r8, MD_EVALID	/* Mark it valid */
-	mtspr	SPRN_MD_EPN, r8
-	li	r8, MD_PS512K | MD_GUARDED	/* Set 512k byte page */
-	ori	r8, r8, MD_SVALID	/* Make it valid */
-	mtspr	SPRN_MD_TWC, r8
-	mr	r8, r9			/* Create paddr for TLB */
-	ori	r8, r8, MI_BOOTINIT|0x2 /* Inhibit cache -- Cort */
-	mtspr	SPRN_MD_RPN, r8
-#endif
-
 	/* Now map the lower RAM (up to 32 Mbytes) into the ITLB. */
 #ifdef CONFIG_PIN_TLB_TEXT
 	lis	r8, MI_RSV4I@h
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 7097e07a209a..1b6d39e9baed 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -182,6 +182,10 @@ static inline void mmu_mark_initmem_nx(void) { }
 static inline void mmu_mark_rodata_ro(void) { }
 #endif
 
+#ifdef CONFIG_PPC_8xx
+void __init mmu_mapin_immr(void);
+#endif
+
 #ifdef CONFIG_PPC_DEBUG_WX
 void ptdump_check_wx(void);
 #else
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index bda5290af751..a9313aa6f1cd 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -66,7 +66,7 @@ void __init MMU_init_hw(void)
 	if (IS_ENABLED(CONFIG_PIN_TLB_DATA)) {
 		unsigned long ctr = mfspr(SPRN_MD_CTR) & 0xfe000000;
 		unsigned long flags = 0xf0 | MD_SPS16K | _PAGE_SH | _PAGE_DIRTY;
-		int i = IS_ENABLED(CONFIG_PIN_TLB_IMMR) ? 29 : 28;
+		int i = 28;
 		unsigned long addr = 0;
 		unsigned long mem = total_lowmem;
 
@@ -81,12 +81,19 @@ void __init MMU_init_hw(void)
 	}
 }
 
-static void __init mmu_mapin_immr(void)
+static bool immr_is_mapped __initdata;
+
+void __init mmu_mapin_immr(void)
 {
 	unsigned long p = PHYS_IMMR_BASE;
 	unsigned long v = VIRT_IMMR_BASE;
 	int offset;
 
+	if (immr_is_mapped)
+		return;
+
+	immr_is_mapped = true;
+
 	for (offset = 0; offset < IMMR_SIZE; offset += PAGE_SIZE)
 		map_kernel_page(v + offset, p + offset, PAGE_KERNEL_NCG);
 }
@@ -122,9 +129,10 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
 	unsigned long mapped;
 
+	mmu_mapin_immr();
+
 	if (__map_without_ltlbs) {
 		mapped = 0;
-		mmu_mapin_immr();
 		if (!IS_ENABLED(CONFIG_PIN_TLB_IMMR))
 			patch_instruction_site(&patch__dtlbmiss_immr_jmp, ppc_inst(PPC_INST_NOP));
 		if (!IS_ENABLED(CONFIG_PIN_TLB_TEXT))
@@ -143,7 +151,6 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		 */
 		mmu_mapin_ram_chunk(0, einittext8, PAGE_KERNEL_X);
 		mmu_mapin_ram_chunk(einittext8, mapped, PAGE_KERNEL);
-		mmu_mapin_immr();
 	}
 
 	mmu_patch_cmp_limit(&patch__dtlbmiss_linmem_top, mapped);
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 0d036cd868ef..04ea1a8a0bdc 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -187,7 +187,7 @@ config PIN_TLB_DATA
 
 config PIN_TLB_IMMR
 	bool "Pinned TLB for IMMR"
-	depends on PIN_TLB || PPC_EARLY_DEBUG_CPM
+	depends on PIN_TLB
 	default y
 	help
 	  This pins the IMMR area with a 512kbytes page. In case
diff --git a/arch/powerpc/sysdev/cpm_common.c b/arch/powerpc/sysdev/cpm_common.c
index 71660bacb264..7dc1960f8bdb 100644
--- a/arch/powerpc/sysdev/cpm_common.c
+++ b/arch/powerpc/sysdev/cpm_common.c
@@ -68,6 +68,8 @@ static void udbg_putc_cpm(char c)
 void __init udbg_init_cpm(void)
 {
 #ifdef CONFIG_PPC_8xx
+	mmu_mapin_immr();
+
 	cpm_udbg_txdesc = (u32 __iomem __force *)
 			  (CONFIG_PPC_EARLY_DEBUG_CPM_ADDR - PHYS_IMMR_BASE +
 			   VIRT_IMMR_BASE);
-- 
2.25.0

