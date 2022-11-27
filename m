Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7E639AC4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:04:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKphj51T3z3fT7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:04:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eBv3hPsR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eBv3hPsR;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNg4gx3z3cMn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:27 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d3so2798360plr.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umHYF31kJbJ3hDv6duFrpbABKNglGBhnFwYf88gKYPA=;
        b=eBv3hPsR9ogLQfobRAF0hgSUn9qaiO3PLa5Gt4bNtrKwuSn4w0mJ1krNB+86bL8gcT
         UpGEK6CSn9DaxR5f0sHkQJZ4mjqhoISD4M2o0CjLzSY+aHHULhOCKOYm1Hs3jbTRjBAd
         avLnkho3n0U6OPyxucP+tTnWRzeyVTnSZDcvFi8Yjm26oDCSPCzovlGHoji6FmJv4utc
         jfObJEvTGO/c0OeQLsMy3cRigxglm4GvKDERMQi8Cs3ECVfkoiwmoTHdFJyaX+iL7vXh
         hdM2a5zgFzYyB+UiGsPP22duZdazy4eh20yy8XWkz+yvGwOvuEqnbSw7gCoI9z6PZeVw
         vRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umHYF31kJbJ3hDv6duFrpbABKNglGBhnFwYf88gKYPA=;
        b=xM5IQr9XG73GR1TpikPR3YkSC/35rXFtfLR+mPdjhLQEH4fTgZPq945QDXVuCI0E82
         9M7zlqEYDwoUc120hJfEqqDpgil+upjniJrR7g+xxLwcboqGeoizSMdHNQCUUz+vMX+q
         OK5/PZcLLK8eFrU2/npYDb6RKwXjtc3ng+UB8wLZBywFUB7PLouyRPz8rhs8QWPQ5PJw
         y8oI8rGq0yUOinju4jmDF8iej4jaF32kWRo3AKR3mD4MLVjLEpTDkbhEQRzmwHbNkLh/
         GpwRTjSPq3g1iqoWJNaceP3T0FTQh1v0z1B+DKYVxKWV2a7aiydGXzoMVZ1lvA+R8nQI
         CxqQ==
X-Gm-Message-State: ANoB5pkSn47471rKwXGVNbFlxiTCWtEutDwktEz6H859UEqKbKCdsPJA
	3CGf9dotMyMJBSaaQlrbGjBll9ZlgrIVKg==
X-Google-Smtp-Source: AA0mqf5bo0JqIIy6DuvA4x5RWn6kl/LPR+vFf+ydQ8WCEjiP4ERQ9ftrLf3rPVv3xUgXYth4KRKa1g==
X-Received: by 2002:a17:902:ecca:b0:189:ee1:23f with SMTP id a10-20020a170902ecca00b001890ee1023fmr28345572plh.75.1669553424951;
        Sun, 27 Nov 2022 04:50:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/17] powerpc: allow minimum sized kernel stack frames
Date: Sun, 27 Nov 2022 22:49:40 +1000
Message-Id: <20221127124942.1665522-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This affects only 64-bit ELFv2 kernels, and reduces the minimum
asm-created stack frame size from 112 to 32 byte on those kernels.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_40x.S       | 2 +-
 arch/powerpc/kernel/head_44x.S       | 6 +++---
 arch/powerpc/kernel/head_64.S        | 6 +++---
 arch/powerpc/kernel/head_85xx.S      | 4 ++--
 arch/powerpc/kernel/head_8xx.S       | 2 +-
 arch/powerpc/kernel/head_book3s_32.S | 4 ++--
 arch/powerpc/kernel/irq.c            | 4 ++--
 arch/powerpc/kernel/misc_32.S        | 2 +-
 arch/powerpc/kernel/misc_64.S        | 4 ++--
 arch/powerpc/kernel/process.c        | 2 +-
 arch/powerpc/kernel/smp.c            | 2 +-
 arch/powerpc/kernel/stacktrace.c     | 2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 088f500896c7..918547b93b5e 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -602,7 +602,7 @@ start_here:
 	lis	r1,init_thread_union@ha
 	addi	r1,r1,init_thread_union@l
 	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
+	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 
 	bl	early_init	/* We have to do this with MMU on */
 
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index f15cb9fdb692..63a85c16fef4 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -109,7 +109,7 @@ _GLOBAL(_start);
 	lis	r1,init_thread_union@h
 	ori	r1,r1,init_thread_union@l
 	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
+	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 
 	bl	early_init
 
@@ -1012,7 +1012,7 @@ _GLOBAL(start_secondary_47x)
 	 */
 	lis	r1,temp_boot_stack@h
 	ori	r1,r1,temp_boot_stack@l
-	addi	r1,r1,1024-STACK_FRAME_OVERHEAD
+	addi	r1,r1,1024-STACK_FRAME_MIN_SIZE
 	li	r0,0
 	stw	r0,0(r1)
 	bl	mmu_init_secondary
@@ -1025,7 +1025,7 @@ _GLOBAL(start_secondary_47x)
 	lwz	r1,TASK_STACK(r2)
 
 	/* Current stack pointer */
-	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
+	addi	r1,r1,THREAD_SIZE-STACK_FRAME_MIN_SIZE
 	li	r0,0
 	stw	r0,0(r1)
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index dedcc6fe2263..b513d13bf79e 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -424,7 +424,7 @@ generic_secondary_common_init:
 
 	/* Create a temp kernel stack for use before relocation is on.	*/
 	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,STACK_FRAME_OVERHEAD
+	subi	r1,r1,STACK_FRAME_MIN_SIZE
 
 	/* See if we need to call a cpu state restore handler */
 	LOAD_REG_ADDR(r23, cur_cpu_spec)
@@ -780,7 +780,7 @@ _GLOBAL(pmac_secondary_start)
 
 	/* Create a temp kernel stack for use before relocation is on.	*/
 	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,STACK_FRAME_OVERHEAD
+	subi	r1,r1,STACK_FRAME_MIN_SIZE
 
 	b	__secondary_start
 
@@ -958,7 +958,7 @@ start_here_multiplatform:
 	LOAD_REG_IMMEDIATE(r1,THREAD_SIZE)
 	add	r1,r3,r1
 	li	r0,0
-	stdu	r0,-STACK_FRAME_OVERHEAD(r1)
+	stdu	r0,-STACK_FRAME_MIN_SIZE(r1)
 
 	/*
 	 * Do very early kernel initializations, including initial hash table
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 24f39abf81df..d9bd377dec91 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -229,7 +229,7 @@ set_ivor:
 	lis	r1,init_thread_union@h
 	ori	r1,r1,init_thread_union@l
 	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
+	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 
 #ifdef CONFIG_SMP
 	stw	r24, TASK_CPU(r2)
@@ -1044,7 +1044,7 @@ __secondary_start:
 	lwz	r1,TASK_STACK(r2)
 
 	/* stack */
-	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
+	addi	r1,r1,THREAD_SIZE-STACK_FRAME_MIN_SIZE
 	li	r0,0
 	stw	r0,0(r1)
 
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 0b05f2be66b9..cf546d0e5c40 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -537,7 +537,7 @@ start_here:
 	ori	r0, r0, STACK_END_MAGIC@l
 	stw	r0, 0(r1)
 	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
+	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 
 	lis	r6, swapper_pg_dir@ha
 	tophys(r6,r6)
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 519b60695167..40854d092dd3 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -840,7 +840,7 @@ __secondary_start:
 	lwz	r1,TASK_STACK(r1)
 
 	/* stack */
-	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
+	addi	r1,r1,THREAD_SIZE-STACK_FRAME_MIN_SIZE
 	li	r0,0
 	tophys(r3,r1)
 	stw	r0,0(r3)
@@ -966,7 +966,7 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_HPTE_TABLE)
 	lis	r1,init_thread_union@ha
 	addi	r1,r1,init_thread_union@l
 	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_OVERHEAD(r1)
+	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
 /*
  * Do early platform-specific initialization,
  * and set up the MMU.
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 9ede61a5a469..c5b9ce887483 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -210,7 +210,7 @@ static __always_inline void call_do_softirq(const void *sp)
 		 PPC_LL "	%%r1, 0(%%r1)		;"
 		 : // Outputs
 		 : // Inputs
-		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
+		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_MIN_SIZE),
 		   [callee] "i" (__do_softirq)
 		 : // Clobbers
 		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
@@ -264,7 +264,7 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 		 : // Outputs
 		   "+r" (r3)
 		 : // Inputs
-		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
+		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_MIN_SIZE),
 		   [callee] "i" (__do_irq)
 		 : // Clobbers
 		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index e5127b19fec2..daf8f87d2372 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -382,7 +382,7 @@ EXPORT_SYMBOL(__bswapdi2)
 _GLOBAL(start_secondary_resume)
 	/* Reset stack */
 	rlwinm	r1, r1, 0, 0, 31 - THREAD_SHIFT
-	addi	r1,r1,THREAD_SIZE-STACK_FRAME_OVERHEAD
+	addi	r1,r1,THREAD_SIZE-STACK_FRAME_MIN_SIZE
 	li	r3,0
 	stw	r3,0(r1)		/* Zero the stack frame pointer	*/
 	bl	start_secondary
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 36184cada00b..4bb6dd30c556 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -384,7 +384,7 @@ _GLOBAL(kexec_sequence)
 	std	r0,16(r1)
 
 	/* switch stacks to newstack -- &kexec_stack.stack */
-	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
+	stdu	r1,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r3)
 	mr	r1,r3
 
 	li	r0,0
@@ -401,7 +401,7 @@ _GLOBAL(kexec_sequence)
 	std	r26,-48(r1)
 	std	r25,-56(r1)
 
-	stdu	r1,-STACK_FRAME_OVERHEAD-64(r1)
+	stdu	r1,-STACK_FRAME_MIN_SIZE-64(r1)
 
 	/* save args into preserved regs */
 	mr	r31,r3			/* newstack (both) */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 6820d90744c3..6a81f1583374 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2151,7 +2151,7 @@ int validate_sp_size(unsigned long sp, struct task_struct *p,
 
 int validate_sp(unsigned long sp, struct task_struct *p)
 {
-	return validate_sp_size(sp, p, STACK_FRAME_OVERHEAD);
+	return validate_sp_size(sp, p, STACK_FRAME_MIN_SIZE);
 }
 
 static unsigned long ___get_wchan(struct task_struct *p)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 0da6e59161cd..6b90f10a6c81 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1249,7 +1249,7 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 #ifdef CONFIG_PPC64
 	paca_ptrs[cpu]->__current = idle;
 	paca_ptrs[cpu]->kstack = (unsigned long)task_stack_page(idle) +
-				 THREAD_SIZE - STACK_FRAME_OVERHEAD;
+				 THREAD_SIZE - STACK_FRAME_MIN_SIZE;
 #endif
 	task_thread_info(idle)->cpu = cpu;
 	secondary_current = current_set[cpu] = idle;
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1dbbf30f265e..5de8597eaab8 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -94,7 +94,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 		 * idle tasks have a custom stack layout,
 		 * c.f. cpu_idle_thread_init().
 		 */
-		stack_end -= STACK_FRAME_OVERHEAD;
+		stack_end -= STACK_FRAME_MIN_SIZE;
 	}
 
 	if (task == current)
-- 
2.37.2

