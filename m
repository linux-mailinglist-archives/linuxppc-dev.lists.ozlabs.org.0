Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 085ED19F19C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:31:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkKM5lJ5zDqNs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FsNhyqdD; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjs56mvgzDqsC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:33 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c5so1342001pgi.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ADCmYaPju0Tev12EQQ9rfg5ji+5ofbt5FbYXikGdOr4=;
 b=FsNhyqdDwrbcAG/VV8neTEWAnY9/bpCiAXf+uJnmUSw9GgPnbUyOB/rNVCH7HthAVK
 pO2SbhNPZGVCphBVAbrNg2Sg7nhG2lICqyuHuN0y+sNV7R1K9w2clz792vn8ed1JV8Rg
 zlBNC7GHxtxA+l+VBUcM+6Dxpd95HcBfnDzGi6vl1jRPzYCrAbytyewnoYr90YuRcYg6
 w/EmoovFG4xOy8jdCTWkEI6woRSe4D5MEPMvYCHdhV/JMuMKUWPDpbaha+F7yXnDgWj5
 OQ2mLh2LGpMuvB2nyG2Q4c4wWsEqnl4HhDK3xJFhXbLlFG5qkoaDPCaDQgA4iR2X8BWx
 SzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ADCmYaPju0Tev12EQQ9rfg5ji+5ofbt5FbYXikGdOr4=;
 b=Lu7r8Bjj3K9JPsKEm1bBq5sgLvum8aUeVrLLICm/AvdBmyylkgCLy3tB9ynSGp+WBV
 BX03hqEMXK3NlZwZA/kgujh8QMewEDxT7KdxpXidBicFwfvLI/Px51DddUXwREnJOh4n
 kq25JcrlX69F/RXKQXUpLrfck2C9OtJhQwHmIGelZCKOeILyh7rwgEMeqkCIND5qHyR7
 Kfxk1dY7AVfOcWaqhIMFRithlwAAuSM15xvaLzdNXxemL+HYiFCymDbKDsJ6iWuGWePC
 qd79FTLd29PlNM/ly2oqwVavvEtlFpDK66KYen/8cXiJ1w146dYIqPSOBr97Og6JwXnQ
 SvMw==
X-Gm-Message-State: AGi0PuZkwGjzchPJ7PXoMet16okmZlxZs0tiu+V0TzIZQUwTZ+TO4TDW
 LICcb7LPULxTdOCXV15Z20u3Ok2nSFw=
X-Google-Smtp-Source: APiQypLN6Aq63aPQEg6aodr5Z/imNRU5ne1ZrRw7iMA3ShWm0t06QO5kwLOYoxAQhLPCGE+tnd5R4g==
X-Received: by 2002:a63:d904:: with SMTP id r4mr14392141pgg.323.1586160631059; 
 Mon, 06 Apr 2020 01:10:31 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:30 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/21] powerpc: Use a function for reading instructions
Date: Mon,  6 Apr 2020 18:09:25 +1000
Message-Id: <20200406080936.7180-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prefixed instructions will mean there are instructions of different
length. As a result dereferencing a pointer to an instruction will not
necessarily give the desired result. Introduce a function for reading
instructions from memory into the instruction data type.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: - Rename read_inst() -> probe_kernel_read_inst()
    - No longer modify uprobe probe type in this patch
---
 arch/powerpc/include/asm/inst.h    |  5 +++++
 arch/powerpc/kernel/kprobes.c      | 11 ++++------
 arch/powerpc/kernel/mce_power.c    |  2 +-
 arch/powerpc/kernel/optprobes.c    |  4 ++--
 arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++-----------
 arch/powerpc/lib/code-patching.c   | 23 ++++++++++-----------
 arch/powerpc/lib/feature-fixups.c  |  2 +-
 arch/powerpc/xmon/xmon.c           |  6 +++---
 8 files changed, 48 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index a71decf5f871..369b35ce964c 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -27,6 +27,11 @@ static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
+static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
+{
+	return *ptr;
+}
+
 static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 {
 	return !memcmp(&x, &y, sizeof(struct ppc_inst));
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9ed996cb0589..ff53e5ef7e40 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-	struct ppc_inst insn = *(struct ppc_inst *)p->addr;
+	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -125,11 +125,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		memcpy(p->ainsn.insn, p->addr,
-				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
-		p->opcode = *p->addr;
-		flush_icache_range((unsigned long)p->ainsn.insn,
-			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
+		patch_instruction((struct ppc_inst *)p->ainsn.insn, insn);
+		p->opcode = ppc_inst_val(insn);
 	}
 
 	p->ainsn.boostable = 0;
@@ -217,7 +214,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	struct ppc_inst insn = *(struct ppc_inst *)p->ainsn.insn;
+	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 7118b46a6543..859b602fa270 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	pfn = addr_to_pfn(regs, regs->nip);
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
-		instr = *(struct ppc_inst *)(instr_addr);
+		instr = ppc_inst_read((struct ppc_inst *)instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index b61bbcee84f4..684640b8fa2e 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -100,8 +100,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * Ensure that the instruction is not a conditional branch,
 	 * and that can be emulated.
 	 */
-	if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *(struct ppc_inst *)p->ainsn.insn) == 1) {
+	if (!is_conditional_branch(ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) &&
+			analyse_instr(&op, &regs, ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 442c62fb68ff..e78742613b36 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -41,6 +41,12 @@
 #define	NUM_FTRACE_TRAMPS	8
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
+static long
+probe_kernel_read_inst(struct ppc_inst *inst, const void *src)
+{
+	return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
+}
+
 static struct ppc_inst
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 {
@@ -68,7 +74,7 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 	 */
 
 	/* read the text we want to modify */
-	if (probe_kernel_read(&replaced, (void *)ip, MCOUNT_INSN_SIZE))
+	if (probe_kernel_read_inst(&replaced, (void *)ip))
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
@@ -130,7 +136,7 @@ __ftrace_make_nop(struct module *mod,
 	struct ppc_inst op, pop;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -164,7 +170,7 @@ __ftrace_make_nop(struct module *mod,
 	/* When using -mkernel_profile there is no load to jump over */
 	pop = ppc_inst(PPC_INST_NOP);
 
-	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
+	if (probe_kernel_read_inst(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
 	}
@@ -196,7 +202,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
 	 * on first pass after boot we will see mflr r0.
 	 */
-	if (probe_kernel_read(&op, (void *)(ip+4), MCOUNT_INSN_SIZE)) {
+	if (probe_kernel_read_inst(&op, (void *)(ip+4))) {
 		pr_err("Fetching op failed.\n");
 		return -EFAULT;
 	}
@@ -348,7 +354,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 			return -1;
 
 	/* New trampoline -- read where this goes */
-	if (probe_kernel_read(&op, (void *)tramp, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
 		return -1;
 	}
@@ -398,7 +404,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	struct ppc_inst op;
 
 	/* Read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -524,7 +530,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	struct module *mod = rec->arch.mod;
 
 	/* read where this goes */
-	if (probe_kernel_read(op, ip, sizeof(op)))
+	if (probe_kernel_read_inst(op, ip))
+		return -EFAULT;
+
+	if (probe_kernel_read_inst(op + 1, ip + 4))
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
@@ -587,7 +596,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, MCOUNT_INSN_SIZE))
+	if (probe_kernel_read_inst(&op, (void *)ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -643,7 +652,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Make sure we have a nop */
-	if (probe_kernel_read(&op, ip, sizeof(op))) {
+	if (probe_kernel_read_inst(&op, ip)) {
 		pr_err("Unable to read ftrace location %p\n", ip);
 		return -EFAULT;
 	}
@@ -721,7 +730,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (probe_kernel_read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -846,7 +855,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	struct ppc_inst old, new;
 	int ret;
 
-	old = *(struct ppc_inst *)&ftrace_call;
+	old = ppc_inst_read((struct ppc_inst *)&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
@@ -854,7 +863,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	/* Also update the regs callback function */
 	if (!ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
-		old = *(struct ppc_inst *)&ftrace_regs_call;
+		old = ppc_inst_read((struct ppc_inst *)&ftrace_regs_call);
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 91be4a0b51cb..ba08f3815d00 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -349,9 +349,9 @@ static unsigned long branch_bform_target(const struct ppc_inst *instr)
 
 unsigned long branch_target(const struct ppc_inst *instr)
 {
-	if (instr_is_branch_iform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)))
 		return branch_iform_target(instr);
-	else if (instr_is_branch_bform(*instr))
+	else if (instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_bform_target(instr);
 
 	return 0;
@@ -359,7 +359,7 @@ unsigned long branch_target(const struct ppc_inst *instr)
 
 int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
 {
-	if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)) || instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_target(instr) == addr;
 
 	return 0;
@@ -368,13 +368,12 @@ int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
 int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest, const struct ppc_inst *src)
 {
 	unsigned long target;
-
 	target = branch_target(src);
 
-	if (instr_is_branch_iform(*src))
-		return create_branch(instr, dest, target, ppc_inst_val(*src));
-	else if (instr_is_branch_bform(*src))
-		return create_cond_branch(instr, dest, target, ppc_inst_val(*src));
+	if (instr_is_branch_iform(ppc_inst_read(src)))
+		return create_branch(instr, dest, target, ppc_inst_val(ppc_inst_read(src)));
+	else if (instr_is_branch_bform(ppc_inst_read(src)))
+		return create_cond_branch(instr, dest, target, ppc_inst_val(ppc_inst_read(src)));
 
 	return 1;
 }
@@ -598,7 +597,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x4a000000)));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -609,7 +608,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x49fffffc)));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -655,7 +654,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff8000)));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -667,7 +666,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
+	check(ppc_inst_equal(ppc_inst_read(q), ppc_inst(0x43ff7ffc)));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 8c5d0db77013..f00dd13b1c3c 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -48,7 +48,7 @@ static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
 	int err;
 	struct ppc_inst instr;
 
-	instr = *src;
+	instr = ppc_inst_read(src);
 
 	if (instr_is_relative_branch(*src)) {
 		struct ppc_inst *target = (struct ppc_inst *)branch_target(src);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e3d8e1b8ce01..5e3949322a6c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -705,13 +705,13 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
-			int stepped = emulate_step(regs, bp->instr[0]);
+			int stepped = emulate_step(regs, ppc_inst_read(bp->instr));
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
 			} else if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
-				    (IS_RFID(bp->instr[0])? "rfid": "mtmsrd"));
+				    IS_RFID(ppc_inst_read(bp->instr))? "rfid": "mtmsrd");
 			}
 		}
 	}
@@ -952,7 +952,7 @@ static void remove_bpts(void)
 		if (mread(bp->address, &instr, 4) == 4
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
-			(struct ppc_inst *)bp->address, bp->instr[0]) != 0)
+			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
-- 
2.17.1

