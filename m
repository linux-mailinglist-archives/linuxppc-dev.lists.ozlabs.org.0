Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49996901D1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 10:41:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLY+4j3u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyQHt45Rjz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 18:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GLY+4j3u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyQGW2864z3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 18:39:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 568F7CE10D1;
	Mon, 10 Jun 2024 08:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04487C2BBFC;
	Mon, 10 Jun 2024 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718008783;
	bh=LdKNhGeILF1XCcYgrdj0dZhvpLSTNXN1KrsnubpYwJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLY+4j3uodQhsNhUR1Pv/rrLBKWQigEjQDC75RGv3ce+XSmxBeboVYqO+1S26b3Kf
	 RPclsbqGgEBthRHCe21PWgTehhViNXnU/libGOsnqtuuLFO0N+BqhFsOPGE+hk/QRa
	 3sTH7hBYnJs3Wh5Zq9TZD4MaDonKzVt+7unuqVQAG/uDM18sXGi9zVw6cia2IypgZM
	 rhnpCraV6J60MY6MyJXQpRcXLnZ+3lmNyGTDn+XILK/VMMT0zeDhMRpNY0MMxQiuyH
	 HgQyspsCaBHFlulGF7+FaC7UX+9yC3LhDDSVVipR9G61DKG79wGAX5ML9hyCJztkoV
	 yyBrTI+wdE5OQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH v2 2/5] powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
Date: Mon, 10 Jun 2024 14:08:15 +0530
Message-ID: <50b038f167f3fb94ed6074e029b6794bbe6e83a2.1718008093.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718008093.git.naveen@kernel.org>
References: <cover.1718008093.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pointer to struct module is only relevant for ftrace records belonging
to kernel modules. Having this field in dyn_arch_ftrace wastes memory
for all ftrace records belonging to the kernel. Remove the same in
favour of looking up the module from the ftrace record address, similar
to other architectures.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h        |  1 -
 arch/powerpc/kernel/trace/ftrace.c       | 47 ++++++++++-----
 arch/powerpc/kernel/trace/ftrace_64_pg.c | 73 +++++++++++-------------
 3 files changed, 64 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 107fc5a48456..201f9d15430a 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -26,7 +26,6 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 struct module;
 struct dyn_ftrace;
 struct dyn_arch_ftrace {
-	struct module *mod;
 };
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d8d6b4fd9a14..041be965485e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -106,20 +106,36 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
+static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
+{
+	struct module *mod = NULL;
+
+#ifdef CONFIG_MODULES
+	/*
+	 * NOTE: __module_text_address() must be called with preemption
+	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
+	 * retains its validity throughout the remainder of this code.
+	*/
+	preempt_disable();
+	mod = __module_text_address(rec->ip);
+	preempt_enable();
+
+	if (!mod)
+		pr_err("No module loaded at addr=%lx\n", rec->ip);
+#endif
+
+	return mod;
+}
+
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
 {
 	unsigned long ip = rec->ip;
 	unsigned long stub;
+	struct module *mod;
 
 	if (is_offset_in_branch_range(addr - ip)) {
 		/* Within range */
 		stub = addr;
-#ifdef CONFIG_MODULES
-	} else if (rec->arch.mod) {
-		/* Module code would be going to one of the module stubs */
-		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
-							       rec->arch.mod->arch.tramp_regs);
-#endif
 	} else if (core_kernel_text(ip)) {
 		/* We would be branching to one of our ftrace stubs */
 		stub = find_ftrace_tramp(ip);
@@ -128,7 +144,16 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 			return -EINVAL;
 		}
 	} else {
-		return -EINVAL;
+		mod = ftrace_lookup_module(rec);
+		if (mod) {
+#ifdef CONFIG_MODULES
+			/* Module code would be going to one of the module stubs */
+			stub = (addr == (unsigned long)ftrace_caller ? mod->arch.tramp :
+								       mod->arch.tramp_regs);
+#endif
+		} else {
+			return -EINVAL;
+		}
 	}
 
 	*call_inst = ftrace_create_branch_inst(ip, stub, 1);
@@ -256,14 +281,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	if (ret)
 		return ret;
 
-	if (!core_kernel_text(ip)) {
-		if (!mod) {
-			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
-			return -EFAULT;
-		}
-		rec->arch.mod = mod;
-	}
-
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
 	addr = MCOUNT_ADDR;
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.c b/arch/powerpc/kernel/trace/ftrace_64_pg.c
index 12fab1803bcf..45bd8dcf9886 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
@@ -116,6 +116,24 @@ static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 }
 
 #ifdef CONFIG_MODULES
+static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
+{
+	struct module *mod;
+	/*
+	 * NOTE: __module_text_address() must be called with preemption
+	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
+	 * retains its validity throughout the remainder of this code.
+	*/
+	preempt_disable();
+	mod = __module_text_address(rec->ip);
+	preempt_enable();
+
+	if (!mod)
+		pr_err("No module loaded at addr=%lx\n", rec->ip);
+
+	return mod;
+}
+
 static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
@@ -124,6 +142,12 @@ __ftrace_make_nop(struct module *mod,
 	unsigned long ip = rec->ip;
 	ppc_inst_t op, pop;
 
+	if (!mod) {
+		mod = ftrace_lookup_module(rec);
+		if (!mod)
+			return -EINVAL;
+	}
+
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
@@ -366,27 +390,6 @@ int ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
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
 	return __ftrace_make_nop(mod, rec, addr);
 }
 
@@ -411,7 +414,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	ppc_inst_t op[2];
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_lookup_module(rec);
+
+	if (!mod)
+		return -EINVAL;
 
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(op, ip))
@@ -533,16 +539,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EINVAL;
 	}
 
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
 	return __ftrace_make_call(rec, addr);
 }
 
@@ -555,7 +551,10 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	ppc_inst_t op;
 	unsigned long ip = rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod = rec->arch.mod;
+	struct module *mod = ftrace_lookup_module(rec);
+
+	if (!mod)
+		return -EINVAL;
 
 	/* If we never set up ftrace trampolines, then bail */
 	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
@@ -668,14 +667,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		return -EINVAL;
 	}
 
-	/*
-	 * Out of range jumps are called from modules.
-	 */
-	if (!rec->arch.mod) {
-		pr_err("No module loaded\n");
-		return -EINVAL;
-	}
-
 	return __ftrace_modify_call(rec, old_addr, addr);
 }
 #endif
-- 
2.45.2

