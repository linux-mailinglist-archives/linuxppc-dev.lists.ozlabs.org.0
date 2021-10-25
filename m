Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B343A63A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdTGm4pVqz3dyY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:53:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdTC84VDVz3c7r
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 08:50:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HdTBd2Gnlz9s2c;
 Mon, 25 Oct 2021 23:49:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUmBa6QgAeK8; Mon, 25 Oct 2021 23:49:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HdTBb2b3Rz9s2N;
 Mon, 25 Oct 2021 23:49:43 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19PLnAJ7007255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 23:49:12 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19PLiYOK007031;
 Mon, 25 Oct 2021 23:44:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 07/10] powerpc/fsl_booke: Tell map_mem_in_cams() if init is
 done
Date: Mon, 25 Oct 2021 23:44:19 +0200
Message-Id: <7b32c4bb03e38f7d2de8c5815de8d3c0b44e57fb.1635198209.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
References: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635198260; l=4513; s=20211009;
 h=from:subject:message-id; bh=RB+xZk91qJ39yUPiwHf/g5tkgltSDACJFbW19cGTWt4=;
 b=PRPmdleuTDV2TNYn990RwzO31sJCp3vlF3SDJZvGvx3hW/tHF5J2BYE+ZPwBV1ycrEAA553ZtN8e
 +bvv+MgkAknvESQusZRgUoi+Te5Am1NT9TJj842cvF9Mz6+8m/Tt
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
v3: No change
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

