Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C035C57C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJn1H676vz3cFV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:43:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJn0763T1z2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:42:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJmzz46Ldz9tyR4;
 Mon, 12 Apr 2021 13:42:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zb31xR56gt4o; Mon, 12 Apr 2021 13:42:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJmzz39qkz9tyQT;
 Mon, 12 Apr 2021 13:42:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 784068B78E;
 Mon, 12 Apr 2021 13:42:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cbK32PceHyo9; Mon, 12 Apr 2021 13:42:12 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D1B18B78D;
 Mon, 12 Apr 2021 13:42:12 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E26DC67A06; Mon, 12 Apr 2021 11:42:11 +0000 (UTC)
Message-Id: <e2fbccd1a0b4e8ed7e12936e03be76588202c7a0.1618227677.git.christophe.leroy@csgroup.eu>
In-Reply-To: <857ceb23b6a614aea2522e770b067593d5f9e906.1618227677.git.christophe.leroy@csgroup.eu>
References: <857ceb23b6a614aea2522e770b067593d5f9e906.1618227677.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/4] powerpc: Rename probe_kernel_read_inst()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Mon, 12 Apr 2021 11:42:11 +0000 (UTC)
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

When probe_kernel_read_inst() was created, it was to mimic
probe_kernel_read() function.

Since then, probe_kernel_read() has been renamed
copy_from_kernel_nofault().

Rename probe_kernel_read_inst() into copy_from_kernel_nofault_inst().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h    |  3 +--
 arch/powerpc/kernel/align.c        |  2 +-
 arch/powerpc/kernel/trace/ftrace.c | 22 +++++++++++-----------
 arch/powerpc/lib/inst.c            |  3 +--
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index a40c3913a4a3..a8ab0715f50e 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -177,7 +177,6 @@ static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_ins
 	__str;				\
 })
 
-int probe_kernel_read_inst(struct ppc_inst *inst,
-			   struct ppc_inst *src);
+int copy_from_kernel_nofault_inst(struct ppc_inst *inst, struct ppc_inst *src);
 
 #endif /* _ASM_POWERPC_INST_H */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index a97d5f1a3905..df3b55fec27d 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -311,7 +311,7 @@ int fix_alignment(struct pt_regs *regs)
 	CHECK_FULL_REGS(regs);
 
 	if (is_kernel_addr(regs->nip))
-		r = probe_kernel_read_inst(&instr, (void *)regs->nip);
+		r = copy_from_kernel_nofault_inst(&instr, (void *)regs->nip);
 	else
 		r = __get_user_instr(instr, (void __user *)regs->nip);
 
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 42761ebec9f7..9daa4eb812ce 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -68,7 +68,7 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 	 */
 
 	/* read the text we want to modify */
-	if (probe_kernel_read_inst(&replaced, (void *)ip))
+	if (copy_from_kernel_nofault_inst(&replaced, (void *)ip))
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
@@ -130,7 +130,7 @@ __ftrace_make_nop(struct module *mod,
 	struct ppc_inst op, pop;
 
 	/* read where this goes */
-	if (probe_kernel_read_inst(&op, (void *)ip)) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -164,7 +164,7 @@ __ftrace_make_nop(struct module *mod,
 	/* When using -mkernel_profile there is no load to jump over */
 	pop = ppc_inst(PPC_INST_NOP);
 
-	if (probe_kernel_read_inst(&op, (void *)(ip - 4))) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
 	}
@@ -197,7 +197,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
 	 * on first pass after boot we will see mflr r0.
 	 */
-	if (probe_kernel_read_inst(&op, (void *)(ip + 4))) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)(ip + 4))) {
 		pr_err("Fetching op failed.\n");
 		return -EFAULT;
 	}
@@ -349,7 +349,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 			return -1;
 
 	/* New trampoline -- read where this goes */
-	if (probe_kernel_read_inst(&op, (void *)tramp)) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
 		return -1;
 	}
@@ -399,7 +399,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	struct ppc_inst op;
 
 	/* Read where this goes */
-	if (probe_kernel_read_inst(&op, (void *)ip)) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -526,10 +526,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	struct module *mod = rec->arch.mod;
 
 	/* read where this goes */
-	if (probe_kernel_read_inst(op, ip))
+	if (copy_from_kernel_nofault_inst(op, ip))
 		return -EFAULT;
 
-	if (probe_kernel_read_inst(op + 1, ip + 4))
+	if (copy_from_kernel_nofault_inst(op + 1, ip + 4))
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
@@ -592,7 +592,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
-	if (probe_kernel_read_inst(&op, (void *)ip))
+	if (copy_from_kernel_nofault_inst(&op, (void *)ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -648,7 +648,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Make sure we have a nop */
-	if (probe_kernel_read_inst(&op, ip)) {
+	if (copy_from_kernel_nofault_inst(&op, ip)) {
 		pr_err("Unable to read ftrace location %p\n", ip);
 		return -EFAULT;
 	}
@@ -726,7 +726,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* read where this goes */
-	if (probe_kernel_read_inst(&op, (void *)ip)) {
+	if (copy_from_kernel_nofault_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
index 0dff3ac2d45f..ec7f6bae8b3c 100644
--- a/arch/powerpc/lib/inst.c
+++ b/arch/powerpc/lib/inst.c
@@ -8,8 +8,7 @@
 #include <asm/inst.h>
 #include <asm/ppc-opcode.h>
 
-int probe_kernel_read_inst(struct ppc_inst *inst,
-			   struct ppc_inst *src)
+int copy_from_kernel_nofault_inst(struct ppc_inst *inst, struct ppc_inst *src)
 {
 	unsigned int val, suffix;
 	int err;
-- 
2.25.0

