Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 283FC2FFFDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:12:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMZng5wXTzDr6Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 21:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZdT1Z41zDrbB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 21:05:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMZdH46lrz9vBmn;
 Fri, 22 Jan 2021 11:05:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qdYmRI3VxW7W; Fri, 22 Jan 2021 11:05:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMZdH3661z9vBml;
 Fri, 22 Jan 2021 11:05:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E1C08B817;
 Fri, 22 Jan 2021 11:05:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Hh5Bs2yg41-Z; Fri, 22 Jan 2021 11:05:24 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 600228B773;
 Fri, 22 Jan 2021 11:05:24 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 372B166AAE; Fri, 22 Jan 2021 10:05:24 +0000 (UTC)
Message-Id: <66f6416be81f63fc7e11a8e831c69004e0c49817.1611309841.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611309841.git.christophe.leroy@csgroup.eu>
References: <cover.1611309841.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 01/14] powerpc/32s: Only build hash code when
 CONFIG_PPC_BOOK3S_604 is selected
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 22 Jan 2021 10:05:24 +0000 (UTC)
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

It is now possible to only build book3s/32 kernel for
CPUs without hash table.

Opt out hash related code when CONFIG_PPC_BOOK3S_604 is not selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 12 ++++++++++++
 arch/powerpc/mm/book3s32/Makefile    |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 858fbc8b19f3..54140f4927e5 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -295,6 +295,7 @@ MachineCheck:
 	DO_KVM  0x300
 DataAccess:
 #ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_SPRG_SCRATCH2,r10
 	mfspr	r10, SPRN_SPRG_THREAD
@@ -311,12 +312,14 @@ BEGIN_MMU_FTR_SECTION
 MMU_FTR_SECTION_ELSE
 	b	1f
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
 	b	handle_page_fault_tramp_1
 #else	/* CONFIG_VMAP_STACK */
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	get_and_save_dar_dsisr_on_stack	r4, r5, r11
+#ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
 	bne	handle_page_fault_tramp_2	/* if not, try to put a PTE */
@@ -324,8 +327,11 @@ BEGIN_MMU_FTR_SECTION
 	bl	hash_page
 	b	handle_page_fault_tramp_1
 MMU_FTR_SECTION_ELSE
+#endif
 	b	handle_page_fault_tramp_2
+#ifdef CONFIG_PPC_BOOK3S_604
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 #endif	/* CONFIG_VMAP_STACK */
 
 /* Instruction access exception. */
@@ -341,12 +347,14 @@ InstructionAccess:
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
 	stw	r11, SRR1(r10)
 	mfcr	r10
+#ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	andis.	r11, r11, SRR1_ISI_NOPT@h	/* no pte found? */
 	bne	hash_page_isi
 .Lhash_page_isi_cont:
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 	andi.	r11, r11, MSR_PR
 
 	EXCEPTION_PROLOG_1
@@ -357,9 +365,11 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	beq	1f			/* if so, try to put a PTE */
 	li	r3,0			/* into the hash table */
 	mr	r4,r12			/* SRR0 is fault address */
+#ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	bl	hash_page
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 #endif	/* CONFIG_VMAP_STACK */
 1:	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
@@ -692,6 +702,7 @@ handle_page_fault_tramp_2:
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 #ifdef CONFIG_VMAP_STACK
+#ifdef CONFIG_PPC_BOOK3S_604
 .macro save_regs_thread		thread
 	stw	r0, THR0(\thread)
 	stw	r3, THR3(\thread)
@@ -763,6 +774,7 @@ fast_hash_page_return:
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
 	rfi
+#endif /* CONFIG_PPC_BOOK3S_604 */
 
 stack_overflow:
 	vmap_stack_overflow_exception
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 3f972db17761..446d9de88ce4 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -6,4 +6,6 @@ ifdef CONFIG_KASAN
 CFLAGS_mmu.o  		+= -DDISABLE_BRANCH_PROFILING
 endif
 
-obj-y += mmu.o hash_low.o mmu_context.o tlb.o nohash_low.o
+obj-y += mmu.o mmu_context.o
+obj-$(CONFIG_PPC_BOOK3S_603) += nohash_low.o
+obj-$(CONFIG_PPC_BOOK3S_604) += hash_low.o tlb.o
-- 
2.25.0

