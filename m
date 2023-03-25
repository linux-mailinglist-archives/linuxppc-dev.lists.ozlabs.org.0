Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8C86C8E32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:32:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJPv6rj3z3fYB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:32:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aoYcE4ti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aoYcE4ti;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJKy1clVz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:26 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so7478392pjp.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZGIjktS5oEZc17NluB8C45p3bjbS565MX+Fvz0y5OY=;
        b=aoYcE4timUO6xXYZD231YpYwWVZoUNwLLZO+e3ckNts/crarGQjLTwOqnvEyCCn9Ca
         mZb4ZQ8xpQOBAdCe6I+onE9HVhPk8qAX0fWnxyqN0Ol8t0kCSCa3/OCpJr2EIDDg/8+B
         O0LE3DMaFqqfiLKhHR9iq35p3PCiW7yL6chEzDTwWyv6X9Yzc56aeeQhCeXSeoAYydF2
         L4A54xuHdTzzdeIaYgGeWg+9+/ji0BjPAi10n/g9mcfVwHj9JXGti/EF2fgGpo8DU8cZ
         X+e/p1BA3PkWuKlbGsV+jKbdoAAwXE7UEYJbLnQvG8OlTAgG442C1mkpBKnPAJHu4Vmq
         JE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZGIjktS5oEZc17NluB8C45p3bjbS565MX+Fvz0y5OY=;
        b=ZgzZ7s9XffDsFmtFUCTSQsK+K2CFZoQ36jocOlC+5tSPWUBy7pgffVc8THxPHty5YW
         t041DgB26a1Z8wcMUB6PVNW2x3JzSOMaHGceuePfH09fWXLJhrGsd9t3OxwiFMnTchbu
         JLTNkKkvDW+s8mSWCYKdcu57CN9wZrKjUNZ+/cuqCLiqGYKCFbW4GRtE0u88kUPvyqTJ
         KxvTx9WXnG1BotyRmd/FUk8m6iSgLDyFneaDSAsP0zkBROmh+e4LXQjOjMNCu8SNf5q4
         IWRynvM5+KhaNaWRS76GhG2yNPT2kWTcmro782J2auFUkTZakfIPEL3FbTsTuRikDSyw
         XArQ==
X-Gm-Message-State: AAQBX9eBpYJNNs4dsozGrSUxPyyd9aK0bhlnU3b5G3qK/n37EbKpXrPl
	iRszwVcSZ/Tco/ll5qlmPLh3XpeDOw8=
X-Google-Smtp-Source: AKy350ZDHBCQypp1kzowhH0GOHtpNe7BuSsQL2rqZhRshguYLTLwS7v5nBgznxlLgY10xut62JgnQA==
X-Received: by 2002:a17:90b:38d2:b0:23f:3b89:7f16 with SMTP id nn18-20020a17090b38d200b0023f3b897f16mr6395466pjb.0.1679747363516;
        Sat, 25 Mar 2023 05:29:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/8] powerpc: use switch frame for ret_from_kernel_thread parameters
Date: Sat, 25 Mar 2023 22:28:59 +1000
Message-Id: <20230325122904.2375060-4-npiggin@gmail.com>
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

The kernel thread path in copy_thread creates a user interrupt frame on
stack and stores the function and arg parameters there, and
ret_from_kernel_thread loads them. This is a slightly confusing way to
overload that frame. Non-volatile registers are loaded from the switch
frame, so the parameters can be stored there. The user interrupt frame
is now only used by user threads when they return to user.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S     |  1 -
 arch/powerpc/kernel/interrupt_64.S |  1 -
 arch/powerpc/kernel/process.c      | 13 +++++++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 755408c63be8..c3fdb3081d3d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -188,7 +188,6 @@ ret_from_fork:
 
 	.globl	ret_from_kernel_thread
 ret_from_kernel_thread:
-	REST_NVGPRS(r1)
 	bl	schedule_tail
 	mtctr	r14
 	mr	r3,r15
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index fccc34489add..d60e7e7564df 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -741,7 +741,6 @@ _GLOBAL(ret_from_fork)
 
 _GLOBAL(ret_from_kernel_thread)
 	bl	schedule_tail
-	REST_NVGPRS(r1)
 	mtctr	r14
 	mr	r3,r15
 #ifdef CONFIG_PPC64_ELF_ABI_V2
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 46e2c3f3a2e9..c537bebb5dd2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1765,14 +1765,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		((unsigned long *)sp)[0] = 0;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->gpr[1] = sp + STACK_USER_INT_FRAME_SIZE;
-		/* function */
-		if (args->fn)
-			childregs->gpr[14] = ppc_function_entry((void *)args->fn);
 #ifdef CONFIG_PPC64
 		clear_tsk_thread_flag(p, TIF_32BIT);
 		childregs->softe = IRQS_ENABLED;
 #endif
-		childregs->gpr[15] = (unsigned long)args->fn_arg;
 		p->thread.regs = NULL;	/* no user register state */
 		ti->flags |= _TIF_RESTOREALL;
 		f = ret_from_kernel_thread;
@@ -1811,6 +1807,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	((unsigned long *)sp)[0] = sp + STACK_SWITCH_FRAME_SIZE;
 	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
 	kregs->nip = ppc_function_entry(f);
+	if (unlikely(args->fn)) {
+		/*
+		 * Put kthread fn, arg parameters in non-volatile GPRs in the
+		 * switch frame so they are loaded by _switch before it returns
+		 * to ret_from_kernel_thread.
+		 */
+		kregs->gpr[14] = ppc_function_entry((void *)args->fn);
+		kregs->gpr[15] = (unsigned long)args->fn_arg;
+	}
 	p->thread.ksp = sp;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-- 
2.37.2

