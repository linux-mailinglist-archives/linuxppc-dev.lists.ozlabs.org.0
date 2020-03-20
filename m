Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8418C6FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:27:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kC2g21SXzDrcN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=alBbNAUo; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBs62BvgzDrWV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:06 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id h72so417895pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dqeMGrxodA+CYnGK5c5KdAC9+4fYmINBb4xFNckuNws=;
 b=alBbNAUo34peKgcv9bd61dOLZP2+Z1HZz3hdHcGbqWE1VA9PLJbwXdQe16bLOrxDkP
 htF6DLuD5g5YFr4FK2kjrIymEucTvpwr2dt/V8VjQri0AQAVmQGfyELAXXyDsfzPct1r
 LbJLvmP/m9gZ5e2mi/4lzqhXIGvfXlJ7qPCpBy+42IBQAZ9FV3oaKyC/VSD0t+iNSi1Q
 aDeCzcZSBRiMvZuBzXx2KVm3dt0DgrSBuTc4aXhouCoZOJdlRgdnKD6Qq7G2ZxXEbr4O
 qEM6jMpCp+sC3lD9XZSRLpcAd5DFJPuvyMfbZBWGST0mX3twN1O3Nq5XCtOzZypcNTC8
 h+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dqeMGrxodA+CYnGK5c5KdAC9+4fYmINBb4xFNckuNws=;
 b=asAYDHZVNtuFSCP/64kbFY0qND0W/1lx5lJxyeavsT4YeINF125XK2x2zq/MFLYDpH
 67WwSHxmoSyi6b79xtr1fO8aiLdeZZf2VjT46rv3YvRuKI49efxiVnsxdlDAEdByaygl
 P+/C78+z6Rj7+Etxy8LbIbaj2CmUySFBdQmWfq9dMiKB4yHZWRYtdkTWC2wLlP8jwPlX
 fhAjodSflK5Mri1jXomKuWRs/txsf/Vxz9Da7iFReL+r1F2X2CMzG5WkICOgyTysPV77
 /m8SDHPXFRHAsOy5Zm8iGglEkeVE4aju7OcGCtQBqL/Jym7lBfPh994AliHwiewCa+k4
 y0Og==
X-Gm-Message-State: ANhLgQ1Eow1C0jL7rMsbQBGl7onEhIfI9FrXF0eMUx0+/uNu6CTb7CtH
 bDt+ZzTnSQNQrTdFNMlI5vyQSzvwc7g=
X-Google-Smtp-Source: ADFU+vuqIjX/igDphiwvQJTGVo/eGSOestELHLwFAUCEhGJLvsz+Jt7YD5pZdqf3dZlBzsv1mZhisg==
X-Received: by 2002:a63:a504:: with SMTP id n4mr6753282pgf.373.1584681543401; 
 Thu, 19 Mar 2020 22:19:03 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:03 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/16] powerpc: Use a macro for creating instructions from
 u32s
Date: Fri, 20 Mar 2020 16:17:57 +1100
Message-Id: <20200320051809.24332-5-jniethe5@gmail.com>
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

In preparation for instructions having a more complex data type start
using a macro, PPC_INST(), for making an instruction out of a u32.
Currently this does nothing, but it will allow for creating a data type
that can represent prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
---
 arch/powerpc/include/asm/code-patching.h |  2 +-
 arch/powerpc/kernel/align.c              |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c      |  2 +-
 arch/powerpc/kernel/jump_label.c         |  2 +-
 arch/powerpc/kernel/kprobes.c            |  4 +-
 arch/powerpc/kernel/module_64.c          |  2 +-
 arch/powerpc/kernel/optprobes.c          | 30 +++++------
 arch/powerpc/kernel/security.c           |  8 +--
 arch/powerpc/kernel/trace/ftrace.c       | 24 ++++-----
 arch/powerpc/kvm/emulate_loadstore.c     |  2 +-
 arch/powerpc/lib/code-patching.c         | 64 ++++++++++++------------
 arch/powerpc/lib/feature-fixups.c        | 39 ++++++++-------
 arch/powerpc/lib/test_emulate_step.c     | 39 ++++++++-------
 arch/powerpc/xmon/xmon.c                 | 11 ++--
 14 files changed, 117 insertions(+), 114 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index cb5106f92d67..68bd9db334bd 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -49,7 +49,7 @@ static inline int patch_branch_site(s32 *site, unsigned long target, int flags)
 static inline int modify_instruction(unsigned int *addr, unsigned int clr,
 				     unsigned int set)
 {
-	return patch_instruction(addr, (*addr & ~clr) | set);
+	return patch_instruction(addr, PPC_INST((*addr & ~clr) | set));
 }
 
 static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned int set)
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 34594aaa44de..6008f14a145b 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -309,7 +309,7 @@ int fix_alignment(struct pt_regs *regs)
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
-		instr = swab32(instr);
+		instr = PPC_INST(swab32(instr));
 	}
 
 #ifdef CONFIG_SPE
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 06b97353d231..f001de471b98 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -244,7 +244,7 @@ dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 			     struct arch_hw_breakpoint *info)
 {
-	ppc_inst instr = 0;
+	ppc_inst instr = PPC_INST(0);
 	int ret, type, size;
 	struct instruction_op op;
 	unsigned long addr = info->address;
diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
index ca37702bde97..8d86d1101782 100644
--- a/arch/powerpc/kernel/jump_label.c
+++ b/arch/powerpc/kernel/jump_label.c
@@ -15,5 +15,5 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	if (type == JUMP_LABEL_JMP)
 		patch_branch(addr, entry->target, 0);
 	else
-		patch_instruction(addr, PPC_INST_NOP);
+		patch_instruction(addr, PPC_INST(PPC_INST_NOP));
 }
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index e7205adc9820..4c2b656615a6 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -147,13 +147,13 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
 void arch_arm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
+	patch_instruction(p->addr, PPC_INST(BREAKPOINT_INSTRUCTION));
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, p->opcode);
+	patch_instruction(p->addr, PPC_INST(p->opcode));
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 007606a48fd9..fdec1be9cec8 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -506,7 +506,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	 * "link" branches and they don't return, so they don't need the r2
 	 * restore afterwards.
 	 */
-	if (!instr_is_relative_link_branch(*prev_insn))
+	if (!instr_is_relative_link_branch(PPC_INST(*prev_insn)))
 		return 1;
 
 	if (*instruction != PPC_INST_NOP) {
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index f5e8cce438a3..1025a7a3b3a8 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -147,13 +147,13 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 {
 	/* addis r4,0,(insn)@h */
-	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
-			  ((val >> 16) & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(4) |
+			  ((val >> 16) & 0xffff)));
 	addr++;
 
 	/* ori r4,r4,(insn)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
-			  ___PPC_RS(4) | (val & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(4) |
+			  ___PPC_RS(4) | (val & 0xffff)));
 }
 
 /*
@@ -163,28 +163,28 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
 {
 	/* lis r3,(op)@highest */
-	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
-			  ((val >> 48) & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ADDIS | ___PPC_RT(3) |
+			  ((val >> 48) & 0xffff)));
 	addr++;
 
 	/* ori r3,r3,(op)@higher */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
+			  ___PPC_RS(3) | ((val >> 32) & 0xffff)));
 	addr++;
 
 	/* rldicr r3,r3,32,31 */
-	patch_instruction(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31));
+	patch_instruction(addr, PPC_INST(PPC_INST_RLDICR | ___PPC_RA(3) |
+			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
 	/* oris r3,r3,(op)@h */
-	patch_instruction(addr, PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ORIS | ___PPC_RA(3) |
+			  ___PPC_RS(3) | ((val >> 16) & 0xffff)));
 	addr++;
 
 	/* ori r3,r3,(op)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff));
+	patch_instruction(addr, PPC_INST(PPC_INST_ORI | ___PPC_RA(3) |
+			  ___PPC_RS(3) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
@@ -230,7 +230,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
 	for (i = 0; i < size; i++) {
-		rc = patch_instruction(buff + i, *(optprobe_template_entry + i));
+		rc = patch_instruction(buff + i, PPC_INST(*(optprobe_template_entry + i)));
 		if (rc < 0)
 			goto error;
 	}
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index bd70f5be1c27..693c68e2aa67 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -403,9 +403,9 @@ static void toggle_count_cache_flush(bool enable)
 		enable = false;
 
 	if (!enable) {
-		patch_instruction_site(&patch__call_flush_count_cache, PPC_INST_NOP);
+		patch_instruction_site(&patch__call_flush_count_cache, PPC_INST(PPC_INST_NOP));
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		patch_instruction_site(&patch__call_kvm_flush_link_stack, PPC_INST_NOP);
+		patch_instruction_site(&patch__call_kvm_flush_link_stack, PPC_INST(PPC_INST_NOP));
 #endif
 		pr_info("link-stack-flush: software flush disabled.\n");
 		link_stack_flush_enabled = false;
@@ -428,7 +428,7 @@ static void toggle_count_cache_flush(bool enable)
 
 	// If we just need to flush the link stack, patch an early return
 	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
-		patch_instruction_site(&patch__flush_link_stack_return, PPC_INST_BLR);
+		patch_instruction_site(&patch__flush_link_stack_return, PPC_INST(PPC_INST_BLR));
 		no_count_cache_flush();
 		return;
 	}
@@ -439,7 +439,7 @@ static void toggle_count_cache_flush(bool enable)
 		return;
 	}
 
-	patch_instruction_site(&patch__flush_count_cache_return, PPC_INST_BLR);
+	patch_instruction_site(&patch__flush_count_cache_return, PPC_INST(PPC_INST_BLR));
 	count_cache_flush_type = COUNT_CACHE_FLUSH_HW;
 	pr_info("count-cache-flush: hardware assisted flush sequence enabled\n");
 }
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 5787ccffb4df..380f1ce77715 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -161,7 +161,7 @@ __ftrace_make_nop(struct module *mod,
 
 #ifdef CONFIG_MPROFILE_KERNEL
 	/* When using -mkernel_profile there is no load to jump over */
-	pop = PPC_INST_NOP;
+	pop = PPC_INST(PPC_INST_NOP);
 
 	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
 		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
@@ -169,7 +169,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (op != PPC_INST_MFLR && op != PPC_INST_STD_LR) {
+	if (op != PPC_INST(PPC_INST_MFLR) && op != PPC_INST(PPC_INST_STD_LR)) {
 		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
 		return -EINVAL;
 	}
@@ -188,7 +188,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Use a b +8 to jump over the load.
 	 */
 
-	pop = PPC_INST_BRANCH | 8;	/* b +8 */
+	pop = PPC_INST(PPC_INST_BRANCH | 8);	/* b +8 */
 
 	/*
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
@@ -199,7 +199,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EFAULT;
 	}
 
-	if (op != PPC_INST_LD_TOC) {
+	if (op != PPC_INST(PPC_INST_LD_TOC)) {
 		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
 		return -EINVAL;
 	}
@@ -275,7 +275,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EINVAL;
 	}
 
-	op = PPC_INST_NOP;
+	op = PPC_INST(PPC_INST_NOP);
 
 	if (patch_instruction((ppc_inst *)ip, op))
 		return -EPERM;
@@ -418,7 +418,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((ppc_inst *)ip, PPC_INST_NOP)) {
+	if (patch_instruction((ppc_inst *)ip, PPC_INST(PPC_INST_NOP))) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -440,7 +440,7 @@ int ftrace_make_nop(struct module *mod,
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
 		old = ftrace_call_replace(ip, addr, 1);
-		new = PPC_INST_NOP;
+		new = PPC_INST(PPC_INST_NOP);
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip))
 		return __ftrace_make_nop_kernel(rec, addr);
@@ -500,10 +500,10 @@ expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
 }
 #else
 static int
-expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
+expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
-	if (op0 != PPC_INST_NOP)
+	if (op0 != PPC_INST(PPC_INST_NOP))
 		return 0;
 	return 1;
 }
@@ -584,7 +584,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
-	if (op != PPC_INST_NOP) {
+	if (op != PPC_INST(PPC_INST_NOP)) {
 		pr_err("Expected NOP but have %x\n", op);
 		return -EINVAL;
 	}
@@ -641,7 +641,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	if (op != PPC_INST_NOP) {
+	if (op != PPC_INST(PPC_INST_NOP)) {
 		pr_err("Unexpected call sequence at %p: %x\n", ip, op);
 		return -EINVAL;
 	}
@@ -672,7 +672,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	 */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		old = PPC_INST_NOP;
+		old = PPC_INST(PPC_INST_NOP);
 		new = ftrace_call_replace(ip, addr, 1);
 		return ftrace_modify_code(ip, old, new);
 	} else if (core_kernel_text(ip))
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 1c9bcbfeb924..ed8cd109f884 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -96,7 +96,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 	emulated = EMULATE_FAIL;
 	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
-	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
+	if (analyse_instr(&op, &vcpu->arch.regs, PPC_INST(inst)) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 8492b9e2b8db..5d69e836337d 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -256,10 +256,10 @@ ppc_inst create_branch(const ppc_inst *addr,
 
 	/* Check we can represent the target in the instruction format */
 	if (!is_offset_in_branch_range(offset))
-		return 0;
+		return PPC_INST(0);
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	instruction = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
+	instruction = PPC_INST(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
 
 	return instruction;
 }
@@ -276,10 +276,10 @@ unsigned int create_cond_branch(const unsigned int *addr,
 
 	/* Check we can represent the target in the instruction format */
 	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
-		return 0;
+		return PPC_INST(0);
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	instruction = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
+	instruction = PPC_INST(0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC));
 
 	return instruction;
 }
@@ -373,7 +373,7 @@ ppc_inst translate_branch(const ppc_inst *dest, const ppc_inst *src)
 	else if (instr_is_branch_bform(*src))
 		return create_cond_branch(dest, target, *src);
 
-	return 0;
+	return PPC_INST(0);
 }
 
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -410,37 +410,37 @@ static void __init test_branch_iform(void)
 	addr = (unsigned long)&instr;
 
 	/* The simplest case, branch to self, no flags */
-	check(instr_is_branch_iform(0x48000000));
+	check(instr_is_branch_iform(PPC_INST(0x48000000)));
 	/* All bits of target set, and flags */
-	check(instr_is_branch_iform(0x4bffffff));
+	check(instr_is_branch_iform(PPC_INST(0x4bffffff)));
 	/* High bit of opcode set, which is wrong */
-	check(!instr_is_branch_iform(0xcbffffff));
+	check(!instr_is_branch_iform(PPC_INST(0xcbffffff)));
 	/* Middle bits of opcode set, which is wrong */
-	check(!instr_is_branch_iform(0x7bffffff));
+	check(!instr_is_branch_iform(PPC_INST(0x7bffffff)));
 
 	/* Simplest case, branch to self with link */
-	check(instr_is_branch_iform(0x48000001));
+	check(instr_is_branch_iform(PPC_INST(0x48000001)));
 	/* All bits of targets set */
-	check(instr_is_branch_iform(0x4bfffffd));
+	check(instr_is_branch_iform(PPC_INST(0x4bfffffd)));
 	/* Some bits of targets set */
-	check(instr_is_branch_iform(0x4bff00fd));
+	check(instr_is_branch_iform(PPC_INST(0x4bff00fd)));
 	/* Must be a valid branch to start with */
-	check(!instr_is_branch_iform(0x7bfffffd));
+	check(!instr_is_branch_iform(PPC_INST(0x7bfffffd)));
 
 	/* Absolute branch to 0x100 */
-	instr = 0x48000103;
+	instr = PPC_INST(0x48000103);
 	check(instr_is_branch_to_addr(&instr, 0x100));
 	/* Absolute branch to 0x420fc */
-	instr = 0x480420ff;
+	instr = PPC_INST(0x480420ff);
 	check(instr_is_branch_to_addr(&instr, 0x420fc));
 	/* Maximum positive relative branch, + 20MB - 4B */
-	instr = 0x49fffffc;
+	instr = PPC_INST(0x49fffffc);
 	check(instr_is_branch_to_addr(&instr, addr + 0x1FFFFFC));
 	/* Smallest negative relative branch, - 4B */
-	instr = 0x4bfffffc;
+	instr = PPC_INST(0x4bfffffc);
 	check(instr_is_branch_to_addr(&instr, addr - 4));
 	/* Largest negative relative branch, - 32 MB */
-	instr = 0x4a000000;
+	instr = PPC_INST(0x4a000000);
 	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
 
 	/* Branch to self, with link */
@@ -474,7 +474,7 @@ static void __init test_branch_iform(void)
 	/* Check flags are masked correctly */
 	instr = create_branch(&instr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == 0x48000000);
+	check(instr == PPC_INST(0x48000000));
 }
 
 static void __init test_create_function_call(void)
@@ -499,28 +499,28 @@ static void __init test_branch_bform(void)
 	addr = (unsigned long)iptr;
 
 	/* The simplest case, branch to self, no flags */
-	check(instr_is_branch_bform(0x40000000));
+	check(instr_is_branch_bform(PPC_INST(0x40000000)));
 	/* All bits of target set, and flags */
-	check(instr_is_branch_bform(0x43ffffff));
+	check(instr_is_branch_bform(PPC_INST(0x43ffffff)));
 	/* High bit of opcode set, which is wrong */
-	check(!instr_is_branch_bform(0xc3ffffff));
+	check(!instr_is_branch_bform(PPC_INST(0xc3ffffff)));
 	/* Middle bits of opcode set, which is wrong */
-	check(!instr_is_branch_bform(0x7bffffff));
+	check(!instr_is_branch_bform(PPC_INST(0x7bffffff)));
 
 	/* Absolute conditional branch to 0x100 */
-	instr = 0x43ff0103;
+	instr = PPC_INST(0x43ff0103);
 	check(instr_is_branch_to_addr(&instr, 0x100));
 	/* Absolute conditional branch to 0x20fc */
-	instr = 0x43ff20ff;
+	instr = PPC_INST(0x43ff20ff);
 	check(instr_is_branch_to_addr(&instr, 0x20fc));
 	/* Maximum positive relative conditional branch, + 32 KB - 4B */
-	instr = 0x43ff7ffc;
+	instr = PPC_INST(0x43ff7ffc);
 	check(instr_is_branch_to_addr(&instr, addr + 0x7FFC));
 	/* Smallest negative relative conditional branch, - 4B */
-	instr = 0x43fffffc;
+	instr = PPC_INST(0x43fffffc);
 	check(instr_is_branch_to_addr(&instr, addr - 4));
 	/* Largest negative relative conditional branch, - 32 KB */
-	instr = 0x43ff8000;
+	instr = PPC_INST(0x43ff8000);
 	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
 
 	/* All condition code bits set & link */
@@ -588,7 +588,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == 0x4a000000);
+	check(*q == PPC_INST(0x4a000000));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -598,7 +598,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == 0x49fffffc);
+	check(*q == PPC_INST(0x49fffffc));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -638,7 +638,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == 0x43ff8000);
+	check(*q == PPC_INST(0x43ff8000));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -648,7 +648,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, translate_branch(q, p));
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == 0x43ff7ffc);
+	check(*q == PPC_INST(0x43ff7ffc));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 4ba634b89ce5..a5f3d98862e9 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -21,6 +21,7 @@
 #include <asm/setup.h>
 #include <asm/security_features.h>
 #include <asm/firmware.h>
+#include <asm/inst.h>
 
 struct fixup_entry {
 	unsigned long	mask;
@@ -88,7 +89,7 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 	}
 
 	for (; dest < end; dest++)
-		raw_patch_instruction(dest, PPC_INST_NOP);
+		raw_patch_instruction(dest, PPC_INST(PPC_INST_NOP));
 
 	return 0;
 }
@@ -145,15 +146,15 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, instrs[0]);
+		patch_instruction(dest, PPC_INST(instrs[0]));
 
 		if (types & STF_BARRIER_FALLBACK)
 			patch_branch(dest + 1, (unsigned long)&stf_barrier_fallback,
 				     BRANCH_SET_LINK);
 		else
-			patch_instruction(dest + 1, instrs[1]);
+			patch_instruction(dest + 1, PPC_INST(instrs[1]));
 
-		patch_instruction(dest + 2, instrs[2]);
+		patch_instruction(dest + 2, PPC_INST(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
@@ -206,12 +207,12 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, instrs[0]);
-		patch_instruction(dest + 1, instrs[1]);
-		patch_instruction(dest + 2, instrs[2]);
-		patch_instruction(dest + 3, instrs[3]);
-		patch_instruction(dest + 4, instrs[4]);
-		patch_instruction(dest + 5, instrs[5]);
+		patch_instruction(dest, PPC_INST(instrs[0]));
+		patch_instruction(dest + 1, PPC_INST(instrs[1]));
+		patch_instruction(dest + 2, PPC_INST(instrs[2]));
+		patch_instruction(dest + 3, PPC_INST(instrs[3]));
+		patch_instruction(dest + 4, PPC_INST(instrs[4]));
+		patch_instruction(dest + 5, PPC_INST(instrs[5]));
 	}
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
@@ -259,9 +260,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, instrs[0]);
-		patch_instruction(dest + 1, instrs[1]);
-		patch_instruction(dest + 2, instrs[2]);
+		patch_instruction(dest, PPC_INST(instrs[0]));
+		patch_instruction(dest + 1, PPC_INST(instrs[1]));
+		patch_instruction(dest + 2, PPC_INST(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
@@ -294,7 +295,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, instr);
+		patch_instruction(dest, PPC_INST(instr));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -337,8 +338,8 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, instr[0]);
-		patch_instruction(dest + 1, instr[1]);
+		patch_instruction(dest, PPC_INST(instr[0]));
+		patch_instruction(dest + 1, PPC_INST(instr[1]));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -352,7 +353,7 @@ static void patch_btb_flush_section(long *curr)
 	end = (void *)curr + *(curr + 1);
 	for (; start < end; start++) {
 		pr_devel("patching dest %lx\n", (unsigned long)start);
-		patch_instruction(start, PPC_INST_NOP);
+		patch_instruction(start, PPC_INST(PPC_INST_NOP));
 	}
 }
 
@@ -381,7 +382,7 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 
 	for (; start < end; start++) {
 		dest = (void *)start + *start;
-		raw_patch_instruction(dest, PPC_INST_LWSYNC);
+		raw_patch_instruction(dest, PPC_INST(PPC_INST_LWSYNC));
 	}
 }
 
@@ -399,7 +400,7 @@ static void do_final_fixups(void)
 	length = (__end_interrupts - _stext) / sizeof(int);
 
 	while (length--) {
-		raw_patch_instruction(dest, *src);
+		raw_patch_instruction(dest, PPC_INST(*src));
 		src++;
 		dest++;
 	}
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 158efc8a0f53..227ebae9ba5a 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -11,6 +11,7 @@
 #include <asm/sstep.h>
 #include <asm/ppc-opcode.h>
 #include <asm/code-patching.h>
+#include <asm/inst.h>
 
 #define IMM_L(i)		((uintptr_t)(i) & 0xffff)
 
@@ -18,40 +19,40 @@
  * Defined with TEST_ prefix so it does not conflict with other
  * definitions.
  */
-#define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
+#define TEST_LD(r, base, i)	PPC_INST(PPC_INST_LD | ___PPC_RT(r) |		\
 					___PPC_RA(base) | IMM_L(i))
-#define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
+#define TEST_LWZ(r, base, i)	PPC_INST(PPC_INST_LWZ | ___PPC_RT(r) |		\
 					___PPC_RA(base) | IMM_L(i))
-#define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
+#define TEST_LWZX(t, a, b)	PPC_INST(PPC_INST_LWZX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STD(r, base, i)	(PPC_INST_STD | ___PPC_RS(r) |		\
+#define TEST_STD(r, base, i)	PPC_INST(PPC_INST_STD | ___PPC_RS(r) |		\
 					___PPC_RA(base) | ((i) & 0xfffc))
-#define TEST_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) |	\
+#define TEST_LDARX(t, a, b, eh)	PPC_INST(PPC_INST_LDARX | ___PPC_RT(t) |	\
 					___PPC_RA(a) | ___PPC_RB(b) |	\
 					__PPC_EH(eh))
-#define TEST_STDCX(s, a, b)	(PPC_INST_STDCX | ___PPC_RS(s) |	\
+#define TEST_STDCX(s, a, b)	PPC_INST(PPC_INST_STDCX | ___PPC_RS(s) |	\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFSX(t, a, b)	(PPC_INST_LFSX | ___PPC_RT(t) |		\
+#define TEST_LFSX(t, a, b)	PPC_INST(PPC_INST_LFSX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFSX(s, a, b)	(PPC_INST_STFSX | ___PPC_RS(s) |	\
+#define TEST_STFSX(s, a, b)	PPC_INST(PPC_INST_STFSX | ___PPC_RS(s) |	\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFDX(t, a, b)	(PPC_INST_LFDX | ___PPC_RT(t) |		\
+#define TEST_LFDX(t, a, b)	PPC_INST(PPC_INST_LFDX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFDX(s, a, b)	(PPC_INST_STFDX | ___PPC_RS(s) |	\
+#define TEST_STFDX(s, a, b)	PPC_INST(PPC_INST_STFDX | ___PPC_RS(s) |	\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LVX(t, a, b)	(PPC_INST_LVX | ___PPC_RT(t) |		\
+#define TEST_LVX(t, a, b)	PPC_INST(PPC_INST_LVX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STVX(s, a, b)	(PPC_INST_STVX | ___PPC_RS(s) |		\
+#define TEST_STVX(s, a, b)	PPC_INST(PPC_INST_STVX | ___PPC_RS(s) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LXVD2X(s, a, b)	(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_ADD(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
+#define TEST_LXVD2X(s, a, b)	PPC_INST(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
+#define TEST_STXVD2X(s, a, b)	PPC_INST(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##b))
+#define TEST_ADD(t, a, b)	PPC_INST(PPC_INST_ADD | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
+#define TEST_ADD_DOT(t, a, b)	PPC_INST(PPC_INST_ADD | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
-#define TEST_ADDC(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
+#define TEST_ADDC(t, a, b)	PPC_INST(PPC_INST_ADDC | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
+#define TEST_ADDC_DOT(t, a, b)	PPC_INST(PPC_INST_ADDC | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 
 #define MAX_SUBTESTS	16
@@ -471,7 +472,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "R0 = LONG_MAX",
-				.instr = PPC_INST_NOP,
+				.instr = PPC_INST(PPC_INST_NOP),
 				.regs = {
 					.gpr[0] = LONG_MAX,
 				}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a0bc442f9557..f8a7a55e6ab2 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -54,6 +54,7 @@
 #include <asm/firmware.h>
 #include <asm/code-patching.h>
 #include <asm/sections.h>
+#include <asm/inst.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
@@ -880,7 +881,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
-			patch_instruction(bp->instr + 1, bpinstr);
+			patch_instruction(bp->instr + 1, PPC_INST(bpinstr));
 			return bp;
 		}
 	}
@@ -915,7 +916,7 @@ static void insert_bpts(void)
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((ppc_inst *)bp->address,
-							bpinstr) != 0) {
+							PPC_INST(bpinstr)) != 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled &= ~BP_TRAP;
@@ -950,7 +951,7 @@ static void remove_bpts(void)
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
 		if (mread(bp->address, &instr, 4) == 4
-		    && instr == bpinstr
+		    && instr == PPC_INST(bpinstr)
 		    && patch_instruction(
 			(ppc_inst *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
@@ -2846,7 +2847,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 {
 	int nr, dotted;
 	unsigned long first_adr;
-	unsigned int inst, last_inst = 0;
+	ppc_inst inst, last_inst = PPC_INST(0);
 	unsigned char val[4];
 
 	dotted = 0;
@@ -2859,7 +2860,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			}
 			break;
 		}
-		inst = GETWORD(val);
+		inst = PPC_INST(GETWORD(val));
 		if (adr > first_adr && inst == last_inst) {
 			if (!dotted) {
 				printf(" ...\n");
-- 
2.17.1

