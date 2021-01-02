Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6F2E8749
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:36:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7LwL1N6czDqCV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:36:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RzS21XR1; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lh86bkKzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:28 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id v1so7141207pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgSLBUFRMZlGbPFpho1oKZVcrfB/nDhRmxl2SEDzp3o=;
 b=RzS21XR119HEHhn3XMcG9yg6ZKNnSWPtOeArkn9g6jCmLQzxCf9M2//Ie7i4gTshSC
 xGkrqRZ06P503uFIG2wAc2OMSV6VWJm8i3+PrawTyd5HV6IxHHGpheAnNHf3SYyNVp+9
 rhaDlxyJeppCrjbE+S+8cJQE2PT3H+x3lM7kqFOG7sHWLYZCuo7dCAVHvqWXb2xIyyZK
 rtHzKpyhXdeN6URqjlQha6D7vM6NqMIkTU4aaBl7m9V27QXgdvO2ZXE2drnTcq2vjtpU
 PvyiQWRheMqThOfYo5nOj2SsYlWGNzNaAmtaReov+jikKahnCVuDBo8qioADyK0f+7x5
 5nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgSLBUFRMZlGbPFpho1oKZVcrfB/nDhRmxl2SEDzp3o=;
 b=iS1WgSPZXrbP9Ml6zgFXefM4Cm22mPD0EB3f6LO7FKhV6sQbrlo+85pHfAMLpzRRbT
 I0ndcjwZ7Puxtu+z10VRHFHijuz4RBYd7RJRssgb9fO/1eY062Xalf4iaDcYvClM4R02
 v5rt9BUQFw5F2gsNE5ynHLF8iZ8SPP3SAd3K+V3er47cuoZY2V1rsoaVVU4Jkq9gmF7u
 qRorjkFq5Qz7BYdai9X8IrMXj3FOP4JZrlgS9+AbvNt7KwU0RLhmq54UGSNl6gLjxF8k
 18e18o+wCQoOcyEUmvXuU4/jiqnl+PSxtQHH8Hf4jBwUBBs/5MUCvRyCfRtq1QNc8RE4
 HEPQ==
X-Gm-Message-State: AOAM530hJgs4CZfzourn7bzFOLJhxrNPCjuATgB14sEMrLcNmg4iIWQH
 ASm1Y6jrSvOlN8Wq4X3x7hz40L+Az8E=
X-Google-Smtp-Source: ABdhPJwSIlnDI/41zyJTLyuKk8GK8lBhW2seO1UYZMks1Y9UcPOQf1/Pj02F3+ocb9zZ4ANtqJm7bQ==
X-Received: by 2002:a17:90a:301:: with SMTP id
 1mr21873748pje.195.1609590325528; 
 Sat, 02 Jan 2021 04:25:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/21] powerpc: remove arguments from fault handler
 functions
Date: Sat,  2 Jan 2021 22:24:50 +1000
Message-Id: <20210102122508.1950592-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/bug.h                |  2 +-
 arch/powerpc/kernel/entry_32.S                |  6 +-----
 arch/powerpc/kernel/exceptions-64e.S          |  2 --
 arch/powerpc/kernel/exceptions-64s.S          | 14 ++------------
 arch/powerpc/kernel/head_40x.S                | 10 +++++-----
 arch/powerpc/kernel/head_8xx.S                |  6 +++---
 arch/powerpc/kernel/head_book3s_32.S          |  5 ++---
 arch/powerpc/kernel/head_booke.h              |  4 +---
 arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
 arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
 arch/powerpc/mm/fault.c                       | 14 +++++++-------
 13 files changed, 37 insertions(+), 51 deletions(-)

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
index 60a669379aa0..b9968e297da2 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -454,7 +454,7 @@ static inline unsigned long hpt_hash(unsigned long vpn,
 #define HPTE_NOHPTE_UPDATE	0x2
 #define HPTE_USE_KERNEL_KEY	0x4
 
-int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr);
+long do_hash_fault(struct pt_regs *regs);
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
 			  unsigned long flags, int ssize, int subpage_prot);
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 464f8ca8a5c9..f7827e993196 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,7 +111,7 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
+long do_page_fault(struct pt_regs *);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
 void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 238eacfda7b0..a32157ce0551 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -277,7 +277,7 @@ reenable_mmu:
 	 * r3 can be different from GPR3(r1) at this point, r9 and r11
 	 * contains the old MSR and handler address respectively,
 	 * r4 & r5 can contain page fault arguments that need to be passed
-	 * along as well. r0, r6-r8, r12, CCR, CTR, XER etc... are left
+	 * r0, r4-r8, r12, CCR, CTR, XER etc... are left
 	 * clobbered as they aren't useful past this point.
 	 */
 
@@ -285,15 +285,11 @@ reenable_mmu:
 	stw	r9,8(r1)
 	stw	r11,12(r1)
 	stw	r3,16(r1)
-	stw	r4,20(r1)
-	stw	r5,24(r1)
 
 	/* If we are disabling interrupts (normal case), simply log it with
 	 * lockdep
 	 */
 1:	bl	trace_hardirqs_off
-	lwz	r5,24(r1)
-	lwz	r4,20(r1)
 	lwz	r3,16(r1)
 	lwz	r11,12(r1)
 	lwz	r9,8(r1)
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 74d07dc0bb48..43e71d86dcbf 100644
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
index bda91c79b261..d42ee713a753 100644
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
index 52702f3db6df..0b2c247cfdff 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -312,14 +312,14 @@ DataStoreTLBMiss:
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
index fc9a12768a14..94ad1372c490 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -352,9 +352,9 @@ BEGIN_MMU_FTR_SECTION
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
@@ -676,7 +676,6 @@ handle_page_fault_tramp_1:
 #ifdef CONFIG_VMAP_STACK
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
 #endif
-	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
 	/* fall through */
 handle_page_fault_tramp_2:
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 74e230c200fb..0fbdacc7fab7 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -476,9 +476,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
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
index 5a61182ddf75..8d014924ee0d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1512,13 +1512,15 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
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
 		goto page_fault;
@@ -1582,7 +1584,7 @@ int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
 
 	} else if (err) {
 page_fault:
-		err = do_page_fault(regs, ea, dsisr);
+		err = do_page_fault(regs);
 	}
 
 	return err;
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 584567970c11..985902ce0272 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -813,8 +813,9 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 	return slb_insert_entry(ea, context, flags, ssize, false);
 }
 
-long do_slb_fault(struct pt_regs *regs, unsigned long ea)
+long do_slb_fault(struct pt_regs *regs)
 {
+	unsigned long ea = regs->dar;
 	unsigned long id = get_region_id(ea);
 
 	/* IRQs are not reconciled here, so can't check irqs_disabled */
@@ -865,13 +866,15 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
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
index 6af4516d1c50..0e7f61fa65f9 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -547,10 +547,11 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(___do_page_fault);
 
-static int __do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+static long __do_page_fault(struct pt_regs *regs)
 {
-	int err;
+	unsigned long address = regs->dar;
+	unsigned long error_code = regs->dsisr;
+	long err;
 
 	err = ___do_page_fault(regs, address, error_code);
 	if (unlikely(err)) {
@@ -583,13 +584,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-int do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+long do_page_fault(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
-	int err;
+	long err;
 
-	err = __do_page_fault(regs, address, error_code);
+	err = __do_page_fault(regs);
 
 	exception_exit(prev_state);
 
-- 
2.23.0

