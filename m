Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800B80A974
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:41:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ucggwy5F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smxjc5tXmz3vXc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:41:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ucggwy5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxZz379Hz3cc6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78E3261D2E;
	Fri,  8 Dec 2023 16:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97072C433C8;
	Fri,  8 Dec 2023 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053337;
	bh=7raJIERHI+frfy4evcCjXbQCBLrz7+ndhekYbkUWCw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ucggwy5F5BZXz172PhI07i2kTcoe04uwSX7QNPhw2P4840kQPSngfiErOdWEZVZUf
	 8T76BRVjSRpjIIU9xWEIo8pMG3XrF3vBB3vODslqGDQ2vY283eRo8d9c1KBSpQaQnn
	 VUNhDQVCQR8kVKY1Hje9m5HxyBmBJELQ1OwdZaTl2b2ogywS4CFPwZC33E7WCdnS8m
	 eyvRbf9C0z970RJOqzOUyc7lcK0vJ9Y7pDV5pvaqEEZLMzYrMLyIkhnFsL4Tl7DVOi
	 4yAMhNA/Idh3RtTl3h2SrraGMtbcBDfSTVXNghBw9OZNZFWT7rQJm83AGQK9WBHtKp
	 UPBXMaKW9yzig==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 8/9] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
Date: Fri,  8 Dec 2023 22:00:47 +0530
Message-ID: <62b7c2fcaca546c790a825cf79b9cced1ac8d1db.1702045299.git.naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS similar to the arm64
implementation.

ftrace direct calls allow custom trampolines to be called into directly
from function ftrace call sites, bypassing the ftrace trampoline
completely. This functionality is currently utilized by BPF trampolines
to hook into kernel function entries.

Since we have limited relative branch range, we support ftrace direct
calls through support for DYNAMIC_FTRACE_WITH_CALL_OPS. In this
approach, ftrace trampoline is not entirely bypassed. Rather, it is
re-purposed into a stub that reads direct_call field from the associated
ftrace_ops structure and branches into that, if it is not NULL. For
this, it is sufficient if we can ensure that the ftrace trampoline is
reachable from all traceable functions.

When multiple ftrace_ops are associated with a call site, we utilize a
call back to set pt_regs->orig_gpr3 that can then be tested on the
return path from the ftrace trampoline to branch into the direct caller.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/include/asm/ftrace.h        | 15 ++++
 arch/powerpc/kernel/asm-offsets.c        |  3 +
 arch/powerpc/kernel/trace/ftrace_entry.S | 99 ++++++++++++++++++------
 4 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c8ecc9dcc914..4fe04fdca33a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -235,6 +235,7 @@ config PPC
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index d9b99781bea3..986c4fffb9ec 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -93,6 +93,21 @@ struct ftrace_ops;
 #define ftrace_graph_func ftrace_graph_func
 void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 		       struct ftrace_ops *op, struct ftrace_regs *fregs);
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+/*
+ * When an ftrace registered caller is tracing a function that is also set by a
+ * register_ftrace_direct() call, it needs to be differentiated in the
+ * ftrace_caller trampoline so that the direct call can be invoked after the
+ * other ftrace ops. To do this, place the direct caller in the orig_gpr3 field
+ * of pt_regs. This tells ftrace_caller that there's a direct caller.
+ */
+static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsigned long addr)
+{
+	struct pt_regs *regs = &fregs->regs;
+	regs->orig_gpr3 = addr;
+}
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 #endif
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8b8a39b57a9f..85da10726d98 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -678,6 +678,9 @@ int main(void)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
 	OFFSET(FTRACE_OPS_FUNC, ftrace_ops, func);
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	OFFSET(FTRACE_OPS_DIRECT_CALL, ftrace_ops, direct_call);
+#endif
 #endif
 
 	return 0;
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 4d1220c2e32f..ab60395fc34b 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -33,14 +33,57 @@
  * and then arrange for the ftrace function to be called.
  */
 .macro	ftrace_regs_entry allregs
-	/* Save the original return address in A's stack frame */
-	PPC_STL		r0, LRSAVE(r1)
 	/* Create a minimal stack frame for representing B */
 	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
 
 	/* Create our stack frame + pt_regs */
 	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
 
+	.if \allregs == 1
+	SAVE_GPRS(11, 12, r1)
+	.endif
+
+	/* Get the _mcount() call site out of LR */
+	mflr	r11
+
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	/*
+	 * This points after the bl at 'mtlr r0', but this sequence could be
+	 * outside the function. Move this to point just after the ftrace
+	 * location inside the function for proper unwind.
+	 */
+	addi	r11, r11, FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	/* Load the ftrace_op */
+	PPC_LL	r12, -SZL-MCOUNT_INSN_SIZE(r11)
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Load direct_call from the ftrace_op */
+	PPC_LL	r12, FTRACE_OPS_DIRECT_CALL(r12)
+	PPC_LCMPI r12, 0
+	beq	1f
+	mtctr	r12
+	.if \allregs == 1
+	REST_GPRS(11, 12, r1)
+	.endif
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	bctr
+1:
+#endif
+#endif
+#endif
+
+	/* Save the previous LR in pt_regs->link */
+	PPC_STL	r0, _LINK(r1)
+	/* Also save it in A's stack frame */
+	PPC_STL	r0, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE+LRSAVE(r1)
+
+	/* Save our return address as pt_regs->nip */
+	PPC_STL	r11, _NIP(r1)
+	/* Also save it in B's stackframe header for proper unwind */
+	PPC_STL	r11, SWITCH_FRAME_SIZE+LRSAVE(r1)
+
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
 	SAVE_GPRS(3, 10, r1)
@@ -54,7 +97,7 @@
 
 	.if \allregs == 1
 	SAVE_GPR(2, r1)
-	SAVE_GPRS(11, 31, r1)
+	SAVE_GPRS(13, 31, r1)
 	.else
 #ifdef CONFIG_LIVEPATCH_64
 	SAVE_GPR(14, r1)
@@ -65,6 +108,13 @@
 	addi	r8, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
 	PPC_STL	r8, GPR1(r1)
 
+#ifdef CONFIG_LIVEPATCH_64
+	mr	r14, r11	/* remember old NIP */
+#endif
+
+	/* Calculate ip from nip-4 into r3 for call below */
+	subi	r3, r11, MCOUNT_INSN_SIZE
+
 	.if \allregs == 1
 	/* Load special regs for save below */
 	mfmsr   r8
@@ -76,22 +126,11 @@
 	li	r8, 0
 	.endif
 
-	/* Get the _mcount() call site out of LR */
-	mflr	r7
-#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
-	/*
-	 * This points after the bl at 'mtlr r0', but this sequence could be
-	 * outside the function. Move this to point just after the ftrace
-	 * location inside the function for proper unwind.
-	 */
-	addi	r7, r7, FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Clear orig_gpr3 to later detect ftrace_direct call */
+	li	r7, 0
+	PPC_STL	r7, ORIG_GPR3(r1)
 #endif
-	/* Save it as pt_regs->nip */
-	PPC_STL	r7, _NIP(r1)
-	/* Also save it in B's stackframe header for proper unwind */
-	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
-	/* Save the read LR in pt_regs->link */
-	PPC_STL	r0, _LINK(r1)
 
 #ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
@@ -99,13 +138,6 @@
 	LOAD_PACA_TOC()		/* get kernel TOC in r2 */
 #endif
 
-#ifdef CONFIG_LIVEPATCH_64
-	mr	r14, r7		/* remember old NIP */
-#endif
-
-	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
-
 	/* Put the original return address in r4 as parent_ip */
 	mr	r4, r0
 
@@ -122,6 +154,13 @@
 .endm
 
 .macro	ftrace_regs_exit allregs
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Check orig_gpr3 to detect ftrace_direct call */
+	PPC_LL	r7, ORIG_GPR3(r1)
+	PPC_LCMPI cr1, r7, 0
+	mtctr	r7
+#endif
+
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
 
@@ -164,8 +203,12 @@
         /* Based on the cmpd above, if the NIP was altered handle livepatch */
 	bne-	livepatch_handler
 #endif
+
 	/* jump after _mcount site */
 #ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	bnectr	cr1
+#endif
 	blr
 #else
 	bctr
@@ -227,6 +270,12 @@ ftrace_no_trace:
 #endif
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+SYM_FUNC_START(ftrace_stub_direct_tramp)
+	blr
+SYM_FUNC_END(ftrace_stub_direct_tramp)
+#endif
+
 #ifdef CONFIG_LIVEPATCH_64
 	/*
 	 * This function runs in the mcount context, between two functions. As
-- 
2.43.0

