Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2069651E4EF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ7y05Jjz3fws
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ0p5cNfz3dp2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:48:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzb0wcJz9sVd;
 Sat,  7 May 2022 08:47:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYL29NAPoX1q; Sat,  7 May 2022 08:47:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzF2q94z9sWK;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5468D8B76D;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KO6VbsAdQzim; Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41D7D8B7AD;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476keAX1320514
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:40 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kebU1320513;
 Sat, 7 May 2022 08:46:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
Date: Sat,  7 May 2022 08:46:13 +0200
Message-Id: <96f53c237316dab4b1b8c682685266faa92da816.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=5657; s=20211009;
 h=from:subject:message-id; bh=kjbdQgVSoXinGhSt3swSZOi5xLdbYAjoi00hLjURjbg=;
 b=HE2HJ8ZtrdSecvZ7pdxJuX7s3tQZs3Fh3m7yPPxNl5/LdHqHQ0SwVAzNtckVCEEKp0M4Y9rGIaR7
 wIM+s6wwCjdE77Gr6/zhFnEO22wYJiCrMQ7wEx07DLGe5LJwweZ0
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

Since c93d4f6ecf4b ("powerpc/ftrace: Add module_trampoline_target()
for PPC32"), __ftrace_make_nop() for PPC32 is very similar to the
one for PPC64.

Same for __ftrace_make_call().

Make them common.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2:
- Fixed comment to -mprofile-kernel versus -mkernel_profile
- Replaced a couple of #ifdef with CONFIG_PPC64_ELF_ABI_V1 as suggested by Naveen.
---
 arch/powerpc/kernel/trace/ftrace.c | 108 +++--------------------------
 1 file changed, 8 insertions(+), 100 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 0b199fc9cfd3..531da4d93c58 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -114,7 +114,6 @@ static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 }
 
 #ifdef CONFIG_MODULES
-#ifdef CONFIG_PPC64
 static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
@@ -154,10 +153,11 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
-#ifdef CONFIG_MPROFILE_KERNEL
-	/* When using -mkernel_profile there is no load to jump over */
+	/* When using -mprofile-kernel or PPC32 there is no load to jump over */
 	pop = ppc_inst(PPC_RAW_NOP());
 
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_MPROFILE_KERNEL
 	if (copy_inst_from_kernel_nofault(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
@@ -201,6 +201,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
+#endif /* PPC64 */
 
 	if (patch_instruction((u32 *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
@@ -209,48 +210,6 @@ __ftrace_make_nop(struct module *mod,
 
 	return 0;
 }
-
-#else /* !PPC64 */
-static int
-__ftrace_make_nop(struct module *mod,
-		  struct dyn_ftrace *rec, unsigned long addr)
-{
-	ppc_inst_t op;
-	unsigned long ip = rec->ip;
-	unsigned long tramp, ptr;
-
-	if (copy_from_kernel_nofault(&op, (void *)ip, MCOUNT_INSN_SIZE))
-		return -EFAULT;
-
-	/* Make sure that that this is still a 24bit jump */
-	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
-		return -EINVAL;
-	}
-
-	/* lets find where the pointer goes */
-	tramp = find_bl_target(ip, op);
-
-	/* Find where the trampoline jumps to */
-	if (module_trampoline_target(mod, tramp, &ptr)) {
-		pr_err("Failed to get trampoline target\n");
-		return -EFAULT;
-	}
-
-	if (ptr != addr) {
-		pr_err("Trampoline location %08lx does not match addr\n",
-		       tramp);
-		return -EINVAL;
-	}
-
-	op = ppc_inst(PPC_RAW_NOP());
-
-	if (patch_instruction((u32 *)ip, op))
-		return -EPERM;
-
-	return 0;
-}
-#endif /* PPC64 */
 #endif /* CONFIG_MODULES */
 
 static unsigned long find_ftrace_tramp(unsigned long ip)
@@ -437,13 +396,12 @@ int ftrace_make_nop(struct module *mod,
 }
 
 #ifdef CONFIG_MODULES
-#ifdef CONFIG_PPC64
 /*
  * Examine the existing instructions for __ftrace_make_call.
  * They should effectively be a NOP, and follow formal constraints,
  * depending on the ABI. Return false if they don't.
  */
-#ifndef CONFIG_MPROFILE_KERNEL
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
@@ -465,7 +423,7 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
+	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
 		return 0;
 	return 1;
@@ -484,8 +442,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	if (copy_inst_from_kernel_nofault(op, ip))
 		return -EFAULT;
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	if (copy_inst_from_kernel_nofault(op + 1, ip + 4))
 		return -EFAULT;
+#endif
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
 		pr_err("Unexpected call sequence at %p: %s %s\n",
@@ -531,58 +491,6 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	return 0;
 }
-
-#else  /* !CONFIG_PPC64: */
-static int
-__ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
-{
-	int err;
-	ppc_inst_t op;
-	u32 *ip = (u32 *)rec->ip;
-	struct module *mod = rec->arch.mod;
-	unsigned long tramp;
-
-	/* read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, ip))
-		return -EFAULT;
-
-	/* It should be pointing to a nop */
-	if (!ppc_inst_equal(op,  ppc_inst(PPC_RAW_NOP()))) {
-		pr_err("Expected NOP but have %s\n", ppc_inst_as_str(op));
-		return -EINVAL;
-	}
-
-	/* If we never set up a trampoline to ftrace_caller, then bail */
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
-#else
-	if (!mod->arch.tramp) {
-#endif
-		pr_err("No ftrace trampoline\n");
-		return -EINVAL;
-	}
-
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
-	if (rec->flags & FTRACE_FL_REGS)
-		tramp = mod->arch.tramp_regs;
-	else
-#endif
-		tramp = mod->arch.tramp;
-	/* create the branch to the trampoline */
-	err = create_branch(&op, ip, tramp, BRANCH_SET_LINK);
-	if (err) {
-		pr_err("REL24 out of range!\n");
-		return -EINVAL;
-	}
-
-	pr_devel("write to %lx\n", rec->ip);
-
-	if (patch_instruction(ip, op))
-		return -EPERM;
-
-	return 0;
-}
-#endif /* CONFIG_PPC64 */
 #endif /* CONFIG_MODULES */
 
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
-- 
2.35.1

