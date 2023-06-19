Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCA735114
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 11:57:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZ9SyYIP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql4tf1jMyz3c3g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 19:57:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZ9SyYIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4n86FW7z30XX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:52:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2215F60A50;
	Mon, 19 Jun 2023 09:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B2DC433C8;
	Mon, 19 Jun 2023 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687168346;
	bh=JnzX964nCR1Bazu/wmQxgrJo1YVRNdq0Lxqc7/Cnfpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZ9SyYIPDJHrmXVV0mbKNb6xVNE6eFOe2LggYCQv7MVerj5MN8U7p8+E1qn+L5z5n
	 OwIdxyhhxTkuu3zos6o1uyZajSs91a+zJoX0IrAsxsn45Umi3TfE45fCc8yuITV+FR
	 mgaqYT7/Lz11yS4XMCKTJ0bMalfqvfmyaPHbsDR2OgEvG5/DmwiQIiNtxKiZDAN2tM
	 DOjvO0B4Vl94rxLxpFgMwz+FUjgnJ2q5LRWSarytjRjP70MHFjfn2Y9sEGAKUxiur1
	 ZrWdD5SwLUTwE4vh+3bPmmScm7QpCRtLO8ZmTd2XJ8voFW+t6LxrVHgSCHIJjgdxFP
	 j0SQvp5idemcg==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 15/17] powerpc/ftrace: Implement ftrace_replace_code()
Date: Mon, 19 Jun 2023 15:17:33 +0530
Message-Id: <c28f852225646b0561bbf3c1d22d03f041ace8e0.1687166935.git.naveen@kernel.org>
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

Implement ftrace_replace_code() to consolidate logic from the different
ftrace patching routines: ftrace_make_nop(), ftrace_make_call() and
ftrace_modify_call(). Note that ftrace_make_call() is still required
primarily to handle patching modules during their load time. The other
two routines should no longer be called.

This lays the groundwork to enable better control in patching ftrace
locations, including the ability to nop-out preceding profiling
instructions when ftrace is disabled.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace.c | 173 ++++++++++++++++-------------
 1 file changed, 96 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 422dd760fbe013..cf9dce77527920 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -94,104 +94,123 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
+static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
+{
+	unsigned long ip = rec->ip;
+	unsigned long stub;
+
+	if (is_offset_in_branch_range(addr - ip)) {
+		/* Within range */
+		stub = addr;
+#ifdef CONFIG_MODULES
+	} else if (rec->arch.mod) {
+		/* Module code would be going to one of the module stubs */
+		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
+							       rec->arch.mod->arch.tramp_regs);
+#endif
+	} else if (core_kernel_text(ip)) {
+		/* We would be branching to one of our ftrace stubs */
+		stub = find_ftrace_tramp(ip);
+		if (!stub) {
+			pr_err("0x%lx: No ftrace stubs reachable\n", ip);
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	*call_inst = ftrace_create_branch_inst(ip, stub, 1);
+	return 0;
+}
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
-	unsigned long tramp, tramp_old, ip = rec->ip;
-	ppc_inst_t old, new;
-	struct module *mod;
-
-	if (is_offset_in_branch_range(old_addr - ip) && is_offset_in_branch_range(addr - ip)) {
-		/* Within range */
-		old = ftrace_create_branch_inst(ip, old_addr, 1);
-		new = ftrace_create_branch_inst(ip, addr, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip)) {
-		/*
-		 * We always patch out of range locations to go to the regs
-		 * variant, so there is nothing to do here
-		 */
-		return 0;
-	} else if (IS_ENABLED(CONFIG_MODULES)) {
-		/* Module code would be going to one of the module stubs */
-		mod = rec->arch.mod;
-		if (addr == (unsigned long)ftrace_caller) {
-			tramp_old = mod->arch.tramp_regs;
-			tramp = mod->arch.tramp;
-		} else {
-			tramp_old = mod->arch.tramp;
-			tramp = mod->arch.tramp_regs;
-		}
-		old = ftrace_create_branch_inst(ip, tramp_old, 1);
-		new = ftrace_create_branch_inst(ip, tramp, 1);
-		return ftrace_modify_code(ip, old, new);
-	}
-
+	/* This should never be called since we override ftrace_replace_code() */
+	WARN_ON(1);
 	return -EINVAL;
 }
 #endif
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned long tramp, ip = rec->ip;
 	ppc_inst_t old, new;
-	struct module *mod;
+	int ret;
+
+	/* This can only ever be called during module load */
+	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec->ip)))
+		return -EINVAL;
 
 	old = ppc_inst(PPC_RAW_NOP());
-	if (is_offset_in_branch_range(addr - ip)) {
-		/* Within range */
-		new = ftrace_create_branch_inst(ip, addr, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip)) {
-		/* We would be branching to one of our ftrace tramps */
-		tramp = find_ftrace_tramp(ip);
-		if (!tramp) {
-			pr_err("0x%lx: No ftrace trampolines reachable\n", ip);
-			return -EINVAL;
-		}
-		new = ftrace_create_branch_inst(ip, tramp, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (IS_ENABLED(CONFIG_MODULES)) {
-		/* Module code would be going to one of the module stubs */
-		mod = rec->arch.mod;
-		tramp = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
-		new = ftrace_create_branch_inst(ip, tramp, 1);
-		return ftrace_modify_code(ip, old, new);
-	}
+	ret = ftrace_get_call_inst(rec, addr, &new);
+	if (ret)
+		return ret;
 
-	return -EINVAL;
+	return ftrace_modify_code(rec->ip, old, new);
 }
 
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned long tramp, ip = rec->ip;
-	ppc_inst_t old, new;
+	/*
+	 * This should never be called since we override ftrace_replace_code(),
+	 * as well as ftrace_init_nop()
+	 */
+	WARN_ON(1);
+	return -EINVAL;
+}
 
-	/* Nop-out the ftrace location */
-	new = ppc_inst(PPC_RAW_NOP());
-	if (is_offset_in_branch_range(addr - ip)) {
-		/* Within range */
-		old = ftrace_create_branch_inst(ip, addr, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip)) {
-		/* We would be branching to one of our ftrace tramps */
-		tramp = find_ftrace_tramp(ip);
-		if (!tramp) {
-			pr_err("0x%lx: No ftrace trampolines reachable\n", ip);
-			return -EINVAL;
+void ftrace_replace_code(int enable)
+{
+	ppc_inst_t old, new, call_inst, new_call_inst;
+	ppc_inst_t nop_inst = ppc_inst(PPC_RAW_NOP());
+	unsigned long ip, new_addr, addr;
+	struct ftrace_rec_iter *iter;
+	struct dyn_ftrace *rec;
+	int ret = 0, update;
+
+	for_ftrace_rec_iter(iter) {
+		rec = ftrace_rec_iter_record(iter);
+		ip = rec->ip;
+
+		if (rec->flags & FTRACE_FL_DISABLED && !(rec->flags & FTRACE_FL_ENABLED))
+			continue;
+
+		addr = ftrace_get_addr_curr(rec);
+		new_addr = ftrace_get_addr_new(rec);
+		update = ftrace_update_record(rec, enable);
+
+		switch (update) {
+		case FTRACE_UPDATE_IGNORE:
+		default:
+			continue;
+		case FTRACE_UPDATE_MODIFY_CALL:
+			ret = ftrace_get_call_inst(rec, new_addr, &new_call_inst);
+			ret |= ftrace_get_call_inst(rec, addr, &call_inst);
+			old = call_inst;
+			new = new_call_inst;
+			break;
+		case FTRACE_UPDATE_MAKE_NOP:
+			ret = ftrace_get_call_inst(rec, addr, &call_inst);
+			old = call_inst;
+			new = nop_inst;
+			break;
+		case FTRACE_UPDATE_MAKE_CALL:
+			ret = ftrace_get_call_inst(rec, new_addr, &call_inst);
+			old = nop_inst;
+			new = call_inst;
+			break;
 		}
-		old = ftrace_create_branch_inst(ip, tramp, 1);
-		return ftrace_modify_code(ip, old, new);
-	} else if (IS_ENABLED(CONFIG_MODULES)) {
-		/* Module code would be going to one of the module stubs */
-		if (!mod)
-			mod = rec->arch.mod;
-		tramp = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
-		old = ftrace_create_branch_inst(ip, tramp, 1);
-		return ftrace_modify_code(ip, old, new);
+
+		if (!ret)
+			ret = ftrace_modify_code(ip, old, new);
+		if (ret)
+			goto out;
 	}
 
-	return -EINVAL;
+out:
+	if (ret)
+		ftrace_bug(ret, rec);
+	return;
 }
 
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
-- 
2.40.1

