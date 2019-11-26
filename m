Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28F109F3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 14:23:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ml3V299ZzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 00:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="L8ESG7p/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mk0m325szDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 23:36:24 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mk0h0nS5z9v0G4;
 Tue, 26 Nov 2019 13:36:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=L8ESG7p/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6XlpknLzJqIr; Tue, 26 Nov 2019 13:36:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mk0g6Xmrz9v0G3;
 Tue, 26 Nov 2019 13:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574771779; bh=Mg27gvFaFN0Lg4e7x1RFBz0v9X5Jy2SaNaScydm79yk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=L8ESG7p/78sHyr6eaTiE7mQfeXKBoCHX9oQua6wVrQXA/hYZ85QeRsuweMhxdtpgI
 YpaeemS9KwatxknBBrK5MUpzNPv5uQNXijvtTB9FPepCnrgCDWeuHbT6ye4YLR3KV/
 dsa3N6boyREZ60DIbLQq/9WLfUI6lPGLwYiPaLXw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A87A8B7FC;
 Tue, 26 Nov 2019 13:36:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VCBvQkuTpwNX; Tue, 26 Nov 2019 13:36:21 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC7B08B771;
 Tue, 26 Nov 2019 13:36:20 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 828826B76A; Tue, 26 Nov 2019 12:36:20 +0000 (UTC)
Message-Id: <0c02cc2661704690c7e86f50689bb2063fa7ac69.1574771541.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1574771539.git.christophe.leroy@c-s.fr>
References: <cover.1574771539.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 16/16] powerpc/32s: Activate CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 26 Nov 2019 12:36:20 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A few changes to retrieve DAR and DSISR from struct regs
instead of retrieving them directly, as they may have
changed due to a TLB miss.

Also modifies hash_page() and friends to work with virtual
data addresses instead of physical ones. Same on load_up_fpu()
and load_up_altivec().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S         |  4 +++
 arch/powerpc/kernel/fpu.S              |  3 +++
 arch/powerpc/kernel/head_32.S          | 19 +++++++++++---
 arch/powerpc/kernel/head_32.h          |  4 ++-
 arch/powerpc/kernel/vector.S           |  3 +++
 arch/powerpc/mm/book3s32/hash_low.S    | 46 +++++++++++++++++++++-------------
 arch/powerpc/mm/book3s32/mmu.c         |  9 +++++--
 arch/powerpc/platforms/Kconfig.cputype |  2 ++
 8 files changed, 67 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 00fcf954e742..1d3b152ee54f 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -1365,7 +1365,11 @@ _GLOBAL(enter_rtas)
 	lis	r6,1f@ha	/* physical return address for rtas */
 	addi	r6,r6,1f@l
 	tophys(r6,r6)
+#ifdef CONFIG_VMAP_STACK
+	mr	r7, r1
+#else
 	tophys(r7,r1)
+#endif
 	lwz	r8,RTASENTRY(r4)
 	lwz	r4,RTASBASE(r4)
 	mfmsr	r9
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 0bb991ddd264..3235a8da6af7 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -94,6 +94,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	/* enable use of FP after return */
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD	/* current task's THREAD (phys) */
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r5, r5)
+#endif
 	lwz	r4,THREAD_FPEXC_MODE(r5)
 	ori	r9,r9,MSR_FP		/* enable FP for current */
 	or	r9,r9,r4
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 90ef355e958b..28391a408a22 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -272,14 +272,22 @@ __secondary_hold_acknowledge:
  */
 	. = 0x200
 	DO_KVM  0x200
+MachineCheck:
 	EXCEPTION_PROLOG_0
+#ifdef CONFIG_VMAP_STACK
+	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r11
+#endif
 #ifdef CONFIG_PPC_CHRP
 	mfspr	r11, SPRN_SPRG_THREAD
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r11, r11)
+#endif
 	lwz	r11, RTAS_SP(r11)
 	cmpwi	cr1, r11, 0
 	bne	cr1, 7f
 #endif /* CONFIG_PPC_CHRP */
-	EXCEPTION_PROLOG_1
+	EXCEPTION_PROLOG_1 rtas
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
@@ -294,7 +302,7 @@ __secondary_hold_acknowledge:
 	. = 0x300
 	DO_KVM  0x300
 DataAccess:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG dar
 	get_and_save_dar_dsisr_on_stack	r4, r5, r11
 BEGIN_MMU_FTR_SECTION
 #ifdef CONFIG_PPC_KUAP
@@ -334,7 +342,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	. = 0x600
 	DO_KVM  0x600
 Alignment:
-	EXCEPTION_PROLOG
+	EXCEPTION_PROLOG dar
 	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
@@ -645,6 +653,11 @@ handle_page_fault_tramp_1:
 handle_page_fault_tramp_2:
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
+#ifdef CONFIG_VMAP_STACK
+stack_ovf_trampoline:
+	b	stack_ovf
+#endif
+
 AltiVecUnavailable:
 	EXCEPTION_PROLOG
 #ifdef CONFIG_ALTIVEC
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 283d4298d555..ae2c8e07e1d5 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -38,10 +38,12 @@
 	andi.	r11, r11, MSR_PR
 .endm
 
-.macro EXCEPTION_PROLOG_1
+.macro EXCEPTION_PROLOG_1 rtas
 #ifdef CONFIG_VMAP_STACK
+	.ifb	\rtas
 	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
 	mtmsr	r11
+	.endif
 	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 #else
 	tophys(r11,r1)			/* use tophys(r1) if kernel */
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 8eb867dbad5f..25c14a0981bf 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -67,6 +67,9 @@ _GLOBAL(load_up_altivec)
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD		/* current task's THREAD (phys) */
 	oris	r9,r9,MSR_VEC@h
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r5, r5)
+#endif
 #else
 	ld	r4,PACACURRENT(r13)
 	addi	r5,r4,THREAD		/* Get THREAD */
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 8bbbd9775c8a..c11b0a005196 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -25,6 +25,12 @@
 #include <asm/feature-fixups.h>
 #include <asm/code-patching-asm.h>
 
+#ifdef CONFIG_VMAP_STACK
+#define ADDR_OFFSET	0
+#else
+#define ADDR_OFFSET	PAGE_OFFSET
+#endif
+
 #ifdef CONFIG_SMP
 	.section .bss
 	.align	2
@@ -47,8 +53,8 @@ mmu_hash_lock:
 	.text
 _GLOBAL(hash_page)
 #ifdef CONFIG_SMP
-	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@h
-	ori	r8, r8, (mmu_hash_lock - PAGE_OFFSET)@l
+	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@h
+	ori	r8, r8, (mmu_hash_lock - ADDR_OFFSET)@l
 	lis	r0,0x0fff
 	b	10f
 11:	lwz	r6,0(r8)
@@ -66,9 +72,12 @@ _GLOBAL(hash_page)
 	cmplw	0,r4,r0
 	ori	r3,r3,_PAGE_USER|_PAGE_PRESENT /* test low addresses as user */
 	mfspr	r5, SPRN_SPRG_PGDIR	/* phys page-table root */
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r5, r5)
+#endif
 	blt+	112f			/* assume user more likely */
-	lis	r5, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	addi	r5 ,r5 ,(swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
+	lis	r5, (swapper_pg_dir - ADDR_OFFSET)@ha	/* if kernel address, use */
+	addi	r5 ,r5 ,(swapper_pg_dir - ADDR_OFFSET)@l	/* kernel page table */
 	rlwimi	r3,r9,32-12,29,29	/* MSR_PR -> _PAGE_USER */
 112:
 #ifndef CONFIG_PTE_64BIT
@@ -80,6 +89,9 @@ _GLOBAL(hash_page)
 	lwzx	r8,r8,r5		/* Get L1 entry */
 	rlwinm.	r8,r8,0,0,20		/* extract pt base address */
 #endif
+#ifdef CONFIG_VMAP_STACK
+	tovirt(r8, r8)
+#endif
 #ifdef CONFIG_SMP
 	beq-	hash_page_out		/* return if no mapping */
 #else
@@ -137,9 +149,9 @@ retry:
 
 #ifdef CONFIG_SMP
 	eieio
-	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
+	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@ha
 	li	r0,0
-	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
+	stw	r0, (mmu_hash_lock - ADDR_OFFSET)@l(r8)
 #endif
 
 	/* Return from the exception */
@@ -152,9 +164,9 @@ retry:
 #ifdef CONFIG_SMP
 hash_page_out:
 	eieio
-	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
+	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@ha
 	li	r0,0
-	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
+	stw	r0, (mmu_hash_lock - ADDR_OFFSET)@l(r8)
 	blr
 #endif /* CONFIG_SMP */
 
@@ -329,7 +341,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	patch_site	1f, patch__hash_page_A1
 	patch_site	2f, patch__hash_page_A2
 	/* Get the address of the primary PTE group in the hash table (r3) */
-0:	lis	r0, (Hash_base - PAGE_OFFSET)@h	/* base address of hash table */
+0:	lis	r0, (Hash_base - ADDR_OFFSET)@h	/* base address of hash table */
 1:	rlwimi	r0,r3,LG_PTEG_SIZE,HASH_LEFT,HASH_RIGHT    /* VSID -> hash */
 2:	rlwinm	r3,r4,20+LG_PTEG_SIZE,HASH_LEFT,HASH_RIGHT /* PI -> hash */
 	xor	r3,r3,r0		/* make primary hash */
@@ -343,10 +355,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	beq+	10f			/* no PTE: go look for an empty slot */
 	tlbie	r4
 
-	lis	r4, (htab_hash_searches - PAGE_OFFSET)@ha
-	lwz	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
+	lis	r4, (htab_hash_searches - ADDR_OFFSET)@ha
+	lwz	r6, (htab_hash_searches - ADDR_OFFSET)@l(r4)
 	addi	r6,r6,1			/* count how many searches we do */
-	stw	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
+	stw	r6, (htab_hash_searches - ADDR_OFFSET)@l(r4)
 
 	/* Search the primary PTEG for a PTE whose 1st (d)word matches r5 */
 	mtctr	r0
@@ -378,10 +390,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	beq+	found_empty
 
 	/* update counter of times that the primary PTEG is full */
-	lis	r4, (primary_pteg_full - PAGE_OFFSET)@ha
-	lwz	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
+	lis	r4, (primary_pteg_full - ADDR_OFFSET)@ha
+	lwz	r6, (primary_pteg_full - ADDR_OFFSET)@l(r4)
 	addi	r6,r6,1
-	stw	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
+	stw	r6, (primary_pteg_full - ADDR_OFFSET)@l(r4)
 
 	patch_site	0f, patch__hash_page_C
 	/* Search the secondary PTEG for an empty slot */
@@ -415,8 +427,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	 * lockup here but that shouldn't happen
 	 */
 
-1:	lis	r4, (next_slot - PAGE_OFFSET)@ha	/* get next evict slot */
-	lwz	r6, (next_slot - PAGE_OFFSET)@l(r4)
+1:	lis	r4, (next_slot - ADDR_OFFSET)@ha	/* get next evict slot */
+	lwz	r6, (next_slot - ADDR_OFFSET)@l(r4)
 	addi	r6,r6,HPTE_SIZE			/* search for candidate */
 	andi.	r6,r6,7*HPTE_SIZE
 	stw	r6,next_slot@l(r4)
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 69b2419accef..0a1c65a2c565 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -413,6 +413,7 @@ void __init MMU_init_hw(void)
 void __init MMU_init_hw_patch(void)
 {
 	unsigned int hmask = Hash_mask >> (16 - LG_HPTEG_SIZE);
+	unsigned int hash;
 
 	if (ppc_md.progress)
 		ppc_md.progress("hash:patch", 0x345);
@@ -424,8 +425,12 @@ void __init MMU_init_hw_patch(void)
 	/*
 	 * Patch up the instructions in hashtable.S:create_hpte
 	 */
-	modify_instruction_site(&patch__hash_page_A0, 0xffff,
-				((unsigned int)Hash - PAGE_OFFSET) >> 16);
+	if (IS_ENABLED(CONFIG_VMAP_STACK))
+		hash = (unsigned int)Hash;
+	else
+		hash = (unsigned int)Hash - PAGE_OFFSET;
+
+	modify_instruction_site(&patch__hash_page_A0, 0xffff, hash >> 16);
 	modify_instruction_site(&patch__hash_page_A1, 0x7c0, hash_mb << 6);
 	modify_instruction_site(&patch__hash_page_A2, 0x7c0, hash_mb2 << 6);
 	modify_instruction_site(&patch__hash_page_B, 0xffff, hmask);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index f0583251e9a3..c5dbc2f9449d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -31,12 +31,14 @@ config PPC_BOOK3S_6xx
 	select PPC_HAVE_PMU_SUPPORT
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
+	select HAVE_ARCH_VMAP_STACK
 
 config PPC_BOOK3S_601
 	bool "PowerPC 601"
 	select PPC_BOOK3S_32
 	select PPC_FPU
 	select PPC_HAVE_KUAP
+	select HAVE_ARCH_VMAP_STACK
 
 config PPC_85xx
 	bool "Freescale 85xx"
-- 
2.13.3

