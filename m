Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16FB37378B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 11:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZrxr2j0Nz3bc2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 19:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZrxD2q41z303b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 19:28:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZrx21QSvz9sT7;
 Wed,  5 May 2021 11:28:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhT9k94579dF; Wed,  5 May 2021 11:28:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZrx13t2Bz9sXF;
 Wed,  5 May 2021 11:28:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34A2F8B7CB;
 Wed,  5 May 2021 11:28:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5jr3cojWsp3N; Wed,  5 May 2021 11:28:21 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D62748B7D2;
 Wed,  5 May 2021 11:28:20 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A94E96484E; Wed,  5 May 2021 09:28:20 +0000 (UTC)
Message-Id: <36e30ead7740a078cbfa270f45541205aa3656bf.1620206886.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f20b416b3ef2064b3cad1f0f87ceb7cb8c59d309.1620206886.git.christophe.leroy@csgroup.eu>
References: <f20b416b3ef2064b3cad1f0f87ceb7cb8c59d309.1620206886.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/32s: Convert switch_mmu_context() to C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  5 May 2021 09:28:20 +0000 (UTC)
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

switch_mmu_context() does things that can easily be done in C.

For updating user segments, we have update_user_segments().

As mentionned in commit b5efec00b671 ("powerpc/32s: Move KUEP
locking/unlocking in C"), update_user_segments() has the loop
unrolled which is a significant performance gain.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/asm-offsets.c      |  5 ---
 arch/powerpc/kernel/head_book3s_32.S   | 53 +-------------------------
 arch/powerpc/mm/book3s32/mmu_context.c | 27 +++++++++++++
 3 files changed, 28 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 28af4efb4587..459829805177 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -86,7 +86,6 @@ int main(void)
 	OFFSET(PACA_CANARY, paca_struct, canary);
 #endif
 #endif
-	OFFSET(MMCONTEXTID, mm_struct, context.id);
 #ifdef CONFIG_PPC64
 	DEFINE(SIGSEGV, SIGSEGV);
 	DEFINE(NMI_MASK, NMI_MASK);
@@ -368,10 +367,6 @@ int main(void)
 #endif
 #endif
 
-#ifndef CONFIG_PPC64
-	OFFSET(MM_PGD, mm_struct, pgd);
-#endif /* ! CONFIG_PPC64 */
-
 	/* About the CPU features table */
 	OFFSET(CPU_SPEC_FEATURES, cpu_spec, cpu_features);
 	OFFSET(CPU_SPEC_SETUP, cpu_spec, cpu_setup);
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 065178f19a3d..c1d2f0d1d6b2 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1023,58 +1023,6 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
 	mtspr	SPRN_SRR1,r4
 	rfi
 
-/*
- * void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next);
- *
- * Set up the segment registers for a new context.
- */
-_ENTRY(switch_mmu_context)
-	lwz	r3,MMCONTEXTID(r4)
-	cmpwi	cr0,r3,0
-	blt-	4f
-	mulli	r3,r3,897	/* multiply context by skew factor */
-	rlwinm	r3,r3,4,8,27	/* VSID = (context & 0xfffff) << 4 */
-#ifdef CONFIG_PPC_KUEP
-	oris	r3, r3, SR_NX@h	/* Set Nx */
-#endif
-#ifdef CONFIG_PPC_KUAP
-	oris	r3, r3, SR_KS@h	/* Set Ks */
-#endif
-	li	r0,NUM_USER_SEGMENTS
-	mtctr	r0
-
-#ifdef CONFIG_BDI_SWITCH
-	/* Context switch the PTE pointer for the Abatron BDI2000.
-	 * The PGDIR is passed as second argument.
-	 */
-	lwz	r4, MM_PGD(r4)
-	lis	r5, abatron_pteptrs@ha
-	stw	r4, abatron_pteptrs@l + 0x4(r5)
-#endif
-BEGIN_MMU_FTR_SECTION
-#ifndef CONFIG_BDI_SWITCH
-	lwz	r4, MM_PGD(r4)
-#endif
-	tophys(r4, r4)
-	rlwinm	r4, r4, 4, 0xffff01ff
-	mtspr	SPRN_SDR1, r4
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
-	li	r4,0
-	isync
-3:
-	mtsrin	r3,r4
-	addi	r3,r3,0x111	/* next VSID */
-	rlwinm	r3,r3,0,8,3	/* clear out any overflow from VSID field */
-	addis	r4,r4,0x1000	/* address of next segment */
-	bdnz	3b
-	sync
-	isync
-	blr
-4:	trap
-	EMIT_BUG_ENTRY 4b,__FILE__,__LINE__,0
-	blr
-EXPORT_SYMBOL(switch_mmu_context)
-
 /*
  * An undocumented "feature" of 604e requires that the v bit
  * be cleared before changing BAT values.
@@ -1312,5 +1260,6 @@ swapper_pg_dir:
 /* Room for two PTE pointers, usually the kernel and current user pointers
  * to their respective root page table.
  */
+	.globl	abatron_pteptrs
 abatron_pteptrs:
 	.space	8
diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index 218996e40a8e..3fcac03b125f 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -111,3 +111,30 @@ void __init mmu_context_init(void)
 	context_map[0] = (1 << FIRST_CONTEXT) - 1;
 	next_mmu_context = FIRST_CONTEXT;
 }
+
+void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next, struct task_struct *tsk)
+{
+	unsigned long id = next->context.id;
+	unsigned long val;
+
+	if (!id)
+		panic("mm_struct %p has no context ID", next);
+
+	isync();
+
+	val = ((id * 897) & 0xfffff) << 4;
+	if (IS_ENABLED(CONFIG_PPC_KUEP))
+		val |= SR_NX;
+	if (IS_ENABLED(CONFIG_PPC_KUAP))
+		val |= SR_KS;
+
+	update_user_segments(val);
+	mb();	/* sync */
+	isync();
+
+	if (IS_ENABLED(CONFIG_BDI_SWITCH))
+		abatron_pteptrs[1] = next->pgd;
+
+	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		mtspr(SPRN_SDR1, rol32(__pa(next->pgd), 4) & 0xffff01ff);
+}
-- 
2.25.0

