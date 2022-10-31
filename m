Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA1613031
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12qS3L1cz3fV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l5lOXCgZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l5lOXCgZ;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SS5Hrqz3cKj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:36 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id v28so9627708pfi.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUbdon5hcb7banSkgotRnzFAwnNjg1+e7htOVrvvmAE=;
        b=l5lOXCgZSMP3vyAmABY0d6H+Sg9fWKqawmOHWqf3M0QcwlU488MQDoeTwpN0DwU2TD
         iQ9d/zbm7V8vXjV7ldbu4if409sZzaaoy7lnwNAAtlKnla8nbyFzAHvibdc/UmFKbJto
         Sdb5LzkTf0tlrOH9Olc5W32sC7Va8qTsgC39aDScawmxiYKapp7Q2krtEsQLTpr5MaHx
         NOJlfC60ps27xy0PYnPp/0p6YMforApTWpXmEFzAHJxuhf66Et6zoPYg0VMAIphXBAqQ
         uCF91JpjkxJ4OOeqRjhdGyLLZPGy04Nr6Y8UXAtwSRRgpIwSU+d1ifkvyDzi3y5j7Gtr
         i8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUbdon5hcb7banSkgotRnzFAwnNjg1+e7htOVrvvmAE=;
        b=H/ucVFdO5A6fgDRcSDf3SdisweaXDIHJabmxOe+NEB13cRakvYirRKxdMS+6blfc6w
         qiHWW7ZOd9O1gzK2KYvm7y9LLaEJa1gpzj05G6/uZKj55LYLY34s9WUtmar3kRE14rGf
         7xW3P097L6QRnuz1NpeDmblb2EjfaWtMTRgCznnRB/B6dG+Ezv8ah1f2/0WNuNVV+tE3
         DSTnluTAk1N6bDEQygMtuMppfQRFUyt+6TLroc9BstSGvjWEmkkKx11cvJz4qzKTGbP7
         3+2EQcT3aFuITz6DTG5tyAeYwr/imZBW7BV/NpQHBGxy77h1dHd82bj6WJE2oK3wPgcS
         p5jA==
X-Gm-Message-State: ACrzQf2zyusQjBJsLSMQcnHfXyS+XW45uWjWmYPUqU29R3eMj2w/tABS
	sAUUDsPMyJBWkyEEx9rP9EIKq/fdXjg=
X-Google-Smtp-Source: AMsMyM5g6Peqom6fFWxB8iwREY4J5WmwgU/cKv+wYUjAe22LPCkhCqF2USr+P2cQdudiNzT/D1ZFOQ==
X-Received: by 2002:a65:6cc8:0:b0:3fe:2b89:cc00 with SMTP id g8-20020a656cc8000000b003fe2b89cc00mr11370034pgw.599.1667195734617;
        Sun, 30 Oct 2022 22:55:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 18/19] powerpc: change stack marker memory operations to 32-bit
Date: Mon, 31 Oct 2022 15:54:39 +1000
Message-Id: <20221031055440.3594315-19-npiggin@gmail.com>
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

The marker is a 32-bit constant across all platforms now, so use 32-bit
memory accesses.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h    | 1 -
 arch/powerpc/kernel/exceptions-64e.S | 2 +-
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 arch/powerpc/kernel/interrupt_64.S   | 6 +++---
 arch/powerpc/kernel/process.c        | 6 +++---
 arch/powerpc/kernel/stacktrace.c     | 2 +-
 arch/powerpc/perf/callchain.c        | 2 +-
 7 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index a53c580388e2..ab41d47761c9 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -162,7 +162,6 @@ struct pt_regs
 #endif /* __powerpc64__ */
 
 #define STACK_INT_FRAME_SIZE	(KERNEL_REDZONE_SIZE + STACK_USER_INT_FRAME_SIZE)
-#define STACK_INT_FRAME_MARKER_LONGS	(STACK_INT_FRAME_MARKER/sizeof(long))
 
 #ifndef __ASSEMBLY__
 #include <asm/paca.h>
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d74c2a53af13..86cf656c6777 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -391,7 +391,7 @@ exc_##n##_common:							    \
 	std	r10,_CCR(r1);		/* store orig CR in stackframe */   \
 	std	r9,GPR1(r1);		/* store stack frame back link */   \
 	std	r11,SOFTE(r1);		/* and save it to stackframe */     \
-	std	r12,STACK_INT_FRAME_MARKER(r1); /* mark the frame */	    \
+	stw	r12,STACK_INT_FRAME_MARKER(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
 	std	r0,RESULT(r1);		/* clear regs->result */	    \
 	SAVE_NVGPRS(r1);
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 39f08ec56126..85bbdfa7e4d3 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -591,7 +591,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	li	r10,0
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
-	std	r11,STACK_INT_FRAME_MARKER(r1) /* mark the frame	*/
+	stw	r11,STACK_INT_FRAME_MARKER(r1) /* mark the frame	*/
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 2306b979e71f..ee8cfe17ca37 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -78,7 +78,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
-	std	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
+	stw	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
 	/* Calling convention has r3 = regs, r4 = orig r0 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
@@ -251,7 +251,7 @@ END_BTB_FLUSH_SECTION
 	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
-	std	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
+	stw	r11,STACK_INT_FRAME_MARKER(r1)		/* "regs" marker */
 	/* Calling convention has r3 = regs, r4 = orig r0 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	mr	r4,r0
@@ -628,7 +628,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	 * Leaving a stale STACK_FRAME_REGS_MARKER on the stack can confuse
 	 * the reliable stack unwinder later on. Clear it.
 	 */
-	std	r0,STACK_INT_FRAME_MARKER(r1)
+	stw	r0,STACK_INT_FRAME_MARKER(r1)
 
 	REST_GPRS(2, 5, r1)
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 20fdb84759f0..e447bf02f996 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1728,7 +1728,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	/* Create initial stack frame. */
 	sp -= STACK_USER_INT_FRAME_SIZE;
-	*(unsigned long *)(sp + STACK_INT_FRAME_MARKER) = STACK_FRAME_REGS_MARKER;
+	*(u32 *)(sp + STACK_INT_FRAME_MARKER) = STACK_FRAME_REGS_MARKER;
 
 	/* Copy registers */
 	childregs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
@@ -2246,8 +2246,8 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 		 * could hold a pt_regs, if that does not fit then it can't
 		 * have regs.
 		 */
-		if (validate_sp_size(sp, tsk, STACK_SWITCH_FRAME_SIZE)
-		    && stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
+		if (validate_sp_size(sp, tsk, STACK_SWITCH_FRAME_SIZE) &&
+		    *(u32 *)(sp + STACK_INT_FRAME_MARKER) == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_INT_FRAME_REGS);
 
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 5de8597eaab8..7d975943f5ec 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -136,7 +136,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 
 		/* Mark stacktraces with exception frames as unreliable. */
 		if (sp <= stack_end - STACK_INT_FRAME_SIZE &&
-		    stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
+		    *(u32 *)(sp + STACK_INT_FRAME_MARKER) == STACK_FRAME_REGS_MARKER) {
 			return -EINVAL;
 		}
 
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..72eef9accdbb 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -62,7 +62,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 
 		if (next_sp == sp + STACK_INT_FRAME_SIZE &&
 		    validate_sp_size(sp, current, STACK_INT_FRAME_SIZE) &&
-		    fp[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
+		    *(u32 *)(sp + STACK_INT_FRAME_MARKER) == STACK_FRAME_REGS_MARKER) {
 			/*
 			 * This looks like an interrupt frame for an
 			 * interrupt that occurred in the kernel
-- 
2.37.2

