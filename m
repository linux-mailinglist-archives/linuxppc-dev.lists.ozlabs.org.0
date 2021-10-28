Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E228143E0F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:25:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4XC6Nw2z3cZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4W34NNfz2ynX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:24:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hg4Vn2vPFz9sSx;
 Thu, 28 Oct 2021 14:24:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRA73A85BokB; Thu, 28 Oct 2021 14:24:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hg4Vl5ZlMz9sT8;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A70F08B78D;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FRd3rnfdGINA; Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.214])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 292CA8B788;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19SCO7DT194400
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:24:08 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19SCO78r194399;
 Thu, 28 Oct 2021 14:24:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v1 4/5] powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS
 on PPC32
Date: Thu, 28 Oct 2021 14:24:04 +0200
Message-Id: <1862dc7719855cc2a4eec80920d94c955877557e.1635423081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635423844; l=7155; s=20211009;
 h=from:subject:message-id; bh=MegU4Fb52Oic66ixjx6wVEindRSBkFzs2mLGg0VOVK8=;
 b=3vtiroz49Z7x7pofiQNP6Dp3qPbo8b8DfyyTTaeKHhyu5fHxaPhyQHkKWifJHH8MZZdHf3WZQmiq
 pBmI9WzOD9pReme4pW3YwCe+Apgv63WaEZElvQrmtjoYj4y8G5WT
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike PPC64, PPC32 doesn't require any special compiler option
to get _mcount() call not clobbering registers.

Provide ftrace_regs_caller() and ftrace_regs_call() and activate
HAVE_DYNAMIC_FTRACE_WITH_REGS.

That's heavily copied from ftrace_64_mprofile.S

For the time being leave livepatching aside, it will come with
following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                  |   4 +-
 arch/powerpc/kernel/module_32.c       |   8 ++
 arch/powerpc/kernel/trace/ftrace.c    |  16 +++-
 arch/powerpc/kernel/trace/ftrace_32.S | 109 ++++++++++++++++++++++++--
 4 files changed, 125 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e43e17987b92..f66eb1984b00 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -206,7 +206,7 @@ config PPC
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
-	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_CPU)
 	select HAVE_FAST_GUP
@@ -230,7 +230,7 @@ config PPC
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
-	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
+	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS && PPC64
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index 5dedd76346b2..a491ad481d85 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -306,6 +306,14 @@ int module_finalize_ftrace(struct module *module, const Elf_Shdr *sechdrs)
 	if (!module->arch.tramp)
 		return -ENOENT;
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	module->arch.tramp_regs = do_plt_call(module->core_layout.base,
+					      (unsigned long)ftrace_regs_caller,
+					      sechdrs, module);
+	if (!module->arch.tramp_regs)
+		return -ENOENT;
+#endif
+
 	return 0;
 }
 #endif
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index c1d54c18e912..faa0fa29ac20 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -561,6 +561,8 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	int err;
 	struct ppc_inst op;
 	u32 *ip = (u32 *)rec->ip;
+	struct module *mod = rec->arch.mod;
+	unsigned long tramp;
 
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(&op, ip))
@@ -573,13 +575,23 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* If we never set up a trampoline to ftrace_caller, then bail */
-	if (!rec->arch.mod->arch.tramp) {
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
+#else
+	if (!mod->arch.tramp) {
+#endif
 		pr_err("No ftrace trampoline\n");
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (rec->flags & FTRACE_FL_REGS)
+		tramp = mod->arch.tramp_regs;
+	else
+#endif
+		tramp = mod->arch.tramp;
 	/* create the branch to the trampoline */
-	err = create_branch(&op, ip, rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
+	err = create_branch(&op, ip, tramp, BRANCH_SET_LINK);
 	if (err) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/trace/ftrace_32.S
index c7d57124cc59..0a02c0cb12d9 100644
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ b/arch/powerpc/kernel/trace/ftrace_32.S
@@ -9,6 +9,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/ftrace.h>
 #include <asm/export.h>
+#include <asm/ptrace.h>
 
 _GLOBAL(mcount)
 _GLOBAL(_mcount)
@@ -29,17 +30,21 @@ _GLOBAL(ftrace_caller)
 	MCOUNT_SAVE_FRAME
 	/* r3 ends up with link register */
 	subi	r3, r3, MCOUNT_INSN_SIZE
+	lis	r5,function_trace_op@ha
+	lwz	r5,function_trace_op@l(r5)
+	li	r6, 0
 .globl ftrace_call
 ftrace_call:
 	bl	ftrace_stub
 	nop
+	MCOUNT_RESTORE_FRAME
+ftrace_caller_common:
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 .globl ftrace_graph_call
 ftrace_graph_call:
 	b	ftrace_graph_stub
 _GLOBAL(ftrace_graph_stub)
 #endif
-	MCOUNT_RESTORE_FRAME
 	/* old link register ends up in ctr reg */
 	bctr
 
@@ -47,16 +52,92 @@ _GLOBAL(ftrace_graph_stub)
 _GLOBAL(ftrace_stub)
 	blr
 
+_GLOBAL(ftrace_regs_caller)
+	/* Save the original return address in A's stack frame */
+	stw	r0,LRSAVE(r1)
+
+	/* Create our stack frame + pt_regs */
+	stwu	r1,-INT_FRAME_SIZE(r1)
+
+	/* Save all gprs to pt_regs */
+	stw	r0, GPR0(r1)
+	stmw	r2, GPR2(r1)
+
+	/* Save previous stack pointer (r1) */
+	addi	r8, r1, INT_FRAME_SIZE
+	stw	r8, GPR1(r1)
+
+	/* Load special regs for save below */
+	mfmsr   r8
+	mfctr   r9
+	mfxer   r10
+	mfcr	r11
+
+	/* Get the _mcount() call site out of LR */
+	mflr	r7
+	/* Save it as pt_regs->nip */
+	stw     r7, _NIP(r1)
+	/* Save the read LR in pt_regs->link */
+	stw     r0, _LINK(r1)
+
+	lis	r3,function_trace_op@ha
+	lwz	r5,function_trace_op@l(r3)
+
+	/* Calculate ip from nip-4 into r3 for call below */
+	subi    r3, r7, MCOUNT_INSN_SIZE
+
+	/* Put the original return address in r4 as parent_ip */
+	mr	r4, r0
+
+	/* Save special regs */
+	stw     r8, _MSR(r1)
+	stw     r9, _CTR(r1)
+	stw     r10, _XER(r1)
+	stw     r11, _CCR(r1)
+
+	/* Load &pt_regs in r6 for call below */
+	addi    r6, r1, STACK_FRAME_OVERHEAD
+
+	/* ftrace_call(r3, r4, r5, r6) */
+.globl ftrace_regs_call
+ftrace_regs_call:
+	bl	ftrace_stub
+	nop
+
+	/* Load ctr with the possibly modified NIP */
+	lwz	r3, _NIP(r1)
+	mtctr	r3
+
+	/* Restore gprs */
+	lmw	r2, GPR2(r1)
+
+	/* Restore possibly modified LR */
+	lwz	r0, _LINK(r1)
+	mtlr	r0
+
+	/* Pop our stack frame */
+	addi r1, r1, INT_FRAME_SIZE
+
+	b	ftrace_caller_common
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(ftrace_graph_caller)
+	stwu	r1,-48(r1)
+	stw	r3, 12(r1)
+	stw	r4, 16(r1)
+	stw	r5, 20(r1)
+	stw	r6, 24(r1)
+	stw	r7, 28(r1)
+	stw	r8, 32(r1)
+	stw	r9, 36(r1)
+	stw	r10,40(r1)
+
 	addi	r5, r1, 48
-	/* load r4 with local address */
-	lwz	r4, 44(r1)
+	mfctr	r4		/* ftrace_caller has moved local addr here */
+	stw	r4, 44(r1)
+	mflr	r3		/* ftrace_caller has restored LR from stack */
 	subi	r4, r4, MCOUNT_INSN_SIZE
 
-	/* Grab the LR out of the caller stack frame */
-	lwz	r3,52(r1)
-
 	bl	prepare_ftrace_return
 	nop
 
@@ -65,9 +146,21 @@ _GLOBAL(ftrace_graph_caller)
          * Change the LR in the callers stack frame to this.
          */
 	stw	r3,52(r1)
+	mtlr	r3
+	lwz	r0,44(r1)
+	mtctr	r0
+
+	lwz	r3, 12(r1)
+	lwz	r4, 16(r1)
+	lwz	r5, 20(r1)
+	lwz	r6, 24(r1)
+	lwz	r7, 28(r1)
+	lwz	r8, 32(r1)
+	lwz	r9, 36(r1)
+	lwz	r10,40(r1)
+
+	addi	r1, r1, 48
 
-	MCOUNT_RESTORE_FRAME
-	/* old link register ends up in ctr reg */
 	bctr
 
 _GLOBAL(return_to_handler)
-- 
2.31.1

