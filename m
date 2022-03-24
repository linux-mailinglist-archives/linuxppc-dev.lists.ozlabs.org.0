Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA034E654A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSQD6Fq5z3bdn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:33:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSMY3MS2z3bSh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:31:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSM41byKz9sTk;
 Thu, 24 Mar 2022 15:30:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeWIDnk8A2ig; Thu, 24 Mar 2022 15:30:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLy4QSXz9sTd;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 840CC8B763;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HVoIDf7g5BBb; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A57548B78B;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUhFQ1811742
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:43 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUhLs1811741;
 Thu, 24 Mar 2022 15:30:43 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 16/22] powerpc/ftrace: Minimise number of #ifdefs
Date: Thu, 24 Mar 2022 15:30:06 +0100
Message-Id: <7ef4015badd5f1861cfc327a7641c84e0e5630ca.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132151; l=14141; s=20211009;
 h=from:subject:message-id; bh=xNDuxmOg37Uw0k7n3Xp9UFxk0u4Ye+KrXTF3IF7X/Bs=;
 b=WPkKV/kUoGre81+Uh0uezXtxErpcZUNIgEWY+QXRJIvKD8hIuYVH//GuIoRyvVny6LNmYbB20AyO
 TMSAdwf2DkvW6L7qTba2NiCo3fYGXeRJUk08IE5f7BqW5uIdg4CK
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A lot of #ifdefs can be replaced by IS_ENABLED()

Do so.

This requires to have kernel_toc_addr() defined at all time
and PPC_INST_LD_TOC as well.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/code-patching.h |   2 -
 arch/powerpc/include/asm/module.h        |   2 -
 arch/powerpc/include/asm/sections.h      |  24 +--
 arch/powerpc/kernel/trace/ftrace.c       | 201 ++++++++++++-----------
 4 files changed, 113 insertions(+), 116 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 4260e89f62b1..071fcbec31c5 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -217,7 +217,6 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 	return addr;
 }
 
-#ifdef CONFIG_PPC64
 /*
  * Some instruction encodings commonly used in dynamic ftracing
  * and function live patching.
@@ -234,6 +233,5 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 
 /* usually preceded by a mflr r0 */
 #define PPC_INST_STD_LR		PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF)
-#endif /* CONFIG_PPC64 */
 
 #endif /* _ASM_POWERPC_CODE_PATCHING_H */
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index e6f5963fd96e..700d7ecd9012 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -41,9 +41,7 @@ struct mod_arch_specific {
 
 #ifdef CONFIG_FUNCTION_TRACER
 	unsigned long tramp;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	unsigned long tramp_regs;
-#endif
 #endif
 
 	/* List of BUG addresses, source line numbers and filenames */
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 8be2c491c733..6980eaeb16fe 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -29,18 +29,6 @@ extern char start_virt_trampolines[];
 extern char end_virt_trampolines[];
 #endif
 
-/*
- * This assumes the kernel is never compiled -mcmodel=small or
- * the total .toc is always less than 64k.
- */
-static inline unsigned long kernel_toc_addr(void)
-{
-	unsigned long toc_ptr;
-
-	asm volatile("mr %0, 2" : "=r" (toc_ptr));
-	return toc_ptr;
-}
-
 static inline int overlaps_interrupt_vector_text(unsigned long start,
 							unsigned long end)
 {
@@ -60,5 +48,17 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
 
 #endif
 
+/*
+ * This assumes the kernel is never compiled -mcmodel=small or
+ * the total .toc is always less than 64k.
+ */
+static inline unsigned long kernel_toc_addr(void)
+{
+	unsigned long toc_ptr;
+
+	asm volatile("mr %0, 2" : "=r" (toc_ptr));
+	return toc_ptr;
+}
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_SECTIONS_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ffedf8c82ea8..4dd30e396026 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -150,55 +150,55 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
-	/* When using -mkernel_profile or PPC32 there is no load to jump over */
-	pop = ppc_inst(PPC_RAW_NOP());
+	if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
+		/* When using -mkernel_profile or PPC32 there is no load to jump over */
+		pop = ppc_inst(PPC_RAW_NOP());
 
-#ifdef CONFIG_PPC64
-#ifdef CONFIG_MPROFILE_KERNEL
-	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
-		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
-		return -EFAULT;
-	}
+		if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
+			pr_err("Fetching instruction at %lx failed.\n", ip - 4);
+			return -EFAULT;
+		}
 
-	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
-	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
-		pr_err("Unexpected instruction %s around bl _mcount\n",
-		       ppc_inst_as_str(op));
-		return -EINVAL;
-	}
-#else
-	/*
-	 * Our original call site looks like:
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
-	 */
+		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
+		if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
+		    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
+			pr_err("Unexpected instruction %s around bl _mcount\n",
+			       ppc_inst_as_str(op));
+			return -EINVAL;
+		}
+	} else if (IS_ENABLED(CONFIG_PPC64)) {
+		/*
+		 * Our original call site looks like:
+		 *
+		 * bl <tramp>
+		 * ld r2,XX(r1)
+		 *
+		 * Milton Miller pointed out that we can not simply nop the branch.
+		 * If a task was preempted when calling a trace function, the nops
+		 * will remove the way to restore the TOC in r2 and the r2 TOC will
+		 * get corrupted.
+		 *
+		 * Use a b +8 to jump over the load.
+		 */
 
-	pop = ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
+		pop = ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
 
-	/*
-	 * Check what is in the next instruction. We can see ld r2,40(r1), but
-	 * on first pass after boot we will see mflr r0.
-	 */
-	if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))) {
-		pr_err("Fetching op failed.\n");
-		return -EFAULT;
-	}
+		/*
+		 * Check what is in the next instruction. We can see ld r2,40(r1), but
+		 * on first pass after boot we will see mflr r0.
+		 */
+		if (copy_inst_from_kernel_nofault(&op, (void *)(ip + 4))) {
+			pr_err("Fetching op failed.\n");
+			return -EFAULT;
+		}
 
-	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-		pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
-		return -EINVAL;
+		if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
+			pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
+			return -EINVAL;
+		}
+	} else {
+		pop = ppc_inst(PPC_RAW_NOP());
 	}
-#endif /* CONFIG_MPROFILE_KERNEL */
-#endif /* PPC64 */
 
 	if (patch_instruction((u32 *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
@@ -207,6 +207,11 @@ __ftrace_make_nop(struct module *mod,
 
 	return 0;
 }
+#else
+static int __ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
+{
+	return 0;
+}
 #endif /* CONFIG_MODULES */
 
 static unsigned long find_ftrace_tramp(unsigned long ip)
@@ -279,11 +284,11 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 	}
 
 	/* Let's re-write the tramp to go to ftrace_[regs_]caller */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	ptr = ppc_global_function_entry((void *)ftrace_regs_caller);
-#else
-	ptr = ppc_global_function_entry((void *)ftrace_caller);
-#endif
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		ptr = ppc_global_function_entry((void *)ftrace_regs_caller);
+	else
+		ptr = ppc_global_function_entry((void *)ftrace_caller);
+
 	if (patch_branch((u32 *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
@@ -352,10 +357,12 @@ int ftrace_make_nop(struct module *mod,
 		old = ftrace_call_replace(ip, addr, 1);
 		new = ppc_inst(PPC_RAW_NOP());
 		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip))
+	} else if (core_kernel_text(ip)) {
 		return __ftrace_make_nop_kernel(rec, addr);
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		return -EINVAL;
+	}
 
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 * We should either already have a pointer to the module
@@ -378,10 +385,6 @@ int ftrace_make_nop(struct module *mod,
 		mod = rec->arch.mod;
 
 	return __ftrace_make_nop(mod, rec, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
 
 #ifdef CONFIG_MODULES
@@ -411,10 +414,9 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	if (copy_inst_from_kernel_nofault(op, ip))
 		return -EFAULT;
 
-#ifndef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (copy_inst_from_kernel_nofault(op + 1, ip + 4))
+	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) &&
+	    copy_inst_from_kernel_nofault(op + 1, ip + 4))
 		return -EFAULT;
-#endif
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
 		pr_err("Unexpected call sequence at %p: %s %s\n",
@@ -423,20 +425,15 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* If we never set up ftrace trampoline(s), then bail */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
-#else
-	if (!mod->arch.tramp) {
-#endif
+	if (!mod->arch.tramp ||
+	    (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !mod->arch.tramp_regs)) {
 		pr_err("No ftrace trampoline\n");
 		return -EINVAL;
 	}
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (rec->flags & FTRACE_FL_REGS)
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && rec->flags & FTRACE_FL_REGS)
 		tramp = mod->arch.tramp_regs;
 	else
-#endif
 		tramp = mod->arch.tramp;
 
 	if (module_trampoline_target(mod, tramp, &ptr)) {
@@ -460,6 +457,11 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	return 0;
 }
+#else
+static int __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	return 0;
+}
 #endif /* CONFIG_MODULES */
 
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
@@ -472,16 +474,12 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	entry = ppc_global_function_entry((void *)ftrace_caller);
 	ptr = ppc_global_function_entry((void *)addr);
 
-	if (ptr != entry) {
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (ptr != entry && IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
 		entry = ppc_global_function_entry((void *)ftrace_regs_caller);
-		if (ptr != entry) {
-#endif
-			pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
-			return -EINVAL;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-		}
-#endif
+
+	if (ptr != entry) {
+		pr_err("Unknown ftrace addr to patch: %ps\n", (void *)ptr);
+		return -EINVAL;
 	}
 
 	/* Make sure we have a nop */
@@ -524,10 +522,13 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		old = ppc_inst(PPC_RAW_NOP());
 		new = ftrace_call_replace(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
-	} else if (core_kernel_text(ip))
+	} else if (core_kernel_text(ip)) {
 		return __ftrace_make_call_kernel(rec, addr);
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		/* We should not get here without modules */
+		return -EINVAL;
+	}
 
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 * Being that we are converting from nop, it had better
@@ -539,10 +540,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	return __ftrace_make_call(rec, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
@@ -633,6 +630,11 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 
 	return 0;
 }
+#else
+static int __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
+{
+	return 0;
+}
 #endif
 
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
@@ -657,9 +659,11 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		 * variant, so there is nothing to do here
 		 */
 		return 0;
+	} else if (!IS_ENABLED(CONFIG_MODULES)) {
+		/* We should not get here without modules */
+		return -EINVAL;
 	}
 
-#ifdef CONFIG_MODULES
 	/*
 	 * Out of range jumps are called from modules.
 	 */
@@ -669,10 +673,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	return __ftrace_modify_call(rec, old_addr, addr);
-#else
-	/* We should not get here without modules */
-	return -EINVAL;
-#endif /* CONFIG_MODULES */
 }
 #endif
 
@@ -686,15 +686,13 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	/* Also update the regs callback function */
-	if (!ret) {
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS) && !ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
 		old = ppc_inst_read((u32 *)&ftrace_regs_call);
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
-#endif
 
 	return ret;
 }
@@ -710,6 +708,9 @@ void arch_ftrace_update_code(int command)
 
 #ifdef CONFIG_PPC64
 #define PACATOC offsetof(struct paca_struct, kernel_toc)
+#else
+#define PACATOC 0
+#endif
 
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
 
@@ -724,12 +725,18 @@ int __init ftrace_dyn_arch_init(void)
 		PPC_RAW_MTCTR(_R12),
 		PPC_RAW_BCTR()
 	};
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	unsigned long addr = ppc_global_function_entry((void *)ftrace_regs_caller);
-#else
-	unsigned long addr = ppc_global_function_entry((void *)ftrace_caller);
-#endif
-	long reladdr = addr - kernel_toc_addr();
+	unsigned long addr;
+	long reladdr;
+
+	if (IS_ENABLED(CONFIG_PPC32))
+		return 0;
+
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		addr = ppc_global_function_entry((void *)ftrace_regs_caller);
+	else
+		addr = ppc_global_function_entry((void *)ftrace_caller);
+
+	reladdr = addr - kernel_toc_addr();
 
 	if (reladdr >= SZ_2G || reladdr < -SZ_2G) {
 		pr_err("Address of %ps out of range of kernel_toc.\n",
@@ -746,12 +753,6 @@ int __init ftrace_dyn_arch_init(void)
 
 	return 0;
 }
-#else
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-#endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 
-- 
2.35.1

