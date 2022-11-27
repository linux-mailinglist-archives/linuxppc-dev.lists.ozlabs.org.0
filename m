Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D003639ABE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:00:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpcX0Qcbz3f5x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:00:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e/P9MxuR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e/P9MxuR;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNV3NMkz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:18 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id 130so8045270pfu.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+krTD53JDTgykVep/jbTUJb7DjigcW/bUrKL0peNZGM=;
        b=e/P9MxuR8USYtsCHCeOaxuS28kISWuTekUfjw5Q9cZUXEBgk9mVAXcbXDfLjtdFukk
         e5TNDM48h3UX4e8phh93lY8ys979gL3y7yYsnkrxsG4FsW9OY8l1hlWFxYOtBcTaoZ8Z
         rW0zRNi94nDnPY/DgdXRPl1SWvg+NKAvBf/EIHmsB0q3mqk3jAZQzfys71dIFXay9cRE
         3V3lb1Wx4dFsb6ELaHc2FLYcfnMDwGjMJTO+IOsJ0RXuOyQoFLkDL4cQJ7KeehRnGmbI
         fcYVFKttXDz0kFuUazdNUvKlaxX/cmgHApAeOIs7NSDDv5lbeqFSTH+IopKqF3liLIBe
         ivbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+krTD53JDTgykVep/jbTUJb7DjigcW/bUrKL0peNZGM=;
        b=VHj4hWuXwcsgumE2CavQsVuwFgqeHcJDRXutBypMcCIRHBWg95d1W72t8oUGI/Ddda
         WJ2N1KfxrAFpMIGZG/suTkbWcfhEVU6y7YKL86grzCS6qrGzC/PMmga/D1xJpIBj03+J
         ufytx7ItlCuKpTIsF7Oiu1duoD9aeJP5vXhO0O3a4t+g3/b5Y0RNMB81lwLy0118DHnb
         9Zv6dKi2rpZaLoMbwXeb3g57eD+NsPm6l8JTEM7GN176uKm7i+hTtzi+VsRJyh9Gssvn
         ei9AeCk9M2YQWC7T7ql5ksEcnpa9x2Gd/fSCKdIv4lGmx1Fo5otFuTF99eF2Rdgxk50i
         F6sQ==
X-Gm-Message-State: ANoB5pknImhpOZP1QdNl0Zar/GP2rhbpoRPlaWzwDSmzIkZp9jRUIpNY
	GYQy+t1DELRImdXvxpo/D89yui4iAVcP9A==
X-Google-Smtp-Source: AA0mqf78RajhynKoDMzkvwfSzHMaU/qtPVSQbrADTbccq9jmFfzkhCvl/LSHmA7W6fgYFNzzgMOWuA==
X-Received: by 2002:aa7:8a0c:0:b0:56c:2a86:d74 with SMTP id m12-20020aa78a0c000000b0056c2a860d74mr27410710pfa.73.1669553415746;
        Sun, 27 Nov 2022 04:50:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/17] powerpc: add a define for the switch frame size and regs offset
Date: Sun, 27 Nov 2022 22:49:36 +1000
Message-Id: <20221127124942.1665522-12-npiggin@gmail.com>
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

