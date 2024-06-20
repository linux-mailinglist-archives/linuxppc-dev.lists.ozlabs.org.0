Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92C9111BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 21:02:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VNcKmNkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4qcl2BLpz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 05:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VNcKmNkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4qW942bZz3cYW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:57:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67728CE28AA;
	Thu, 20 Jun 2024 18:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D41C4AF0B;
	Thu, 20 Jun 2024 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718909876;
	bh=rm9sdHHwK6qY7TQ13cheO2nwRcGl6YR5u8v4AFUNSik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VNcKmNkvUsMJuJx1eqxx0SnfLvuMq41S3JggJn8HrifzsEPm5ZamvHOSvdDjNb1oa
	 Auo8k+rS6McDknc/kXdcBo3Rpk7+NfigZYNmFvmyLHWBSWOR/vP95RSjWzDydGY2bw
	 yX5pWS6kwiOpdaRrvOvG5L19IachmvTxhFmKY56MYA04fxR3zik1yfbuaoa1l7eNDx
	 2ppxgmusQeIXN2M4Dett7XYv/v00CTS1JGVHWSYXS8Ep9+B9pcKBuxkGOP/ihZd8oD
	 Y9Vu0nKBgKLHGQo0euDvpqBPndRUpgLWcwHxrokhB1cjF9bNPkZDci5ULAY2ldf2os
	 x+O2Twgphdatg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>
Subject: [RFC PATCH v3 08/11] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
Date: Fri, 21 Jun 2024 00:24:11 +0530
Message-ID: <889f7be092839ea1917f4310867dff845539860b.1718908016.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718908016.git.naveen@kernel.org>
References: <cover.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
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
 arch/powerpc/kernel/trace/ftrace.c       |  9 +++
 arch/powerpc/kernel/trace/ftrace_entry.S | 99 ++++++++++++++++++------
 5 files changed, 105 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index fde64ad19de5..96ae653bdcde 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -236,6 +236,7 @@ config PPC
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if FTRACE_PFE_OUT_OF_LINE || (PPC32 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
+	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS if HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 938cecf72eb1..fc0f25b10e86 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -147,6 +147,21 @@ extern unsigned long ftrace_pfe_stub_text_count, ftrace_pfe_stub_inittext_count;
 #endif
 void ftrace_free_init_tramp(void);
 unsigned long ftrace_call_adjust(unsigned long addr);
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
 #else
 static inline void ftrace_free_init_tramp(void) { }
 static inline unsigned long ftrace_call_adjust(unsigned long addr) { return addr; }
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index a11ea5f4d86a..0b955dddeb28 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -680,6 +680,9 @@ int main(void)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
 	OFFSET(FTRACE_OPS_FUNC, ftrace_ops, func);
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	OFFSET(FTRACE_OPS_DIRECT_CALL, ftrace_ops, direct_call);
+#endif
 #endif
 
 	return 0;
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 028548312c23..799612ee270f 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -153,6 +153,15 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
 		ip = ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE; /* second instruction in stub */
 
+	if (!is_offset_in_branch_range(addr - ip) && addr != FTRACE_ADDR && addr != FTRACE_REGS_ADDR) {
+		/* This can only happen with ftrace direct */
+		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)) {
+			pr_err("0x%lx (0x%lx): Unexpected target address 0x%lx\n", ip, rec->ip, addr);
+			return -EINVAL;
+		}
+		addr = FTRACE_ADDR;
+	}
+
 	if (is_offset_in_branch_range(addr - ip))
 		/* Within range */
 		stub = addr;
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index a76aedd970a6..d5a63e60aafa 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -33,14 +33,38 @@
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
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Load the ftrace_op */
+	PPC_LL	r12, -(MCOUNT_INSN_SIZE*2 + SZL)(r11)
+
+	/* Load direct_call from the ftrace_op */
+	PPC_LL	r12, FTRACE_OPS_DIRECT_CALL(r12)
+	PPC_LCMPI r12, 0
+	.if \allregs == 1
+	bne	.Lftrace_direct_call_regs
+	.else
+	bne	.Lftrace_direct_call
+	.endif
+#endif
+
+	/* Save the previous LR in pt_regs->link */
+	PPC_STL	r0, _LINK(r1)
+	/* Also save it in A's stack frame */
+	PPC_STL	r0, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE+LRSAVE(r1)
+
 	/* Save all gprs to pt_regs */
 	SAVE_GPR(0, r1)
 	SAVE_GPRS(3, 10, r1)
@@ -54,7 +78,7 @@
 
 	.if \allregs == 1
 	SAVE_GPR(2, r1)
-	SAVE_GPRS(11, 31, r1)
+	SAVE_GPRS(13, 31, r1)
 	.else
 #ifdef CONFIG_LIVEPATCH_64
 	SAVE_GPR(14, r1)
@@ -67,20 +91,15 @@
 
 	.if \allregs == 1
 	/* Load special regs for save below */
+	mfcr	r7
 	mfmsr   r8
 	mfctr   r9
 	mfxer   r10
-	mfcr	r11
 	.else
 	/* Clear MSR to flag as ftrace_caller versus frace_regs_caller */
 	li	r8, 0
 	.endif
 
-	/* Get the _mcount() call site out of LR */
-	mflr	r7
-	/* Save the read LR in pt_regs->link */
-	PPC_STL	r0, _LINK(r1)
-
 #ifdef CONFIG_PPC64
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
@@ -88,8 +107,8 @@
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
-	/* r7 points to the instruction following the call to ftrace */
-	PPC_LL	r5, -(MCOUNT_INSN_SIZE*2 + SZL)(r7)
+	/* r11 points to the instruction following the call to ftrace */
+	PPC_LL	r5, -(MCOUNT_INSN_SIZE*2 + SZL)(r11)
 	PPC_LL	r12, FTRACE_OPS_FUNC(r5)
 	mtctr	r12
 #else /* !CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS */
@@ -105,40 +124,47 @@
 	/* Save special regs */
 	PPC_STL	r8, _MSR(r1)
 	.if \allregs == 1
+	PPC_STL	r7, _CCR(r1)
 	PPC_STL	r9, _CTR(r1)
 	PPC_STL	r10, _XER(r1)
-	PPC_STL	r11, _CCR(r1)
 	.endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Clear orig_gpr3 to later detect ftrace_direct call */
+	li	r7, 0
+	PPC_STL	r7, ORIG_GPR3(r1)
+#endif
+
 #ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
 	/* Save our real return address locally for return */
-	PPC_STL	r7, STACK_INT_FRAME_MARKER(r1)
+	PPC_STL	r11, STACK_INT_FRAME_MARKER(r1)
 	/*
-	 * We want the ftrace location in the function, but our lr (in r7)
+	 * We want the ftrace location in the function, but our lr (in r11)
 	 * points at the 'mtlr r0' instruction in the out of line stub.  To
 	 * recover the ftrace location, we read the branch instruction in the
 	 * stub, and adjust our lr by the branch offset.
 	 */
-	lwz	r8, MCOUNT_INSN_SIZE(r7)
+	lwz	r8, MCOUNT_INSN_SIZE(r11)
 	slwi	r8, r8, 6
 	srawi	r8, r8, 6
-	add	r3, r7, r8
+	add	r3, r11, r8
 	/*
 	 * Override our nip to point past the branch in the original function.
 	 * This allows reliable stack trace and the ftrace stack tracer to work as-is.
 	 */
-	add	r7, r3, MCOUNT_INSN_SIZE
+	add	r11, r3, MCOUNT_INSN_SIZE
 #else
 	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
+	subi    r3, r11, MCOUNT_INSN_SIZE
 #endif
 
 	/* Save NIP as pt_regs->nip */
-	PPC_STL	r7, _NIP(r1)
+	PPC_STL	r11, _NIP(r1)
 	/* Also save it in B's stackframe header for proper unwind */
-	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
+	PPC_STL	r11, LRSAVE+SWITCH_FRAME_SIZE(r1)
+
 #ifdef CONFIG_LIVEPATCH_64
-	mr	r14, r7		/* remember old NIP */
+	mr	r14, r11		/* remember old NIP */
 #endif
 
 	/* Put the original return address in r4 as parent_ip */
@@ -149,11 +175,21 @@
 .endm
 
 .macro	ftrace_regs_exit allregs
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/* Check orig_gpr3 to detect ftrace_direct call */
+	PPC_LL	r7, ORIG_GPR3(r1)
+	PPC_LCMPI cr1, r7, 0
+	mtctr	r7
+#endif
+
 #ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	bne	cr1,2f
+#endif
 	mtctr	r3
-
+2:
 #ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
 #endif
@@ -198,7 +234,11 @@
         /* Based on the cmpd above, if the NIP was altered handle livepatch */
 	bne-	livepatch_handler
 #endif
+
 	/* jump after _mcount site */
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	bnectr	cr1
+#endif
 #ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
 	blr
 #else
@@ -251,6 +291,21 @@ ftrace_no_trace:
 #endif
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+.Lftrace_direct_call_regs:
+	mtctr	r12
+	REST_GPRS(11, 12, r1)
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	bctr
+.Lftrace_direct_call:
+	mtctr	r12
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	bctr
+SYM_FUNC_START(ftrace_stub_direct_tramp)
+	blr
+SYM_FUNC_END(ftrace_stub_direct_tramp)
+#endif
+
 #ifdef CONFIG_LIVEPATCH_64
 	/*
 	 * This function runs in the mcount context, between two functions. As
-- 
2.45.2

