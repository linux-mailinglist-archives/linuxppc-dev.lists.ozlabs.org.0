Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457D80A972
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:40:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KUFBhlM7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smxhk5kqMz3vlm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:40:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KUFBhlM7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxZt36K2z3dGl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6172624FD;
	Fri,  8 Dec 2023 16:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE94C433CB;
	Fri,  8 Dec 2023 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053332;
	bh=mcOc029J1BqyWbOqtSlrwAjg5MaAlcqBJsrSldWAf8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUFBhlM7PmCPIHyssSqtMtp0iHkXz0NaajpTrYeU7B9HrrgSt6Sze/LesuoHwp5ZK
	 xSB8ZFbckeD9MVLZrmE6MV1S8wu6nUgACwNuyfLZBEnOwnjhChCHrzwKnjuTuXIiFQ
	 jC2gXriHQP89crMlGaYqaRLQ2+ii82w+BUq5++7TccuBh7QoJNxKe70VJlNj+xhLgz
	 nhxvjs7ihyhHZlzHuMTrxQt2wl0jJnbMl0u8buymkdxplPfVzVqIeXthFgA2izpoVO
	 rp4WP3WV7Y12Wb4a1HmJNeSxGaGEu4qcCR9A5ibNTgsMdd+OPLKQ0umsxYjqySGFQt
	 pEBXTz3LJZP6A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 7/9] powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
Date: Fri,  8 Dec 2023 22:00:46 +0530
Message-ID: <cc8ac847f3b23384b79e3db7968f79aea41bdc57.1702045299.git.naveen@kernel.org>
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

Implement support for DYNAMIC_FTRACE_WITH_CALL_OPS similar to the
arm64 implementation.

This works by patching-in a pointer to an associated ftrace_ops
structure before each traceable function. If multiple ftrace_ops are
associated with a call site, then a special ftrace_list_ops is used to
enable iterating over all the registered ftrace_ops. If no ftrace_ops
are associated with a call site, then a special ftrace_nop_ops structure
is used to render the ftrace call as a no-op. ftrace trampoline can then
read the associated ftrace_ops for a call site by loading from an offset
from the LR, and branch directly to the associated function.

The primary advantage with this approach is that we don't have to
iterate over all the registered ftrace_ops for call sites that have a
single ftrace_ops registered. This is the equivalent of implementing
support for dynamic ftrace trampolines, which set up a special ftrace
trampoline for each registered ftrace_ops and have individual call sites
branch into those directly.

A secondary advantage is that this gives us a way to add support for
direct ftrace callers without having to resort to using stubs. The
address of the direct call trampoline can be loaded from the ftrace_ops
structure.

To support this, we utilize the space between the existing function
profile sequence and the function entry. During ftrace activation, we
update this location with the associated ftrace_ops pointer. Then, on
ftrace entry, we load from this location and call into
ftrace_ops->func().

For 64-bit powerpc, we also select FUNCTION_ALIGNMENT_8B so that the
ftrace_ops pointer is double word aligned and can be updated atomically.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                     |  2 +
 arch/powerpc/kernel/asm-offsets.c        |  4 ++
 arch/powerpc/kernel/trace/ftrace.c       | 58 ++++++++++++++++++++++++
 arch/powerpc/kernel/trace/ftrace_entry.S | 39 +++++++++++-----
 4 files changed, 91 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 318e5c1b7454..c8ecc9dcc914 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -190,6 +190,7 @@ config PPC
 	select EDAC_SUPPORT
 	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	select FUNCTION_ALIGNMENT_4B
+	select FUNCTION_ALIGNMENT_8B		if PPC64 && DYNAMIC_FTRACE_WITH_CALL_OPS
 	select GENERIC_ATOMIC64			if PPC32
 	select GENERIC_CLOCKEVENTS_BROADCAST	if SMP
 	select GENERIC_CMOS_UPDATE
@@ -233,6 +234,7 @@ config PPC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
+	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 9f14d95b8b32..8b8a39b57a9f 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -676,5 +676,9 @@ int main(void)
 	DEFINE(BPT_SIZE, BPT_SIZE);
 #endif
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	OFFSET(FTRACE_OPS_FUNC, ftrace_ops, func);
+#endif
+
 	return 0;
 }
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d3b4949142a8..af84eabf7912 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -124,6 +124,41 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 	return 0;
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+static const struct ftrace_ops *powerpc_rec_get_ops(struct dyn_ftrace *rec)
+{
+	const struct ftrace_ops *ops = NULL;
+
+	if (rec->flags & FTRACE_FL_CALL_OPS_EN) {
+		ops = ftrace_find_unique_ops(rec);
+		WARN_ON_ONCE(!ops);
+	}
+
+	if (!ops)
+		ops = &ftrace_list_ops;
+
+	return ops;
+}
+
+static int ftrace_rec_set_ops(const struct dyn_ftrace *rec, const struct ftrace_ops *ops)
+{
+	return patch_ulong((void *)(rec->ip - sizeof(unsigned long)), (unsigned long)ops);
+}
+
+static int ftrace_rec_set_nop_ops(struct dyn_ftrace *rec)
+{
+	return ftrace_rec_set_ops(rec, &ftrace_nop_ops);
+}
+
+static int ftrace_rec_update_ops(struct dyn_ftrace *rec)
+{
+	return ftrace_rec_set_ops(rec, powerpc_rec_get_ops(rec));
+}
+#else
+static int ftrace_rec_set_nop_ops(struct dyn_ftrace *rec) { return 0; }
+static int ftrace_rec_update_ops(struct dyn_ftrace *rec) { return 0; }
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
@@ -159,6 +194,10 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	if (ret || !IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
 		return ret;
 
+	ret = ftrace_rec_update_ops(rec);
+	if (ret)
+		return ret;
+
 	ip = rec->ip;
 	ret = ftrace_modify_code(ip, ppc_inst(PPC_RAW_NOP()),
 				 ppc_inst(PPC_RAW_BRANCH(-FTRACE_MCOUNT_TRAMP_OFFSET)));
@@ -214,16 +253,19 @@ void ftrace_replace_code(int enable)
 		case FTRACE_UPDATE_MODIFY_CALL:
 			ret = ftrace_get_call_inst(rec, new_addr, &new_call_inst);
 			ret |= ftrace_get_call_inst(rec, addr, &call_inst);
+			ret |= ftrace_rec_update_ops(rec);
 			old = call_inst;
 			new = new_call_inst;
 			break;
 		case FTRACE_UPDATE_MAKE_NOP:
 			ret = ftrace_get_call_inst(rec, addr, &call_inst);
+			ret |= ftrace_rec_set_nop_ops(rec);
 			old = call_inst;
 			new = nop_inst;
 			break;
 		case FTRACE_UPDATE_MAKE_CALL:
 			ret = ftrace_get_call_inst(rec, new_addr, &call_inst);
+			ret |= ftrace_rec_update_ops(rec);
 			old = nop_inst;
 			new = call_inst;
 			break;
@@ -312,6 +354,12 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 			ret |= ftrace_modify_code(ip, old, ppc_inst(ftrace_mcount_tramp_insns[i]));
 
 		if (IS_ENABLED(CONFIG_PPC64)) {
+			if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS) &&
+			    !IS_ALIGNED(ip, sizeof(unsigned long))) {
+				pr_err("0x%lx: Mis-aligned ftrace_ops patch site\n", ip);
+				return -EINVAL;
+			}
+
 			/* two more nops */
 			ret |= ftrace_validate_inst(ip, old);
 			ip += MCOUNT_INSN_SIZE;
@@ -325,6 +373,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		/* nop at ftrace location */
 		ret |= ftrace_validate_inst(ip, old);
 
+		if (!ret)
+			ret = ftrace_rec_set_nop_ops(rec);
+
 		return ret;
 	}
 
@@ -383,6 +434,13 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	ppc_inst_t old, new;
 	int ret;
 
+	/*
+	 * When using CALL_OPS, the function to call is associated with the
+	 * call site, and we don't have a global function pointer to update.
+	 */
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
+		return 0;
+
 	old = ppc_inst_read((u32 *)&ftrace_call);
 	new = ftrace_create_branch_inst(ip, ppc_function_entry(func), 1);
 	ret = ftrace_modify_code(ip, old, new);
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 537c14b12904..4d1220c2e32f 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -97,11 +97,6 @@
 	/* Save callee's TOC in the ABI compliant location */
 	std	r2, STK_GOT(r1)
 	LOAD_PACA_TOC()		/* get kernel TOC in r2 */
-	LOAD_REG_ADDR(r3, function_trace_op)
-	ld	r5,0(r3)
-#else
-	lis	r3,function_trace_op@ha
-	lwz	r5,function_trace_op@l(r3)
 #endif
 
 #ifdef CONFIG_LIVEPATCH_64
@@ -177,20 +172,40 @@
 #endif
 .endm
 
-_GLOBAL(ftrace_regs_caller)
-	ftrace_regs_entry 1
-	/* ftrace_call(r3, r4, r5, r6) */
+.macro ftrace_regs_func allregs
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+	PPC_LL	r5, -SZL(r3)
+	PPC_LL	r12, FTRACE_OPS_FUNC(r5)
+	mtctr	r12
+	bctrl
+#else
+#ifdef CONFIG_PPC64
+	LOAD_REG_ADDR(r5, function_trace_op)
+	ld	r5, 0(r5)
+#else
+	lis	r5, function_trace_op@ha
+	lwz	r5, function_trace_op@l(r5)
+#endif
+	.if \allregs == 1
 .globl ftrace_regs_call
 ftrace_regs_call:
+	.else
+.globl ftrace_call
+ftrace_call:
+	.endif
+	/* ftrace_call(r3, r4, r5, r6) */
 	bl	ftrace_stub
+#endif
+.endm
+
+_GLOBAL(ftrace_regs_caller)
+	ftrace_regs_entry 1
+	ftrace_regs_func 1
 	ftrace_regs_exit 1
 
 _GLOBAL(ftrace_caller)
 	ftrace_regs_entry 0
-	/* ftrace_call(r3, r4, r5, r6) */
-.globl ftrace_call
-ftrace_call:
-	bl	ftrace_stub
+	ftrace_regs_func 0
 	ftrace_regs_exit 0
 
 _GLOBAL(ftrace_stub)
-- 
2.43.0

