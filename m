Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D453218C714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:36:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCDy4TCRzDqD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:36:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I12YHPSG; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsV3HGDzDrSF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:26 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id c19so2619828pfo.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iI/+gXjNcOSCm0Mx95mHELj2Urj3BVXmlvBj/aXPvxg=;
 b=I12YHPSGh5qxEjZJoc09A5lkuYtlG2IAvC/6DXTVRbORPxxMzMSbh2XOPEJz+6dIm+
 QublQ/MGzys1XNKi8pqaLfBNAgL7f+EYFyYnvg08/zclPB0huCyactyRVs5vb/rDRg6a
 XMJ8OZg48hUxKIvzaRLNpim0/0/0jn708d5jzRUJFOVC6NMbNFz0oeax6fiS8yn4/EY6
 N5G7x807eLdjQyg7B0Lo+9BRYqdVyO+znRt+8VSpc5y8cxOrStBtrBZ1SDzJ0/v9YrQQ
 vKz53kSqdsfU9gcjvyaAb5HYLn0O86dnEzFSQk5mGoaGaBEn+nuAyWEbUF5MaXgOUKXD
 UpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iI/+gXjNcOSCm0Mx95mHELj2Urj3BVXmlvBj/aXPvxg=;
 b=LyTgDSJd4f6DFKGBWZyMJSQBnqPwYM7lL61pN28syiTfqYJOo/oHGBsMFh7XS3p6OH
 Bevll3ovf6MvIHMtl6XXapSvNcC1jK2ZoSyf5uLsy4F76MHSuCVatmD28GgH+XPqFaYO
 mVF/PMkDpM8tynGKGZPyjP+y59uJwKCfmw6PU2OmK9tEwK1j4I5iP2goPYINWzZwd4Wg
 GZGvPgcBrCyQCDlBKv6xSO1Bh3fPe1yWxW73Rm9bwKZeu5zEYhjmlwQrdKnUzvcbViiE
 R8p/oKjlrVlXtanBn3WAVqO/3ytOsOVnsddrfSAeMN9ir8ygn10d1LZZdqxz6G+hSGBK
 KMaA==
X-Gm-Message-State: ANhLgQ0vzMLUaK7gQGRjTMsKLjZQm/ZowTf915nv9X5MZncZavVR8CyQ
 6eICzfsshO+9HIp2G24LxEcVryvJTZI=
X-Google-Smtp-Source: ADFU+vs+uQBikXq7Q/mHurPkjhEAw9QIUDMOU47uacHt5BmPU4pR4zur0636J5NoRnQaukXwRSo6Qw==
X-Received: by 2002:a62:6244:: with SMTP id w65mr7919015pfb.89.1584681562960; 
 Thu, 19 Mar 2020 22:19:22 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:22 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/16] powerpc: Use a function for reading instructions
Date: Fri, 20 Mar 2020 16:18:02 +1100
Message-Id: <20200320051809.24332-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
---
 arch/powerpc/include/asm/uprobes.h |  4 ++--
 arch/powerpc/kernel/kprobes.c      |  8 ++++----
 arch/powerpc/kernel/mce_power.c    |  2 +-
 arch/powerpc/kernel/optprobes.c    |  6 +++---
 arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++-----------
 arch/powerpc/kernel/uprobes.c      |  2 +-
 arch/powerpc/lib/code-patching.c   | 22 ++++++++++----------
 arch/powerpc/lib/feature-fixups.c  |  6 +++---
 arch/powerpc/xmon/xmon.c           |  6 +++---
 9 files changed, 49 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 2bbdf27d09b5..fff3c5fc90b5 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -23,8 +23,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
 
 struct arch_uprobe {
 	union {
-		u32	insn;
-		u32	ixol;
+		u8	insn[MAX_UINSN_BYTES];
+		u8	ixol[MAX_UINSN_BYTES];
 	};
 };
 
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 0c600b6e4ead..f142d11d7b48 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -117,7 +117,7 @@ void *alloc_insn_page(void)
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-	kprobe_opcode_t insn = *p->addr;
+	ppc_inst insn = ppc_inst_read(p->addr);
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -136,8 +136,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		patch_instruction(p->ainsn.insn, *p->addr);
-		p->opcode = *p->addr;
+		patch_instruction(p->ainsn.insn, insn);
+		p->opcode = ppc_inst_word(insn);
 	}
 
 	p->ainsn.boostable = 0;
@@ -225,7 +225,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	ppc_inst insn = *p->ainsn.insn;
+	ppc_inst insn = ppc_inst_read((ppc_inst *)p->ainsn.insn);
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index e65616bb3a3e..d1fdb5105d32 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	pfn = addr_to_pfn(regs, regs->nip);
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
-		instr = *(ppc_inst *)(instr_addr);
+		instr = ppc_inst_read((ppc_inst *)instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 6027425a85f2..5b53c373373b 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -99,8 +99,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * Ensure that the instruction is not a conditional branch,
 	 * and that can be emulated.
 	 */
-	if (!is_conditional_branch(*p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *p->ainsn.insn) == 1) {
+	if (!is_conditional_branch(ppc_inst_read(p->ainsn.insn)) &&
+			analyse_instr(&op, &regs, ppc_inst_read(p->ainsn.insn)) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
@@ -268,7 +268,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
+	patch_imm32_load_insns(*(unsigned int *)p->ainsn.insn, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7614a9f537fd..ad451205f268 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -41,6 +41,12 @@
 #define	NUM_FTRACE_TRAMPS	8
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
+static long
+read_inst(ppc_inst *inst, const void *src)
+{
+	return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
+}
+
 static ppc_inst
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 {
@@ -68,7 +74,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst old, ppc_inst new)
 	 */
 
 	/* read the text we want to modify */
-	if (probe_kernel_read(&replaced, (void *)ip, MCOUNT_INSN_SIZE))
+	if (read_inst(&replaced, (void *)ip))
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
@@ -129,7 +135,7 @@ __ftrace_make_nop(struct module *mod,
 	ppc_inst op, pop;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -163,7 +169,7 @@ __ftrace_make_nop(struct module *mod,
 	/* When using -mkernel_profile there is no load to jump over */
 	pop = PPC_INST(PPC_INST_NOP);
 
-	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
+	if (read_inst(&op, (void *)(ip - 4))) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
 		return -EFAULT;
 	}
@@ -195,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
 	 * on first pass after boot we will see mflr r0.
 	 */
-	if (probe_kernel_read(&op, (void *)(ip+4), MCOUNT_INSN_SIZE)) {
+	if (read_inst(&op, (void *)(ip+4))) {
 		pr_err("Fetching op failed.\n");
 		return -EFAULT;
 	}
@@ -344,7 +350,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 			return -1;
 
 	/* New trampoline -- read where this goes */
-	if (probe_kernel_read(&op, (void *)tramp, sizeof(int))) {
+	if (read_inst(&op, (void *)tramp)) {
 		pr_debug("Fetching opcode failed.\n");
 		return -1;
 	}
@@ -394,7 +400,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	ppc_inst op;
 
 	/* Read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -520,7 +526,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	struct module *mod = rec->arch.mod;
 
 	/* read where this goes */
-	if (probe_kernel_read(op, ip, sizeof(op)))
+	if (read_inst(op, ip))
+		return -EFAULT;
+
+	if (read_inst(op + 1, ip + 4))
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
@@ -582,7 +591,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, MCOUNT_INSN_SIZE))
+	if (read_inst(&op, (void *)ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -638,7 +647,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Make sure we have a nop */
-	if (probe_kernel_read(&op, ip, sizeof(op))) {
+	if (read_inst(&op, ip)) {
 		pr_err("Unable to read ftrace location %p\n", ip);
 		return -EFAULT;
 	}
@@ -716,7 +725,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* read where this goes */
-	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
+	if (read_inst(&op, (void *)ip)) {
 		pr_err("Fetching opcode failed.\n");
 		return -EFAULT;
 	}
@@ -842,7 +851,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	ppc_inst old, new;
 	int ret;
 
-	old = *(unsigned int *)&ftrace_call;
+	old = ppc_inst_read((ppc_inst *)&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
@@ -850,7 +859,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	/* Also update the regs callback function */
 	if (!ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
-		old = *(unsigned int *)&ftrace_regs_call;
+		old = ppc_inst_read((ppc_inst *)&ftrace_regs_call);
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 1cfef0e5fec5..d1dff1dc3a11 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, auprobe->insn);
+	ret = emulate_step(regs, ppc_inst_read((ppc_inst *)auprobe->insn));
 	if (ret > 0)
 		return true;
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 849eee63df3d..88ee03ff55f1 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -346,9 +346,9 @@ static unsigned long branch_bform_target(const ppc_inst *instr)
 
 unsigned long branch_target(const ppc_inst *instr)
 {
-	if (instr_is_branch_iform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)))
 		return branch_iform_target(instr);
-	else if (instr_is_branch_bform(*instr))
+	else if (instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_bform_target(instr);
 
 	return 0;
@@ -356,7 +356,7 @@ unsigned long branch_target(const ppc_inst *instr)
 
 int instr_is_branch_to_addr(const ppc_inst *instr, unsigned long addr)
 {
-	if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
+	if (instr_is_branch_iform(ppc_inst_read(instr)) || instr_is_branch_bform(ppc_inst_read(instr)))
 		return branch_target(instr) == addr;
 
 	return 0;
@@ -368,10 +368,10 @@ ppc_inst translate_branch(const ppc_inst *dest, const ppc_inst *src)
 
 	target = branch_target(src);
 
-	if (instr_is_branch_iform(*src))
-		return create_branch(dest, target, *src);
-	else if (instr_is_branch_bform(*src))
-		return create_cond_branch(dest, target, *src);
+	if (instr_is_branch_iform(ppc_inst_read(src)))
+		return create_branch(dest, target, ppc_inst_word(ppc_inst_read(src)));
+	else if (instr_is_branch_bform(ppc_inst_read(src)))
+		return create_cond_branch(dest, target, ppc_inst_word(ppc_inst_read(src)));
 
 	return PPC_INST(0);
 }
@@ -588,7 +588,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == PPC_INST(0x4a000000));
+	check(ppc_inst_equal(ppc_inst_read(q), PPC_INST(0x4a000000)));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -598,7 +598,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == PPC_INST(0x49fffffc));
+	check(ppc_inst_equal(ppc_inst_read(q), PPC_INST(0x49fffffc)));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -638,7 +638,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == PPC_INST(0x43ff8000));
+	check(ppc_inst_equal(ppc_inst_read(q), PPC_INST(0x43ff8000)));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -648,7 +648,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == PPC_INST(0x43ff7ffc));
+	check(ppc_inst_equal(ppc_inst_read(q), PPC_INST(0x43ff7ffc)));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index fe8ec099aa96..9e322f701e32 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -49,8 +49,8 @@ static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 
 	instr = *src;
 
-	if (instr_is_relative_branch(*src)) {
-		unsigned int *target = (unsigned int *)branch_target(src);
+	if (instr_is_relative_branch(PPC_INST(*src))) {
+		unsigned int *target = (unsigned int *)branch_target((ppc_inst *)src);
 
 		/* Branch within the section doesn't need translating */
 		if (target < alt_start || target > alt_end) {
@@ -60,7 +60,7 @@ static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 		}
 	}
 
-	raw_patch_instruction(dest, instr);
+	raw_patch_instruction((ppc_inst *)dest, PPC_INST(instr));
 
 	return 0;
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dec522fa8201..ee084411f2f5 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -704,13 +704,13 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
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
@@ -953,7 +953,7 @@ static void remove_bpts(void)
 		if (mread(bp->address, &instr, 4) == 4
 		    && ppc_inst_equal(instr, PPC_INST(bpinstr))
 		    && patch_instruction(
-			(ppc_inst *)bp->address, bp->instr[0]) != 0)
+			(ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
-- 
2.17.1

