Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CB42EE71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 12:09:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW22z5VMcz3c9s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 21:05:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW20Z2zhLz3bw7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 21:03:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HW1zv2mJdz9sSJ;
 Fri, 15 Oct 2021 12:03:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCMJ0JA1vz-o; Fri, 15 Oct 2021 12:03:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HW1zp6F4Jz9sSL;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF6E68B78B;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b5s0szab9dBw; Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.255])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56E588B794;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19FA2rCJ2627047
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 12:02:53 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19FA2re82627046;
 Fri, 15 Oct 2021 12:02:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 7/8] powerpc/fsl_booke: Update of TLBCAMs after init
Date: Fri, 15 Oct 2021 12:02:48 +0200
Message-Id: <66bef0b9c273e1121706883f3cf5ad0a053d863f.1634292136.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
References: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634292165; l=2943; s=20211009;
 h=from:subject:message-id; bh=gzG7H3KYBKJ5yQFhvkG5u6bqpV0yLD6k/o96DqH9ELk=;
 b=paIJ63x6J2fXzZLUXlHWCycDOs4xxuq6ZMfM+duUwHDpLnGjPeuz3QPq3lL8QP9GioeWomOuCWzx
 Mr1kEnwWARjhWb4g9S0MLV56KIgHZjWpWWqHxd6TNTuwV1H0uFoW
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
index c1bc11f46344..978e0bcdfa2c 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -181,7 +181,7 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	/* Calculate CAM values */
 	for (i = 0; boundary && i < max_cam_idx; i++) {
 		unsigned long cam_sz;
-		pgprot_t prot = PAGE_KERNEL_X;
+		pgprot_t prot = init ? PAGE_KERNEL_X : PAGE_KERNEL_ROX;
 
 		cam_sz = calc_cam_sz(boundary, virt, phys);
 		if (!dryrun)
@@ -194,7 +194,7 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 	}
 	for (ram -= amount_mapped; ram && i < max_cam_idx; i++) {
 		unsigned long cam_sz;
-		pgprot_t prot = PAGE_KERNEL_X;
+		pgprot_t prot = init ? PAGE_KERNEL_X : PAGE_KERNEL;
 
 		cam_sz = calc_cam_sz(ram, virt, phys);
 		if (!dryrun)
@@ -209,8 +209,13 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
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
@@ -279,6 +284,25 @@ void __init adjust_total_lowmem(void)
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

