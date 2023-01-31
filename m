Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622F683333
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rsp0GpTz3f3b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=klPjQin1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=klPjQin1;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rlx1Jnsz3cYd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:56 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id m13so3801379plx.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzr35HrrqOSBWAxdxT1MsNRn5/azWkwgTm9ZHnsTKWI=;
        b=klPjQin1EF74+MHDjg5BIxoKEHx1xFZzyrWDYw+LPX+vse0rJtzTICSdT6h4i52T2t
         oZj3xNk2zSrOepC/YXqlXaseN5gxPd04wGcGT/3CntsXizqlxd8qjcMZogit7N44KuCu
         Hzu5rbEKBub6+4+7nO9/miMLI8XE78XeicILlkSawWkH/lVAXYEDcpsZe/t/X4yZwstC
         stjpGI31CCRjN+YURQW6/IuWDFIj6b3CVKIxtu3lkrTe65eJuypd8zT6UJ0HgDMW7qkT
         cXkYN5CkjCs9sc2yvFczPQsZ9rzGsCVl+YiUeXoVGbSXRhzTsArqN/LOd0qAip75MToH
         PbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzr35HrrqOSBWAxdxT1MsNRn5/azWkwgTm9ZHnsTKWI=;
        b=x91UI+ZAV2CE959Q+APLLqlC/sHhFFaAYurdbNE7mTSLy6AY4HzGzeJkHpxVz/VrNq
         6+t4PogH8YWB7Zj9YEGgrwSl9MEvA27xMYbahcdULYG1fefOrS4bxZyeBivBKCUIKjb0
         AixcivIYQIZip3fVpe4F3vVX7gd4nmdmlxNVKB7zbSwpK1NlbcJaCXVJnJEQw3A6XGO5
         IckIK1AbtaPAjzQiRzHlVoimtcs6XrrT2HD0nULqM4BMiIOTlcFo651ejFl8EjZ1P4t0
         267rvpsbLF7T7XqmskoC1RM79EyNZyYOM+jLzfPaesRINX2gqY0RDPaDPNWcMhK/Hd13
         9lsw==
X-Gm-Message-State: AO0yUKVsCp06ebXjK/5GR64InGmP1PiMPxl6/tnV+GOwsTcdFEMUjZ/5
	fBm1+zKtq6J3J8RgoYJSPB8MYImh8Ss=
X-Google-Smtp-Source: AK7set/84nVfYbeazK0JFrMMyACRXXHqpPx2A6PTSd1L6+tNa/uoPP5oxSl54lEM8LXhVHac7xMWmw==
X-Received: by 2002:a17:90a:1da:b0:22b:e2ef:6845 with SMTP id 26-20020a17090a01da00b0022be2ef6845mr31806396pjd.41.1675184154510;
        Tue, 31 Jan 2023 08:55:54 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/8] powerpc: copy_thread differentiate kthreads and user mode threads
Date: Wed,  1 Feb 2023 02:55:31 +1000
Message-Id: <20230131165534.601490-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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

When copy_thread is given a kernel function to run in arg->fn, this does
not necessarily mean it is a kernel thread. User threads can be created
this way (e.g., kernel_init, see also x86's copy_thread). These user
threads run a kernel function which may kernel_execve and return, which
then returns like a userspace exec syscall. Kernel threads can be
differentiated by PF_KTHREAD, will always have arg->fn set, and should
never return from that function, but call kthread_exit() to exit.

Create separate paths for the kthread and user kernel thread creation
logic. The kthread path will never exit and does not require a user
interrupt frame, so it gets a minimal stack frame.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 99 +++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 6cea224b7e60..82aad157c5f6 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1739,10 +1739,7 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
  */
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
-	unsigned long clone_flags = args->flags;
-	unsigned long usp = args->stack;
-	unsigned long tls = args->tls;
-	struct pt_regs *childregs, *kregs;
+	struct pt_regs *kregs; /* Switch frame regs */
 	extern void ret_from_fork(void);
 	extern void ret_from_fork_scv(void);
 	extern void ret_from_kernel_thread(void);
@@ -1755,49 +1752,77 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	klp_init_thread_info(p);
 
-	/* Create initial stack frame. */
-	sp -= STACK_USER_INT_FRAME_SIZE;
-	*(unsigned long *)(sp + STACK_INT_FRAME_MARKER) = STACK_FRAME_REGS_MARKER;
-
-	/* Copy registers */
-	childregs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
-	if (unlikely(args->fn)) {
+	if (unlikely(p->flags & PF_KTHREAD)) {
 		/* kernel thread */
+
+		/* Create initial minimum stack frame. */
+		sp -= STACK_FRAME_MIN_SIZE;
 		((unsigned long *)sp)[0] = 0;
-		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->gpr[1] = sp + STACK_USER_INT_FRAME_SIZE;
-		/* function */
-		if (args->fn)
-			childregs->gpr[14] = ppc_function_entry((void *)args->fn);
+
+		f = ret_from_kernel_thread;
+		p->thread.regs = NULL;	/* no user register state */
 #ifdef CONFIG_PPC64
 		clear_tsk_thread_flag(p, TIF_32BIT);
-		childregs->softe = IRQS_ENABLED;
 #endif
-		childregs->gpr[15] = (unsigned long)args->fn_arg;
-		p->thread.regs = NULL;	/* no user register state */
-		ti->flags |= _TIF_RESTOREALL;
-		f = ret_from_kernel_thread;
 	} else {
 		/* user thread */
-		struct pt_regs *regs = current_pt_regs();
-		*childregs = *regs;
-		if (usp)
-			childregs->gpr[1] = usp;
-		((unsigned long *)sp)[0] = childregs->gpr[1];
-		p->thread.regs = childregs;
-		if (clone_flags & CLONE_SETTLS) {
-			if (!is_32bit_task())
-				childregs->gpr[13] = tls;
+		struct pt_regs *childregs;
+
+		/* Create initial user return stack frame. */
+		sp -= STACK_USER_INT_FRAME_SIZE;
+		*(unsigned long *)(sp + STACK_INT_FRAME_MARKER) = STACK_FRAME_REGS_MARKER;
+
+		childregs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
+
+		if (unlikely(args->fn)) {
+			/*
+			 * A user space thread, but it first runs a kernel
+			 * thread, and then returns as though it had called
+			 * execve rather than fork.
+			 */
+			((unsigned long *)sp)[0] = 0;
+			memset(childregs, 0, sizeof(struct pt_regs));
+#ifdef CONFIG_PPC64
+			childregs->softe = IRQS_ENABLED;
+#endif
+			ti->flags |= _TIF_RESTOREALL;
+			f = ret_from_kernel_thread;
+		} else {
+			struct pt_regs *regs = current_pt_regs();
+			unsigned long clone_flags = args->flags;
+			unsigned long usp = args->stack;
+
+			/* Copy registers */
+			*childregs = *regs;
+			if (usp)
+				childregs->gpr[1] = usp;
+			((unsigned long *)sp)[0] = childregs->gpr[1];
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+			WARN_ON_ONCE(childregs->softe != IRQS_ENABLED);
+#endif
+			if (clone_flags & CLONE_SETTLS) {
+				unsigned long tls = args->tls;
+
+				if (!is_32bit_task())
+					childregs->gpr[13] = tls;
+				else
+					childregs->gpr[2] = tls;
+			}
+
+			if (trap_is_scv(regs))
+				f = ret_from_fork_scv;
 			else
-				childregs->gpr[2] = tls;
+				f = ret_from_fork;
 		}
 
-		if (trap_is_scv(regs))
-			f = ret_from_fork_scv;
-		else
-			f = ret_from_fork;
+#ifdef CONFIG_PPC64
+		if (cpu_has_feature(CPU_FTR_HAS_PPR))
+			childregs->ppr = DEFAULT_PPR;
+#endif
+
+		childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
+		p->thread.regs = childregs;
 	}
-	childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
 
 	/*
 	 * The way this works is that at some point in the future
@@ -1848,8 +1873,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.dscr_inherit = current->thread.dscr_inherit;
 		p->thread.dscr = mfspr(SPRN_DSCR);
 	}
-	if (cpu_has_feature(CPU_FTR_HAS_PPR))
-		childregs->ppr = DEFAULT_PPR;
 
 	p->thread.tidr = 0;
 #endif
-- 
2.37.2

