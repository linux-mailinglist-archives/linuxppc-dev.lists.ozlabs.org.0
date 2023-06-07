Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4097266A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbttr5k4Mz3ffr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:02:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DizYrUWe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DizYrUWe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbtr61V22z3dwh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67DC060A49;
	Wed,  7 Jun 2023 17:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A95C433EF;
	Wed,  7 Jun 2023 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157203;
	bh=YYUmVT6X8MT+8GtFX36c9ZC7SWw4gDef52giezsI0YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DizYrUWe256dLTK1zBtQM2O6KUyS60ulg9aKRQqrzEbArD1Kc9+8P6UrolFH2mO6X
	 HJEfXVcfbxYxSaZJx04mqxFSJHxUbqlJGiue9fWEiNohzEJAKvOZrRjHWFPTVVYvZ6
	 hxd9Om5QUmtFVHUU7eSIxpWXCYWxSP045tcV5q1GsLZiEQSMH9eps0XHgnj+7x4zqR
	 ZOAb0G/u1fqO2+4oZuzifyzcqUgAWIY9heRXzaOAtuDnhGf4iNTxyNKwNwuX//xKQ+
	 Ixe2HybEyRKOzazYwPJWIY1vCxZLN/eqHfo0YpFLXw8fP0WIq+ZbP9aQRtsUj+uc+p
	 uJfonoeTgbhRg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 12/15] powerpc/ftrace: Simplify ftrace_modify_call()
Date: Wed,  7 Jun 2023 22:25:27 +0530
Message-Id: <606d6bac9179b35629a5eaecdd15a368f0100c10.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686151854.git.naveen@kernel.org>
References: <cover.1686151854.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we validate the ftrace location during initialization in
ftrace_init_nop(), we can simplify ftrace_modify_call() to patch-in the
updated branch instruction without worrying about the instructions
surrounding the ftrace location. Note that we continue to ensure we
have the expected branch instruction at the ftrace location before
patching it with the updated branch destination.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 161 ++++-------------------------
 1 file changed, 21 insertions(+), 140 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 8d5d91b8ae85a0..c810343d1a6cd6 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -89,33 +89,11 @@ static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_
 	return ret;
 }
 
-/*
- * Helper functions that are the same for both PPC64 and PPC32.
- */
-static int test_24bit_addr(unsigned long ip, unsigned long addr)
-{
-	addr = ppc_function_entry((void *)addr);
-
-	return is_offset_in_branch_range(addr - ip);
-}
-
 static int is_bl_op(ppc_inst_t op)
 {
 	return (ppc_inst_val(op) & ~PPC_LI_MASK) == PPC_RAW_BL(0);
 }
 
-static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
-{
-	int offset;
-
-	offset = PPC_LI(ppc_inst_val(op));
-	/* make it signed */
-	if (offset & 0x02000000)
-		offset |= 0xfe000000;
-
-	return ip + (long)offset;
-}
-
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
@@ -130,115 +108,16 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-#ifdef CONFIG_MODULES
-static int
-__ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
-					unsigned long addr)
+int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
-	ppc_inst_t op;
-	unsigned long ip = rec->ip;
-	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
-
-	/* If we never set up ftrace trampolines, then bail */
-	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
-		pr_err("No ftrace trampoline\n");
-		return -EINVAL;
-	}
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
-	entry = ppc_global_function_entry((void *)old_addr);
-
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
-
-	if (tramp != entry) {
-		/* old_addr is not within range, so we must have used a trampoline */
-		if (module_trampoline_target(mod, tramp, &ptr)) {
-			pr_err("Failed to get trampoline target\n");
-			return -EFAULT;
-		}
-
-		pr_devel("trampoline target %lx", ptr);
-
-		/* This should match what was called */
-		if (ptr != entry) {
-			pr_err("addr %lx does not match expected %lx\n", ptr, entry);
-			return -EINVAL;
-		}
-	}
-
-	/* The new target may be within range */
-	if (test_24bit_addr(ip, addr)) {
-		/* within range */
-		if (patch_branch((u32 *)ip, addr, BRANCH_SET_LINK)) {
-			pr_err("REL24 out of range!\n");
-			return -EINVAL;
-		}
-
-		return 0;
-	}
-
-	if (rec->flags & FTRACE_FL_REGS)
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
-	if (patch_branch((u32 *)ip, tramp, BRANCH_SET_LINK)) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-#else
-static int __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
-{
-	return 0;
-}
-#endif
-
-int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
-			unsigned long addr)
-{
-	unsigned long ip = rec->ip;
+	unsigned long tramp, tramp_old, ip = rec->ip;
 	ppc_inst_t old, new;
+	struct module *mod;
 
-	/*
-	 * If the calling address is more that 24 bits away,
-	 * then we had to use a trampoline to make the call.
-	 * Otherwise just update the call site.
-	 */
-	if (test_24bit_addr(ip, addr) && test_24bit_addr(ip, old_addr)) {
-		/* within range */
-		old = ftrace_call_replace(ip, old_addr, 1);
-		new = ftrace_call_replace(ip, addr, 1);
+	if (is_offset_in_branch_range(old_addr - ip) && is_offset_in_branch_range(addr - ip)) {
+		/* Within range */
+		old = ftrace_create_branch_inst(ip, old_addr, 1);
+		new = ftrace_create_branch_inst(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip)) {
 		/*
@@ -246,20 +125,22 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		 * variant, so there is nothing to do here
 		 */
 		return 0;
-	} else if (!IS_ENABLED(CONFIG_MODULES)) {
-		/* We should not get here without modules */
-		return -EINVAL;
+	} else if (IS_ENABLED(CONFIG_MODULES)) {
+		/* Module code would be going to one of the module stubs */
+		mod = rec->arch.mod;
+		if (addr == (unsigned long)ftrace_caller) {
+			tramp_old = mod->arch.tramp_regs;
+			tramp = mod->arch.tramp;
+		} else {
+			tramp_old = mod->arch.tramp;
+			tramp = mod->arch.tramp_regs;
+		}
+		old = ftrace_create_branch_inst(ip, tramp_old, 1);
+		new = ftrace_create_branch_inst(ip, tramp, 1);
+		return ftrace_modify_code(ip, old, new);
 	}
 
-	/*
-	 * Out of range jumps are called from modules.
-	 */
-	if (!rec->arch.mod) {
-		pr_err("No module loaded\n");
-		return -EINVAL;
-	}
-
-	return __ftrace_modify_call(rec, old_addr, addr);
+	return -EINVAL;
 }
 #endif
 
-- 
2.40.1

