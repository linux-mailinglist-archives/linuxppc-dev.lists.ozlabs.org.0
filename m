Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0BB5BCDDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:03:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRGL03nnz3c4j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:03:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pa8SiexO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pa8SiexO;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRF90qQ9z3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:04 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 207so18449120pgc.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KX1DR2S31KehXb4h5SKd0GwOjEshRBRPupbjODfb1Rg=;
        b=Pa8SiexOU61k1qsc4uJrKjAAt968GC1VpmzfkcYUdTz7iZ7J1Y/T/lAcXQ9Ukjht+Z
         xYxkf9L38xjzluu2ZH+ca5tc4RG3EB3OiJrVQAak+aR3kEVuLS5skAQ5yae/lAZS7qmq
         7tulw55qb2LqnwN8CJe1Su0o1uXMdm3cRxawBzCVEBu58ywNM8LBUAKZwgITbvOwnkQJ
         l75SpMHtnITqwzhnr9KLZYmKEJ322rCsWfZU1BJQZvUK2F4he9Yt0t1JP4GqV8dZBKxm
         gUfukYWAdbVBsVHjr5Dzesu894ts9zO2GhAOkscZTrEWm7kdIuu88LL0A8Of5EhYPMKF
         107A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KX1DR2S31KehXb4h5SKd0GwOjEshRBRPupbjODfb1Rg=;
        b=Tpln3ZdqbFNl5s6ADnAHF6b1hefItBPq8llU7jEq4jLrYNHesMBQ229RJhaqrn8Qo1
         IFal9SdBaHYHBN/SGWR5hyW6XNWNU9OnFVD/R8mZOLxUGTUOvot6Tq7NunKMkstv6MBl
         qa7YgWuwlMC+DViHiFr/ZrxIvdf6BtUgEQRCVjctyo07dRO76wVRyGuJKoulquXBOP7V
         H1XNRpISDSY45CqH6NA+urcztGF85mwy8HeDG/NLCC3sSnsFF08kJaSSHe5JlHbpdfFX
         DoOvcQ0XISdIwjYBdan4DC/I/MwU+1CiEjFkbspcKGxojxaNW97vBUwk/dQMVvW57arv
         ebiA==
X-Gm-Message-State: ACrzQf3Nz2ozl0S74FMH3K9XezmN3jf1OnD5UcJvHXv0Y0PSIfT5OQLR
	RSA5OCxSFtyH+I4KyYZF23urY6TQnos=
X-Google-Smtp-Source: AMsMyM5Zw5R9m8ad1obeq6JhHzz6IIx+AcyTjIaYuAjBQlml+A5xSYQm/rFaf2wzQ/R2eObaTLBEXQ==
X-Received: by 2002:a63:5915:0:b0:438:d560:c4d3 with SMTP id n21-20020a635915000000b00438d560c4d3mr15449519pgb.240.1663596122179;
        Mon, 19 Sep 2022 07:02:02 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/7] powerpc: use 16-bit immediate for STACK_FRAME_REGS_MARKER
Date: Tue, 20 Sep 2022 00:01:43 +1000
Message-Id: <20220919140149.4018927-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919140149.4018927-1-npiggin@gmail.com>
References: <20220919140149.4018927-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using a 16-bit constant for this marker allows it to be loaded with
a single 'li' instruction. On 64-bit this avoids a TOC entry and a
TOC load that depends on the r2 value that has just been loaded from
the PACA.

XXX: this probably should be 64-bit change and use 2 instruction
sequence that 32-bit uses, to avoid false positives.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h    | 6 +++---
 arch/powerpc/kernel/entry_32.S       | 9 ++++-----
 arch/powerpc/kernel/exceptions-64e.S | 8 +-------
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 arch/powerpc/kernel/head_32.h        | 3 +--
 arch/powerpc/kernel/head_64.S        | 7 -------
 arch/powerpc/kernel/head_booke.h     | 3 +--
 arch/powerpc/kernel/interrupt_64.S   | 6 +++---
 8 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index a03403695cd4..f47066f7878e 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -115,10 +115,10 @@ struct pt_regs
 
 #define STACK_FRAME_OVERHEAD	112	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
-#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x7265677368657265)
+#define STACK_FRAME_REGS_MARKER	ASM_CONST(0xffffffffffffdead)
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
-#define STACK_FRAME_MARKER	12
+#define STACK_FRAME_MARKER	1	/* Reuse CR+reserved word */
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
@@ -136,7 +136,7 @@ struct pt_regs
 #define KERNEL_REDZONE_SIZE	0
 #define STACK_FRAME_OVERHEAD	16	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
-#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x72656773)
+#define STACK_FRAME_REGS_MARKER	ASM_CONST(0xffffba51)
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 1d599df6f169..c221e764cefd 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -108,9 +108,8 @@ transfer_to_syscall:
 #ifdef CONFIG_BOOKE_OR_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #endif
-	lis	r12,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
+	li	r12,STACK_FRAME_REGS_MARKER /* exception frame marker */
 	SAVE_GPR(2, r1)
-	addi	r12,r12,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r1)
 	li	r2, INTERRUPT_SYSCALL
 	stw	r12,8(r1)
@@ -265,7 +264,7 @@ fast_exception_return:
 	mtcr	r10
 	lwz	r10,_LINK(r11)
 	mtlr	r10
-	/* Clear the exception_marker on the stack to avoid confusing stacktrace */
+	/* Clear the STACK_FRAME_REGS_MARKER on the stack to avoid confusing stacktrace */
 	li	r10, 0
 	stw	r10, 8(r11)
 	REST_GPR(10, r11)
@@ -322,7 +321,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	li	r0,0
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	stw	r0,8(r1)
@@ -374,7 +373,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_XER,r5
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	stw	r0,8(r1)
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 67dc4e3179a0..08b7d6bd4da6 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -389,7 +389,7 @@ exc_##n##_common:							    \
 	ld	r9,excf+EX_R1(r13);	/* load orig r1 back from PACA */   \
 	lwz	r10,excf+EX_CR(r13);	/* load orig CR back from PACA	*/  \
 	lbz	r11,PACAIRQSOFTMASK(r13); /* get current IRQ softe */	    \
-	ld	r12,exception_marker@toc(r2);				    \
+	li	r12,STACK_FRAME_REGS_MARKER;				    \
 	li	r0,0;							    \
 	std	r3,GPR10(r1);		/* save r10 to stackframe */	    \
 	std	r4,GPR11(r1);		/* save r11 to stackframe */	    \
@@ -470,12 +470,6 @@ exc_##n##_bad_stack:							    \
 	bl	hdlr;							\
 	b	interrupt_return
 
-/* This value is used to mark exception frames on the stack. */
-	.section	".toc","aw"
-exception_marker:
-	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
-
-
 /*
  * And here we have the exception vectors !
  */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..5c110e5e5819 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -589,7 +589,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	li	r9,IVEC
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
-	ld	r11,exception_marker@toc(r2)
+	li	r11,STACK_FRAME_REGS_MARKER
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 .endm
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index c3286260a7d1..5cf80f29d839 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -110,8 +110,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 .macro COMMON_EXCEPTION_PROLOG_END trapno
 	stw	r0,GPR0(r1)
-	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
-	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
+	li	r10,STACK_FRAME_REGS_MARKER /* exception frame marker */
 	stw	r10,8(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..cac3e1b58360 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -192,13 +192,6 @@ __secondary_hold:
 #endif
 CLOSE_FIXED_SECTION(first_256B)
 
-/* This value is used to mark exception frames on the stack. */
-	.section ".toc","aw"
-/* This value is used to mark exception frames on the stack. */
-exception_marker:
-	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
-	.previous
-
 /*
  * On server, we include the exception vectors code here as it
  * relies on absolute addressing which is only possible within
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index bb6d5d0fc4ac..fe36237197c2 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -82,8 +82,7 @@ END_BTB_FLUSH_SECTION
 
 .macro COMMON_EXCEPTION_PROLOG_END trapno
 	stw	r0,GPR0(r1)
-	lis	r10, STACK_FRAME_REGS_MARKER@ha	/* exception frame marker */
-	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
+	li	r10, STACK_FRAME_REGS_MARKER	/* exception frame marker */
 	stw	r10, 8(r1)
 	li	r10, \trapno
 	stw	r10,_TRAP(r1)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ce25b28cf418..14c409fd4c38 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -92,7 +92,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
+	li	r11,STACK_FRAME_REGS_MARKER
 	std	r11,-16(r10)		/* "regshere" marker */
 
 BEGIN_FTR_SECTION
@@ -276,7 +276,7 @@ END_BTB_FLUSH_SECTION
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
 	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
+	li	r11,STACK_FRAME_REGS_MARKER
 	std	r11,-16(r10)		/* "regshere" marker */
 
 #ifdef CONFIG_PPC_BOOK3S
@@ -619,7 +619,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mtspr	SPRN_XER,r5
 
 	/*
-	 * Leaving a stale exception_marker on the stack can confuse
+	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
 	std	r0,STACK_FRAME_OVERHEAD-16(r1)
-- 
2.37.2

