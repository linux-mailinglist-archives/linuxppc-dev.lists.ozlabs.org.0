Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB96C8E3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:35:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJT55zXxz3fcb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:35:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R5Jc62zu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R5Jc62zu;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJL51Db3z3fS1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:32 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso4043220pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB2OFPDjoM6aB2FqnFtvEQ73ZNAfekYDKZqddNso9qU=;
        b=R5Jc62zudyp3aHQoUJegsrIL7fSTV0Ewz2ouuWjOqPJThl/k1uvQr/sxEZwm5/F2qp
         6ErxQ2ImJTo5exdbSySP7AtQt+K+Mylnlh/5xi3jBJxbYEvoRxYURjpWbaUit5XPLxu1
         vT78myJkdsZUvZbWPTwcrfKZK1QdOuwDLQRVWdQxal6mrf33zet+tvKB4GG54j/4vJpG
         mYnsIn1ipODrMECt/VRZU5HiOKlFZBAKQBStP9zOuFUiPBJnhAKkjudWQz/H4vAgV7Ey
         L2JChpG/OLR375LWTxEuGKqptvDK/0Qlg+ODzoU6w25+XGpuopC9znbPkjUUitRWkMNd
         mdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB2OFPDjoM6aB2FqnFtvEQ73ZNAfekYDKZqddNso9qU=;
        b=dWW+gWiT991dbAW2n1k/9nl7ZUwbvf180jAFiILjYP26jJ0xwD+ubcCvuhuMzyEbh3
         BOvjJxG9EtLmfMW9S+iGfN0RW6ov9Iws943epCieZeJNIaG3sHL6tEPzA4ywiXmh3EGh
         MczbsA0G3wN/9fbgDRHlQWCfJFIBXGzShlN8p9OXssxPP5A12NS9QDZou8slidNW5W4L
         KOFIO5WfKqDQAoeflTLeISNJrrJeMgZCeBGsp5qquFKF/9opzEozj7PXzZUItNb6ddnK
         NxyxG3nPhqzy+gBMlheBGFVEZ//vwDicexu85yY7bQr6qrjfLdIH5nVny18+oURu9RxY
         lDTA==
X-Gm-Message-State: AO0yUKUkPLZCD+FVRC/64uDr5ZdVtxblOXsA3gmg+CWsPkcXEJfiP2hq
	peWq81Eknl4Xpo1S+XNscVM0aqyUkZ0=
X-Google-Smtp-Source: AK7set+z6uTn2YYmtBDl96i/ttsUszSeWmDNIJyGIxgqKUfLMjDLg48ic4CDL6vJxf8O9DIgDgqssw==
X-Received: by 2002:a05:6a20:9305:b0:d8:cfcc:555d with SMTP id r5-20020a056a20930500b000d8cfcc555dmr5328499pzh.17.1679747370219;
        Sat, 25 Mar 2023 05:29:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/8] powerpc: differentiate kthread from user kernel thread start
Date: Sat, 25 Mar 2023 22:29:02 +1000
Message-Id: <20230325122904.2375060-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325122904.2375060-1-npiggin@gmail.com>
References: <20230325122904.2375060-1-npiggin@gmail.com>
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

Kernel created user threads start similarly to kernel threads in that
they call a kernel function after first returning from _switch, so
they share ret_from_kernel_thread for this. Kernel threads never return
from that function though, whereas user threads often do (although some
don't, e.g., IO threads).

Split these startup functions in two, and catch kernel threads that
improperly return from their function. This is intended to make the
complicated code a little bit easier to understand.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S     | 20 ++++++++++++++++++--
 arch/powerpc/kernel/interrupt_64.S | 18 +++++++++++++++++-
 arch/powerpc/kernel/process.c      |  7 ++++---
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index c3fdb3081d3d..47f0dd9a45ad 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -186,8 +186,8 @@ ret_from_fork:
 	li	r3,0	/* fork() return value */
 	b	ret_from_syscall
 
-	.globl	ret_from_kernel_thread
-ret_from_kernel_thread:
+	.globl	ret_from_kernel_user_thread
+ret_from_kernel_user_thread:
 	bl	schedule_tail
 	mtctr	r14
 	mr	r3,r15
@@ -196,6 +196,22 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
+	.globl	start_kernel_thread
+start_kernel_thread:
+	bl	schedule_tail
+	mtctr	r14
+	mr	r3,r15
+	PPC440EP_ERR42
+	bctrl
+	/*
+	 * This must not return. We actually want to BUG here, not WARN,
+	 * because BUG will exit the process which is what the kernel thread
+	 * should have done, which may give some hope of continuing.
+	 */
+100:	trap
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,0
+
+
 /*
  * This routine switches between two different tasks.  The process
  * state of one is saved on its kernel stack.  Then the state
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index bac1f89501ac..a44c8aab63ec 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -739,7 +739,7 @@ _GLOBAL(ret_from_fork)
 	li	r3,0	/* fork() return value */
 	b	.Lsyscall_exit
 
-_GLOBAL(ret_from_kernel_thread)
+_GLOBAL(ret_from_kernel_user_thread)
 	bl	schedule_tail
 	mtctr	r14
 	mr	r3,r15
@@ -749,3 +749,19 @@ _GLOBAL(ret_from_kernel_thread)
 	bctrl
 	li	r3,0
 	b	.Lsyscall_exit
+
+_GLOBAL(start_kernel_thread)
+	bl	schedule_tail
+	mtctr	r14
+	mr	r3,r15
+#ifdef CONFIG_PPC64_ELF_ABI_V2
+	mr	r12,r14
+#endif
+	bctrl
+	/*
+	 * This must not return. We actually want to BUG here, not WARN,
+	 * because BUG will exit the process which is what the kernel thread
+	 * should have done, which may give some hope of continuing.
+	 */
+100:	trap
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,0
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 7b016f958e8b..307639948691 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1741,7 +1741,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	struct pt_regs *kregs; /* Switch frame regs */
 	extern void ret_from_fork(void);
 	extern void ret_from_fork_scv(void);
-	extern void ret_from_kernel_thread(void);
+	extern void ret_from_kernel_user_thread(void);
+	extern void start_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 	struct thread_info *ti = task_thread_info(p);
@@ -1758,7 +1759,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		sp -= STACK_FRAME_MIN_SIZE;
 		((unsigned long *)sp)[0] = 0;
 
-		f = ret_from_kernel_thread;
+		f = start_kernel_thread;
 		p->thread.regs = NULL;	/* no user register state */
 		clear_tsk_compat_task(p);
 	} else {
@@ -1784,7 +1785,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			childregs->softe = IRQS_ENABLED;
 #endif
 			ti->flags |= _TIF_RESTOREALL;
-			f = ret_from_kernel_thread;
+			f = ret_from_kernel_user_thread;
 		} else {
 			struct pt_regs *regs = current_pt_regs();
 			unsigned long clone_flags = args->flags;
-- 
2.37.2

