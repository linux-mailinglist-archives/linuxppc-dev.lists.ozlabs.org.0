Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 979C461301C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:04:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12g23b72z3f5m
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:04:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RPi345XB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RPi345XB;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12S30VP3z3cBv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:14 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id 17so5554403pfv.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrnqkbxJ5S/2fsEj9nqhBEzQDP0Edmb8mbzDHTO8vos=;
        b=RPi345XBbRNMGO9ftRTGimmnLXp5ZkdnkY41bUEbU1+S+6V5zzjGUxt3QJE2r0MfkG
         UAB2PxiYJXEHXQq9AsroNCkWtR9T2/re9iIrHNQmYr4WjFSbUsq51hg8+aW6wHQ5DA36
         /Nfyviaqn2eKYcXTw4wwmTliKrB9nFFOt8lN4h9KNrIHGcGpC37CgB8EWuaqO0nq+y3u
         UOGDTdjfE9VMfyoYlqRbfkWNin5gDfyCTn0aHusxG2FLznZ06TFypVA0eOIGDF7jYyvv
         /CkzTRW0JNKILOEPFu7RW34aFF/X2KCA/tSGGJtBkPRZJU7bA6tHkoF5hx4n0wPaYtzX
         3NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrnqkbxJ5S/2fsEj9nqhBEzQDP0Edmb8mbzDHTO8vos=;
        b=4+BFlFQG+SptObnN5crHFx4N7gSRI9m9BERyNnYhglptlw3Yd6EOHFS6Nt9KL5fmhH
         Z5xKlhxo5ChPyVdinkBN5Rc/CVTL5iW7Ly6s/AN5ICXc2RLGjd0Ws8yhqfhem/+G26Yk
         64U0Dd24d5Ei8hhOVydfCw46xpDpEZwHS0KEzUvEpSeWeiDZfAxAM9UBreoDH3v7QWvM
         gLHWO38v+jHpFcjuAV9ERICAJAIgVpTSwGBpe27ROAMO/dc++BQpesb2q3YUndi0eCZA
         uJeFp9VWDmWaGhelxKxKY87jhFlD15A+mI4QmhREu853CepQZEt9tolbQf8/Yz/o73py
         fgcQ==
X-Gm-Message-State: ACrzQf2DhXXBEU0JL29DKmDVxwS7ZrRADybC7TiXCS8pIoEkRwOKAdHf
	GodmfLkref4fdO3yyu6jURv9DdqBWWA=
X-Google-Smtp-Source: AMsMyM4TcOVN6jEMvkk8ZO+l1nz0Y/AnJUFQNE4D3uTlSfqwbgJ/AnOFe3DngoZB2hIhm/yR+v9H1w==
X-Received: by 2002:a63:1e16:0:b0:430:5c4a:a3b5 with SMTP id e22-20020a631e16000000b004305c4aa3b5mr11570043pge.37.1667195712397;
        Sun, 30 Oct 2022 22:55:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 10/19] powerpc: add a define for the user interrupt frame size
Date: Mon, 31 Oct 2022 15:54:31 +1000
Message-Id: <20221031055440.3594315-11-npiggin@gmail.com>
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

The user interrupt frame is a different size from the kernel frame, so
give it its own name.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 6 +++---
 arch/powerpc/kernel/process.c     | 6 +++---
 arch/powerpc/kernel/stacktrace.c  | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index fdd50648df56..705ce26ae887 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -122,8 +122,7 @@ struct pt_regs
 
 #define STACK_FRAME_OVERHEAD	112	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	2	/* Location of LR in stack frame */
-#define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + \
-				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
 
@@ -143,7 +142,7 @@ struct pt_regs
 #define KERNEL_REDZONE_SIZE	0
 #define STACK_FRAME_OVERHEAD	16	/* size of minimum stack frame */
 #define STACK_FRAME_LR_SAVE	1	/* Location of LR in stack frame */
-#define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
+#define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 8)
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
@@ -153,6 +152,7 @@ struct pt_regs
 
 #endif /* __powerpc64__ */
 
+#define STACK_INT_FRAME_SIZE	(KERNEL_REDZONE_SIZE + STACK_USER_INT_FRAME_SIZE)
 #define STACK_INT_FRAME_MARKER_LONGS	(STACK_INT_FRAME_MARKER/sizeof(long))
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b0a9e5eeec4c..d6daf0d073b3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1727,15 +1727,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	klp_init_thread_info(p);
 
 	/* Create initial stack frame. */
-	sp -= (sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD);
+	sp -= STACK_USER_INT_FRAME_SIZE;
 	((unsigned long *)sp)[0] = 0;
 
 	/* Copy registers */
-	childregs = (struct pt_regs *)(sp + STACK_FRAME_OVERHEAD);
+	childregs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
 	if (unlikely(args->fn)) {
 		/* kernel thread */
 		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->gpr[1] = sp + (sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD);
+		childregs->gpr[1] = sp + STACK_USER_INT_FRAME_SIZE;
 		/* function */
 		if (args->fn)
 			childregs->gpr[14] = ppc_function_entry((void *)args->fn);
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 7efa0ec9dd77..453ac317a6cf 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -77,7 +77,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 		/*
 		 * For user tasks, this is the SP value loaded on
 		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and
-		 * system_call_common()/EXCEPTION_PROLOG_COMMON().
+		 * system_call_common().
 		 *
 		 * Likewise for non-swapper kernel threads,
 		 * this also happens to be the top of the stack
@@ -88,7 +88,7 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 		 * an unreliable stack trace until it's been
 		 * _switch()'ed to for the first time.
 		 */
-		stack_end -= STACK_FRAME_OVERHEAD + sizeof(struct pt_regs);
+		stack_end -= STACK_USER_INT_FRAME_SIZE;
 	} else {
 		/*
 		 * idle tasks have a custom stack layout,
-- 
2.37.2

