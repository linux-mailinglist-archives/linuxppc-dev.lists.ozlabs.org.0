Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877B438392
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 13:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hc00h07Bxz3f1K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 22:51:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbzxD6CwHz3cXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 22:48:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HbzwZ3pfJz9s33;
 Sat, 23 Oct 2021 13:47:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3H-IBd099V7; Sat, 23 Oct 2021 13:47:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HbzwS6sfZz9s38;
 Sat, 23 Oct 2021 13:47:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19NBlKkM441192
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 23 Oct 2021 13:47:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19NBlKke441191;
 Sat, 23 Oct 2021 13:47:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 09/10] powerpc/fsl_booke: Update of TLBCAMs after init
Date: Sat, 23 Oct 2021 13:47:14 +0200
Message-Id: <1aa98a5ba8c3a1934f727eba70c641e86e01f73c.1634983809.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
References: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634989633; l=2963; s=20211009;
 h=from:subject:message-id; bh=Og1EQpdf48R3VhQ/ssjHdpTTpBkcto19/FrdU4Q3Gow=;
 b=wKfO3oyk4ifTf8rs48gesJ65i4fbdor/lp3ebVED7d4blX/c8ymvqtv0X/F9dZnpTtGHcxx4jt3c
 /BSAT0bSAcdlIFNYAHhzEpnEJ9R4b4Kb96Qeyb8mBpfXjoA4vLeb
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

