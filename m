Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B130D5BCDDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRHp2njDz3f6Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DhFrA0z9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DhFrA0z9;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFG3tVXz3bWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:10 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id bu5-20020a17090aee4500b00202e9ca2182so6801311pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9Nse6Ejk7TH0SHRxNxfcw9GgDVYmTOwgYK3wjUO92dM=;
        b=DhFrA0z9ApUZGpaxSeTkDTSvHYHbYJIFm+MeJCiA/l2in4LXp1+wOrI8eVlufA8i30
         EUs/LQQROaHRP6V7MaWWHu5ZojwtmXYTlRPYYzzLfGIjNaXf3kNvAv9dOoAxB6v7zFNe
         N4luwDjmlBt9RMsRfNvw+rN6mG0R98HM9EoMiKI1qh21EbnZqCw1fOj3t0NdPUziuJUc
         BWQgnfG+8gqST9ing0eZ2USFjkMzHVH3ODnYqkhuuiS82/BUczplGh47lSyEs4CmRrJt
         WNqSt4giddikY2KRlpgFzzx4YAeJp6cGPqc0SMoBw4/6pbadf8MDib6KYHf+4hu36YZR
         hyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9Nse6Ejk7TH0SHRxNxfcw9GgDVYmTOwgYK3wjUO92dM=;
        b=bTOUlld3PSOEcsVmJwZL6TIDIBVT8yX772K06HHOiGA2yO0sTC8N8B8t9G0cvpwRxh
         EFXg7TlRBi5+gop8p4xiskIAtT1i+mXrwsElAUjLF5LrlW3lmFMdu+CF+tNNAqFcDhf0
         UopavusThfn7qtiu9S/ftbhzZHtLLYNUDKSYjZb2UoDgVp202zxc+3fmYacwHSc7XWAI
         +NiQoMX12fvadH5Bo+1l3AimaWIYP/mpNCKFFhFEqA8m/6DQj0QdidNFPdhSgtbtx3US
         f7cXq5llrvKv4/4X4YLi0R26oHBILVbf6dmCDGkmZwVUGP0iUK88A0ttFoSahqzx//ki
         hnSg==
X-Gm-Message-State: ACrzQf2Hs8JYWwvr2LA2A0SlYABay75pwhY5wZlTMrh+cRe7GuXicz8m
	Mz5ZsS9jTCP7NxxqExSjA6vQq5R6+D8=
X-Google-Smtp-Source: AMsMyM7d2+GeSzahlrPGYqUz16LtIrsQuSrx0kVJuec5LFgPv9FzS+bZPtzu1k4qwhQoa/DEnlBEtw==
X-Received: by 2002:a17:90a:ac0c:b0:203:2d73:8ef5 with SMTP id o12-20020a17090aac0c00b002032d738ef5mr19974091pjq.180.1663596127521;
        Mon, 19 Sep 2022 07:02:07 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/7] powerpc/64: provide a helper macro to load r2 with the kernel TOC
Date: Tue, 20 Sep 2022 00:01:45 +1000
Message-Id: <20220919140149.4018927-4-npiggin@gmail.com>
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

A later change stops the kernel using r2 and loads it with a poison
value.  Provide a PACATOC loading abstraction which can hide this
detail.

XXX: 64e, KVM, ftrace not entirely done

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h             |  3 +++
 arch/powerpc/kernel/exceptions-64e.S           |  4 ++--
 arch/powerpc/kernel/exceptions-64s.S           |  6 +++---
 arch/powerpc/kernel/head_64.S                  |  4 ++--
 arch/powerpc/kernel/interrupt_64.S             | 12 ++++++------
 arch/powerpc/kernel/optprobes_head.S           |  2 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S    |  4 ++--
 arch/powerpc/platforms/powernv/opal-wrappers.S |  2 +-
 8 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 520c4c9caf7f..c0848303151c 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -374,6 +374,9 @@ GLUE(.,name):
 
 #ifdef __powerpc64__
 
+#define LOAD_PACA_TOC()				\
+	ld	r2,PACATOC(r13)
+
 #define LOAD_REG_IMMEDIATE(reg, expr) __LOAD_REG_IMMEDIATE reg, expr
 
 #define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 08b7d6bd4da6..bc76950201b6 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -382,7 +382,7 @@ exc_##n##_common:							    \
 	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
 	mfspr	r5,scratch;		/* get back r13 */		    \
 	std	r12,GPR12(r1);		/* save r12 in stackframe */	    \
-	ld	r2,PACATOC(r13);	/* get kernel TOC into r2 */	    \
+	LOAD_PACA_TOC();		/* get kernel TOC into r2 */	    \
 	mflr	r6;			/* save LR in stackframe */	    \
 	mfctr	r7;			/* save CTR in stackframe */	    \
 	mfspr	r8,SPRN_XER;		/* save XER in stackframe */	    \
@@ -1073,7 +1073,7 @@ bad_stack_book3e:
 	std	r11,0(r1)
 	li	r12,0
 	std	r12,0(r11)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 1:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_bad_stack
 	b	1b
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5c110e5e5819..9a06f2c8e326 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -580,7 +580,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   */
 	mflr	r9			/* Get LR, later save to stack	*/
-	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	*/
+	LOAD_PACA_TOC()			/* get kernel TOC into r2	*/
 	std	r9,_LINK(r1)
 	lbz	r10,PACAIRQSOFTMASK(r13)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
@@ -610,7 +610,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 .macro SEARCH_RESTART_TABLE
 #ifdef CONFIG_RELOCATABLE
 	mr	r12,r2
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	LOAD_REG_ADDR(r9, __start___restart_table)
 	LOAD_REG_ADDR(r10, __stop___restart_table)
 	mr	r2,r12
@@ -640,7 +640,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 .macro SEARCH_SOFT_MASK_TABLE
 #ifdef CONFIG_RELOCATABLE
 	mr	r12,r2
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	LOAD_REG_ADDR(r9, __start___soft_mask_table)
 	LOAD_REG_ADDR(r10, __stop___soft_mask_table)
 	mr	r2,r12
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cac3e1b58360..80106aaf0b7a 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -841,7 +841,7 @@ __secondary_start:
  * before going into C code.
  */
 start_secondary_prolog:
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
 	bl	start_secondary
@@ -981,7 +981,7 @@ start_here_common:
 	std	r1,PACAKSAVE(r13)
 
 	/* Load the TOC (virtual address) */
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 
 	/* Mark interrupts soft and hard disabled (they might be enabled
 	 * in the PACA when doing hotplug)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index e95911f49eb8..6d5c105457dd 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -57,7 +57,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
 	std	r2,GPR2(r1)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
@@ -185,7 +185,7 @@ syscall_vectored_\name\()_restart:
 _ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
@@ -235,7 +235,7 @@ START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
 #endif
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	mfcr	r12
 	li	r11,0
 	/* Can we avoid saving r3-r8 in common case? */
@@ -378,7 +378,7 @@ syscall_restart:
 _ASM_NOKPROBE_SYMBOL(syscall_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r3,RESULT(r1)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
@@ -525,7 +525,7 @@ interrupt_return_\srr\()_user_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
@@ -658,7 +658,7 @@ interrupt_return_\srr\()_kernel_restart:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	GET_PACA(r13)
 	ld	r1,PACA_EXIT_SAVE_R1(r13)
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index 5c7f0b4b784b..cd4e7bc32609 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -73,7 +73,7 @@ optprobe_template_entry:
 	 * further below.
 	 */
 #ifdef CONFIG_PPC64
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 #endif
 
 	.global optprobe_template_op_address
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 33fcfb2eaded..38c132ffc4b8 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -83,8 +83,8 @@
 #ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
-	ld	r2,PACATOC(r13)	/* get kernel TOC in r2 */
-
+	LOAD_PACA_TOC()		/* get kernel TOC in r2 */
+	/* XXX: could be load_var */
 	LOAD_REG_ADDR(r3, function_trace_op)
 	ld	r5,0(r3)
 #else
diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
index e5acc33b3b20..0ed95f753416 100644
--- a/arch/powerpc/platforms/powernv/opal-wrappers.S
+++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
@@ -57,7 +57,7 @@ opal_return:
 	.long 0xa64b7b7d /* mthsrr1 r11				*/
 	.long 0x2402004c /* hrfid				*/
 #endif
-	ld	r2,PACATOC(r13)
+	LOAD_PACA_TOC()
 	ld	r0,PPC_LR_STKOFF(r1)
 	mtlr	r0
 	blr
-- 
2.37.2

