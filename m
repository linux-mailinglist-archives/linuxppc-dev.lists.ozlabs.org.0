Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC6639AC3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:03:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpgh6QFfz3fC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:03:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DdzJ9fY/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DdzJ9fY/;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNd3912z3f3Y
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:25 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id v3so7648050pgh.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvIGD2m1L4RbhSq+kD/Yyum0ENbCwI3WlJ1O1AI1zmI=;
        b=DdzJ9fY/7PUO8jIauYLgb3xiTo09RWLEIQav9s9cHPNSiLCBiRL93LPh70pT/Fo1DX
         HICnok1FWmJtDZNfoB/AE3CEiOWav3w4bhj1DKeWge6ZpdUhOrpvzoXjMycjhjI5ddyo
         JTBSbboHSNALVBZ/Jl7QWpjlbPkxdFv1PUSHCrrjw4jb+gjrw+YM9DEeQRynYwhA4RF1
         2pGQYv75W3MgNexiwMyElbsK00Y2rvQdIkOk/QaE4lY7M3K6CLu0TcdOPvX0HKxnEVg3
         qDZ+jJZQxOryx8pDm1YuKL97nLTvAcg5u24QbDtL/uzLxPhad80B9KmWjr39d3UGV00M
         llmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvIGD2m1L4RbhSq+kD/Yyum0ENbCwI3WlJ1O1AI1zmI=;
        b=yFsUkqJErmKmdeBoaEvvZ8HSndW10DEDHzdOlPcxJQ9+XxKzPIvIJS0FjMdcn/OR2M
         VoSAjTSza+8B12X0Pxc480HdoF6STyWMcgcDLio9+asLz98f6jpzUc34JZGlzvxUAHd6
         ru2w3q3WY0lPUwXUNCAF3XEggn7TsHELj4r0oCp7PFor4K7O1ckAkSXqaCyzarMoPSqp
         Ok7m27BRbQb6rCJdsI2GO3D3YHxqDOmb6m7BITuzVsx1ox6BvSgnUQNNAnAYFHcOzFEl
         Jyrxo8qYQcx7C/MctlhGDClYLV2Q8PzpNQYpsj8b3Idsn3CWOl0hKnwc3dKY1BN83xfy
         f2mA==
X-Gm-Message-State: ANoB5plkfso7/y2S5XUiQxV/vXo9sBu3EKi3qZMMs+iLb9tAYGEAhx2o
	+3+RSRckI+EWq94yZm1FLzG4uSoiL1lSfw==
X-Google-Smtp-Source: AA0mqf7czBiysUYNBBX4KR2fzrEJ5tyaAlKj07HNEiFWL069GyqZyIOC1nb92qdxdbBkm1zKpEMjuQ==
X-Received: by 2002:a63:4043:0:b0:470:2ecd:333e with SMTP id n64-20020a634043000000b004702ecd333emr42124147pga.596.1669553422629;
        Sun, 27 Nov 2022 04:50:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/17] powerpc: split validate_sp into two functions
Date: Sun, 27 Nov 2022 22:49:39 +1000
Message-Id: <20221127124942.1665522-15-npiggin@gmail.com>
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
index 6cb3982a11ef..6820d90744c3 100644
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
+	return validate_sp_size(sp, p, STACK_FRAME_OVERHEAD);
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

