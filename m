Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B0D68333E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:01:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rtp5lrsz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:01:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mGeiLRRy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mGeiLRRy;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rlx4xdGz3ccq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:57 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so1435348pjq.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzlUO/iIGu/f/w3nE4/a7M6akCNoHwRlGBbDvHNWpKE=;
        b=mGeiLRRywuyTPItbaaBd75hTGqRSW/UZJ30Dr+W1vGADUk0ApsY/W0s4vFSgQhN3wU
         JoTih0aQN9ZkWWtqSEMFH+MHiGhQ8tQzocjv6Fovt/TiXFBNHLZ1t24N9G1y3V1a0w+y
         63c6FP5sQO0Gd20wGXzxFpxn5ZZWJSwR5wxSO0ILh6ZU/JMsXn7fzfmGoXh3piI0tbIP
         vBPJ9cJWs8gMIQaV98nOLRZ43rBsRmDTtJb51LP/QZ80PqJ/WQlvWy2vI96hNmBcjV87
         TxvZ9pkihV6nQVn+9O1xUz5o7IP0NBFFhJuS7v78x7753Y0HewdTjXH8CtdtKak8JEGo
         8Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzlUO/iIGu/f/w3nE4/a7M6akCNoHwRlGBbDvHNWpKE=;
        b=8QPhOe+ufdB7Vkz4Ls7oFWRGN0w5Xpv/RjoHr299uqaGoodYv56eA9OaTK4eNTd29M
         Wj6xHk/gmvMTSoWnftWumy+/ubxv14wGeFPNB1Ez64o5CRDIrxxhjawjs5riwJVQxyhz
         0Kqd85OFgDBR5B4pbNG1sEfbtNHR+1cSKXgFM1/LqpwLFzzoQowVlUi+zARxZjfH5nJ2
         PcpMCipeX4c8o6RAMj6490kTuwIHVPObTkXayKwyt6Ez2QvjpQ/LzxlNn2/1+mK7yO2Q
         REF44UPu/5o1fZIFD0HOljWyBZ/sMF34aRl5b0uwWu1oaeHrlDtJCCbC5DjMM44bAPy7
         qTiQ==
X-Gm-Message-State: AO0yUKVGz6zVUs5w9qqNzlT+xpnohC9SsRbdHqJIysdnelZdShcGAkZD
	kK2GSPrY5SVNM6YEJfSxMwwtqCAK+cE=
X-Google-Smtp-Source: AK7set8kFp4GXhF3fQ37oMmJTMHErgOpYDsRH8w4LFQ1UpSJYZdZsolmZAkxtEnwLPVoT0fiFMUekQ==
X-Received: by 2002:a17:90b:3141:b0:22c:b1c5:ae87 with SMTP id ip1-20020a17090b314100b0022cb1c5ae87mr7053004pjb.45.1675184156881;
        Tue, 31 Jan 2023 08:55:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] powerpc: differentiate kthread from user kernel thread start
Date: Wed,  1 Feb 2023 02:55:32 +1000
Message-Id: <20230131165534.601490-7-npiggin@gmail.com>
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

Kernel created user threads start similarly to kernel threads in that
they call a kernel function after first returning from _switch, so they
share ret_from_kernel_thread for this. Kernel threads never return from
that function though, whereas user threads often do (although some
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
index c3fdb3081d3d..c33ac0b454dc 100644
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
index bac1f89501ac..90370b89905b 100644
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
index 82aad157c5f6..53215cdb19dd 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1742,7 +1742,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	struct pt_regs *kregs; /* Switch frame regs */
 	extern void ret_from_fork(void);
 	extern void ret_from_fork_scv(void);
-	extern void ret_from_kernel_thread(void);
+	extern void ret_from_kernel_user_thread(void);
+	extern void start_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 	struct thread_info *ti = task_thread_info(p);
@@ -1759,7 +1760,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		sp -= STACK_FRAME_MIN_SIZE;
 		((unsigned long *)sp)[0] = 0;
 
-		f = ret_from_kernel_thread;
+		f = start_kernel_thread;
 		p->thread.regs = NULL;	/* no user register state */
 #ifdef CONFIG_PPC64
 		clear_tsk_thread_flag(p, TIF_32BIT);
@@ -1786,7 +1787,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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

