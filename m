Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120B43A636
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:52:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdTFF6sZtz3djK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdTBx03Xfz2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 08:50:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HdTBZ47wTz9s2S;
 Mon, 25 Oct 2021 23:49:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1qsLImEUcOO; Mon, 25 Oct 2021 23:49:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HdTBZ1pJjz9s2N;
 Mon, 25 Oct 2021 23:49:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19PLnAJ1007255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 23:49:12 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19PLiYFU007033;
 Mon, 25 Oct 2021 23:44:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 09/10] powerpc/fsl_booke: Update of TLBCAMs after init
Date: Mon, 25 Oct 2021 23:44:21 +0200
Message-Id: <c7d2f279533fcba0c66801d1bb6528b96c39ecfd.1635198209.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
References: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635198260; l=2978; s=20211009;
 h=from:subject:message-id; bh=C43yTB0Jz0DWME3YSGNvrvtRu4CeXk5uf6/L0Z14DUo=;
 b=MeS7U2Yk7De/SD1N0E0y9T2XGBsGGT5qTuVTpN6l+THAHZXYiPgyfi1zdWXp9unNkDkpfjNFoPBL
 GIqK7tZ0BXhdzqMHwfAVsWwis3FScZwjj4vlw01Ln7e3x7ZO2/Ru
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

After init, set readonly memory as ROX and set readwrite
memory as RWX, if STRICT_KERNEL_RWX is enabled.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: No change
v2: No change
---
 arch/powerpc/mm/mmu_decl.h          |  2 +-
 arch/powerpc/mm/nohash/fsl_book3e.c | 32 +++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index e13a3c0caa02..0dd4c18f8363 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -168,7 +168,7 @@ static inline phys_addr_t v_block_mapped(unsigned long va) { return 0; }
 static inline unsigned long p_block_mapped(phys_addr_t pa) { return 0; }
 #endif
 
-#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_8xx)
+#if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC_FSL_BOOK3E)
 void mmu_mark_initmem_nx(void);
 void mmu_mark_rodata_ro(void);
 #else
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index 88132cab3442..b231a54f540c 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -182,7 +182,7 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	/* Calculate CAM values */
 	for (i = 0; boundary && i < max_cam_idx; i++) {
 		unsigned long cam_sz;
-		pgprot_t prot = PAGE_KERNEL_X;
+		pgprot_t prot = init ? PAGE_KERNEL_X : PAGE_KERNEL_ROX;
 
 		cam_sz = calc_cam_sz(boundary, virt, phys);
 		if (!dryrun)
@@ -195,7 +195,7 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	}
 	for (ram -= amount_mapped; ram && i < max_cam_idx; i++) {
 		unsigned long cam_sz;
-		pgprot_t prot = PAGE_KERNEL_X;
+		pgprot_t prot = init ? PAGE_KERNEL_X : PAGE_KERNEL;
 
 		cam_sz = calc_cam_sz(ram, virt, phys);
 		if (!dryrun)
@@ -210,8 +210,13 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	if (dryrun)
 		return amount_mapped;
 
-	loadcam_multi(0, i, max_cam_idx);
-	tlbcam_index = i;
+	if (init) {
+		loadcam_multi(0, i, max_cam_idx);
+		tlbcam_index = i;
+	} else {
+		loadcam_multi(0, i, 0);
+		WARN_ON(i > tlbcam_index);
+	}
 
 #ifdef CONFIG_PPC64
 	get_paca()->tcd.esel_next = i;
@@ -280,6 +285,25 @@ void __init adjust_total_lowmem(void)
 	memblock_set_current_limit(memstart_addr + __max_low_memory);
 }
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+void mmu_mark_rodata_ro(void)
+{
+	/* Everything is done in mmu_mark_initmem_nx() */
+}
+#endif
+
+void mmu_mark_initmem_nx(void)
+{
+	unsigned long remapped;
+
+	if (!strict_kernel_rwx_enabled())
+		return;
+
+	remapped = map_mem_in_cams(__max_low_memory, CONFIG_LOWMEM_CAM_NUM, false, false);
+
+	WARN_ON(__max_low_memory != remapped);
+}
+
 void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
 {
-- 
2.31.1

