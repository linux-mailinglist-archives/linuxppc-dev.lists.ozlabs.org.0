Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8575613020
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12h35P9gz3dt5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:05:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o9M/wibf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o9M/wibf;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12S33x5jz3cGB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:15 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id u6so9832176plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+krTD53JDTgykVep/jbTUJb7DjigcW/bUrKL0peNZGM=;
        b=o9M/wibfG8iHHI4HSOXp/85SRyNmg85pueHMRBy4o0sQV4/h2jLKPNQHODi5Q+QNpn
         wVHYi/NRqbdBdAle+Kt3sQY39/6zOnuNXDrauSUNKnl6MXIT7fRfxko1Hyh9S5RBbjcg
         T8j3kc2EO8Z6qTc+C2lobOu5QPtEiV93oebvk67fak7FJSyGDmuyhVB3XoEcpXquS7hk
         bgCAGmerUk1nIcKZv3RBq1g3JXDt7GXvqjk3eliijy/K7r/yyXN/mEyIz4A+3xzc1Lgu
         QssSZuSBEbUA76ECAkOTMxDfwVoB8tIJsfQYG+BrEjkazDckxmVURSpZMhi0Lhjv4MRJ
         kxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+krTD53JDTgykVep/jbTUJb7DjigcW/bUrKL0peNZGM=;
        b=ufG6Lzad41/mAcpsHrIunCM/YaNGLGSJTeSClvGgddFtJnJKvhxaclFl79j9L0I7SG
         lsFdoNmPhh4fXGsrYb0VR9s8Sb0yF69Ytqsv4ZjtyBx5y+zOWXfHqwgE3Xz6OT6C4t/T
         BNrp6BJj3el2bj7QKLGl7hY56d5t/HvpS/ILcTmalT5T/34AJ795T7w+gWDZP/xl10sZ
         XDog4zvK+yyfmd7j+KDkUYc7ysiR5fGgbPCponSGFRBHA1fETtpMym8dBHR8fXmv73Wx
         oyxOT/mqfKY91TW657O9bX3mqu9xvvPoK2CG9NEUHL55OGn9YRQ8PUWWA19m8SEEu2ZK
         5gyA==
X-Gm-Message-State: ACrzQf2UXnjOlyhpW4GSp0+uqJRwNk9461PaqhCV9s3ckRiFcES3ykRA
	IQeFRpUFiT4esj1JotD3oYGV2hLkz9E=
X-Google-Smtp-Source: AMsMyM68+02w6O6OeK30reRciK6q+0Xn2NLtqLRH0x+CkxcX79WL4BJBkpIBVaDRRa20p0SQOkiHkA==
X-Received: by 2002:a17:902:7408:b0:186:88be:1cca with SMTP id g8-20020a170902740800b0018688be1ccamr12462018pll.155.1667195714727;
        Sun, 30 Oct 2022 22:55:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 11/19] powerpc: add a define for the switch frame size and regs offset
Date: Mon, 31 Oct 2022 15:54:32 +1000
Message-Id: <20221031055440.3594315-12-npiggin@gmail.com>
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

This is open-coded in process.c, ppc32 uses a different define with the
same value, and the C definition is name differently which makes it an
extra indirection to grep for.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h |  6 ++++--
 arch/powerpc/kernel/asm-offsets.c |  2 +-
 arch/powerpc/kernel/entry_32.S    |  6 +++---
 arch/powerpc/kernel/process.c     | 12 ++++++++----
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 705ce26ae887..412ef0749775 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -97,8 +97,6 @@ struct pt_regs
 #endif
 
 
-#define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))
-
 // Always displays as "REGS" in memory dumps
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define STACK_FRAME_REGS_MARKER	ASM_CONST(0x52454753)
@@ -125,6 +123,8 @@ struct pt_regs
 #define STACK_USER_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 16)
+#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
+#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_OVERHEAD
 
 #ifdef CONFIG_PPC64_ELF_ABI_V2
 #define STACK_FRAME_MIN_SIZE	32
@@ -146,6 +146,8 @@ struct pt_regs
 #define STACK_INT_FRAME_REGS	STACK_FRAME_OVERHEAD
 #define STACK_INT_FRAME_MARKER	(STACK_FRAME_OVERHEAD - 8)
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
+#define STACK_SWITCH_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
+#define STACK_SWITCH_FRAME_REGS	STACK_FRAME_OVERHEAD
 
 /* Size of stack frame allocated when calling signal handler. */
 #define __SIGNAL_FRAMESIZE	64
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index db5e66c1d031..f7dff906c24b 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -260,7 +260,7 @@ int main(void)
 
 	/* Interrupt register frame */
 	DEFINE(INT_FRAME_SIZE, STACK_INT_FRAME_SIZE);
-	DEFINE(SWITCH_FRAME_SIZE, STACK_FRAME_WITH_PT_REGS);
+	DEFINE(SWITCH_FRAME_SIZE, STACK_SWITCH_FRAME_SIZE);
 	STACK_PT_REGS_OFFSET(GPR0, gpr[0]);
 	STACK_PT_REGS_OFFSET(GPR1, gpr[1]);
 	STACK_PT_REGS_OFFSET(GPR2, gpr[2]);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 2f61b7d3677c..6e99ec10be89 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -215,9 +215,9 @@ ret_from_kernel_thread:
  * in arch/ppc/kernel/process.c
  */
 _GLOBAL(_switch)
-	stwu	r1,-INT_FRAME_SIZE(r1)
+	stwu	r1,-SWITCH_FRAME_SIZE(r1)
 	mflr	r0
-	stw	r0,INT_FRAME_SIZE+4(r1)
+	stw	r0,SWITCH_FRAME_SIZE+4(r1)
 	/* r3-r12 are caller saved -- Cort */
 	SAVE_NVGPRS(r1)
 	stw	r0,_NIP(r1)	/* Return to switch caller */
@@ -248,7 +248,7 @@ _GLOBAL(_switch)
 
 	lwz	r4,_NIP(r1)	/* Return to _switch caller in new task */
 	mtlr	r4
-	addi	r1,r1,INT_FRAME_SIZE
+	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
 	.globl	fast_exception_return
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index d6daf0d073b3..a097879b0474 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1779,10 +1779,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	 * do some house keeping and then return from the fork or clone
 	 * system call, using the stack frame created above.
 	 */
-	sp -= sizeof(struct pt_regs);
-	kregs = (struct pt_regs *) sp;
-	sp -= STACK_FRAME_OVERHEAD;
+	sp -= STACK_SWITCH_FRAME_SIZE;
+	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
 	p->thread.ksp = sp;
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	for (i = 0; i < nr_wp_slots(); i++)
 		p->thread.ptrace_bps[i] = NULL;
@@ -2232,8 +2232,12 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
 		/*
 		 * See if this is an exception frame.
 		 * We look for the "regs" marker in the current frame.
+		 *
+		 * STACK_SWITCH_FRAME_SIZE being the smallest frame that
+		 * could hold a pt_regs, if that does not fit then it can't
+		 * have regs.
 		 */
-		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
+		if (validate_sp(sp, tsk, STACK_SWITCH_FRAME_SIZE)
 		    && stack[STACK_INT_FRAME_MARKER_LONGS] == STACK_FRAME_REGS_MARKER) {
 			struct pt_regs *regs = (struct pt_regs *)
 				(sp + STACK_INT_FRAME_REGS);
-- 
2.37.2

