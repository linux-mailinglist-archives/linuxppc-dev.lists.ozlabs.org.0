Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12F930949
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:37:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vPl393gE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJbv4lNTz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:37:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vPl393gE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJRJ082Nz3dBm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:29:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F6D960B45;
	Sun, 14 Jul 2024 08:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A87AC116B1;
	Sun, 14 Jul 2024 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720945786;
	bh=Obemq1PkXgUxv63tDsRVkWT5+WyPEPtD6ghMCi268o4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vPl393gE7nH9lr1pGHwFK83POdL//kREe62eDET3A+j8Y6PHR0CM7Iu12updQuxWu
	 HdRUdtD9WVmZznfr4zEIjCOh+21F/GQyrXBHtkdB1Xt9DspdfZpfOPC1O9gYa5OaDI
	 PfLwjX9T9e9/TfB9nUL8o7rNsC4ZbQ8PKtz/w4jVtQZOWltgNgMI96QZkRvVwBdA6w
	 kSivV/qFaHVcWAO0UyCYY40oDG3FzIMy6JD+V0aAHpdu3o7Agbx7IDBBYwXEzDkRZN
	 rkvbGJ1QSVZwzne9Mb78wMqkhp/1mgH01w4F75iZbykWPr1UplrBbweWK6t8lWsR0p
	 MkuQ3+pITchjA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>,
	linux-kbuild@vger.kernel.org,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 06/17] powerpc/ftrace: Remove pointer to struct module from dyn_arch_ftrace
Date: Sun, 14 Jul 2024 13:57:42 +0530
Message-ID: <a854b14f8b3d68207e7e8c0785de148fc312a539.1720942106.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720942106.git.naveen@kernel.org>
References: <cover.1720942106.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pointer to struct module is only relevant for ftrace records belonging
to kernel modules. Having this field in dyn_arch_ftrace wastes memory
for all ftrace records belonging to the kernel. Remove the same in
favour of looking up the module from the ftrace record address, similar
to other architectures.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h        |  1 -
 arch/powerpc/kernel/trace/ftrace.c       | 49 +++++++++--------
 arch/powerpc/kernel/trace/ftrace_64_pg.c | 69 ++++++++++--------------
 3 files changed, 56 insertions(+), 63 deletions(-)

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
index 8c3e523e4f96..fe0546fbac8e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -106,28 +106,43 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	return 0;
 }
 
+#ifdef CONFIG_MODULES
+static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long addr)
+{
+	struct module *mod = NULL;
+
+	preempt_disable();
+	mod = __module_text_address(ip);
+	preempt_enable();
+
+	if (!mod)
+		pr_err("No module loaded at addr=%lx\n", ip);
+
+	return (addr == (unsigned long)ftrace_caller ? mod->arch.tramp : mod->arch.tramp_regs);
+}
+#else
+static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long addr)
+{
+	return 0;
+}
+#endif
+
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
 {
 	unsigned long ip = rec->ip;
 	unsigned long stub;
 
-	if (is_offset_in_branch_range(addr - ip)) {
+	if (is_offset_in_branch_range(addr - ip))
 		/* Within range */
 		stub = addr;
-#ifdef CONFIG_MODULES
-	} else if (rec->arch.mod) {
-		/* Module code would be going to one of the module stubs */
-		stub = (addr == (unsigned long)ftrace_caller ? rec->arch.mod->arch.tramp :
-							       rec->arch.mod->arch.tramp_regs);
-#endif
-	} else if (core_kernel_text(ip)) {
+	else if (core_kernel_text(ip))
 		/* We would be branching to one of our ftrace stubs */
 		stub = find_ftrace_tramp(ip);
-		if (!stub) {
-			pr_err("0x%lx: No ftrace stubs reachable\n", ip);
-			return -EINVAL;
-		}
-	} else {
+	else
+		stub = ftrace_lookup_module_stub(ip, addr);
+
+	if (!stub) {
+		pr_err("0x%lx: No ftrace stubs reachable\n", ip);
 		return -EINVAL;
 	}
 
@@ -262,14 +277,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
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
index 12fab1803bcf..8a551dfca3d0 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
@@ -116,6 +116,20 @@ static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 }
 
 #ifdef CONFIG_MODULES
+static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
+{
+	struct module *mod;
+
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
@@ -124,6 +138,12 @@ __ftrace_make_nop(struct module *mod,
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
@@ -366,27 +386,6 @@ int ftrace_make_nop(struct module *mod,
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
 
@@ -411,7 +410,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
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
@@ -533,16 +535,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
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
 
@@ -555,7 +547,10 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
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
@@ -668,14 +663,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
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

