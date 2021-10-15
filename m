Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFAB42EE7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 12:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW23Q62Xnz3f1T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 21:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW20f62K3z3cFN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 21:03:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HW1zw1WY3z9sSL;
 Fri, 15 Oct 2021 12:03:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DI58JirztcI5; Fri, 15 Oct 2021 12:03:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HW1zp6zB7z9sST;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D71C98B78C;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dCvEUkDQ25A9; Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.255])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 55F348B792;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19FA2roL2627039
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 12:02:53 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19FA2r1R2627038;
 Fri, 15 Oct 2021 12:02:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 5/8] powerpc/fsl_booke: Tell map_mem_in_cams() if init is
 done
Date: Fri, 15 Oct 2021 12:02:46 +0200
Message-Id: <3b69a7e0b393b16984ade882a5eae5d727717459.1634292136.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
References: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634292165; l=4478; s=20211009;
 h=from:subject:message-id; bh=/SjyXb3zlDtvbYhrULnG+J2Dv+4vb9SRFhiGiimbiq8=;
 b=syby9d/3+5z8OCh/oYw/19Kg13YPGLV59pVaQ/raTjlOeKwu17Xpy7v0o9Izg+ALI5nPm2ZuIGJl
 444k5O1nBq390n6b9RBURO+rntb/GW32IN8ki1QZBoivTip4hTgt
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to be able to call map_mem_in_cams() once more
after init for STRICT_KERNEL_RWX, add an argument.

For now, map_mem_in_cams() is always called only during init.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mmu_decl.h           |  2 +-
 arch/powerpc/mm/nohash/fsl_book3e.c  | 12 ++++++------
 arch/powerpc/mm/nohash/kaslr_booke.c |  2 +-
 arch/powerpc/mm/nohash/tlb.c         |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index dd1cabc2ea0f..e13a3c0caa02 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -126,7 +126,7 @@ unsigned long mmu_mapin_ram(unsigned long base, unsigned long top);
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
 extern unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx,
-				     bool dryrun);
+				     bool dryrun, bool init);
 extern unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
 				 phys_addr_t phys);
 #ifdef CONFIG_PPC32
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index fdf1029e62f0..375b2b8238c1 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -167,7 +167,7 @@ unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
 
 static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 					unsigned long ram, int max_cam_idx,
-					bool dryrun)
+					bool dryrun, bool init)
 {
 	int i;
 	unsigned long amount_mapped = 0;
@@ -202,12 +202,12 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	return amount_mapped;
 }
 
-unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx, bool dryrun)
+unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx, bool dryrun, bool init)
 {
 	unsigned long virt = PAGE_OFFSET;
 	phys_addr_t phys = memstart_addr;
 
-	return map_mem_in_cams_addr(phys, virt, ram, max_cam_idx, dryrun);
+	return map_mem_in_cams_addr(phys, virt, ram, max_cam_idx, dryrun, init);
 }
 
 #ifdef CONFIG_PPC32
@@ -248,7 +248,7 @@ void __init adjust_total_lowmem(void)
 	ram = min((phys_addr_t)__max_low_memory, (phys_addr_t)total_lowmem);
 
 	i = switch_to_as1();
-	__max_low_memory = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, false);
+	__max_low_memory = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, false, true);
 	restore_to_as0(i, 0, 0, 1);
 
 	pr_info("Memory CAM mapping: ");
@@ -319,11 +319,11 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
 		/* map a 64M area for the second relocation */
 		if (memstart_addr > start)
 			map_mem_in_cams(0x4000000, CONFIG_LOWMEM_CAM_NUM,
-					false);
+					false, true);
 		else
 			map_mem_in_cams_addr(start, PAGE_OFFSET + offset,
 					0x4000000, CONFIG_LOWMEM_CAM_NUM,
-					false);
+					false, true);
 		restore_to_as0(n, offset, __va(dt_ptr), 1);
 		/* We should never reach here */
 		panic("Relocation error");
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 4c74e8a5482b..8fc49b1b4a91 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -314,7 +314,7 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 		pr_warn("KASLR: No safe seed for randomizing the kernel base.\n");
 
 	ram = min_t(phys_addr_t, __max_low_memory, size);
-	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
+	ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true, false);
 	linear_sz = min_t(unsigned long, ram, SZ_512M);
 
 	/* If the linear size is smaller than 64M, do not randmize */
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69141d5..fc195b9f524b 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -643,7 +643,7 @@ static void early_init_this_mmu(void)
 
 		if (map)
 			linear_map_top = map_mem_in_cams(linear_map_top,
-							 num_cams, false);
+							 num_cams, true, true);
 	}
 #endif
 
@@ -764,7 +764,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
 
 		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
-					    true);
+					    false, true);
 
 		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
 	} else
-- 
2.31.1

