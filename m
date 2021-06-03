Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39261399DC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 11:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwgZt4XGzz306N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwgZY6CCcz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 19:29:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwgZR3NMrzBCSt;
 Thu,  3 Jun 2021 11:29:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Thj5r1GUQOvs; Thu,  3 Jun 2021 11:29:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwgZR2VJ0zBCR5;
 Thu,  3 Jun 2021 11:29:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36C578B849;
 Thu,  3 Jun 2021 11:29:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WiTeVHotEaS4; Thu,  3 Jun 2021 11:29:03 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB9348B848;
 Thu,  3 Jun 2021 11:29:02 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B0E246493B; Thu,  3 Jun 2021 09:29:02 +0000 (UTC)
Message-Id: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 1/6] powerpc/nohash: Refactor update of BDI2000 pointers in
 switch_mmu_context()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 09:29:02 +0000 (UTC)
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

Instead of duplicating the update of BDI2000 pointers in
set_context(), do it directly from switch_mmu_context().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Do it only for nohash platforms, book3s/32 will have its own as part of converting switch_mmu_context() to C.
---
 arch/powerpc/kernel/head_40x.S       | 14 --------------
 arch/powerpc/kernel/head_44x.S       | 16 ----------------
 arch/powerpc/kernel/head_8xx.S       |  7 -------
 arch/powerpc/kernel/head_book3s_32.S |  6 ------
 arch/powerpc/kernel/head_fsl_booke.S | 16 ----------------
 arch/powerpc/mm/nohash/8xx.c         |  6 ------
 arch/powerpc/mm/nohash/mmu_context.c |  8 ++++++++
 arch/powerpc/mm/nohash/tlb_low.S     |  8 --------
 8 files changed, 8 insertions(+), 73 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index e1360b88b6cb..7ef1bbc23bed 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -703,14 +703,6 @@ _GLOBAL(abort)
         mtspr   SPRN_DBCR0,r13
 
 _GLOBAL(set_context)
-
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is the second parameter.
-	 */
-	lis	r5, abatron_pteptrs@ha
-	stw	r4, abatron_pteptrs@l + 0x4(r5)
-#endif
 	sync
 	mtspr	SPRN_PID,r3
 	isync				/* Need an isync to flush shadow */
@@ -731,9 +723,3 @@ EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
-
-/* Room for two PTE pointers, usually the kernel and current user pointers
- * to their respective root page table.
- */
-abatron_pteptrs:
-	.space	8
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 5c106ac36626..57509d90e409 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -781,15 +781,6 @@ _GLOBAL(__fixup_440A_mcheck)
 	blr
 
 _GLOBAL(set_context)
-
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is the second parameter.
-	 */
-	lis	r5, abatron_pteptrs@h
-	ori	r5, r5, abatron_pteptrs@l
-	stw	r4, 0x4(r5)
-#endif
 	mtspr	SPRN_PID,r3
 	isync			/* Force context change */
 	blr
@@ -1259,13 +1250,6 @@ EXPORT_SYMBOL(empty_zero_page)
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
 
-/*
- * Room for two PTE pointers, usually the kernel and current user pointers
- * to their respective root page table.
- */
-abatron_pteptrs:
-	.space	8
-
 #ifdef CONFIG_SMP
 	.align	12
 temp_boot_stack:
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 7d445e4342c0..817df9fe7fb3 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -804,10 +804,3 @@ EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
-
-/* Room for two PTE table pointers, usually the kernel and current user
- * pointer to their respective root page table (pgdir).
- */
-	.globl	abatron_pteptrs
-abatron_pteptrs:
-	.space	8
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 326262030279..32c27dac9b80 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1282,9 +1282,3 @@ EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
-
-/* Room for two PTE pointers, usually the kernel and current user pointers
- * to their respective root page table.
- */
-abatron_pteptrs:
-	.space	8
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index a1a5c3f10dc4..590f34cc5bb2 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -986,15 +986,6 @@ _GLOBAL(abort)
 	isync
 
 _GLOBAL(set_context)
-
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is the second parameter.
-	 */
-	lis	r5, abatron_pteptrs@h
-	ori	r5, r5, abatron_pteptrs@l
-	stw	r4, 0x4(r5)
-#endif
 	mtspr	SPRN_PID,r3
 	isync			/* Force context change */
 	blr
@@ -1242,10 +1233,3 @@ EXPORT_SYMBOL(empty_zero_page)
 	.globl	swapper_pg_dir
 swapper_pg_dir:
 	.space	PGD_TABLE_SIZE
-
-/*
- * Room for two PTE pointers, usually the kernel and current user pointers
- * to their respective root page table.
- */
-abatron_pteptrs:
-	.space	8
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 71bfdbedacee..f749acba5473 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -224,12 +224,6 @@ void set_context(unsigned long id, pgd_t *pgd)
 {
 	s16 offset = (s16)(__pa(swapper_pg_dir));
 
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is passed as second argument.
-	 */
-	if (IS_ENABLED(CONFIG_BDI_SWITCH))
-		abatron_pteptrs[1] = pgd;
-
 	/* Register M_TWB will contain base address of level 1 table minus the
 	 * lower part of the kernel PGDIR base address, so that all accesses to
 	 * level 1 table are done relative to lower part of kernel PGDIR base
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index aac81c9f84a5..eae48635a9ac 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -50,6 +50,12 @@
 
 #include <mm/mmu_decl.h>
 
+/*
+ * Room for two PTE table pointers, usually the kernel and current user
+ * pointer to their respective root page table (pgdir).
+ */
+void *abatron_pteptrs[2];
+
 /*
  * The MPC8xx has only 16 contexts. We rotate through them on each task switch.
  * A better way would be to keep track of tasks that own contexts, and implement
@@ -357,6 +363,8 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 
 	/* Flick the MMU and release lock */
 	pr_hardcont(" -> %d\n", id);
+	if (IS_ENABLED(CONFIG_BDI_SWITCH))
+		abatron_pteptrs[1] = next->pgd;
 	set_context(id, next->pgd);
 	raw_spin_unlock(&context_lock);
 }
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index 68797e072f55..b3d0f0127828 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -362,14 +362,6 @@ _GLOBAL(_tlbivax_bcast)
 	blr
 
 _GLOBAL(set_context)
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is the second parameter.
-	 */
-	lis	r5, abatron_pteptrs@h
-	ori	r5, r5, abatron_pteptrs@l
-	stw	r4, 0x4(r5)
-#endif
 	mtspr	SPRN_PID,r3
 	isync			/* Force context change */
 	blr
-- 
2.25.0

