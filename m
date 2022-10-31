Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEF613026
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12lF5XZGz3f3T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cH+8a/OD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cH+8a/OD;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SD613dz3c2g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:24 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id 17so5554673pfv.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GPBuQmYtjxa9j7Vp6IVObDl9xrxHYAjMeTDVRPBvB0=;
        b=cH+8a/OD8Dh9hTykWNIISYvXILbqCg7FB4HN5L50vCgV/fN2uMN631SwjWIUU8CAQU
         cWvXE5hNs6mX3Y0M7v3BvijtPcyBRiqgA79itUtmbCl1xOTI8CymToVZEBPJr4WdSiLc
         yPjwHfpN5O25LAFBgKPdx8qyeC1b1gpOc9o2bL2clu1aBX1NJ5mPJvj3RgY2T8ilfmDc
         220pFJNTomAyf1Nc4/w8YhCCUXf9++YFKPWVN1duxjvNPAfgsUQauB9x3HAtFljSmV2t
         GN28ZapzUNtQK1vgi9DPAjOk1nNwrHAIoFlMR5y6aNJIaIg+VwgQtC0qKFIG+xFc72A0
         HIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GPBuQmYtjxa9j7Vp6IVObDl9xrxHYAjMeTDVRPBvB0=;
        b=gqXOuZVm2HPtRfOXDByS1ftZHpbiDvZhH0OFxFzHs6QGkcDYpbDi7eC3VtTTivWBTM
         acfSbVWjmYrkfDxbYLuI2ulsQA7yCihtath3RWrx9AE7MkdJYz5/C4EWES+t5YwIhHJH
         3S/64FXNJ5oOMMkvvwId5yB4jcYLMdg1BOM/8ApceIYwhcx1W/k8Am3W/mu/50LN66TE
         iY39uF3hPOAisM0vW26unKeVYvJqf6b1WRrEFAr/QpDa4s+m/9wmQmuVWLUY3rCGLatr
         Af9W/2hKpd+IkfHGIL4bDtKYhVtBOhKL1JxvPQbX8S+2MqRCiMfH5/vnD2az0aFc8j5s
         D2kQ==
X-Gm-Message-State: ACrzQf33GJ7UARcFJj2s19czaxh6elpyQWS7frVGKkzX2UZALgSz49kE
	o+EnDEg7q8yxcON41VG1ngge30V+GWY=
X-Google-Smtp-Source: AMsMyM7kvInXot1LzbvnN3jK/BrpCii1vQY7cP5zmVUx4Et2IdDkegrMAdO7YbRhJJfvkcUkW//i3A==
X-Received: by 2002:a63:2bd4:0:b0:451:5df1:4b15 with SMTP id r203-20020a632bd4000000b004515df14b15mr11332937pgr.518.1667195723844;
        Sun, 30 Oct 2022 22:55:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 14/19] powerpc: split validate_sp into two functions
Date: Mon, 31 Oct 2022 15:54:35 +1000
Message-Id: <20221031055440.3594315-15-npiggin@gmail.com>
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

Most callers just want to validate an arbitrary kernel stack pointer,
some need a particular size. Make the size case the exceptional one
with an extra function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/processor.h | 15 ++++++++++++---
 arch/powerpc/kernel/process.c        | 23 ++++++++++++++---------
 arch/powerpc/kernel/stacktrace.c     |  2 +-
 arch/powerpc/perf/callchain.c        |  6 +++---
 4 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 631802999d59..e96c9b8c2a60 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -374,9 +374,18 @@ static inline unsigned long __pack_fe01(unsigned int fpmode)
 
 #endif
 
-/* Check that a certain kernel stack pointer is valid in task_struct p */
-int validate_sp(unsigned long sp, struct task_struct *p,
-                       unsigned long nbytes);
+/*
+ * Check that a certain kernel stack pointer is a valid (minimum sized)
+ * stack frame in task_struct p.
+ */
+int validate_sp(unsigned long sp, struct task_struct *p);
+
+/*
+ * validate the stack frame of a particular minimum size, used for when we are
+ * looking at a certain object in the stack beyond the minimum.
+ */
+int validate_sp_size(unsigned long sp, struct task_struct *p,
+		     unsigned long nbytes);
 
 /*
  * Prefetch macros.
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 6cb3982a11ef..b5defea32e75 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2128,9 +2128,12 @@ static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
 	return 0;
 }
 
-
-int validate_sp(unsigned long sp, struct task_struct *p,
-		       unsigned long nbytes)
+/*
+ * validate the stack frame of a particular minimum size, used for when we are
+ * looking at a certain object in the stack beyond the minimum.
+ */
+int validate_sp_size(unsigned long sp, struct task_struct *p,
+		     unsigned long nbytes)
 {
 	unsigned long stack_page = (unsigned long)task_stack_page(p);
 
@@ -2146,7 +2149,10 @@ int validate_sp(unsigned long sp, struct task_struct *p,
 	return valid_emergency_stack(sp, p, nbytes);
 }
 
-EXPORT_SYMBOL(validate_sp);
+int validate_sp(unsigned long sp, struct task_struct *p)
+{
+	return validate_sp(sp, p, STACK_FRAME_OVERHEAD);
+}
 
 static unsigned long ___get_wchan(struct task_struct *p)
 {
@@ -2154,13 +2160,12 @@ static unsigned long ___get_wchan(struct task_struct *p)
 	int count = 0;
 
 	sp = p->thread.ksp;
-	if (!validate_sp(sp, p, STACK_FRAME_OVERHEAD))
+	if (!validate_sp(sp, p))
 		return 0;
 
 	do {
 		sp = READ_ONCE_NOCHECK(*(unsigned long *)sp);
-		if (!validate_sp(sp, p, STACK_FRAME_OVERHEAD) ||
-		    task_is_running(p))
+		if (!validate_sp(sp, p) || task_is_running(p))
 			return 0;
 		if (count > 0) {
 			ip = READ_ONCE_NOCHECK(((unsigned long *)sp)[STACK_FRAME_LR_SAVE]);
@@ -2214,7 +2219,7 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 	lr = 0;
 	printk("%sCall Trace:\n", loglvl);
 	do {
-		if (!validate_sp(sp, tsk, STACK_FRAME_OVERHEAD))
+		if (!validate_sp(sp, tsk))
 			break;
 
 		stack = (unsigned long *) sp;
@@ -2241,7 +2246,7 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 		 * could hold a pt_regs, if that does not fit then it can't
 		 * have regs.
 		 */
-		if (validate_sp(sp, tsk, STACK_SWITCH_FRAME_SIZE)
+		if (validate_sp_size(sp, tsk, STACK_SWITCH_FRAME_SIZE)
 		    && stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_INT_FRAME_REGS);
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 453ac317a6cf..1dbbf30f265e 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -43,7 +43,7 @@ void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry,
 		unsigned long *stack = (unsigned long *) sp;
 		unsigned long newsp, ip;
 
-		if (!validate_sp(sp, task, STACK_FRAME_OVERHEAD))
+		if (!validate_sp(sp, task))
 			return;
 
 		newsp = stack[0];
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index b01497ed5173..6b4434dd0ff3 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -27,7 +27,7 @@ static int valid_next_sp(unsigned long sp, unsigned long prev_sp)
 {
 	if (sp & 0xf)
 		return 0;		/* must be 16-byte aligned */
-	if (!validate_sp(sp, current, STACK_FRAME_OVERHEAD))
+	if (!validate_sp(sp, current))
 		return 0;
 	if (sp >= prev_sp + STACK_FRAME_MIN_SIZE)
 		return 1;
@@ -53,7 +53,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	sp = regs->gpr[1];
 	perf_callchain_store(entry, perf_instruction_pointer(regs));
 
-	if (!validate_sp(sp, current, STACK_FRAME_OVERHEAD))
+	if (!validate_sp(sp, current))
 		return;
 
 	for (;;) {
@@ -61,7 +61,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 		next_sp = fp[0];
 
 		if (next_sp == sp + STACK_INT_FRAME_SIZE &&
-		    validate_sp(sp, current, STACK_INT_FRAME_SIZE) &&
+		    validate_sp_size(sp, current, STACK_INT_FRAME_SIZE) &&
 		    fp[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			/*
 			 * This looks like an interrupt frame for an
-- 
2.37.2

