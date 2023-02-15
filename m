Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5C5697D55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 14:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGzSF2vBSz3ffy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:29:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGzQb4tj5z3fVF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 00:27:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PGzQW3hWSz9sn5;
	Wed, 15 Feb 2023 14:27:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrO2Lcah7REe; Wed, 15 Feb 2023 14:27:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PGzNR2KkYz9spZ;
	Wed, 15 Feb 2023 14:25:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C9E88B7C6;
	Wed, 15 Feb 2023 13:53:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0IZa5wOlksWW; Wed, 15 Feb 2023 13:53:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 329358B7C8;
	Wed, 15 Feb 2023 13:53:57 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31FCrs3s217607
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 13:53:54 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31FCrsxQ217606;
	Wed, 15 Feb 2023 13:53:54 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 8/9] powerpc: Use ppc_md_progress()
Date: Wed, 15 Feb 2023 13:53:37 +0100
Message-Id: <ac3fbc68f251577d57cac8a338803c414a0dacd9.1676465585.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
References: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676465615; l=32864; s=20211009; h=from:subject:message-id; bh=Q9uPFHwO8O759wVCoqTCLU9Pl5DGYqmVdDPOzitj3b8=; b=3DB+HGTstdl02hXCfdF/XSc254i+cqstdBbtDWEdLUPP20Agt1tSbTFe1h6CXmnmTQAvlYIjoNoy ak1CfM+BDioF7bEDZFq8cWYKcAATw+IFxun3lUAzZdNrchZp2CVZ
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

Many places have:

	if (ppc.md_progress)
		ppc.md_progress();

Use ppc_md_progress() instead.

Note that checkpatch complains about using function names,
but this is not a function taking format strings, so we
leave the function names for now.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/setup_32.c                 |  3 +--
 arch/powerpc/mm/book3s32/mmu.c                 | 10 ++++------
 arch/powerpc/mm/init_32.c                      | 12 ++++--------
 arch/powerpc/platforms/52xx/efika.c            |  3 +--
 arch/powerpc/platforms/52xx/lite5200.c         |  3 +--
 arch/powerpc/platforms/52xx/media5200.c        |  3 +--
 arch/powerpc/platforms/52xx/mpc5200_simple.c   |  3 +--
 arch/powerpc/platforms/82xx/ep8248e.c          |  6 ++----
 arch/powerpc/platforms/82xx/km82xx.c           |  6 ++----
 arch/powerpc/platforms/82xx/mpc8272_ads.c      |  6 ++----
 arch/powerpc/platforms/82xx/pq2fads.c          |  6 ++----
 arch/powerpc/platforms/83xx/misc.c             |  3 +--
 arch/powerpc/platforms/85xx/bsc913x_qds.c      |  3 +--
 arch/powerpc/platforms/85xx/bsc913x_rdb.c      |  3 +--
 arch/powerpc/platforms/85xx/c293pcie.c         |  3 +--
 arch/powerpc/platforms/85xx/ge_imp3a.c         |  3 +--
 arch/powerpc/platforms/85xx/ksi8560.c          |  3 +--
 arch/powerpc/platforms/85xx/mpc8536_ds.c       |  3 +--
 arch/powerpc/platforms/85xx/mpc85xx_ads.c      |  3 +--
 arch/powerpc/platforms/85xx/mpc85xx_cds.c      |  5 ++---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c       |  3 +--
 arch/powerpc/platforms/85xx/mpc85xx_mds.c      |  3 +--
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c      |  3 +--
 arch/powerpc/platforms/85xx/mvme2500.c         |  3 +--
 arch/powerpc/platforms/85xx/p1010rdb.c         |  3 +--
 arch/powerpc/platforms/85xx/p1022_ds.c         |  3 +--
 arch/powerpc/platforms/85xx/p1022_rdk.c        |  3 +--
 arch/powerpc/platforms/85xx/p1023_rdb.c        |  3 +--
 arch/powerpc/platforms/85xx/ppa8548.c          |  3 +--
 arch/powerpc/platforms/85xx/qemu_e500.c        |  2 +-
 arch/powerpc/platforms/85xx/socrates.c         |  3 +--
 arch/powerpc/platforms/85xx/stx_gp3.c          |  3 +--
 arch/powerpc/platforms/85xx/tqm85xx.c          |  3 +--
 arch/powerpc/platforms/85xx/twr_p102x.c        |  3 +--
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c     |  3 +--
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c     |  3 +--
 arch/powerpc/platforms/86xx/mvme7100.c         |  3 +--
 arch/powerpc/platforms/amigaone/setup.c        |  3 +--
 arch/powerpc/platforms/chrp/setup.c            |  5 ++---
 arch/powerpc/platforms/embedded6xx/holly.c     |  6 ++----
 .../platforms/embedded6xx/mpc7448_hpc2.c       |  7 +++----
 arch/powerpc/platforms/embedded6xx/mvme5100.c  |  3 +--
 arch/powerpc/platforms/powermac/smp.c          | 18 ++++++++----------
 arch/powerpc/platforms/pseries/setup.c         |  8 ++++----
 44 files changed, 69 insertions(+), 121 deletions(-)

diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index b761cc1a403c..843f64050efc 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -127,8 +127,7 @@ __setup("l3cr=", ppc_setup_l3cr);
 static int __init ppc_init(void)
 {
 	/* clear the progress line */
-	if (ppc_md.progress)
-		ppc_md.progress("             ", 0xffff);
+	ppc_md_progress("             ", 0xffff);
 
 	/* call platform init */
 	if (ppc_md.init != NULL) {
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 850783cfa9c7..ec6facff2779 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -347,7 +347,7 @@ void __init MMU_init_hw(void)
 	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
 
-	if ( ppc_md.progress ) ppc_md.progress("hash:enter", 0x105);
+	ppc_md_progress("hash:enter", 0x105);
 
 #define LG_HPTEG_SIZE	6		/* 64 bytes per HPTEG */
 #define SDR1_LOW_BITS	((n_hpteg - 1) >> 10)
@@ -371,7 +371,7 @@ void __init MMU_init_hw(void)
 	/*
 	 * Find some memory for the hash table.
 	 */
-	if ( ppc_md.progress ) ppc_md.progress("hash:find piece", 0x322);
+	ppc_md_progress("hash:find piece", 0x322);
 	Hash = memblock_alloc(Hash_size, Hash_size);
 	if (!Hash)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
@@ -396,10 +396,8 @@ void __init MMU_init_hw_patch(void)
 	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return;
 
-	if (ppc_md.progress)
-		ppc_md.progress("hash:patch", 0x345);
-	if (ppc_md.progress)
-		ppc_md.progress("hash:done", 0x205);
+	ppc_md_progress("hash:patch", 0x345);
+	ppc_md_progress("hash:done", 0x205);
 
 	/* WARNING: Make sure nothing can trigger a KASAN check past this point */
 
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index d4cc3749e621..97e0f58dd401 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -79,8 +79,7 @@ unsigned long __max_low_memory = MAX_LOW_MEM;
  */
 void __init MMU_init(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:enter", 0x111);
+	ppc_md_progress("MMU:enter", 0x111);
 
 	total_lowmem = total_memory = memblock_end_of_DRAM() - memstart_addr;
 	lowmem_end_addr = memstart_addr + total_lowmem;
@@ -102,20 +101,17 @@ void __init MMU_init(void)
 	}
 
 	/* Initialize the MMU hardware */
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:hw init", 0x300);
+	ppc_md_progress("MMU:hw init", 0x300);
 	MMU_init_hw();
 
 	/* Map in all of RAM starting at KERNELBASE */
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:mapin", 0x301);
+	ppc_md_progress("MMU:mapin", 0x301);
 	mapin_ram();
 
 	/* Initialize early top-down ioremap allocator */
 	ioremap_bot = IOREMAP_TOP;
 
-	if (ppc_md.progress)
-		ppc_md.progress("MMU:exit", 0x211);
+	ppc_md_progress("MMU:exit", 0x211);
 
 	/* From now on, btext is no longer BAT mapped if it was at all */
 #ifdef CONFIG_BOOTX_TEXT
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 364d040c0d69..ee7f4a16568d 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -189,8 +189,7 @@ static void __init efika_setup_arch(void)
 	mpc52xx_pm_init();
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x0);
+	ppc_md_progress("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x0);
 }
 
 static int __init efika_probe(void)
diff --git a/arch/powerpc/platforms/52xx/lite5200.c b/arch/powerpc/platforms/52xx/lite5200.c
index 0fd67b3ffc3e..38db50af4258 100644
--- a/arch/powerpc/platforms/52xx/lite5200.c
+++ b/arch/powerpc/platforms/52xx/lite5200.c
@@ -146,8 +146,7 @@ static void lite5200_resume_finish(void __iomem *mbar)
 
 static void __init lite5200_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("lite5200_setup_arch()", 0);
+	ppc_md_progress("lite5200_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index 19626cd42406..d5b9cb44dd58 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -196,8 +196,7 @@ static void __init media5200_setup_arch(void)
 	struct mpc52xx_gpio __iomem *gpio;
 	u32 port_config;
 
-	if (ppc_md.progress)
-		ppc_md.progress("media5200_setup_arch()", 0);
+	ppc_md_progress("media5200_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index f1e85e86f5e5..5980dad483c0 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -32,8 +32,7 @@
  */
 static void __init mpc5200_simple_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc5200_simple_setup_arch()", 0);
+	ppc_md_progress("mpc5200_simple_setup_arch()", 0);
 
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 8f1856ba692e..9b85cd85ceeb 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -249,8 +249,7 @@ static void __init init_ioports(void)
 
 static void __init ep8248e_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("ep8248e_setup_arch()", 0);
+	ppc_md_progress("ep8248e_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -280,8 +279,7 @@ static void __init ep8248e_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("ep8248e_setup_arch(), finish", 0);
+	ppc_md_progress("ep8248e_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 51c9bfd97592..8e59b10f5038 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -159,8 +159,7 @@ static void __init init_ioports(void)
 
 static void __init km82xx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("km82xx_setup_arch()", 0);
+	ppc_md_progress("km82xx_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -171,8 +170,7 @@ static void __init km82xx_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("km82xx_setup_arch(), finish", 0);
+	ppc_md_progress("km82xx_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
index f9b2b1617eeb..73ed4b6ce08f 100644
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c
@@ -134,8 +134,7 @@ static void __init mpc8272_ads_setup_arch(void)
 	struct device_node *np;
 	__be32 __iomem *bcsr;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch()", 0);
+	ppc_md_progress("mpc8272_ads_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -172,8 +171,7 @@ static void __init mpc8272_ads_setup_arch(void)
 
 	init_ioports();
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8272_ads_setup_arch(), finish", 0);
+	ppc_md_progress("mpc8272_ads_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
index 4080cb4253d3..367d2b30031f 100644
--- a/arch/powerpc/platforms/82xx/pq2fads.c
+++ b/arch/powerpc/platforms/82xx/pq2fads.c
@@ -117,8 +117,7 @@ static void __init pq2fads_setup_arch(void)
 	struct device_node *np;
 	__be32 __iomem *bcsr;
 
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch()", 0);
+	ppc_md_progress("pq2fads_setup_arch()", 0);
 
 	cpm2_reset();
 
@@ -150,8 +149,7 @@ static void __init pq2fads_setup_arch(void)
 	/* Enable external IRQs */
 	clrbits32(&cpm2_immr->im_siu_conf.siu_82xx.sc_siumcr, 0x0c000000);
 
-	if (ppc_md.progress)
-		ppc_md.progress("pq2fads_setup_arch(), finish", 0);
+	ppc_md_progress("pq2fads_setup_arch(), finish", 0);
 }
 
 static const struct of_device_id of_bus_ids[] __initconst = {
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 2fb2a85d131f..d7fd14535193 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -125,8 +125,7 @@ void __init mpc83xx_setup_arch(void)
 	int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
 	unsigned long va = fix_to_virt(FIX_IMMR_BASE);
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc83xx_setup_arch()", 0);
+	ppc_md_progress("mpc83xx_setup_arch()", 0);
 
 	setbat(-1, va, immrbase, immrsize, PAGE_KERNEL_NCG);
 	update_bats();
diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index a029aa090538..4dd1f1cf051b 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -36,8 +36,7 @@ void __init bsc913x_qds_pic_init(void)
  */
 static void __init bsc913x_qds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("bsc913x_qds_setup_arch()", 0);
+	ppc_md_progress("bsc913x_qds_setup_arch()", 0);
 
 #if defined(CONFIG_SMP)
 	mpc85xx_smp_init();
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index 361b4371d073..8972c78375d1 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -32,8 +32,7 @@ void __init bsc913x_rdb_pic_init(void)
  */
 static void __init bsc913x_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("bsc913x_rdb_setup_arch()", 0);
+	ppc_md_progress("bsc913x_rdb_setup_arch()", 0);
 
 	pr_info("bsc913x board from Freescale Semiconductor\n");
 }
diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 34975708be79..4aacc36ea15b 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -35,8 +35,7 @@ static void __init c293_pcie_pic_init(void)
  */
 static void __init c293_pcie_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("c293_pcie_setup_arch()", 0);
+	ppc_md_progress("c293_pcie_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 3678a1fbf5ad..871f73a86f60 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -105,8 +105,7 @@ static void __init ge_imp3a_setup_arch(void)
 {
 	struct device_node *regs;
 
-	if (ppc_md.progress)
-		ppc_md.progress("ge_imp3a_setup_arch()", 0);
+	ppc_md_progress("ge_imp3a_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index af38c3aec042..78b1dbcc0edc 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -135,8 +135,7 @@ static void __init ksi8560_setup_arch(void)
 
 	of_node_put(cpld);
 
-	if (ppc_md.progress)
-		ppc_md.progress("ksi8560_setup_arch()", 0);
+	ppc_md_progress("ksi8560_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/mpc8536_ds.c b/arch/powerpc/platforms/85xx/mpc8536_ds.c
index 58ab3831913f..a88ab88d09a6 100644
--- a/arch/powerpc/platforms/85xx/mpc8536_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc8536_ds.c
@@ -40,8 +40,7 @@ void __init mpc8536_ds_pic_init(void)
  */
 static void __init mpc8536_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc8536_ds_setup_arch()", 0);
+	ppc_md_progress("mpc8536_ds_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ads.c b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
index 7c67438e76f8..b5e4cc420ac6 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ads.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ads.c
@@ -122,8 +122,7 @@ static void __init init_ioports(void)
 
 static void __init mpc85xx_ads_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ads_setup_arch()", 0);
+	ppc_md_progress("mpc85xx_ads_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 0e6964c7fdd6..41079d02dee8 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -319,8 +319,7 @@ static void __init mpc85xx_cds_setup_arch(void)
 	struct device_node *np;
 	int cds_pci_slot;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_cds_setup_arch()", 0);
+	ppc_md_progress("mpc85xx_cds_setup_arch()", 0);
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,mpc8548cds-fpga");
 	if (!np) {
@@ -340,7 +339,7 @@ static void __init mpc85xx_cds_setup_arch(void)
 		cds_pci_slot = ((in_8(&cadmus->cm_csr) >> 6) & 0x3) + 1;
 		snprintf(buf, 40, "CDS Version = 0x%x in slot %d\n",
 				in_8(&cadmus->cm_ver), cds_pci_slot);
-		ppc_md.progress(buf, 0);
+		ppc_md_progress(buf, 0);
 	}
 
 #ifdef CONFIG_PCI
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 70167b8f00a3..f55313df9130 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -147,8 +147,7 @@ static void __init mpc85xx_ds_uli_init(void)
  */
 static void __init mpc85xx_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_ds_setup_arch()", 0);
+	ppc_md_progress("mpc85xx_ds_setup_arch()", 0);
 
 	swiotlb_detect_4g();
 	fsl_pci_assign_primary();
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 28a04928250f..53775cbe297a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -272,8 +272,7 @@ static void __init mpc85xx_mds_qe_init(void) { }
 
 static void __init mpc85xx_mds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_mds_setup_arch()", 0);
+	ppc_md_progress("mpc85xx_mds_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index aa24793ad25c..f841089bbbce 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -63,8 +63,7 @@ void __init mpc85xx_rdb_pic_init(void)
  */
 static void __init mpc85xx_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc85xx_rdb_setup_arch()", 0);
+	ppc_md_progress("mpc85xx_rdb_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/85xx/mvme2500.c b/arch/powerpc/platforms/85xx/mvme2500.c
index 1b59e45a0c64..c7112719cd4c 100644
--- a/arch/powerpc/platforms/85xx/mvme2500.c
+++ b/arch/powerpc/platforms/85xx/mvme2500.c
@@ -35,8 +35,7 @@ void __init mvme2500_pic_init(void)
  */
 static void __init mvme2500_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mvme2500_setup_arch()", 0);
+	ppc_md_progress("mvme2500_setup_arch()", 0);
 	fsl_pci_assign_primary();
 	pr_info("MVME2500 board from Artesyn\n");
 }
diff --git a/arch/powerpc/platforms/85xx/p1010rdb.c b/arch/powerpc/platforms/85xx/p1010rdb.c
index 14ec79a32746..74213e7d6cc5 100644
--- a/arch/powerpc/platforms/85xx/p1010rdb.c
+++ b/arch/powerpc/platforms/85xx/p1010rdb.c
@@ -41,8 +41,7 @@ void __init p1010_rdb_pic_init(void)
  */
 static void __init p1010_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1010_rdb_setup_arch()", 0);
+	ppc_md_progress("p1010_rdb_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/p1022_ds.c b/arch/powerpc/platforms/85xx/p1022_ds.c
index 23d0926298b9..2edeb3324e47 100644
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@ -471,8 +471,7 @@ early_param("video", early_video_setup);
  */
 static void __init p1022_ds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1022_ds_setup_arch()", 0);
+	ppc_md_progress("p1022_ds_setup_arch()", 0);
 
 #if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
 	diu_ops.set_monitor_port	= p1022ds_set_monitor_port;
diff --git a/arch/powerpc/platforms/85xx/p1022_rdk.c b/arch/powerpc/platforms/85xx/p1022_rdk.c
index d1159150c3b5..6534a2bf862d 100644
--- a/arch/powerpc/platforms/85xx/p1022_rdk.c
+++ b/arch/powerpc/platforms/85xx/p1022_rdk.c
@@ -110,8 +110,7 @@ void __init p1022_rdk_pic_init(void)
  */
 static void __init p1022_rdk_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("p1022_rdk_setup_arch()", 0);
+	ppc_md_progress("p1022_rdk_setup_arch()", 0);
 
 #if defined(CONFIG_FB_FSL_DIU) || defined(CONFIG_FB_FSL_DIU_MODULE)
 	diu_ops.set_pixel_clock		= p1022rdk_set_pixel_clock;
diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index 9df0439a9382..5ec718ae691c 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -41,8 +41,7 @@ static void __init p1023_rdb_setup_arch(void)
 {
 	struct device_node *np;
 
-	if (ppc_md.progress)
-		ppc_md.progress("p1023_rdb_setup_arch()", 0);
+	ppc_md_progress("p1023_rdb_setup_arch()", 0);
 
 	/* Map BCSR area */
 	np = of_find_node_by_name(NULL, "bcsr");
diff --git a/arch/powerpc/platforms/85xx/ppa8548.c b/arch/powerpc/platforms/85xx/ppa8548.c
index acd19c52ad43..1562997a239b 100644
--- a/arch/powerpc/platforms/85xx/ppa8548.c
+++ b/arch/powerpc/platforms/85xx/ppa8548.c
@@ -37,8 +37,7 @@ static void __init ppa8548_pic_init(void)
  */
 static void __init ppa8548_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("ppa8548_setup_arch()", 0);
+	ppc_md_progress("ppa8548_setup_arch()", 0);
 }
 
 static void ppa8548_show_cpuinfo(struct seq_file *m)
diff --git a/arch/powerpc/platforms/85xx/qemu_e500.c b/arch/powerpc/platforms/85xx/qemu_e500.c
index 6e4b1ddf292b..7ade7df4275a 100644
--- a/arch/powerpc/platforms/85xx/qemu_e500.c
+++ b/arch/powerpc/platforms/85xx/qemu_e500.c
@@ -39,7 +39,7 @@ void __init qemu_e500_pic_init(void)
 
 static void __init qemu_e500_setup_arch(void)
 {
-	ppc_md.progress("qemu_e500_setup_arch()", 0);
+	ppc_md_progress("qemu_e500_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 	swiotlb_detect_4g();
diff --git a/arch/powerpc/platforms/85xx/socrates.c b/arch/powerpc/platforms/85xx/socrates.c
index 9fa1338bc002..d3d363b2768f 100644
--- a/arch/powerpc/platforms/85xx/socrates.c
+++ b/arch/powerpc/platforms/85xx/socrates.c
@@ -61,8 +61,7 @@ static void __init socrates_pic_init(void)
  */
 static void __init socrates_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("socrates_setup_arch()", 0);
+	ppc_md_progress("socrates_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 }
diff --git a/arch/powerpc/platforms/85xx/stx_gp3.c b/arch/powerpc/platforms/85xx/stx_gp3.c
index 5e2646b4c039..27e7bca3f384 100644
--- a/arch/powerpc/platforms/85xx/stx_gp3.c
+++ b/arch/powerpc/platforms/85xx/stx_gp3.c
@@ -55,8 +55,7 @@ static void __init stx_gp3_pic_init(void)
  */
 static void __init stx_gp3_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("stx_gp3_setup_arch()", 0);
+	ppc_md_progress("stx_gp3_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/85xx/tqm85xx.c b/arch/powerpc/platforms/85xx/tqm85xx.c
index 80effb028bf4..1ddb5628a48a 100644
--- a/arch/powerpc/platforms/85xx/tqm85xx.c
+++ b/arch/powerpc/platforms/85xx/tqm85xx.c
@@ -54,8 +54,7 @@ static void __init tqm85xx_pic_init(void)
  */
 static void __init tqm85xx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("tqm85xx_setup_arch()", 0);
+	ppc_md_progress("tqm85xx_setup_arch()", 0);
 
 #ifdef CONFIG_CPM2
 	cpm2_reset();
diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platforms/85xx/twr_p102x.c
index b88e23a334a4..ea1cfd909598 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -45,8 +45,7 @@ static void __init twr_p1025_pic_init(void)
  */
 static void __init twr_p1025_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("twr_p1025_setup_arch()", 0);
+	ppc_md_progress("twr_p1025_setup_arch()", 0);
 
 	mpc85xx_smp_init();
 
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index 6a403705ae44..304d2802c341 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -276,8 +276,7 @@ static void __init mpc86xx_hpcd_setup_arch(void)
 	struct resource r;
 	unsigned char *pixis;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcd_setup_arch()", 0);
+	ppc_md_progress("mpc86xx_hpcd_setup_arch()", 0);
 
 	fsl_pci_assign_primary();
 
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
index 7b00ebd2d7f8..482470d59344 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_hpcn.c
@@ -56,8 +56,7 @@ static int mpc86xx_exclude_device(struct pci_controller *hose,
 static void __init
 mpc86xx_hpcn_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc86xx_hpcn_setup_arch()", 0);
+	ppc_md_progress("mpc86xx_hpcn_setup_arch()", 0);
 
 #ifdef CONFIG_PCI
 	ppc_md.pci_exclude_device = mpc86xx_exclude_device;
diff --git a/arch/powerpc/platforms/86xx/mvme7100.c b/arch/powerpc/platforms/86xx/mvme7100.c
index c0ac40514361..76ef81d4f653 100644
--- a/arch/powerpc/platforms/86xx/mvme7100.c
+++ b/arch/powerpc/platforms/86xx/mvme7100.c
@@ -43,8 +43,7 @@ static void __init mvme7100_setup_arch(void)
 	void __iomem *mvme7100_regs = NULL;
 	u8 reg;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mvme7100_setup_arch()", 0);
+	ppc_md_progress("mvme7100_setup_arch()", 0);
 
 #ifdef CONFIG_SMP
 	mpc86xx_smp_init();
diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index 6c6e714a7521..08d209b965b6 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -67,8 +67,7 @@ static int __init amigaone_add_bridge(struct device_node *dev)
 
 void __init amigaone_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
+	ppc_md_progress("Linux/PPC " UTS_RELEASE "\n", 0);
 }
 
 static void __init amigaone_discover_phbs(void)
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 5db82cd365cf..bceb19f5b6eb 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -345,7 +345,7 @@ static void __init chrp_setup_arch(void)
 	 * Print the banner, then scroll down so boot progress
 	 * can be printed.  -- Cort
 	 */
-	if (ppc_md.progress) ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0x0);
+	ppc_md_progress("Linux/PPC " UTS_RELEASE "\n", 0x0);
 }
 
 static void chrp_8259_cascade(struct irq_desc *desc)
@@ -546,8 +546,7 @@ chrp_init2(void)
 	request_region(0x80,0x10,"dma page reg");
 	request_region(0xc0,0x20,"dma2");
 
-	if (ppc_md.progress)
-		ppc_md.progress("  Have fun!    ", 0x7777);
+	ppc_md_progress("  Have fun!    ", 0x7777);
 }
 
 static int __init chrp_probe(void)
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index a167ee88fbf9..748acdea94ad 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -113,8 +113,7 @@ static void __init holly_init_pci(void)
 {
 	struct device_node *np;
 
-	if (ppc_md.progress)
-		ppc_md.progress("holly_setup_arch():set_bridge", 0);
+	ppc_md_progress("holly_setup_arch():set_bridge", 0);
 
 	/* setup PCI host bridge */
 	holly_remap_bridge();
@@ -126,8 +125,7 @@ static void __init holly_init_pci(void)
 	of_node_put(np);
 
 	ppc_md.pci_exclude_device = holly_exclude_device;
-	if (ppc_md.progress)
-		ppc_md.progress("tsi108: resources set", 0x100);
+	ppc_md_progress("tsi108: resources set", 0x100);
 }
 
 static void __init holly_setup_arch(void)
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index ec93d69dc0ee..3e51adb81015 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -62,16 +62,15 @@ static void __init mpc7448_hpc2_setup_pci(void)
 {
 #ifdef CONFIG_PCI
 	struct device_node *np;
-	if (ppc_md.progress)
-		ppc_md.progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
+
+	ppc_md_progress("mpc7448_hpc2_setup_pci():set_bridge", 0);
 
 	/* setup PCI host bridge */
 	for_each_compatible_node(np, "pci", "tsi108-pci")
 		tsi108_setup_pci(np, MPC7448HPC2_PCI_CFG_PHYS, 0);
 
 	ppc_md.pci_exclude_device = mpc7448_hpc2_exclude_device;
-	if (ppc_md.progress)
-		ppc_md.progress("tsi108: resources set", 0x100);
+	ppc_md_progress("tsi108: resources set", 0x100);
 #endif
 }
 
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 00bec0f051be..8d988c65dc05 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -154,8 +154,7 @@ static const struct of_device_id mvme5100_of_bus_ids[] __initconst = {
  */
 static void __init mvme5100_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mvme5100_setup_arch()", 0);
+	ppc_md_progress("mvme5100_setup_arch()", 0);
 
 	restart = ioremap(BOARD_MODRST_REG, 4);
 }
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 5b26a9012d2e..e5e6ad514d1d 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -246,7 +246,7 @@ static void __init psurge_quad_init(void)
 {
 	int procbits;
 
-	if (ppc_md.progress) ppc_md.progress("psurge_quad_init", 0x351);
+	ppc_md_progress("psurge_quad_init", 0x351);
 	procbits = ~PSURGE_QUAD_IN(PSURGE_QUAD_WHICH_CPU);
 	if (psurge_type == PSURGE_QUAD_ICEGRASS)
 		PSURGE_QUAD_BIS(PSURGE_QUAD_RESET_CTL, procbits);
@@ -325,7 +325,7 @@ static void __init smp_psurge_probe(void)
 	for (i = 1; i < ncpus ; ++i)
 		set_cpu_present(i, true);
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_probe - done", 0x352);
+	ppc_md_progress("smp_psurge_probe - done", 0x352);
 }
 
 static int __init smp_psurge_kick_cpu(int nr)
@@ -345,7 +345,7 @@ static int __init smp_psurge_kick_cpu(int nr)
 		asm volatile("dcbf 0,%0" : : "r" (a) : "memory");
 	asm volatile("sync");
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_kick_cpu", 0x353);
+	ppc_md_progress("smp_psurge_kick_cpu", 0x353);
 
 	/* This is going to freeze the timeebase, we disable interrupts */
 	local_irq_save(flags);
@@ -392,7 +392,7 @@ static int __init smp_psurge_kick_cpu(int nr)
 	if (psurge_type == PSURGE_DUAL)
 		psurge_set_ipi(1);
 
-	if (ppc_md.progress) ppc_md.progress("smp_psurge_kick_cpu - done", 0x354);
+	ppc_md_progress("smp_psurge_kick_cpu - done", 0x354);
 
 	return 0;
 }
@@ -763,7 +763,7 @@ static void __init smp_core99_probe(void)
 	struct device_node *cpus;
 	int ncpus = 0;
 
-	if (ppc_md.progress) ppc_md.progress("smp_core99_probe", 0x345);
+	ppc_md_progress("smp_core99_probe", 0x345);
 
 	/* Count CPUs in the device-tree */
 	for_each_node_by_type(cpus, "cpu")
@@ -800,8 +800,7 @@ static int smp_core99_kick_cpu(int nr)
 	if (nr < 0 || nr > 3)
 		return -ENOENT;
 
-	if (ppc_md.progress)
-		ppc_md.progress("smp_core99_kick_cpu", 0x346);
+	ppc_md_progress("smp_core99_kick_cpu", 0x346);
 
 	local_irq_save(flags);
 
@@ -828,7 +827,7 @@ static int smp_core99_kick_cpu(int nr)
 	patch_instruction(vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
-	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
+	ppc_md_progress("smp_core99_kick_cpu done", 0x347);
 
 	return 0;
 }
@@ -896,8 +895,7 @@ static void __init smp_core99_bringup_done(void)
 				  smp_core99_cpu_online, NULL);
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("smp_core99_bringup_done", 0x349);
+	ppc_md_progress("smp_core99_bringup_done", 0x349);
 }
 #endif /* CONFIG_PPC64 */
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0828cd2b6af0..d71f050befd9 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -488,7 +488,7 @@ void __init pseries_little_endian_exceptions(void)
 		mdelay(get_longbusy_msecs(rc));
 	}
 	if (rc) {
-		ppc_md.progress("H_SET_MODE LE exception fail", 0);
+		ppc_md_progress("H_SET_MODE LE exception fail", 0);
 		panic("Could not enable little endian exceptions");
 	}
 }
@@ -885,11 +885,11 @@ static int __init pSeries_init_panel(void)
 {
 	/* Manually leave the kernel version on the panel. */
 #ifdef __BIG_ENDIAN__
-	ppc_md.progress("Linux ppc64\n", 0);
+	ppc_md_progress("Linux ppc64\n", 0);
 #else
-	ppc_md.progress("Linux ppc64le\n", 0);
+	ppc_md_progress("Linux ppc64le\n", 0);
 #endif
-	ppc_md.progress(init_utsname()->version, 0);
+	ppc_md_progress(init_utsname()->version, 0);
 
 	return 0;
 }
-- 
2.39.1

