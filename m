Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DBE735176
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:06:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hye2PuV5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql54z50LXz3dDh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:06:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hye2PuV5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4p82wDjz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:53:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDD0E601CD;
	Mon, 19 Jun 2023 09:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1D3C433C8;
	Mon, 19 Jun 2023 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168398;
	bh=1WQ3lhGz5caRaaobUBPQvT/KIGPZ8w9+nESjHNgmp3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hye2PuV57U7eBCAajtwe3MjBecp8HtNUJqe/O3c+AhMHQkJ9fPF0ofzIn40O4PcNo
	 zrIrcQWhiSY17TTWKGs19afSBDDdw0cItIGJMQtYD2cEl8TMNXhhNyHnlQsUsVTm+d
	 kbrdaUJ/WvABlQpfNkdMlHGOyy1PmYwMhl78Evf5zRGkPIkXy5gRpwSdXk/RPt/3rZ
	 9NFNQZs2+IDPSI1wnnkaNkcRvLFVB4iOVapkRp8FBNWcYGVrpQiyfbiUWv0rsQJjlA
	 E+UrKtKhioiXLcf5GNB47L1Wrp3drxBJFCyovuIDO4s90kUE9WNCdGUFd1JLOTLfjW
	 AXDWpuW91HGHw==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 12/17] powerpc/ftrace: Simplify ftrace_make_call()
Date: Mon, 19 Jun 2023 15:17:30 +0530
Message-Id: <2d28866d2f556488a663981abe5621511efb207b.1687166935.git.naveen@kernel.org>
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
ftrace_init_nop(), we can simplify ftrace_make_call() to replace the nop
without worrying about the instructions surrounding the ftrace location.
Note that we continue to ensure that we have a nop at the ftrace
location before patching it.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 187 +++++------------------------
 1 file changed, 31 insertions(+), 156 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 05153a1038fdff..6ea8b90246a540 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -129,162 +129,6 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
-#ifdef CONFIG_MODULES
-/*
- * Examine the existing instructions for __ftrace_make_call.
- * They should effectively be a NOP, and follow formal constraints,
- * depending on the ABI. Return false if they don't.
- */
-static bool expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
-{
-	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
-		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP()));
-	else
-		return ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) &&
-		       ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC));
-}
-
-static int
-__ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
-{
-	ppc_inst_t op[2];
-	void *ip = (void *)rec->ip;
-	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
-
-	/* read where this goes */
-	if (copy_inst_from_kernel_nofault(op, ip))
-		return -EFAULT;
-
-	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
-	    copy_inst_from_kernel_nofault(op + 1, ip + 4))
-		return -EFAULT;
-
-	if (!expected_nop_sequence(ip, op[0], op[1])) {
-		pr_err("Unexpected call sequence at %p: %08lx %08lx\n", ip,
-		       ppc_inst_as_ulong(op[0]), ppc_inst_as_ulong(op[1]));
-		return -EINVAL;
-	}
-
-	/* If we never set up ftrace trampoline(s), then bail */
-	if (!mod->arch.tramp ||
-	    (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !mod->arch.tramp_regs)) {
-		pr_err("No ftrace trampoline\n");
-		return -EINVAL;
-	}
-
-	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && rec->flags & FTRACE_FL_REGS)
-		tramp = mod->arch.tramp_regs;
-	else
-		tramp = mod->arch.tramp;
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
-	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-#else
-static int __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
-{
-	return 0;
-}
-#endif /* CONFIG_MODULES */
-
-static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
-{
-	ppc_inst_t op;
-	void *ip = (void *)rec->ip;
-	unsigned long tramp, entry, ptr;
-
-	/* Make sure we're being asked to patch branch to a known ftrace addr */
-	entry = ppc_global_function_entry((void *)ftrace_caller);
-	ptr = ppc_global_function_entry((void *)addr);
-
-	if (ptr != entry && IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
-		entry = ppc_global_function_entry((void *)ftrace_regs_caller);
-
-	if (ptr != entry) {
-		pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
-		return -EINVAL;
-	}
-
-	/* Make sure we have a nop */
-	if (copy_inst_from_kernel_nofault(&op, ip)) {
-		pr_err("Unable to read ftrace location %p\n", ip);
-		return -EFAULT;
-	}
-
-	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_NOP()))) {
-		pr_err("Unexpected call sequence at %p: %08lx\n",
-		       ip, ppc_inst_as_ulong(op));
-		return -EINVAL;
-	}
-
-	tramp = find_ftrace_tramp((unsigned long)ip);
-	if (!tramp) {
-		pr_err("No ftrace trampolines reachable from %ps\n", ip);
-		return -EINVAL;
-	}
-
-	if (patch_branch(ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("Error patching branch to ftrace tramp!\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
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
-		old = ppc_inst(PPC_RAW_NOP());
-		new = ftrace_call_replace(ip, addr, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip)) {
-		return __ftrace_make_call_kernel(rec, addr);
-	} else if (!IS_ENABLED(CONFIG_MODULES)) {
-		/* We should not get here without modules */
-		return -EINVAL;
-	}
-
-	/*
-	 * Out of range jumps are called from modules.
-	 * Being that we are converting from nop, it had better
-	 * already have a module defined.
-	 */
-	if (!rec->arch.mod) {
-		pr_err("No module loaded\n");
-		return -EINVAL;
-	}
-
-	return __ftrace_make_call(rec, addr);
-}
-
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 #ifdef CONFIG_MODULES
 static int
@@ -419,6 +263,37 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 }
 #endif
 
+int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	unsigned long tramp, ip = rec->ip;
+	ppc_inst_t old, new;
+	struct module *mod;
+
+	old = ppc_inst(PPC_RAW_NOP());
+	if (is_offset_in_branch_range(addr - ip)) {
+		/* Within range */
+		new = ftrace_create_branch_inst(ip, addr, 1);
+		return ftrace_modify_code(ip, old, new);
+	} else if (core_kernel_text(ip)) {
+		/* We would be branching to one of our ftrace tramps */
+		tramp = find_ftrace_tramp(ip);
+		if (!tramp) {
+			pr_err("0x%lx: No ftrace trampolines reachable\n", ip);
+			return -EINVAL;
+		}
+		new = ftrace_create_branch_inst(ip, tramp, 1);
+		return ftrace_modify_code(ip, old, new);
+	} else if (IS_ENABLED(CONFIG_MODULES)) {
+		/* Module code would be going to one of the module stubs */
+		mod = rec->arch.mod;
+		tramp = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
+		new = ftrace_create_branch_inst(ip, tramp, 1);
+		return ftrace_modify_code(ip, old, new);
+	}
+
+	return -EINVAL;
+}
+
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long tramp, ip = rec->ip;
-- 
2.40.1

