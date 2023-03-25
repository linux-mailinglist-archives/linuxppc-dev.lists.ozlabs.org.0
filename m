Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A06C8E36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJS51Gkzz3fVv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:34:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E8fvuzyZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E8fvuzyZ;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJL25PXNz3chX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:30 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id o2so4189212plg.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2A9do+TSYK9KAEttZVaT+GeggOEBYv8Hp/gahNDOw0=;
        b=E8fvuzyZhHLXSoJacm+adZ/pH99DQVqr5XJQBgjOYgzul4KUo4we57tIosxO6LGtRB
         Lv1HFPSoQ7Otzruuxr1c9W9Nlw9KwxD3/+0KLjVKk7931xIqgKNXzYjL6+1eUUR5IMLJ
         6goauAaJsiYIujEcz6wimDNoJ+uPje8cl+lJQsLQeexSrEIexEV3vOSP6Sqc1RNAKrFC
         jgiTncRgn2iWLYVGv5ldf+sZaDGSsNrVeaM0mbgYcxBnEXzn4tygYgzACZIgmuFEWWia
         lHZ5CVyglOrymdTJC+cW2noEN0F866nJ5znzDNU4rY8gELnG/wGFV+gxLql6jgO+aiKZ
         8uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2A9do+TSYK9KAEttZVaT+GeggOEBYv8Hp/gahNDOw0=;
        b=6R4pRp/1ikktZnsGrf7NBYSrZxtwD6ad8052jVRXNZbx5+kMfraXuOy8CpvUEjLyo2
         aguxp8W3jjMhxP6nU8N7kYUcRBKNQjlz5s3nguXricE4KnM0EO2soS1HBjQ4aKt6eUew
         0j3FSPse6Hc/5pohuWcMvx7Kp02mpqVsAylx3oIbulncVUBCQH4MWm7xWbmf403RTHwm
         5dY1Tw87DfX90qpxTY6/MvELFJ22gJ3oIZAQsVJXZV5PSJgFlYfQIo93QtMDtkwIXELY
         cNSros1sLGg3V0C5qaB1MsyVBBME2wnk3MzpUvlXLw9FoZXQyOj97t5QQfJOAltb9QFu
         qHtw==
X-Gm-Message-State: AAQBX9cxrbKvwLMMaLadJ3RGCIFPwkyHBJlhNF8DW0EoPeCRtCUP6was
	6t+PMN9LlAAT/cf1Go1QLd9sZNyUX0g=
X-Google-Smtp-Source: AKy350aXravIVA1fvnI+LAFAWeKwtIz2DdQFFY6MeRVCksG83QfD+yJqWdusja/7CXejR41zrHYFqw==
X-Received: by 2002:a17:90b:38cf:b0:233:feb4:895f with SMTP id nn15-20020a17090b38cf00b00233feb4895fmr6231969pjb.44.1679747367977;
        Sat, 25 Mar 2023 05:29:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/8] powerpc: copy_thread differentiate kthreads and user mode threads
Date: Sat, 25 Mar 2023 22:29:01 +1000
Message-Id: <20230325122904.2375060-6-npiggin@gmail.com>
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

When copy_thread is given a kernel function to run in arg->fn, this
does not necessarily mean it is a kernel thread. User threads can be
created this way (e.g., kernel_init, see also x86's copy_thread()).
These threads run a kernel function which may call kernel_execve()
and return, which returns like a userspace exec(2) syscall.

Kernel threads are to  be differentiated with PF_KTHREAD, will always
have arg->fn set, and should never return from that function, instead
calling kthread_exit() to exit.

Create separate paths for the kthread and user kernel thread creation
logic. The kthread path will never exit and does not require a user
interrupt frame, so it gets a minimal stack frame.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/thread_info.h |  2 +
 arch/powerpc/kernel/process.c          | 98 ++++++++++++++++----------
 2 files changed, 64 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index af58f1ed3952..6c9e70402922 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -175,9 +175,11 @@ static inline bool test_thread_local_flags(unsigned int flags)
 #ifdef CONFIG_COMPAT
 #define is_32bit_task()	(test_thread_flag(TIF_32BIT))
 #define is_tsk_32bit_task(tsk)	(test_tsk_thread_flag(tsk, TIF_32BIT))
+#define clear_tsk_compat_task(tsk) (clear_tsk_thread_flag(p, TIF_32BIT))
 #else
 #define is_32bit_task()	(IS_ENABLED(CONFIG_PPC32))
 #define is_tsk_32bit_task(tsk)	(IS_ENABLED(CONFIG_PPC32))
+#define clear_tsk_compat_task(tsk) do { } while (0)
 #endif
 
 #if defined(CONFIG_PPC64)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index c537bebb5dd2..7b016f958e8b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1738,10 +1738,7 @@ static void setup_ksp_vsid(struct task_struct *p, unsigned long sp)
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
@@ -1754,45 +1751,76 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
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
-#ifdef CONFIG_PPC64
-		clear_tsk_thread_flag(p, TIF_32BIT);
-		childregs->softe = IRQS_ENABLED;
-#endif
-		p->thread.regs = NULL;	/* no user register state */
-		ti->flags |= _TIF_RESTOREALL;
+
 		f = ret_from_kernel_thread;
+		p->thread.regs = NULL;	/* no user register state */
+		clear_tsk_compat_task(p);
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
+			 * execve rather than fork, so user regs will be
+			 * filled in (e.g., by kernel_execve()).
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
@@ -1843,8 +1871,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.dscr_inherit = current->thread.dscr_inherit;
 		p->thread.dscr = mfspr(SPRN_DSCR);
 	}
-	if (cpu_has_feature(CPU_FTR_HAS_PPR))
-		childregs->ppr = DEFAULT_PPR;
 
 	p->thread.tidr = 0;
 #endif
-- 
2.37.2

