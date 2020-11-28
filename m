Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD42C6FAC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:45:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvRK6SghzDvrD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lk91B/hX; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMF1PC9zDsGv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:28 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id s63so6606418pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BXv9OC+q1DQSg1qFGpa+RnyshL9wJAm6So0bdq0nQLQ=;
 b=Lk91B/hX4wj325SxwZqkCmvfywuklR/5Rl9i3y9P2vNaHSkJgW3LlKbRlgStpwUDZG
 dfa8ZWo+S52Exc/1E0hNsT0eqChY8/nmmGF/M2Lmz5Wa8IMt/W0rmOQg5DyHCTRvIhV+
 U8TQ3AEZDO2kjE7bQ+EhFpbu/7L0yJXBAvrkCaAj4122uSlSmUEOf1bKOxxfWJQ0yw5Y
 gTE9ilQ5NMKGYsnhFDvbb2RIadBOrJGcSc7QDcMByOFYJ/W5miITTItVLyP6AbRAIqNK
 ML9/tZqiglYP3/8sfyH4AkpfWiEbnr38BKYeqNtXohKlV/7HnNCxJTBfeu43wOnRDXO6
 JBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BXv9OC+q1DQSg1qFGpa+RnyshL9wJAm6So0bdq0nQLQ=;
 b=WxFCzbE2+xcf0PJnS5MUh+kzdGa/TIsyx1KfOMKgT3CGEfCWPFh5t/0HROU+C0kVGJ
 2SyUxq6vJk84/Eq8+59+9ooFiXkOdUtmFQvsgoUhcWkz9dJiJxnD/fH86g2GC/56QkBh
 cOdHRHb/VuqrSlRGBAhRZmABE4d2RePwEU0u8r9Rs2LK9FBB+M/VfdmKWdTrIvD7T1TY
 O4uY0oBd/FRjtmWSTKBr7H2zoP3YwiMq34oJ4a3zTRw+SA4JNKCg/HQ3H8IYCBdVqZhE
 SmZSVfonHFGOhOOVP/Djr/2XphP4v5oL9bZCqKaUsiMKa3Z1DERPnB1ljgfIEjQeXM4V
 5Yjw==
X-Gm-Message-State: AOAM532r5b5HNvOnJ1jQUaSgC0C6c/bogYLVYvGWjUyxX13ys5Tj2Bwf
 fpGTAOeJ5WQc/aG4SzIzhVqXECiO0jg=
X-Google-Smtp-Source: ABdhPJz9h1Ti9vI5OYCK3dUyWA/00QWENAQYhjUCBmoJYRtEIvW5o0x+6b4SfYggZbN5zPbVmxctlA==
X-Received: by 2002:a17:90b:4d0e:: with SMTP id
 mw14mr16240889pjb.92.1606574486086; 
 Sat, 28 Nov 2020 06:41:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/19] powerpc: remove arguments from fault handler
 functions
Date: Sun, 29 Nov 2020 00:40:57 +1000
Message-Id: <20201128144114.944000-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make mm fault handlers all just take the pt_regs * argument and load
DAR/DSISR from that. Make those that return a value return long.

This is done to make the function signatures match other handlers, which
will help with a future patch to add wrappers. Explicit arguments could
be added for performance but that would require more wrapper macro
variants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h     |  4 ++--
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  2 +-
 arch/powerpc/include/asm/bug.h                |  4 ++--
 arch/powerpc/kernel/exceptions-64e.S          |  2 --
 arch/powerpc/kernel/exceptions-64s.S          | 14 ++------------
 arch/powerpc/kernel/head_40x.S                | 10 +++++-----
 arch/powerpc/kernel/head_8xx.S                |  6 +++---
 arch/powerpc/kernel/head_book3s_32.S          |  6 ++----
 arch/powerpc/kernel/head_booke.h              |  4 +---
 arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
 arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
 arch/powerpc/mm/fault.c                       | 16 +++++++++-------
 12 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index d0b832cbbec8..22c9d08fa3a4 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -82,8 +82,8 @@ void kernel_bad_stack(struct pt_regs *regs);
 void system_reset_exception(struct pt_regs *regs);
 void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
-long do_slb_fault(struct pt_regs *regs, unsigned long ea);
-void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
+long do_slb_fault(struct pt_regs *regs);
+void do_bad_slb_fault(struct pt_regs *regs);
 
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index bc8c91f2d26f..e843d0b193d3 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -453,7 +453,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
 #define HPTE_LOCAL_UPDATE	0x1
 #define HPTE_NOHPTE_UPDATE	0x2
 
-int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr);
+long do_hash_fault(struct pt_regs *regs);
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
 			  unsigned long flags, int ssize, int subpage_prot);
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index c0e9b7a967a8..897bad6b6bbb 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,8 +111,8 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
-int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
+long do_page_fault(struct pt_regs *);
+long hash__do_page_fault(struct pt_regs *);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index f579ce46eef2..25fa7d5a643c 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1011,8 +1011,6 @@ storage_fault_common:
 	std	r14,_DAR(r1)
 	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
-	mr	r5,r15
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 336fa1fa39d1..690058043b17 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1438,8 +1438,6 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1492,10 +1490,9 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 EXC_COMMON_BEGIN(data_access_slb_common)
 	GEN_COMMON data_access_slb
-	ld	r4,_DAR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1507,8 +1504,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_DAR(r1)
-	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1543,8 +1538,6 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1588,10 +1581,9 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	GEN_COMMON instruction_access_slb
-	ld	r4,_DAR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1603,8 +1595,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_DAR(r1)
-	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index a1ae00689e0f..3c5577ac4dc8 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -179,9 +179,9 @@ _ENTRY(saved_ksp_limit)
  */
 	START_EXCEPTION(0x0300,	DataStorage)
 	EXCEPTION_PROLOG
-	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
+	mfspr	r5, SPRN_ESR		/* Grab the ESR, save it */
 	stw	r5, _ESR(r11)
-	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
+	mfspr	r4, SPRN_DEAR		/* Grab the DEAR, save it */
 	stw	r4, _DEAR(r11)
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
@@ -191,9 +191,9 @@ _ENTRY(saved_ksp_limit)
  */
 	START_EXCEPTION(0x0400, InstructionAccess)
 	EXCEPTION_PROLOG
-	mr	r4,r12			/* Pass SRR0 as arg2 */
-	stw	r4, _DEAR(r11)
-	li	r5,0			/* Pass zero as arg3 */
+	li	r5,0
+	stw	r5, _ESR(r11)		/* Zero ESR */
+	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* 0x0500 - External Interrupt Exception */
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index ee0bfebc375f..8acd365a2be6 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -324,14 +324,14 @@ DataStoreTLBMiss:
 	. = 0x1300
 InstructionTLBError:
 	EXCEPTION_PROLOG
-	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	andis.	r10,r9,SRR1_ISI_NOPT@h
 	beq+	.Litlbie
-	tlbie	r4
+	tlbie	r12
 	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
 .Litlbie:
-	stw	r4, _DAR(r11)
+	stw	r12, _DAR(r11)
+	stw	r5, _DSISR(r11)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* This is the data TLB error on the MPC8xx.  This could be due to
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index a0dda2a1f2df..7addf67832f9 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -370,9 +370,9 @@ BEGIN_MMU_FTR_SECTION
 	bl	hash_page
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #endif	/* CONFIG_VMAP_STACK */
-1:	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
-	stw	r4, _DAR(r11)
+	stw	r5, _DSISR(r11)
+	stw	r12, _DAR(r11)
 	EXC_XFER_LITE(0x400, handle_page_fault)
 
 /* External interrupt */
@@ -687,8 +687,6 @@ handle_page_fault_tramp_1:
 #ifdef CONFIG_VMAP_STACK
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
 #endif
-	lwz	r4, _DAR(r11)
-	lwz	r5, _DSISR(r11)
 	/* fall through */
 handle_page_fault_tramp_2:
 	EXC_XFER_LITE(0x300, handle_page_fault)
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 71c359d438b5..1da0c1d1b0a1 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -477,9 +477,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(INST_STORAGE);		      \
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
-	mr      r4,r12;                 /* Pass SRR0 as arg2 */		      \
-	stw	r4, _DEAR(r11);						      \
-	li      r5,0;                   /* Pass zero as arg3 */		      \
+	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
 	EXC_XFER_LITE(0x0400, handle_page_fault)
 
 #define ALIGNMENT_EXCEPTION						      \
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index bfa1b1966218..0f0bd4af4b2d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1510,13 +1510,15 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
+long do_hash_fault(struct pt_regs *regs)
 {
+	unsigned long ea = regs->dar;
+	unsigned long dsisr = regs->dsisr;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
 	unsigned long flags = 0;
 	struct mm_struct *mm;
 	unsigned int region_id;
-	int err;
+	long err;
 
 	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
 		goto _do_page_fault;
@@ -1580,7 +1582,7 @@ int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
 
 	} else if (err) {
 _do_page_fault:
-		err = hash__do_page_fault(regs, ea, dsisr);
+		err = hash__do_page_fault(regs);
 	}
 
 	return err;
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c30fcbfa0e32..cc34d50874c1 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -837,8 +837,9 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 	return slb_insert_entry(ea, context, flags, ssize, false);
 }
 
-long do_slb_fault(struct pt_regs *regs, unsigned long ea)
+long do_slb_fault(struct pt_regs *regs)
 {
+	unsigned long ea = regs->dar;
 	unsigned long id = get_region_id(ea);
 
 	/* IRQs are not reconciled here, so can't check irqs_disabled */
@@ -889,13 +890,15 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
 	}
 }
 
-void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
+void do_bad_slb_fault(struct pt_regs *regs)
 {
+	int err = regs->result;
+
 	if (err == -EFAULT) {
 		if (user_mode(regs))
-			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
+			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
 		else
-			bad_page_fault(regs, ea, SIGSEGV);
+			bad_page_fault(regs, regs->dar, SIGSEGV);
 	} else if (err == -EINVAL) {
 		unrecoverable_exception(regs);
 	} else {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index e65a49f246ef..390a296b16a3 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-int do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+long do_page_fault(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
-	int err;
+	unsigned long address = regs->dar;
+	unsigned long error_code = regs->dsisr;
+	long err;
 
 	err = __do_page_fault(regs, address, error_code);
 
@@ -580,11 +581,12 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 NOKPROBE_SYMBOL(do_page_fault);
 
 #ifdef CONFIG_PPC_BOOK3S_64
-/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
-int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+/* Same as do_page_fault but no interrupt entry */
+long hash__do_page_fault(struct pt_regs *regs)
 {
-	int err;
+	unsigned long address = regs->dar;
+	unsigned long error_code = regs->dsisr;
+	long err;
 
 	err = __do_page_fault(regs, address, error_code);
 	if (unlikely(err)) {
-- 
2.23.0

