Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94843838F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 13:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hbzzm587Pz3drt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 22:50:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hbzx36dRrz3cTy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 22:47:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HbzwX5BH2z9s2q;
 Sat, 23 Oct 2021 13:47:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uur7x1x_otDA; Sat, 23 Oct 2021 13:47:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HbzwS3k6Nz9s32;
 Sat, 23 Oct 2021 13:47:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19NBlK2m441183
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 23 Oct 2021 13:47:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19NBlK86441182;
 Sat, 23 Oct 2021 13:47:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 07/10] powerpc/fsl_booke: Tell map_mem_in_cams() if init is
 done
Date: Sat, 23 Oct 2021 13:47:12 +0200
Message-Id: <190469e547b181abfbf7a7c2b98407cb6a8321db.1634983809.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
References: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634989633; l=4498; s=20211009;
 h=from:subject:message-id; bh=EosFtMqY8PIhkX2yuHpQvYEMoymVtHxz/lwpVpDH48k=;
 b=xRey5vYfBRXLwMHDMPquwM8Xw8VFcJysdW1ho3ijGJk7CPoVRPD6QwJXzW5qabifNrKKW5igmqTG
 Lz+4E9BfBU/qfUEzhQggFHCJ0Cxd6LdsbXF9ZXFvFHOuJnt3Ia7v
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
v2: No change
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
index 2668bb06e4fa..8ae1ba7985df 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -168,7 +168,7 @@ unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
 
 static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 					unsigned long ram, int max_cam_idx,
-					bool dryrun)
+					bool dryrun, bool init)
 {
 	int i;
 	unsigned long amount_mapped = 0;
@@ -203,12 +203,12 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
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
@@ -249,7 +249,7 @@ void __init adjust_total_lowmem(void)
 	ram = min((phys_addr_t)__max_low_memory, (phys_addr_t)total_lowmem);
 
 	i = switch_to_as1();
-	__max_low_memory = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, false);
+	__max_low_memory = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, false, true);
 	restore_to_as0(i, 0, 0, 1);
 
 	pr_info("Memory CAM mapping: ");
@@ -320,11 +320,11 @@ notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
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

