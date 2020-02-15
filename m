Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C037D15FDEA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 11:15:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KR3G4wVBzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 21:15:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kgdpZwSE; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KR1j0FKczDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 21:14:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48KR1Z1LmVz9v0Mt;
 Sat, 15 Feb 2020 11:14:26 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kgdpZwSE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MrZYPYOqvdGz; Sat, 15 Feb 2020 11:14:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48KR1Z04W0z9v0Ms;
 Sat, 15 Feb 2020 11:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581761666; bh=kQtMLrlXi9bG+w50imTmTMBz9JXBKB9in8gEERb4Ee4=;
 h=From:Subject:To:Cc:Date:From;
 b=kgdpZwSEzMAs4lEbWdDH3n97IVcKEXMN19LhSMvNEE4q0ce+7DxgV94diTqxI7dJt
 o8f6ZvJJ9F9ZBQ9wT0aWR6U8J/1uv17BtBWyCEOFqalrs3ZEsrdHWNxA8DIc1TYOyQ
 yMwBemIgwR1NHG97UPqt/k1rf83EI+x0fpw+T+uw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CF368B781;
 Sat, 15 Feb 2020 11:14:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CpnqmDZ3G4he; Sat, 15 Feb 2020 11:14:26 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C8FA8B755;
 Sat, 15 Feb 2020 11:14:26 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 283C3652FA; Sat, 15 Feb 2020 10:14:25 +0000 (UTC)
Message-Id: <64a4aa44686e9fd4b01333401367029771d9b231.1581761633.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4] powerpc/32s: Fix DSI and ISI exceptions for
 CONFIG_VMAP_STACK
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Erhard F. <erhard_f@mailbox.org>, Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 15 Feb 2020 10:14:25 +0000 (UTC)
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

hash_page() needs to read page tables from kernel memory. When entire
kernel memory is mapped by BATs, which is normally the case when
CONFIG_STRICT_KERNEL_RWX is not set, it works even if the page hosting
the page table is not referenced in the MMU hash table.

However, if the page where the page table resides is not covered by
a BAT, a DSI fault can be encountered from hash_page(), and it loops
forever. This can happen when CONFIG_STRICT_KERNEL_RWX is selected
and the alignment of the different regions is too small to allow
covering the entire memory with BATs. This also happens when
CONFIG_DEBUG_PAGEALLOC is selected or when booting with 'nobats'
flag.

Also, if the page containing the kernel stack is not present in the
MMU hash table, registers cannot be saved and a recursive DSI fault
is encountered.

To allow hash_page() to properly do its job at all time and load the
MMU hash table whenever needed, it must run with data MMU disabled.
This means it must be called before re-enabling data MMU. To allow
this, registers clobbered by hash_page() and create_hpte() have to
be saved in the thread struct together with SRR0, SSR1, DAR and DSISR.
It is also necessary to ensure that DSI prolog doesn't overwrite
regs saved by prolog of the current running exception. That means:
- DSI can only use SPRN_SPRG_SCRATCH0
- Exceptions must free SPRN_SPRG_SCRATCH0 before writing to the stack.

This also fixes the Oops reported by Erhard when create_hpte() is
called by add_hash_page().

Due to prolog size increase, a few more exceptions had to get split
in two parts.

Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
Reported-by: Erhard F. <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206501
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Tested-by: Erhard F. <erhard_f@mailbox.org>
Tested-by: Larry Finger <Larry.Finger@lwfinger.net>

---
v4: Fixed build when CONFIG_PPC_CHRP and CONFIG_KVM_BOOK3S_32 are set.
    Also fixed the fact that cr1 is lost when CONFIG_VMAP_STACK is set
    in Machine Check for CHRP. Made the dance with cr registers depend
    on MMU_FTR_HPTE_TABLE feature, on 603 a failed access to stack
    will not trigger a DSI but a data store tlb miss which doesn't use
    the scratch registers.

v3: Also modify kasan_early_hash_table() accordingly.

v2: Reworked the DSI to call hash_page() even earlier and without
    cloberring what ongoing exception saved in SPRG registers and
    thread struct.
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/processor.h  |   4 +
 arch/powerpc/kernel/asm-offsets.c     |  12 ++
 arch/powerpc/kernel/head_32.S         | 155 +++++++++++++++++++++++++-
 arch/powerpc/kernel/head_32.h         |  21 +++-
 arch/powerpc/mm/book3s32/hash_low.S   |  52 ++++-----
 arch/powerpc/mm/book3s32/mmu.c        |  10 +-
 arch/powerpc/mm/kasan/kasan_init_32.c |   3 +-
 7 files changed, 212 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8387698bd5b6..eedcbfb9a6ff 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -168,6 +168,10 @@ struct thread_struct {
 	unsigned long	srr1;
 	unsigned long	dar;
 	unsigned long	dsisr;
+#ifdef CONFIG_PPC_BOOK3S_32
+	unsigned long	r0, r3, r4, r5, r6, r8, r9, r11;
+	unsigned long	lr, ctr;
+#endif
 #endif
 	/* Debug Registers */
 	struct debug_reg debug;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index c25e562f1cd9..fcf24a365fc0 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -132,6 +132,18 @@ int main(void)
 	OFFSET(SRR1, thread_struct, srr1);
 	OFFSET(DAR, thread_struct, dar);
 	OFFSET(DSISR, thread_struct, dsisr);
+#ifdef CONFIG_PPC_BOOK3S_32
+	OFFSET(THR0, thread_struct, r0);
+	OFFSET(THR3, thread_struct, r3);
+	OFFSET(THR4, thread_struct, r4);
+	OFFSET(THR5, thread_struct, r5);
+	OFFSET(THR6, thread_struct, r6);
+	OFFSET(THR8, thread_struct, r8);
+	OFFSET(THR9, thread_struct, r9);
+	OFFSET(THR11, thread_struct, r11);
+	OFFSET(THLR, thread_struct, lr);
+	OFFSET(THCTR, thread_struct, ctr);
+#endif
 #endif
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 0493fcac6409..97c887950c3c 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -290,17 +290,55 @@ MachineCheck:
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
-	bne	cr1,1f
+#ifdef CONFIG_VMAP_STACK
+	mfspr	r4, SPRN_SPRG_THREAD
+	tovirt(r4, r4)
+	lwz	r4, RTAS_SP(r4)
+	cmpwi	cr1, r4, 0
 #endif
-	EXC_XFER_STD(0x200, machine_check_exception)
-#ifdef CONFIG_PPC_CHRP
-1:	b	machine_check_in_rtas
+	beq	cr1, machine_check_tramp
+	b	machine_check_in_rtas
+#else
+	b	machine_check_tramp
 #endif
 
 /* Data access exception. */
 	. = 0x300
 	DO_KVM  0x300
 DataAccess:
+#ifdef CONFIG_VMAP_STACK
+	mtspr	SPRN_SPRG_SCRATCH0,r10
+	mfspr	r10, SPRN_SPRG_THREAD
+BEGIN_MMU_FTR_SECTION
+	stw	r11, THR11(r10)
+	mfspr	r10, SPRN_DSISR
+	mfcr	r11
+#ifdef CONFIG_PPC_KUAP
+	andis.	r10, r10, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH | DSISR_PROTFAULT)@h
+#else
+	andis.	r10, r10, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
+#endif
+	mfspr	r10, SPRN_SPRG_THREAD
+	beq	hash_page_dsi
+.Lhash_page_dsi_cont:
+	mtcr	r11
+	lwz	r11, THR11(r10)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+	mtspr	SPRN_SPRG_SCRATCH1,r11
+	mfspr	r11, SPRN_DAR
+	stw	r11, DAR(r10)
+	mfspr	r11, SPRN_DSISR
+	stw	r11, DSISR(r10)
+	mfspr	r11, SPRN_SRR0
+	stw	r11, SRR0(r10)
+	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
+	stw	r11, SRR1(r10)
+	mfcr	r10
+	andi.	r11, r11, MSR_PR
+
+	EXCEPTION_PROLOG_1
+	b	handle_page_fault_tramp_1
+#else	/* CONFIG_VMAP_STACK */
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	get_and_save_dar_dsisr_on_stack	r4, r5, r11
 BEGIN_MMU_FTR_SECTION
@@ -316,11 +354,32 @@ BEGIN_MMU_FTR_SECTION
 FTR_SECTION_ELSE
 	b	handle_page_fault_tramp_2
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
+#endif	/* CONFIG_VMAP_STACK */
 
 /* Instruction access exception. */
 	. = 0x400
 	DO_KVM  0x400
 InstructionAccess:
+#ifdef CONFIG_VMAP_STACK
+	mtspr	SPRN_SPRG_SCRATCH0,r10
+	mtspr	SPRN_SPRG_SCRATCH1,r11
+	mfspr	r10, SPRN_SPRG_THREAD
+	mfspr	r11, SPRN_SRR0
+	stw	r11, SRR0(r10)
+	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
+	stw	r11, SRR1(r10)
+	mfcr	r10
+BEGIN_MMU_FTR_SECTION
+	andis.	r11, r11, SRR1_ISI_NOPT@h	/* no pte found? */
+	bne	hash_page_isi
+.Lhash_page_isi_cont:
+	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+	andi.	r11, r11, MSR_PR
+
+	EXCEPTION_PROLOG_1
+	EXCEPTION_PROLOG_2
+#else	/* CONFIG_VMAP_STACK */
 	EXCEPTION_PROLOG
 	andis.	r0,r9,SRR1_ISI_NOPT@h	/* no pte found? */
 	beq	1f			/* if so, try to put a PTE */
@@ -329,6 +388,7 @@ InstructionAccess:
 BEGIN_MMU_FTR_SECTION
 	bl	hash_page
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif	/* CONFIG_VMAP_STACK */
 1:	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r4, _DAR(r11)
@@ -344,7 +404,7 @@ Alignment:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
 	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_STD(0x600, alignment_exception)
+	b	alignment_exception_tramp
 
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -645,15 +705,100 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 
 	. = 0x3000
 
+machine_check_tramp:
+	EXC_XFER_STD(0x200, machine_check_exception)
+
+alignment_exception_tramp:
+	EXC_XFER_STD(0x600, alignment_exception)
+
 handle_page_fault_tramp_1:
+#ifdef CONFIG_VMAP_STACK
+	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+#endif
 	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
 	/* fall through */
 handle_page_fault_tramp_2:
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
+#ifdef CONFIG_VMAP_STACK
+.macro save_regs_thread		thread
+	stw	r0, THR0(\thread)
+	stw	r3, THR3(\thread)
+	stw	r4, THR4(\thread)
+	stw	r5, THR5(\thread)
+	stw	r6, THR6(\thread)
+	stw	r8, THR8(\thread)
+	stw	r9, THR9(\thread)
+	mflr	r0
+	stw	r0, THLR(\thread)
+	mfctr	r0
+	stw	r0, THCTR(\thread)
+.endm
+
+.macro restore_regs_thread	thread
+	lwz	r0, THLR(\thread)
+	mtlr	r0
+	lwz	r0, THCTR(\thread)
+	mtctr	r0
+	lwz	r0, THR0(\thread)
+	lwz	r3, THR3(\thread)
+	lwz	r4, THR4(\thread)
+	lwz	r5, THR5(\thread)
+	lwz	r6, THR6(\thread)
+	lwz	r8, THR8(\thread)
+	lwz	r9, THR9(\thread)
+.endm
+
+hash_page_dsi:
+	save_regs_thread	r10
+	mfdsisr	r3
+	mfdar	r4
+	mfsrr0	r5
+	mfsrr1	r9
+	rlwinm	r3, r3, 32 - 15, _PAGE_RW	/* DSISR_STORE -> _PAGE_RW */
+	bl	hash_page
+	mfspr	r10, SPRN_SPRG_THREAD
+	restore_regs_thread r10
+	b	.Lhash_page_dsi_cont
+
+hash_page_isi:
+	mr	r11, r10
+	mfspr	r10, SPRN_SPRG_THREAD
+	save_regs_thread	r10
+	li	r3, 0
+	lwz	r4, SRR0(r10)
+	lwz	r9, SRR1(r10)
+	bl	hash_page
+	mfspr	r10, SPRN_SPRG_THREAD
+	restore_regs_thread r10
+	mr	r10, r11
+	b	.Lhash_page_isi_cont
+
+	.globl fast_hash_page_return
+fast_hash_page_return:
+	andis.	r10, r9, SRR1_ISI_NOPT@h	/* Set on ISI, cleared on DSI */
+	mfspr	r10, SPRN_SPRG_THREAD
+	restore_regs_thread r10
+	bne	1f
+
+	/* DSI */
+	mtcr	r11
+	lwz	r11, THR11(r10)
+	mfspr	r10, SPRN_SPRG_SCRATCH0
+	SYNC
+	RFI
+
+1:	/* ISI */
+	mtcr	r11
+	mfspr	r11, SPRN_SPRG_SCRATCH1
+	mfspr	r10, SPRN_SPRG_SCRATCH0
+	SYNC
+	RFI
+
 stack_overflow:
 	vmap_stack_overflow_exception
+#endif
 
 AltiVecUnavailable:
 	EXCEPTION_PROLOG
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index a6a5fbbf8504..9db162f79fe6 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -64,11 +64,25 @@
 .endm
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
+BEGIN_MMU_FTR_SECTION
+	mtcr	r10
+FTR_SECTION_ELSE
+	stw	r10, _CCR(r11)
+ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
+#else
 	stw	r10,_CCR(r11)		/* save registers */
+#endif
+	mfspr	r10, SPRN_SPRG_SCRATCH0
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
-	mfspr	r10,SPRN_SPRG_SCRATCH0
 	stw	r10,GPR10(r11)
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
+BEGIN_MMU_FTR_SECTION
+	mfcr	r10
+	stw	r10, _CCR(r11)
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 	mfspr	r12,SPRN_SPRG_SCRATCH1
 	stw	r12,GPR11(r11)
 	mflr	r10
@@ -83,6 +97,11 @@
 	stw	r10, _DSISR(r11)
 	.endif
 	lwz	r9, SRR1(r12)
+#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_PPC_BOOK3S)
+BEGIN_MMU_FTR_SECTION
+	andi.	r10, r9, MSR_PR
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
 	lwz	r12, SRR0(r12)
 #else
 	mfspr	r12,SPRN_SRR0
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index c11b0a005196..2015c4f96238 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -25,12 +25,6 @@
 #include <asm/feature-fixups.h>
 #include <asm/code-patching-asm.h>
 
-#ifdef CONFIG_VMAP_STACK
-#define ADDR_OFFSET	0
-#else
-#define ADDR_OFFSET	PAGE_OFFSET
-#endif
-
 #ifdef CONFIG_SMP
 	.section .bss
 	.align	2
@@ -53,8 +47,8 @@ mmu_hash_lock:
 	.text
 _GLOBAL(hash_page)
 #ifdef CONFIG_SMP
-	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@h
-	ori	r8, r8, (mmu_hash_lock - ADDR_OFFSET)@l
+	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@h
+	ori	r8, r8, (mmu_hash_lock - PAGE_OFFSET)@l
 	lis	r0,0x0fff
 	b	10f
 11:	lwz	r6,0(r8)
@@ -72,12 +66,9 @@ _GLOBAL(hash_page)
 	cmplw	0,r4,r0
 	ori	r3,r3,_PAGE_USER|_PAGE_PRESENT /* test low addresses as user */
 	mfspr	r5, SPRN_SPRG_PGDIR	/* phys page-table root */
-#ifdef CONFIG_VMAP_STACK
-	tovirt(r5, r5)
-#endif
 	blt+	112f			/* assume user more likely */
-	lis	r5, (swapper_pg_dir - ADDR_OFFSET)@ha	/* if kernel address, use */
-	addi	r5 ,r5 ,(swapper_pg_dir - ADDR_OFFSET)@l	/* kernel page table */
+	lis	r5, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	addi	r5 ,r5 ,(swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 	rlwimi	r3,r9,32-12,29,29	/* MSR_PR -> _PAGE_USER */
 112:
 #ifndef CONFIG_PTE_64BIT
@@ -89,9 +80,6 @@ _GLOBAL(hash_page)
 	lwzx	r8,r8,r5		/* Get L1 entry */
 	rlwinm.	r8,r8,0,0,20		/* extract pt base address */
 #endif
-#ifdef CONFIG_VMAP_STACK
-	tovirt(r8, r8)
-#endif
 #ifdef CONFIG_SMP
 	beq-	hash_page_out		/* return if no mapping */
 #else
@@ -143,30 +131,36 @@ retry:
 	bne-	retry			/* retry if someone got there first */
 
 	mfsrin	r3,r4			/* get segment reg for segment */
+#ifndef CONFIG_VMAP_STACK
 	mfctr	r0
 	stw	r0,_CTR(r11)
+#endif
 	bl	create_hpte		/* add the hash table entry */
 
 #ifdef CONFIG_SMP
 	eieio
-	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@ha
+	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
 	li	r0,0
-	stw	r0, (mmu_hash_lock - ADDR_OFFSET)@l(r8)
+	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
 #endif
 
+#ifdef CONFIG_VMAP_STACK
+	b	fast_hash_page_return
+#else
 	/* Return from the exception */
 	lwz	r5,_CTR(r11)
 	mtctr	r5
 	lwz	r0,GPR0(r11)
 	lwz	r8,GPR8(r11)
 	b	fast_exception_return
+#endif
 
 #ifdef CONFIG_SMP
 hash_page_out:
 	eieio
-	lis	r8, (mmu_hash_lock - ADDR_OFFSET)@ha
+	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
 	li	r0,0
-	stw	r0, (mmu_hash_lock - ADDR_OFFSET)@l(r8)
+	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
 	blr
 #endif /* CONFIG_SMP */
 
@@ -341,7 +335,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	patch_site	1f, patch__hash_page_A1
 	patch_site	2f, patch__hash_page_A2
 	/* Get the address of the primary PTE group in the hash table (r3) */
-0:	lis	r0, (Hash_base - ADDR_OFFSET)@h	/* base address of hash table */
+0:	lis	r0, (Hash_base - PAGE_OFFSET)@h	/* base address of hash table */
 1:	rlwimi	r0,r3,LG_PTEG_SIZE,HASH_LEFT,HASH_RIGHT    /* VSID -> hash */
 2:	rlwinm	r3,r4,20+LG_PTEG_SIZE,HASH_LEFT,HASH_RIGHT /* PI -> hash */
 	xor	r3,r3,r0		/* make primary hash */
@@ -355,10 +349,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	beq+	10f			/* no PTE: go look for an empty slot */
 	tlbie	r4
 
-	lis	r4, (htab_hash_searches - ADDR_OFFSET)@ha
-	lwz	r6, (htab_hash_searches - ADDR_OFFSET)@l(r4)
+	lis	r4, (htab_hash_searches - PAGE_OFFSET)@ha
+	lwz	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
 	addi	r6,r6,1			/* count how many searches we do */
-	stw	r6, (htab_hash_searches - ADDR_OFFSET)@l(r4)
+	stw	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
 
 	/* Search the primary PTEG for a PTE whose 1st (d)word matches r5 */
 	mtctr	r0
@@ -390,10 +384,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	beq+	found_empty
 
 	/* update counter of times that the primary PTEG is full */
-	lis	r4, (primary_pteg_full - ADDR_OFFSET)@ha
-	lwz	r6, (primary_pteg_full - ADDR_OFFSET)@l(r4)
+	lis	r4, (primary_pteg_full - PAGE_OFFSET)@ha
+	lwz	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
 	addi	r6,r6,1
-	stw	r6, (primary_pteg_full - ADDR_OFFSET)@l(r4)
+	stw	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
 
 	patch_site	0f, patch__hash_page_C
 	/* Search the secondary PTEG for an empty slot */
@@ -427,8 +421,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	 * lockup here but that shouldn't happen
 	 */
 
-1:	lis	r4, (next_slot - ADDR_OFFSET)@ha	/* get next evict slot */
-	lwz	r6, (next_slot - ADDR_OFFSET)@l(r4)
+1:	lis	r4, (next_slot - PAGE_OFFSET)@ha	/* get next evict slot */
+	lwz	r6, (next_slot - PAGE_OFFSET)@l(r4)
 	addi	r6,r6,HPTE_SIZE			/* search for candidate */
 	andi.	r6,r6,7*HPTE_SIZE
 	stw	r6,next_slot@l(r4)
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 0a1c65a2c565..f888cbb109b9 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -413,7 +413,7 @@ void __init MMU_init_hw(void)
 void __init MMU_init_hw_patch(void)
 {
 	unsigned int hmask = Hash_mask >> (16 - LG_HPTEG_SIZE);
-	unsigned int hash;
+	unsigned int hash = (unsigned int)Hash - PAGE_OFFSET;
 
 	if (ppc_md.progress)
 		ppc_md.progress("hash:patch", 0x345);
@@ -425,11 +425,6 @@ void __init MMU_init_hw_patch(void)
 	/*
 	 * Patch up the instructions in hashtable.S:create_hpte
 	 */
-	if (IS_ENABLED(CONFIG_VMAP_STACK))
-		hash = (unsigned int)Hash;
-	else
-		hash = (unsigned int)Hash - PAGE_OFFSET;
-
 	modify_instruction_site(&patch__hash_page_A0, 0xffff, hash >> 16);
 	modify_instruction_site(&patch__hash_page_A1, 0x7c0, hash_mb << 6);
 	modify_instruction_site(&patch__hash_page_A2, 0x7c0, hash_mb2 << 6);
@@ -439,8 +434,7 @@ void __init MMU_init_hw_patch(void)
 	/*
 	 * Patch up the instructions in hashtable.S:flush_hash_page
 	 */
-	modify_instruction_site(&patch__flush_hash_A0, 0xffff,
-				((unsigned int)Hash - PAGE_OFFSET) >> 16);
+	modify_instruction_site(&patch__flush_hash_A0, 0xffff, hash >> 16);
 	modify_instruction_site(&patch__flush_hash_A1, 0x7c0, hash_mb << 6);
 	modify_instruction_site(&patch__flush_hash_A2, 0x7c0, hash_mb2 << 6);
 	modify_instruction_site(&patch__flush_hash_B, 0xffff, hmask);
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 16dd95bd0749..db5664dde5ff 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -185,8 +185,7 @@ u8 __initdata early_hash[256 << 10] __aligned(256 << 10) = {0};
 
 static void __init kasan_early_hash_table(void)
 {
-	unsigned int hash = IS_ENABLED(CONFIG_VMAP_STACK) ? (unsigned int)early_hash :
-							    __pa(early_hash);
+	unsigned int hash = __pa(early_hash);
 
 	modify_instruction_site(&patch__hash_page_A0, 0xffff, hash >> 16);
 	modify_instruction_site(&patch__flush_hash_A0, 0xffff, hash >> 16);
-- 
2.25.0

