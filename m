Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184C309561
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:33:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZsQ427FzDqBm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sWSjOxdp; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZL34cLpzDrTL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:31 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id y205so8016777pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9r5gX9trLuBGO+R4GiWCa/nomtzAfpcXaGfYLnkn/io=;
 b=sWSjOxdpcRD7aw+mT0eWx5MVguBpsE14lO2/6j05oww27H+KmQY1DkUnW05yIcGbUY
 PzeG+2Up9cdhz6x+/BGwN4xFPOZKMh6e3dRwFfSZrk3Ztm1Qkkt8+vkc7moREeal7zYS
 eDaiyg8UePzFnS4+jKr1fR4l9p2S17IK0X2imwjH8YOXVPj+uXaR8iQtHE/wY2spA0X3
 N3Rdfef9gvTXQdapNjaVK5s7IhxknDDWemqv3xF/KZr5RCkhtuE9hCc/Pm4D0w7qbw0d
 0XHo8ezhXcTKJJI8uwjmI1RnSBwqU6bKjFIOFJ52XfW+oK804ZKhXrUjlP6rbuZVwlt0
 OsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9r5gX9trLuBGO+R4GiWCa/nomtzAfpcXaGfYLnkn/io=;
 b=B5b55J9+zR15mWuVSxLkEbT5YaL7irggAVN09b42vzSV2shXt56ZdKPeeIZJJMs5a9
 evPP5CP0q6y08inTroWrCo7EQZFFkXRBzNdhdejVnmLurBKuPtgtan0udEd5CgPPNfaB
 OLgNZn45wYFOej5i4sWXINSjRlkJ8oTFU86WfhoxNUxHqofr/SsSkbN2BbEjI2Bm0dfR
 b2Nnq6qrTvWgGILIPmDp6Iai6Gxby1BrUZ6i6Wul2kfoCNSSWyFFlkYRqhU8xjPY7mgA
 Kg8hTHXhZBHSzqB+hXg0IpOpmYBein71QRrewh5SSCKwAaFvhsGwdxOXDvUdiHsokuMQ
 4Vnw==
X-Gm-Message-State: AOAM5306dj+A/F079B+zG6gY+rpofM5HYS2FZnb5XTIxC/xDHPsI91Z3
 hNGgIBYFLC+UPEYucewQRTjt4Ne3Ssk=
X-Google-Smtp-Source: ABdhPJzuD5AaYyq/eFtA581ZQVjXr/4VgCLPXPU2iuqKjpvUfAEQQxpg8Fq/dllbu+JJD07uF8KD5g==
X-Received: by 2002:a62:2ac3:0:b029:1bc:4287:c0b3 with SMTP id
 q186-20020a622ac30000b02901bc4287c0b3mr8270469pfq.26.1612012168487; 
 Sat, 30 Jan 2021 05:09:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 06/42] powerpc: remove arguments from fault handler
 functions
Date: Sat, 30 Jan 2021 23:08:16 +1000
Message-Id: <20210130130852.2952424-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64e.S          |  2 --
 arch/powerpc/kernel/exceptions-64s.S          | 17 ++++-------------
 arch/powerpc/kernel/head_40x.S                | 10 +++++-----
 arch/powerpc/kernel/head_8xx.S                |  6 +++---
 arch/powerpc/kernel/head_book3s_32.S          |  5 ++---
 arch/powerpc/kernel/head_booke.h              |  4 +---
 arch/powerpc/mm/book3s64/hash_utils.c         |  8 +++++---
 arch/powerpc/mm/book3s64/slb.c                | 11 +++++++----
 arch/powerpc/mm/fault.c                       |  5 ++---
 12 files changed, 33 insertions(+), 43 deletions(-)

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
index 07aba8af99d3..839dcb94eea7 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1438,10 +1438,9 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
+	ld	r4,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	andis.	r0,r5,DSISR_DABRMATCH@h
+	andis.	r0,r4,DSISR_DABRMATCH@h
 	bne-	1f
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1504,10 +1503,9 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
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
@@ -1519,8 +1517,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_DAR(r1)
-	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1555,8 +1551,6 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1602,10 +1596,9 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
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
@@ -1617,8 +1610,6 @@ MMU_FTR_SECTION_ELSE
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
index 6d411b8fd5d3..1f808e1aa051 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -361,9 +361,9 @@ BEGIN_MMU_FTR_SECTION
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
@@ -685,7 +685,6 @@ handle_page_fault_tramp_1:
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
index e866cae57e2f..9a499af3eebf 100644
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
 
 	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)))
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
index 8961b44f350c..273ff845eccf 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -542,12 +542,11 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-int do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+long do_page_fault(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
 	enum ctx_state prev_state = exception_enter();
-	int rc = __do_page_fault(regs, address, error_code);
+	int rc = __do_page_fault(regs, regs->dar, regs->dsisr);
 	exception_exit(prev_state);
 	if (likely(!rc))
 		return 0;
-- 
2.23.0

