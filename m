Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F6739F67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 13:25:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hRFLCN8t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmyjN3MS5z3bYV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 21:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hRFLCN8t;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmyhT1478z303p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 21:24:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmyhS71tQz4x1R;
	Thu, 22 Jun 2023 21:24:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687433097;
	bh=MFqu0Fxui8E4yy7bVHaZ0S97NFeHBxBXuHtsJkq2cxE=;
	h=From:To:Subject:Date:From;
	b=hRFLCN8tB82awjjyeq82BYHoDN1WPLAthKMWAoaUcqsV4H38edUYcRjUOWN9mxYtG
	 CFZKQEmlG/8ep7Zumgue+fJOvj+qcVLW7rfeSrgVAepM5aWsXHatXxHgwpiIoLdgwa
	 8zFm4YRXuGyAAv9xA+STPq8VQ1jrPQLsuIISdlg3VPMog4etfvqm09ziI96lITcfEU
	 uW3z9zqWkHULQIDI2r4fG9tCGQcBPq7NqV3AIZWzlJmXxkzuAgl7fWsU1jLXBurHqW
	 8OrHvNMhTuEZW8Q+P2FkUlyeSVMC7IG35C4UTiQuJTWQ0AceqO+A1jOalSt9yQ+c7B
	 8hyLje+UwozPw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64e: Fix obtool warnings in exceptions-64e.S
Date: Thu, 22 Jun 2023 21:24:51 +1000
Message-ID: <20230622112451.735268-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit aec0ba7472a7 ("powerpc/64: Use -mprofile-kernel for big
endian ELFv2 kernels"), this file is checked by objtool. Fix warnings
such as:

  arch/powerpc/kernel/idle_64e.o: warning: objtool: .text+0x20: unannotated intra-function call
  arch/powerpc/kernel/exceptions-64e.o: warning: objtool: .text+0x218: unannotated intra-function call

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64e.S | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 3f86091e68b3..7ab4c8c0f1ab 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -5,6 +5,7 @@
  *  Copyright (C) 2007 Ben. Herrenschmidt (benh@kernel.crashing.org), IBM Corp.
  */
 
+#include <linux/linkage.h>
 #include <linux/threads.h>
 #include <asm/reg.h>
 #include <asm/page.h>
@@ -66,7 +67,7 @@
 #define SPECIAL_EXC_LOAD(reg, name) \
 	ld	reg, (SPECIAL_EXC_##name * 8 + SPECIAL_EXC_FRAME_OFFS)(r1)
 
-special_reg_save:
+SYM_CODE_START_LOCAL(special_reg_save)
 	/*
 	 * We only need (or have stack space) to save this stuff if
 	 * we interrupted the kernel.
@@ -131,8 +132,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	SPECIAL_EXC_STORE(r10,CSRR1)
 
 	blr
+SYM_CODE_END(special_reg_save)
 
-ret_from_level_except:
+SYM_CODE_START_LOCAL(ret_from_level_except)
 	ld	r3,_MSR(r1)
 	andi.	r3,r3,MSR_PR
 	beq	1f
@@ -206,6 +208,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	mtxer	r11
 
 	blr
+SYM_CODE_END(ret_from_level_except)
 
 .macro ret_from_level srr0 srr1 paca_ex scratch
 	bl	ret_from_level_except
@@ -232,13 +235,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r13,\scratch
 .endm
 
-ret_from_crit_except:
+SYM_CODE_START_LOCAL(ret_from_crit_except)
 	ret_from_level SPRN_CSRR0 SPRN_CSRR1 PACA_EXCRIT SPRN_SPRG_CRIT_SCRATCH
 	rfci
+SYM_CODE_END(ret_from_crit_except)
 
-ret_from_mc_except:
+SYM_CODE_START_LOCAL(ret_from_mc_except)
 	ret_from_level SPRN_MCSRR0 SPRN_MCSRR1 PACA_EXMC SPRN_SPRG_MC_SCRATCH
 	rfmci
+SYM_CODE_END(ret_from_mc_except)
 
 /* Exception prolog code for all exceptions */
 #define EXCEPTION_PROLOG(n, intnum, type, addition)	    		    \
@@ -978,20 +983,22 @@ masked_interrupt_book3e_0x2c0:
  * r14 and r15 containing the fault address and error code, with the
  * original values stashed away in the PACA
  */
-storage_fault_common:
+SYM_CODE_START_LOCAL(storage_fault_common)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	do_page_fault
 	b	interrupt_return
+SYM_CODE_END(storage_fault_common)
 
 /*
  * Alignment exception doesn't fit entirely in the 0x100 bytes so it
  * continues here.
  */
-alignment_more:
+SYM_CODE_START_LOCAL(alignment_more)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
+SYM_CODE_END(alignment_more)
 
 /*
  * Trampolines used when spotting a bad kernel stack pointer in
@@ -1030,8 +1037,7 @@ BAD_STACK_TRAMPOLINE(0xe00)
 BAD_STACK_TRAMPOLINE(0xf00)
 BAD_STACK_TRAMPOLINE(0xf20)
 
-	.globl	bad_stack_book3e
-bad_stack_book3e:
+_GLOBAL(bad_stack_book3e)
 	/* XXX: Needs to make SPRN_SPRG_GEN depend on exception type */
 	mfspr	r10,SPRN_SRR0;		  /* read SRR0 before touching stack */
 	ld	r1,PACAEMERGSP(r13)
@@ -1285,8 +1291,7 @@ have_hes:
 	 * ever takes any parameters, the SCOM code must also be updated to
 	 * provide them.
 	 */
-	.globl a2_tlbinit_code_start
-a2_tlbinit_code_start:
+_GLOBAL(a2_tlbinit_code_start)
 
 	ori	r11,r3,MAS0_WQ_ALLWAYS
 	oris	r11,r11,MAS0_ESEL(3)@h /* Use way 3: workaround A2 erratum 376 */
@@ -1479,8 +1484,7 @@ _GLOBAL(book3e_secondary_thread_init)
 	mflr	r28
 	b	3b
 
-	.globl init_core_book3e
-init_core_book3e:
+_GLOBAL(init_core_book3e)
 	/* Establish the interrupt vector base */
 	tovirt(r2,r2)
 	LOAD_REG_ADDR(r3, interrupt_base_book3e)
@@ -1488,7 +1492,7 @@ init_core_book3e:
 	sync
 	blr
 
-init_thread_book3e:
+SYM_CODE_START_LOCAL(init_thread_book3e)
 	lis	r3,(SPRN_EPCR_ICM | SPRN_EPCR_GICM)@h
 	mtspr	SPRN_EPCR,r3
 
@@ -1502,6 +1506,7 @@ init_thread_book3e:
 	mtspr	SPRN_TSR,r3
 
 	blr
+SYM_CODE_END(init_thread_book3e)
 
 _GLOBAL(__setup_base_ivors)
 	SET_IVOR(0, 0x020) /* Critical Input */
-- 
2.41.0

