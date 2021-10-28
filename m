Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D340E43E0E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4WH5Kqxz2ybD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:24:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4Vt4qMqz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:24:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hg4Vl5zmVz9sTD;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57v-vB-U9CTl; Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hg4Vl4yfvz9sSg;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95AD18B78F;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gKs8YQKQwwMa; Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.214])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2404F8B763;
 Thu, 28 Oct 2021 14:24:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19SCO7nm194396
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:24:07 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19SCO7AY194395;
 Thu, 28 Oct 2021 14:24:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v1 3/5] powerpc/ftrace: Add module_trampoline_target() for
 PPC32
Date: Thu, 28 Oct 2021 14:24:03 +0200
Message-Id: <42345f464fb465f0fc76f3090e250be8fc1729f0.1635423081.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635423844; l=3431; s=20211009;
 h=from:subject:message-id; bh=7oBsAXZEtuqZHdeGOsvjy9OJ4r1UHVRoSUNaMjipvfk=;
 b=JFNq2n600zBLunbpvb1BPcov+t5rxZT0toiSE8KiNqzb+W85TdBVNklQ+Mk9T49QSmtDps09nhTh
 +BB0TIL9AZsuLm1Y4wciS44y4T3hYgEcHpDJsKhZyGUyvKgqH9qM
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

module_trampoline_target() is used by __ftrace_modify_call().

Implement it for PPC32 so that CONFIG_DYNAMIC_FTRACE_WITH_REGS
can be activated on PPC32 as well.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/module_32.c    | 25 ++++++++++++++++++++
 arch/powerpc/kernel/trace/ftrace.c | 37 ++++--------------------------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index f417afc08d33..5dedd76346b2 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -273,6 +273,31 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+int module_trampoline_target(struct module *mod, unsigned long addr,
+			     unsigned long *target)
+{
+	unsigned int jmp[4];
+
+	/* Find where the trampoline jumps to */
+	if (copy_from_kernel_nofault(jmp, (void *)addr, sizeof(jmp)))
+		return -EFAULT;
+
+	/* verify that this is what we expect it to be */
+	if ((jmp[0] & 0xffff0000) != PPC_RAW_LIS(_R12, 0) ||
+	    (jmp[1] & 0xffff0000) != PPC_RAW_ADDI(_R12, _R12, 0) ||
+	    jmp[2] != PPC_RAW_MTCTR(_R12) ||
+	    jmp[3] != PPC_RAW_BCTR())
+		return -EINVAL;
+
+	addr = (jmp[1] & 0xffff) | ((jmp[0] & 0xffff) << 16);
+	if (addr & 0x8000)
+		addr -= 0x10000;
+
+	*target = addr;
+
+	return 0;
+}
+
 int module_finalize_ftrace(struct module *module, const Elf_Shdr *sechdrs)
 {
 	module->arch.tramp = do_plt_call(module->core_layout.base,
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index d89c5df4f206..c1d54c18e912 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -222,9 +222,8 @@ __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
 {
 	struct ppc_inst op;
-	unsigned int jmp[4];
 	unsigned long ip = rec->ip;
-	unsigned long tramp;
+	unsigned long tramp, ptr;
 
 	if (copy_from_kernel_nofault(&op, (void *)ip, MCOUNT_INSN_SIZE))
 		return -EFAULT;
@@ -238,41 +237,13 @@ __ftrace_make_nop(struct module *mod,
 	/* lets find where the pointer goes */
 	tramp = find_bl_target(ip, op);
 
-	/*
-	 * On PPC32 the trampoline looks like:
-	 *  0x3d, 0x80, 0x00, 0x00  lis r12,sym@ha
-	 *  0x39, 0x8c, 0x00, 0x00  addi r12,r12,sym@l
-	 *  0x7d, 0x89, 0x03, 0xa6  mtctr r12
-	 *  0x4e, 0x80, 0x04, 0x20  bctr
-	 */
-
-	pr_devel("ip:%lx jumps to %lx", ip, tramp);
-
 	/* Find where the trampoline jumps to */
-	if (copy_from_kernel_nofault(jmp, (void *)tramp, sizeof(jmp))) {
-		pr_err("Failed to read %lx\n", tramp);
+	if (module_trampoline_target(mod, tramp, &ptr)) {
+		pr_err("Failed to get trampoline target\n");
 		return -EFAULT;
 	}
 
-	pr_devel(" %08x %08x ", jmp[0], jmp[1]);
-
-	/* verify that this is what we expect it to be */
-	if (((jmp[0] & 0xffff0000) != 0x3d800000) ||
-	    ((jmp[1] & 0xffff0000) != 0x398c0000) ||
-	    (jmp[2] != 0x7d8903a6) ||
-	    (jmp[3] != 0x4e800420)) {
-		pr_err("Not a trampoline\n");
-		return -EINVAL;
-	}
-
-	tramp = (jmp[1] & 0xffff) |
-		((jmp[0] & 0xffff) << 16);
-	if (tramp & 0x8000)
-		tramp -= 0x10000;
-
-	pr_devel(" %lx ", tramp);
-
-	if (tramp != addr) {
+	if (ptr != addr) {
 		pr_err("Trampoline location %08lx does not match addr\n",
 		       tramp);
 		return -EINVAL;
-- 
2.31.1

