Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F48639ABB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpbW3JbTz3fFR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:59:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GOM4xFNK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GOM4xFNK;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNS0yNHz3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:15 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id y4so7793550plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrnqkbxJ5S/2fsEj9nqhBEzQDP0Edmb8mbzDHTO8vos=;
        b=GOM4xFNKkkP4FMh5YJg9S8hZqLpsRCxb/6KFIgc5S4wuBc+qi4Dwgn06aF+9YjU+pf
         b+nZztP0oLiwsg28zFjR/gRoT3PKJbM5ewjfsg4zwCYrozf1+nZ7Q3i7LvAgUHhmxBz9
         VmE6wLgtJKkyJmqOo7en/V/3wjYwgTU9Axn0vRByn5K9rmODJXHvpSK7jdnaUkHWrLUo
         faYlt3ZbkeoARVc1VtMHE5YO4cjh+Bf24QV6yjcKM0R/9R9uf9+pDf121w1KD79QyA7c
         81pTpisivVmvUMD7yzZW2E0BPXtgEe9ZLhrq67v/64ahnMA7FT2cdHZD9pLrdRQt8GoR
         7yHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrnqkbxJ5S/2fsEj9nqhBEzQDP0Edmb8mbzDHTO8vos=;
        b=rFrIk8HLjVwe5GQu46ScAhzP1IYGW41FWXOfBiK05OxwUHKwIqEnpsTiq3cXs+29yK
         ECAAueQosl5HqXJ0t4XMXedfxvrbtjLL5VaPOg2IAVgf2PYnlXoOu0SL0nbCSGBdGHd1
         r4ifoEwdekdT1Mjgs1+gZ0KYWdFGKTrLKXDsBCxtST45n6Ka00hcIuOTnPFFa8DD5Ssd
         3JYi16kCEftkjoKBqT4Ej3Qcm+0YugiR5sJAvJL8MHNUO2n1vTrTYDLB4n9NkDHs+nH+
         So6z5IivcOFRSX7WqU+WVmFEHTvci0E/VwmwKLG1xzV3TqaBXb6SH+1msCC1xd8rk/sH
         XJMg==
X-Gm-Message-State: ANoB5plnV+VI7aPvdZ+TfkZ+Atr07je6accuIFwlYm6lbML1DMJ/YMLS
	/AgXHQGUddNl1ttSw6/RBKg3jqrvi+5rnQ==
X-Google-Smtp-Source: AA0mqf6kcWj/aLvVRYA9jxbaGOgt1igZbV8EAO4OdZPupcq3FaA+bUD4gjEXRv6CVCY+uP1y72vvIg==
X-Received: by 2002:a17:90b:e18:b0:219:31ed:22be with SMTP id ge24-20020a17090b0e1800b0021931ed22bemr1604052pjb.75.1669553413415;
        Sun, 27 Nov 2022 04:50:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/17] powerpc: add a define for the user interrupt frame size
Date: Sun, 27 Nov 2022 22:49:35 +1000
Message-Id: <20221127124942.1665522-11-npiggin@gmail.com>
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

