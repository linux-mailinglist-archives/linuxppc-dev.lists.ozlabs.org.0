Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A761302B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:09:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12mG69bjz3cFs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:09:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mfx4aYNv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mfx4aYNv;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SK1GXpz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:29 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so11880134pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUE/vMRCPjOE+uWRzORwT8aB57gxfYRsLdwmW2HmMX0=;
        b=Mfx4aYNvWFDYg6di8he/c3CCeal/MXKtgfA5aRrrnZmzlbj32pN1iyGLkxOeQlma6Y
         afFL79BhQgTBUNTfDoot5IGlnsqRFq0aaj29Id27rJnjSbCN/HUCM4+DUrZpmSi17QsC
         FUmH6z/+EoPRWDv4OrzyrXvaTDskQG/f2pAUDjA66HCVcimYKZ/rvBmp1E5qiVPXcXJw
         hkSTyLCdRk5/UTxIafNtMzYkIdaIlDV3DPW5p8O4b/CYviXUuKDm7a8PCs1JkbEB5pQG
         eNZtimQa9KWRdgDahGfRUye5fpk9UKKDScGbE0Y0ZDFJt8+RH1nTTx/kIIgl1ZnEYKOy
         HSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUE/vMRCPjOE+uWRzORwT8aB57gxfYRsLdwmW2HmMX0=;
        b=6MAkiiANdL7N0Ugukek7K44nub5sECwKlMNZe1NlRJ4a3q6nZWTNgQiz4Qfz47F1pG
         izrbvjR1hf7N5S3ZCV0okDFyqmqhg+8MjafuCtqjgu4vmtQ7yD+8SapauU08wHNJRqa7
         37pTQoOCl6arswcZzTJ81bV8+eSoNo6JCWJL1dxf4X2dGrNMXWtvaj7tXmk9jeFH4bUO
         uuEuZA6/bj5ACQLgE1HsBkvNyvYy7lMUZjdRI9CKr5gHuSltkC3XVF0hjs6cLKS4O5K3
         VU/dQB+pyjk07MVk2FviXdBbejyPUrdQzu5/em+RKQsiCE2vbVqPJHsscZEFXFN6rptA
         /9Sw==
X-Gm-Message-State: ACrzQf07EL7SC8sVFZNIBrA1o5npM3GMI3KwCAxVDykVIC9K53E4n4zp
	4TFGiVT9xz2/cwqDtXuNukqv3iWByM4=
X-Google-Smtp-Source: AMsMyM67X87NfxJ/gTsvCgpIXzrhg5H9cfjQxz2LDjSIcQOdjF2nuSgwA6B+dBztYn+BvnRmfjyIiA==
X-Received: by 2002:a17:902:e811:b0:186:8a61:ea76 with SMTP id u17-20020a170902e81100b001868a61ea76mr12836805plg.10.1667195726952;
        Sun, 30 Oct 2022 22:55:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 15/19] powerpc: allow minimum sized kernel stack frames
Date: Mon, 31 Oct 2022 15:54:36 +1000
Message-Id: <20221031055440.3594315-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
index b5defea32e75..20fdb84759f0 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2151,7 +2151,7 @@ int validate_sp_size(unsigned long sp, struct task_struct *p,
 
 int validate_sp(unsigned long sp, struct task_struct *p)
 {
-	return validate_sp(sp, p, STACK_FRAME_OVERHEAD);
+	return validate_sp(sp, p, STACK_FRAME_MIN_SIZE);
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

