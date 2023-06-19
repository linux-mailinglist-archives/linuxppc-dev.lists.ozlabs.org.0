Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718D3735172
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:05:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k6cLAnt/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql53s20R2z3d8N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k6cLAnt/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4p33PmDz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:53:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B817C601CD;
	Mon, 19 Jun 2023 09:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90209C433C8;
	Mon, 19 Jun 2023 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168393;
	bh=kY59zIia92tnkVQ+n2QicgjFmTstOeOTi3k+EkFObTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k6cLAnt/4LIy65hrAOHg3mCPIr7YJwBkTrJu+KhbtI3y5a8K074SvMaj1MKheBkW/
	 XawIA1pUdR+LfkaLYP2BLf/ACFaKXXRlozaOM8YeJo1yfKz3e01vBQSpqY1h3oqsqK
	 w3tdMxLRNL9m9a0Yv1o0LcIwZKN7Pu6uhlZrzy6xU9Ims6BtcPzwWnyDch2uROlApe
	 PioMXoA+Pl9e5KvSH5GeCTZ1g1yNe0jXsGFtyZ0mF5IvHvM8/LiWzkZcIln8rSZOy4
	 J57EWj/v0hkg9aSL0cbe1qBhznIySROLaGAjxALYG0qLoaRoal6ZNe2QJcBBbqvxDa
	 EFFcjn/7zuc/A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 11/17] powerpc/ftrace: Simplify ftrace_make_nop()
Date: Mon, 19 Jun 2023 15:17:29 +0530
Message-Id: <e12ccbf28c50c3a07fb614f4d392e55f7098a729.1687166935.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687166935.git.naveen@kernel.org>
References: <cover.1687166935.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we validate the ftrace location during initialization in
ftrace_init_nop(), we can simplify ftrace_make_nop() to patch-in the nop
without worrying about the instructions surrounding the ftrace location.
Note that we continue to ensure that we have a bl to
ftrace_[regs_]caller at the ftrace location before nop-ing it out.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 220 +++++------------------------
 1 file changed, 32 insertions(+), 188 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 98bd099c428ee0..05153a1038fdff 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -116,112 +116,6 @@ static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 	return ip + (long)offset;
 }
 
-#ifdef CONFIG_MODULES
-static int
-__ftrace_make_nop(struct module *mod,
-		  struct dyn_ftrace *rec, unsigned long addr)
-{
-	unsigned long entry, ptr, tramp;
-	unsigned long ip = rec->ip;
-	ppc_inst_t op, pop;
-
-	/* read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
-		pr_err("Fetching opcode failed.\n");
-		return -EFAULT;
-	}
-
-	/* Make sure that this is still a 24bit jump */
-	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
-		return -EINVAL;
-	}
-
-	/* lets find where the pointer goes */
-	tramp = find_bl_target(ip, op);
-
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
-
-	if (module_trampoline_target(mod, tramp, &ptr)) {
-		pr_err("Failed to get trampoline target\n");
-		return -EFAULT;
-	}
-
-	pr_devel("trampoline target %lx", ptr);
-
-	entry = ppc_global_function_entry((void *)addr);
-	/* This should match what was called */
-	if (ptr != entry) {
-		pr_err("addr %lx does not match expected %lx\n", ptr, entry);
-		return -EINVAL;
-	}
-
-	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
-		if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
-			pr_err("Fetching instruction at %lx failed.\n", ip - 4);
-			return -EFAULT;
-		}
-
-		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-		if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
-		    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
-			pr_err("Unexpected instruction %08lx around bl _mcount\n",
-			       ppc_inst_as_ulong(op));
-			return -EINVAL;
-		}
-	} else if (IS_ENABLED(CONFIG_PPC64)) {
-		/*
-		 * Check what is in the next instruction. We can see ld r2,40(r1), but
-		 * on first pass after boot we will see mflr r0.
-		 */
-		if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))) {
-			pr_err("Fetching op failed.\n");
-			return -EFAULT;
-		}
-
-		if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-			pr_err("Expected %08lx found %08lx\n", PPC_INST_LD_TOC,
-			       ppc_inst_as_ulong(op));
-			return -EINVAL;
-		}
-	}
-
-	/*
-	 * When using -mprofile-kernel or PPC32 there is no load to jump over.
-	 *
-	 * Otherwise our original call site looks like:
-	 *
-	 * bl <tramp>
-	 * ld r2,XX(r1)
-	 *
-	 * Milton Miller pointed out that we can not simply nop the branch.
-	 * If a task was preempted when calling a trace function, the nops
-	 * will remove the way to restore the TOC in r2 and the r2 TOC will
-	 * get corrupted.
-	 *
-	 * Use a b +8 to jump over the load.
-	 * XXX: could make PCREL depend on MPROFILE_KERNEL
-	 * XXX: check PCREL && MPROFILE_KERNEL calling sequence
-	 */
-	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL) || IS_ENABLED(CONFIG_PPC32))
-		pop = ppc_inst(PPC_RAW_NOP());
-	else
-		pop = ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
-
-	if (patch_instruction((u32 *)ip, pop)) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
-
-	return 0;
-}
-#else
-static int __ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
-{
-	return 0;
-}
-#endif /* CONFIG_MODULES */
-
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
@@ -235,88 +129,6 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
-static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
-{
-	unsigned long tramp, ip = rec->ip;
-	ppc_inst_t op;
-
-	/* Read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
-		pr_err("Fetching opcode failed.\n");
-		return -EFAULT;
-	}
-
-	/* Make sure that this is still a 24bit jump */
-	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
-		return -EINVAL;
-	}
-
-	/* Let's find where the pointer goes */
-	tramp = find_bl_target(ip, op);
-
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
-
-	/* Are ftrace trampolines reachable? */
-	if (!find_ftrace_tramp(ip)) {
-		pr_err("No ftrace trampolines reachable from %ps\n", (void *)ip);
-		return -EINVAL;
-	}
-
-	if (patch_instruction((u32 *)ip, ppc_inst(PPC_RAW_NOP()))) {
-		pr_err("Patching NOP failed.\n");
-		return -EPERM;
-	}
-
-	return 0;
-}
-
-int ftrace_make_nop(struct module *mod,
-		    struct dyn_ftrace *rec, unsigned long addr)
-{
-	unsigned long ip = rec->ip;
-	ppc_inst_t old, new;
-
-	/*
-	 * If the calling address is more that 24 bits away,
-	 * then we had to use a trampoline to make the call.
-	 * Otherwise just update the call site.
-	 */
-	if (test_24bit_addr(ip, addr)) {
-		/* within range */
-		old = ftrace_call_replace(ip, addr, 1);
-		new = ppc_inst(PPC_RAW_NOP());
-		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip)) {
-		return __ftrace_make_nop_kernel(rec, addr);
-	} else if (!IS_ENABLED(CONFIG_MODULES)) {
-		return -EINVAL;
-	}
-
-	/*
-	 * Out of range jumps are called from modules.
-	 * We should either already have a pointer to the module
-	 * or it has been passed in.
-	 */
-	if (!rec->arch.mod) {
-		if (!mod) {
-			pr_err("No module loaded addr=%lx\n", addr);
-			return -EFAULT;
-		}
-		rec->arch.mod = mod;
-	} else if (mod) {
-		if (mod != rec->arch.mod) {
-			pr_err("Record mod %p not equal to passed in mod %p\n",
-			       rec->arch.mod, mod);
-			return -EINVAL;
-		}
-		/* nothing to do if mod == rec->arch.mod */
-	} else
-		mod = rec->arch.mod;
-
-	return __ftrace_make_nop(mod, rec, addr);
-}
-
 #ifdef CONFIG_MODULES
 /*
  * Examine the existing instructions for __ftrace_make_call.
@@ -607,6 +419,38 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 }
 #endif
 
+int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
+{
+	unsigned long tramp, ip = rec->ip;
+	ppc_inst_t old, new;
+
+	/* Nop-out the ftrace location */
+	new = ppc_inst(PPC_RAW_NOP());
+	if (is_offset_in_branch_range(addr - ip)) {
+		/* Within range */
+		old = ftrace_create_branch_inst(ip, addr, 1);
+		return ftrace_modify_code(ip, old, new);
+	} else if (core_kernel_text(ip)) {
+		/* We would be branching to one of our ftrace tramps */
+		tramp = find_ftrace_tramp(ip);
+		if (!tramp) {
+			pr_err("0x%lx: No ftrace trampolines reachable\n", ip);
+			return -EINVAL;
+		}
+		old = ftrace_create_branch_inst(ip, tramp, 1);
+		return ftrace_modify_code(ip, old, new);
+	} else if (IS_ENABLED(CONFIG_MODULES)) {
+		/* Module code would be going to one of the module stubs */
+		if (!mod)
+			mod = rec->arch.mod;
+		tramp = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
+		old = ftrace_create_branch_inst(ip, tramp, 1);
+		return ftrace_modify_code(ip, old, new);
+	}
+
+	return -EINVAL;
+}
+
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
 	unsigned long addr, ip = rec->ip;
-- 
2.40.1

