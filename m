Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D562802FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 17:38:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2HMv1N7WzDqZq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 01:38:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2HJj4sPKzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 01:35:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C2HJS3YKzz9v3bX;
 Thu,  1 Oct 2020 17:35:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id s9DFAf4VuOt8; Thu,  1 Oct 2020 17:35:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C2HJS2lBnz9v3bW;
 Thu,  1 Oct 2020 17:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 814338B992;
 Thu,  1 Oct 2020 17:35:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JkVP7JSc9UYM; Thu,  1 Oct 2020 17:35:38 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 344598B986;
 Thu,  1 Oct 2020 17:35:38 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0FD7B65ED9; Thu,  1 Oct 2020 15:35:38 +0000 (UTC)
Message-Id: <b8f8101c368b8a6451844a58d7bd7d83c14cf2aa.1601566529.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Setup the early hash table at all time.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  1 Oct 2020 15:35:38 +0000 (UTC)
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

At the time being, an early hash table is set up when
CONFIG_KASAN is selected.

There is nothing wrong with setting such an early hash table
all the time, even if it is not used. This is a statically
allocated 256 kB table which lies in the init data section.

This makes the code simpler and may in the future allow to
setup early IO mappings with fixmap instead of hard coding BATs.

Put create_hpte() and flush_hash_pages() in the .ref.text section
in order to avoid warning for the reference to early_hash[]. This
reference is removed by MMU_init_hw_patch() before init memory is
freed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.S         | 13 +++++--------
 arch/powerpc/mm/book3s32/hash_low.S   |  9 +++++++--
 arch/powerpc/mm/book3s32/mmu.c        | 14 +++++---------
 arch/powerpc/mm/kasan/kasan_init_32.c | 19 -------------------
 4 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 2bd0aa3a4cc7..b5458113e0b0 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -166,9 +166,9 @@ __after_mmu_off:
 
 	bl	initial_bats
 	bl	load_segment_registers
-#ifdef CONFIG_KASAN
+BEGIN_MMU_FTR_SECTION
 	bl	early_hash_table
-#endif
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #if defined(CONFIG_BOOTX_TEXT)
 	bl	setup_disp_bat
 #endif
@@ -953,7 +953,6 @@ _ENTRY(__restore_cpu_setup)
  * Load stuff into the MMU.  Intended to be called with
  * IR=0 and DR=0.
  */
-#ifdef CONFIG_KASAN
 early_hash_table:
 	sync			/* Force all PTE updates to finish */
 	isync
@@ -964,8 +963,10 @@ early_hash_table:
 	lis	r6, early_hash - PAGE_OFFSET@h
 	ori	r6, r6, 3	/* 256kB table */
 	mtspr	SPRN_SDR1, r6
+	lis	r6, early_hash@h
+	lis	r3, Hash@ha
+	stw	r6, Hash@l(r3)
 	blr
-#endif
 
 load_up_mmu:
 	sync			/* Force all PTE updates to finish */
@@ -1055,11 +1056,7 @@ start_here:
 	bl	machine_init
 	bl	__save_cpu_setup
 	bl	MMU_init
-#ifdef CONFIG_KASAN
-BEGIN_MMU_FTR_SECTION
 	bl	MMU_init_hw_patch
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
 
 /*
  * Go back to running unmapped so we can load up new values
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 1690d369688b..8fc594ff7286 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -15,6 +15,7 @@
  */
 
 #include <linux/pgtable.h>
+#include <linux/init.h>
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/cputable.h>
@@ -287,9 +288,9 @@ _ASM_NOKPROBE_SYMBOL(add_hash_page)
  *
  * For speed, 4 of the instructions get patched once the size and
  * physical address of the hash table are known.  These definitions
- * of Hash_base and Hash_bits below are just an example.
+ * of Hash_base and Hash_bits below are for the early hash table.
  */
-Hash_base = 0xc0180000
+Hash_base = early_hash
 Hash_bits = 12				/* e.g. 256kB hash table */
 Hash_msk = (((1 << Hash_bits) - 1) * 64)
 
@@ -310,6 +311,7 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
 #define HASH_LEFT	31-(LG_PTEG_SIZE+Hash_bits-1)
 #define HASH_RIGHT	31-LG_PTEG_SIZE
 
+__REF
 _GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
 	rlwinm	r8,r5,32-9,30,30	/* _PAGE_RW -> PP msb */
@@ -476,6 +478,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 
 	sync		/* make sure pte updates get to memory */
 	blr
+	.previous
 _ASM_NOKPROBE_SYMBOL(create_hpte)
 
 	.section .bss
@@ -496,6 +499,7 @@ htab_hash_searches:
  *
  * We assume that there is a hash table in use (Hash != 0).
  */
+__REF
 _GLOBAL(flush_hash_pages)
 	/*
 	 * We disable interrupts here, even on UP, because we want
@@ -632,6 +636,7 @@ _GLOBAL(flush_hash_pages)
 	SYNC_601
 	isync
 	blr
+	.previous
 EXPORT_SYMBOL(flush_hash_pages)
 _ASM_NOKPROBE_SYMBOL(flush_hash_pages)
 
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index d426eaf76bb0..3cf1177738ea 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -31,6 +31,8 @@
 
 #include <mm/mmu_decl.h>
 
+u8 __initdata early_hash[SZ_256K] __aligned(SZ_256K) = {0};
+
 struct hash_pte *Hash;
 static unsigned long Hash_size, Hash_mask;
 unsigned long _SDR1;
@@ -425,15 +427,6 @@ void __init MMU_init_hw(void)
 	hash_mb2 = hash_mb = 32 - LG_HPTEG_SIZE - lg_n_hpteg;
 	if (lg_n_hpteg > 16)
 		hash_mb2 = 16 - LG_HPTEG_SIZE;
-
-	/*
-	 * When KASAN is selected, there is already an early temporary hash
-	 * table and the switch to the final hash table is done later.
-	 */
-	if (IS_ENABLED(CONFIG_KASAN))
-		return;
-
-	MMU_init_hw_patch();
 }
 
 void __init MMU_init_hw_patch(void)
@@ -441,6 +434,9 @@ void __init MMU_init_hw_patch(void)
 	unsigned int hmask = Hash_mask >> (16 - LG_HPTEG_SIZE);
 	unsigned int hash = (unsigned int)Hash - PAGE_OFFSET;
 
+	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		return;
+
 	if (ppc_md.progress)
 		ppc_md.progress("hash:patch", 0x345);
 	if (ppc_md.progress)
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 929716ea21e9..59f61efc43af 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -174,22 +174,6 @@ void __init kasan_late_init(void)
 		kasan_unmap_early_shadow_vmalloc();
 }
 
-#ifdef CONFIG_PPC_BOOK3S_32
-u8 __initdata early_hash[256 << 10] __aligned(256 << 10) = {0};
-
-static void __init kasan_early_hash_table(void)
-{
-	unsigned int hash = __pa(early_hash);
-
-	modify_instruction_site(&patch__hash_page_A0, 0xffff, hash >> 16);
-	modify_instruction_site(&patch__flush_hash_A0, 0xffff, hash >> 16);
-
-	Hash = (struct hash_pte *)early_hash;
-}
-#else
-static void __init kasan_early_hash_table(void) {}
-#endif
-
 void __init kasan_early_init(void)
 {
 	unsigned long addr = KASAN_SHADOW_START;
@@ -205,7 +189,4 @@ void __init kasan_early_init(void)
 		next = pgd_addr_end(addr, end);
 		pmd_populate_kernel(&init_mm, pmd, kasan_early_shadow_pte);
 	} while (pmd++, addr = next, addr != end);
-
-	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		kasan_early_hash_table();
 }
-- 
2.25.0

