Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B987D9EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 12:18:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Txdsq6738z3vcH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 22:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxdsP3Cbhz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 22:18:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TxdsF1HmZz9sgJ;
	Sat, 16 Mar 2024 12:18:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmImxgpwDZLg; Sat, 16 Mar 2024 12:18:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TxdsF07B0z9s2l;
	Sat, 16 Mar 2024 12:18:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EB7708B768;
	Sat, 16 Mar 2024 12:18:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0q9Spab6pB2M; Sat, 16 Mar 2024 12:18:24 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (PO18731.IDSI0.si.c-s.fr [192.168.233.183])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8638E8B764;
	Sat, 16 Mar 2024 12:18:24 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2] powerpc: Handle error in mark_rodata_ro() and mark_initmem_nx()
Date: Sat, 16 Mar 2024 12:18:21 +0100
Message-ID: <b16329611deb89e1af505d43f0e2a91310584d26.1710587887.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710587902; l=8098; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YZudm0mc7oieHhIoGo6jmZA09xujHbMs3Vj+6U3O8yY=; b=8AixODopzd1V5xuUB+A8j1/mGniaweXfE/AdYMEt140Qd/QjIR/kpvwP+/GGbrvsSYTRbKUGp AvO+WkahkqjCPuqQI7tMM52QWSXPRvqUwE/seWehdsdIr5LbPEyMwbu
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

mark_rodata_ro() and mark_initmem_nx() use functions that can
fail like set_memory_nx() and set_memory_ro(), leading to a not
protected kernel.

In case of failure, panic.

Link: https://github.com/KSPP/linux/issues/7
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/836f75710daef12dfea55f8fb6055d7fdaf716e3.1708078577.git.christophe.leroy@csgroup.eu
---
v2: Rebased on top of 6388eaa7f116 ("Automatic merge of 'master' into merge (2024-03-16 10:18)")
---
 arch/powerpc/mm/book3s32/mmu.c |  7 +++++--
 arch/powerpc/mm/mmu_decl.h     |  8 +++----
 arch/powerpc/mm/nohash/8xx.c   | 33 ++++++++++++++++++-----------
 arch/powerpc/mm/nohash/e500.c  | 10 ++++++---
 arch/powerpc/mm/pgtable_32.c   | 38 +++++++++++++++++++++++++---------
 5 files changed, 65 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 5445587bfe84..100f999871bc 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -193,7 +193,7 @@ static bool is_module_segment(unsigned long addr)
 	return true;
 }
 
-void mmu_mark_initmem_nx(void)
+int mmu_mark_initmem_nx(void)
 {
 	int nb = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
 	int i;
@@ -230,9 +230,10 @@ void mmu_mark_initmem_nx(void)
 
 		mtsr(mfsr(i << 28) | 0x10000000, i << 28);
 	}
+	return 0;
 }
 
-void mmu_mark_rodata_ro(void)
+int mmu_mark_rodata_ro(void)
 {
 	int nb = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
 	int i;
@@ -245,6 +246,8 @@ void mmu_mark_rodata_ro(void)
 	}
 
 	update_bats();
+
+	return 0;
 }
 
 /*
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 8e84bc214d13..6949c2c937e7 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -160,11 +160,11 @@ static inline unsigned long p_block_mapped(phys_addr_t pa) { return 0; }
 #endif
 
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC_E500)
-void mmu_mark_initmem_nx(void);
-void mmu_mark_rodata_ro(void);
+int mmu_mark_initmem_nx(void);
+int mmu_mark_rodata_ro(void);
 #else
-static inline void mmu_mark_initmem_nx(void) { }
-static inline void mmu_mark_rodata_ro(void) { }
+static inline int mmu_mark_initmem_nx(void) { return 0; }
+static inline int mmu_mark_rodata_ro(void) { return 0; }
 #endif
 
 #ifdef CONFIG_PPC_8xx
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 6be6421086ed..43d4842bb1c7 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -119,23 +119,26 @@ void __init mmu_mapin_immr(void)
 				    PAGE_KERNEL_NCG, MMU_PAGE_512K, true);
 }
 
-static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
-				pgprot_t prot, bool new)
+static int mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
+			       pgprot_t prot, bool new)
 {
 	unsigned long v = PAGE_OFFSET + offset;
 	unsigned long p = offset;
+	int err = 0;
 
 	WARN_ON(!IS_ALIGNED(offset, SZ_512K) || !IS_ALIGNED(top, SZ_512K));
 
-	for (; p < ALIGN(p, SZ_8M) && p < top; p += SZ_512K, v += SZ_512K)
-		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
-	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top; p += SZ_8M, v += SZ_8M)
-		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
-	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top; p += SZ_512K, v += SZ_512K)
-		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+	for (; p < ALIGN(p, SZ_8M) && p < top && !err; p += SZ_512K, v += SZ_512K)
+		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top && !err; p += SZ_8M, v += SZ_8M)
+		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
+	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top && !err; p += SZ_512K, v += SZ_512K)
+		err = __early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
 
 	if (!new)
 		flush_tlb_kernel_range(PAGE_OFFSET + v, PAGE_OFFSET + top);
+
+	return err;
 }
 
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
@@ -166,27 +169,33 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	return top;
 }
 
-void mmu_mark_initmem_nx(void)
+int mmu_mark_initmem_nx(void)
 {
 	unsigned long etext8 = ALIGN(__pa(_etext), SZ_8M);
 	unsigned long sinittext = __pa(_sinittext);
 	unsigned long boundary = strict_kernel_rwx_enabled() ? sinittext : etext8;
 	unsigned long einittext8 = ALIGN(__pa(_einittext), SZ_8M);
+	int err = 0;
 
 	if (!debug_pagealloc_enabled_or_kfence())
-		mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
+		err = mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
 
 	mmu_pin_tlb(block_mapped_ram, false);
+
+	return err;
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mmu_mark_rodata_ro(void)
+int mmu_mark_rodata_ro(void)
 {
 	unsigned long sinittext = __pa(_sinittext);
+	int err;
 
-	mmu_mapin_ram_chunk(0, sinittext, PAGE_KERNEL_ROX, false);
+	err = mmu_mapin_ram_chunk(0, sinittext, PAGE_KERNEL_ROX, false);
 	if (IS_ENABLED(CONFIG_PIN_TLB_DATA))
 		mmu_pin_tlb(block_mapped_ram, true);
+
+	return err;
 }
 #endif
 
diff --git a/arch/powerpc/mm/nohash/e500.c b/arch/powerpc/mm/nohash/e500.c
index 921c3521ec11..266fb22131fc 100644
--- a/arch/powerpc/mm/nohash/e500.c
+++ b/arch/powerpc/mm/nohash/e500.c
@@ -285,19 +285,23 @@ void __init adjust_total_lowmem(void)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mmu_mark_rodata_ro(void)
+int mmu_mark_rodata_ro(void)
 {
 	unsigned long remapped;
 
 	remapped = map_mem_in_cams(__max_low_memory, CONFIG_LOWMEM_CAM_NUM, false, false);
 
-	WARN_ON(__max_low_memory != remapped);
+	if (WARN_ON(__max_low_memory != remapped))
+		return -EINVAL;
+
+	return 0;
 }
 #endif
 
-void mmu_mark_initmem_nx(void)
+int mmu_mark_initmem_nx(void)
 {
 	/* Everything is done in mmu_mark_rodata_ro() */
+	return 0;
 }
 
 void setup_initial_memory_limit(phys_addr_t first_memblock_base,
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index face94977cb2..cfd622ebf774 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -130,31 +130,41 @@ void __init mapin_ram(void)
 	}
 }
 
-void mark_initmem_nx(void)
+static int __mark_initmem_nx(void)
 {
 	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
 				 PFN_DOWN((unsigned long)_sinittext);
+	int err;
 
-	mmu_mark_initmem_nx();
+	err = mmu_mark_initmem_nx();
 
 	if (!v_block_mapped((unsigned long)_sinittext)) {
-		set_memory_nx((unsigned long)_sinittext, numpages);
-		set_memory_rw((unsigned long)_sinittext, numpages);
+		err = set_memory_nx((unsigned long)_sinittext, numpages);
+		if (err)
+			return err;
+		err = set_memory_rw((unsigned long)_sinittext, numpages);
 	}
+	return err;
+}
+
+void mark_initmem_nx(void)
+{
+	int err = __mark_initmem_nx();
+
+	if (err)
+		panic("%s() failed, err = %d\n", __func__, err);
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mark_rodata_ro(void)
+static int __mark_rodata_ro(void)
 {
 	unsigned long numpages;
 
 	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		pr_warn("This platform has HASH MMU, STRICT_MODULE_RWX won't work\n");
 
-	if (v_block_mapped((unsigned long)_stext + 1)) {
-		mmu_mark_rodata_ro();
-		return;
-	}
+	if (v_block_mapped((unsigned long)_stext + 1))
+		return mmu_mark_rodata_ro();
 
 	/*
 	 * mark text and rodata as read only. __end_rodata is set by
@@ -164,6 +174,14 @@ void mark_rodata_ro(void)
 	numpages = PFN_UP((unsigned long)__end_rodata) -
 		   PFN_DOWN((unsigned long)_stext);
 
-	set_memory_ro((unsigned long)_stext, numpages);
+	return set_memory_ro((unsigned long)_stext, numpages);
+}
+
+void mark_rodata_ro(void)
+{
+	int err = __mark_rodata_ro();
+
+	if (err)
+		panic("%s() failed, err = %d\n", __func__, err);
 }
 #endif
-- 
2.43.0

