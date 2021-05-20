Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60038B08F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:53:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB694NZwz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB3Q1BW1z3c18
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:51:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB331JJ6z9sVH;
 Thu, 20 May 2021 15:50:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vJ4IuUmlEjM; Thu, 20 May 2021 15:50:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2s5ht6z9sSw;
 Thu, 20 May 2021 15:50:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EE638B815;
 Thu, 20 May 2021 15:50:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id w9RkM3SWL0Ef; Thu, 20 May 2021 15:50:45 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FCEC8B808;
 Thu, 20 May 2021 15:50:45 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 54CBD64C40; Thu, 20 May 2021 13:50:45 +0000 (UTC)
Message-Id: <7062722b087228e42cbd896e39bfdf526d6a340a.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 08/12] powerpc: Don't use 'struct ppc_inst' to reference
 instruction location
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:45 +0000 (UTC)
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

'struct ppc_inst' is an internal representation of an instruction, but
in-memory instructions are and will remain a table of 'unsigned int'
forever.

Replace all 'struct ppc_inst *' used for locating an instruction in
memory by 'unsigned int *'. This removes a lot of undue casts
to 'struct ppc_inst *'.

It also helps locating ab-use of 'struct ppc_inst' dereference.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Fix a create_branch() in ftrace and take copy_inst_from_kernel_nofault() into account.
---
 arch/powerpc/include/asm/code-patching.h  | 22 +++---
 arch/powerpc/include/asm/inst.h           | 14 ++--
 arch/powerpc/include/asm/uprobes.h        |  4 +-
 arch/powerpc/kernel/crash_dump.c          |  4 +-
 arch/powerpc/kernel/epapr_paravirt.c      |  4 +-
 arch/powerpc/kernel/jump_label.c          |  2 +-
 arch/powerpc/kernel/kgdb.c                |  6 +-
 arch/powerpc/kernel/kprobes.c             | 17 ++--
 arch/powerpc/kernel/mce_power.c           |  2 +-
 arch/powerpc/kernel/optprobes.c           | 45 +++++------
 arch/powerpc/kernel/setup_32.c            |  2 +-
 arch/powerpc/kernel/trace/ftrace.c        | 33 ++++----
 arch/powerpc/kernel/uprobes.c             |  6 +-
 arch/powerpc/lib/code-patching.c          | 50 ++++++------
 arch/powerpc/lib/feature-fixups.c         | 96 +++++++++++------------
 arch/powerpc/mm/maccess.c                 |  4 +-
 arch/powerpc/perf/core-book3s.c           |  4 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c |  2 +-
 arch/powerpc/platforms/powermac/smp.c     |  4 +-
 arch/powerpc/xmon/xmon.c                  | 10 +--
 20 files changed, 160 insertions(+), 171 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index f9bd1397b696..b20ee4e1e6fb 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -23,13 +23,13 @@
 #define BRANCH_ABSOLUTE	0x2
 
 bool is_offset_in_branch_range(long offset);
-int create_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
+int create_branch(struct ppc_inst *instr, const unsigned int *addr,
 		  unsigned long target, int flags);
-int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
+int create_cond_branch(struct ppc_inst *instr, const unsigned int *addr,
 		       unsigned long target, int flags);
-int patch_branch(struct ppc_inst *addr, unsigned long target, int flags);
-int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
-int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+int patch_branch(unsigned int *addr, unsigned long target, int flags);
+int patch_instruction(unsigned int *addr, struct ppc_inst instr);
+int raw_patch_instruction(unsigned int *addr, struct ppc_inst instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
@@ -38,18 +38,18 @@ static inline unsigned long patch_site_addr(s32 *site)
 
 static inline int patch_instruction_site(s32 *site, struct ppc_inst instr)
 {
-	return patch_instruction((struct ppc_inst *)patch_site_addr(site), instr);
+	return patch_instruction((unsigned int *)patch_site_addr(site), instr);
 }
 
 static inline int patch_branch_site(s32 *site, unsigned long target, int flags)
 {
-	return patch_branch((struct ppc_inst *)patch_site_addr(site), target, flags);
+	return patch_branch((unsigned int *)patch_site_addr(site), target, flags);
 }
 
 static inline int modify_instruction(unsigned int *addr, unsigned int clr,
 				     unsigned int set)
 {
-	return patch_instruction((struct ppc_inst *)addr, ppc_inst((*addr & ~clr) | set));
+	return patch_instruction(addr, ppc_inst((*addr & ~clr) | set));
 }
 
 static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned int set)
@@ -59,9 +59,9 @@ static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned
 
 int instr_is_relative_branch(struct ppc_inst instr);
 int instr_is_relative_link_branch(struct ppc_inst instr);
-unsigned long branch_target(const struct ppc_inst *instr);
-int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
-		     const struct ppc_inst *src);
+unsigned long branch_target(const unsigned int *instr);
+int translate_branch(struct ppc_inst *instr, const unsigned int *dest,
+		     const unsigned int *src);
 extern bool is_conditional_branch(struct ppc_inst instr);
 #ifdef CONFIG_PPC_BOOK3E_64
 void __patch_exception(int exc, unsigned long addr);
diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 5a0740ebf132..32d318c3b180 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -80,13 +80,13 @@ static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 	return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
 }
 
-static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
+static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
 {
 	u32 val, suffix;
 
-	val = *(u32 *)ptr;
+	val = *ptr;
 	if ((val >> 26) == OP_PREFIX) {
-		suffix = *((u32 *)ptr + 1);
+		suffix = *(ptr + 1);
 		return ppc_inst_prefix(val, suffix);
 	} else {
 		return ppc_inst(val);
@@ -114,9 +114,9 @@ static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
-static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
+static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
 {
-	return *ptr;
+	return ppc_inst(*ptr);
 }
 
 #endif /* CONFIG_PPC64 */
@@ -139,7 +139,7 @@ static inline int ppc_inst_len(struct ppc_inst x)
  * Return the address of the next instruction, if the instruction @value was
  * located at @location.
  */
-static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst *value)
+static inline unsigned int *ppc_inst_next(unsigned int *location, unsigned int *value)
 {
 	struct ppc_inst tmp;
 
@@ -177,6 +177,6 @@ static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_ins
 	__str;				\
 })
 
-int copy_inst_from_kernel_nofault(struct ppc_inst *inst, struct ppc_inst *src);
+int copy_inst_from_kernel_nofault(struct ppc_inst *inst, unsigned int *src);
 
 #endif /* _ASM_POWERPC_INST_H */
diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 5bf65f5d44a9..fe683371336f 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -24,8 +24,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
 
 struct arch_uprobe {
 	union {
-		struct ppc_inst	insn;
-		struct ppc_inst	ixol;
+		u32 insn[2];
+		u32 ixol[2];
 	};
 };
 
diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 735e89337398..1476ae72a432 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -35,7 +35,7 @@ void __init reserve_kdump_trampoline(void)
 
 static void __init create_trampoline(unsigned long addr)
 {
-	struct ppc_inst *p = (struct ppc_inst *)addr;
+	unsigned int *p = (unsigned int *)addr;
 
 	/* The maximum range of a single instruction branch, is the current
 	 * instruction's address + (32 MB - 4) bytes. For the trampoline we
@@ -46,7 +46,7 @@ static void __init create_trampoline(unsigned long addr)
 	 * two instructions it doesn't require any registers.
 	 */
 	patch_instruction(p, ppc_inst(PPC_INST_NOP));
-	patch_branch((void *)p + 4, addr + PHYSICAL_START, 0);
+	patch_branch(p + 1, addr + PHYSICAL_START, 0);
 }
 
 void __init setup_kdump_trampoline(void)
diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/epapr_paravirt.c
index 2ed14d4a47f5..93b0f3ec8fb0 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -38,9 +38,9 @@ static int __init early_init_dt_scan_epapr(unsigned long node,
 
 	for (i = 0; i < (len / 4); i++) {
 		struct ppc_inst inst = ppc_inst(be32_to_cpu(insts[i]));
-		patch_instruction((struct ppc_inst *)(epapr_hypercall_start + i), inst);
+		patch_instruction(epapr_hypercall_start + i, inst);
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
-		patch_instruction((struct ppc_inst *)(epapr_ev_idle_start + i), inst);
+		patch_instruction(epapr_ev_idle_start + i, inst);
 #endif
 	}
 
diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
index ce87dc5ea23c..b58d5a0d8c28 100644
--- a/arch/powerpc/kernel/jump_label.c
+++ b/arch/powerpc/kernel/jump_label.c
@@ -11,7 +11,7 @@
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
-	struct ppc_inst *addr = (struct ppc_inst *)jump_entry_code(entry);
+	unsigned int *addr = (unsigned int *)jump_entry_code(entry);
 
 	if (type == JUMP_LABEL_JMP)
 		patch_branch(addr, jump_entry_target(entry), 0);
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 7dd2ad3603ad..22c82ccddaf9 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -419,9 +419,9 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
 	unsigned int instr;
-	struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
+	unsigned int *addr = (unsigned int *)bpt->bpt_addr;
 
-	err = get_kernel_nofault(instr, (unsigned *) addr);
+	err = get_kernel_nofault(instr, addr);
 	if (err)
 		return err;
 
@@ -438,7 +438,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
 	unsigned int instr = *(unsigned int *)bpt->saved_instr;
-	struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
+	unsigned int *addr = (unsigned int *)bpt->bpt_addr;
 
 	err = patch_instruction(addr, ppc_inst(instr));
 	if (err)
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..e6dc2c5bb2cd 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -107,8 +107,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
 	struct kprobe *prev;
-	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
-	struct ppc_inst prefix = ppc_inst_read((struct ppc_inst *)(p->addr - 1));
+	struct ppc_inst insn = ppc_inst_read(p->addr);
+	struct ppc_inst prefix = ppc_inst_read(p->addr - 1);
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -123,8 +123,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 	preempt_disable();
 	prev = get_kprobe(p->addr - 1);
 	preempt_enable_no_resched();
-	if (prev &&
-	    ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)prev->ainsn.insn))) {
+	if (prev && ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
 		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
 		ret = -EINVAL;
 	}
@@ -138,7 +137,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		patch_instruction((struct ppc_inst *)p->ainsn.insn, insn);
+		patch_instruction(p->ainsn.insn, insn);
 		p->opcode = ppc_inst_val(insn);
 	}
 
@@ -149,13 +148,13 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
 void arch_arm_kprobe(struct kprobe *p)
 {
-	patch_instruction((struct ppc_inst *)p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
+	patch_instruction(p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction((struct ppc_inst *)p->addr, ppc_inst(p->opcode));
+	patch_instruction(p->addr, ppc_inst(p->opcode));
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
@@ -228,7 +227,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
+	struct ppc_inst insn = ppc_inst_read(p->ainsn.insn);
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
@@ -439,7 +438,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	if (!cur || user_mode(regs))
 		return 0;
 
-	len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
+	len = ppc_inst_len(ppc_inst_read(cur->ainsn.insn));
 	/* make sure we got here for instruction we have a kprobe on */
 	if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
 		return 0;
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 667104d4c455..f3b5097768b6 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -463,7 +463,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	pfn = addr_to_pfn(regs, regs->nip);
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
-		instr = ppc_inst_read((struct ppc_inst *)instr_addr);
+		instr = ppc_inst_read((unsigned int *)instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index cdf87086fa33..adaf31157f6d 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -100,9 +100,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * Ensure that the instruction is not a conditional branch,
 	 * and that can be emulated.
 	 */
-	if (!is_conditional_branch(ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) &&
-	    analyse_instr(&op, &regs,
-			  ppc_inst_read((struct ppc_inst *)p->ainsn.insn)) == 1) {
+	if (!is_conditional_branch(ppc_inst_read(p->ainsn.insn)) &&
+	    analyse_instr(&op, &regs, ppc_inst_read(p->ainsn.insn)) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
@@ -143,12 +142,10 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 
 static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_RAW_LIS(reg, IMM_H(val))));
+	patch_instruction(addr, ppc_inst(PPC_RAW_LIS(reg, IMM_H(val))));
 	addr++;
 
-	patch_instruction((struct ppc_inst *)addr,
-			  ppc_inst(PPC_RAW_ORI(reg, reg, IMM_L(val))));
+	patch_instruction(addr, ppc_inst(PPC_RAW_ORI(reg, reg, IMM_L(val))));
 }
 
 /*
@@ -158,31 +155,31 @@ static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_opcode_t *
 static void patch_imm64_load_insns(unsigned long long val, int reg, kprobe_opcode_t *addr)
 {
 	/* lis reg,(op)@highest */
-	patch_instruction((struct ppc_inst *)addr,
+	patch_instruction(addr,
 			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
 				   ((val >> 48) & 0xffff)));
 	addr++;
 
 	/* ori reg,reg,(op)@higher */
-	patch_instruction((struct ppc_inst *)addr,
+	patch_instruction(addr,
 			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
 				   ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
 	addr++;
 
 	/* rldicr reg,reg,32,31 */
-	patch_instruction((struct ppc_inst *)addr,
+	patch_instruction(addr,
 			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
 				   ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
 	/* oris reg,reg,(op)@h */
-	patch_instruction((struct ppc_inst *)addr,
+	patch_instruction(addr,
 			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
 				   ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
 	addr++;
 
 	/* ori reg,reg,(op)@l */
-	patch_instruction((struct ppc_inst *)addr,
+	patch_instruction(addr,
 			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
 				   ___PPC_RS(reg) | (val & 0xffff)));
 }
@@ -238,8 +235,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
 	for (i = 0; i < size; i++) {
-		rc = patch_instruction((struct ppc_inst *)(buff + i),
-				       ppc_inst(*(optprobe_template_entry + i)));
+		rc = patch_instruction(buff + i, ppc_inst(*(optprobe_template_entry + i)));
 		if (rc < 0)
 			goto error;
 	}
@@ -260,34 +256,30 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 		goto error;
 	}
 
-	rc = create_branch(&branch_op_callback,
-			   (struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
+	rc = create_branch(&branch_op_callback, buff + TMPL_CALL_HDLR_IDX,
 			   (unsigned long)op_callback_addr,
 			   BRANCH_SET_LINK);
 
-	rc |= create_branch(&branch_emulate_step,
-			    (struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
+	rc |= create_branch(&branch_emulate_step, buff + TMPL_EMULATE_IDX,
 			    (unsigned long)emulate_step_addr,
 			    BRANCH_SET_LINK);
 
 	if (rc)
 		goto error;
 
-	patch_instruction((struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
-			  branch_op_callback);
-	patch_instruction((struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
-			  branch_emulate_step);
+	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
+	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
 
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
 	 */
-	temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
+	temp = ppc_inst_read(p->ainsn.insn);
 	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
 
 	/*
 	 * 4. branch back from trampoline
 	 */
-	patch_branch((struct ppc_inst *)(buff + TMPL_RET_IDX), (unsigned long)nip, 0);
+	patch_branch(buff + TMPL_RET_IDX, nip, 0);
 
 	flush_icache_range((unsigned long)buff,
 			   (unsigned long)(&buff[TMPL_END_IDX]));
@@ -330,10 +322,9 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		 */
 		memcpy(op->optinsn.copied_insn, op->kp.addr,
 					       RELATIVEJUMP_SIZE);
-		create_branch(&instr,
-			      (struct ppc_inst *)op->kp.addr,
+		create_branch(&instr, op->kp.addr,
 			      (unsigned long)op->optinsn.insn, 0);
-		patch_instruction((struct ppc_inst *)op->kp.addr, instr);
+		patch_instruction(op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
 }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index d7c1f92152af..77590ecf83b1 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -74,7 +74,7 @@ EXPORT_SYMBOL(DMA_MODE_WRITE);
  */
 notrace void __init machine_init(u64 dt_ptr)
 {
-	struct ppc_inst *addr = (struct ppc_inst *)patch_site_addr(&patch__memset_nocache);
+	unsigned int *addr = (unsigned int *)patch_site_addr(&patch__memset_nocache);
 	struct ppc_inst insn;
 
 	/* Configure static keys first, now that we're relocated. */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index ffe9537195aa..fc7453a27175 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -49,7 +49,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 	addr = ppc_function_entry((void *)addr);
 
 	/* if (link) set op to 'bl' else 'b' */
-	create_branch(&op, (struct ppc_inst *)ip, addr, link ? 1 : 0);
+	create_branch(&op, (unsigned int *)ip, addr, link ? 1 : 0);
 
 	return op;
 }
@@ -79,7 +79,7 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 	}
 
 	/* replace the text with the new text */
-	if (patch_instruction((struct ppc_inst *)ip, new))
+	if (patch_instruction((unsigned int *)ip, new))
 		return -EPERM;
 
 	return 0;
@@ -94,7 +94,7 @@ static int test_24bit_addr(unsigned long ip, unsigned long addr)
 	addr = ppc_function_entry((void *)addr);
 
 	/* use the create_branch to verify that this offset can be branched */
-	return create_branch(&op, (struct ppc_inst *)ip, addr, 0) == 0;
+	return create_branch(&op, (unsigned int *)ip, addr, 0) == 0;
 }
 
 static int is_bl_op(struct ppc_inst op)
@@ -208,7 +208,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
 
-	if (patch_instruction((struct ppc_inst *)ip, pop)) {
+	if (patch_instruction((unsigned int *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -280,7 +280,7 @@ __ftrace_make_nop(struct module *mod,
 
 	op = ppc_inst(PPC_INST_NOP);
 
-	if (patch_instruction((struct ppc_inst *)ip, op))
+	if (patch_instruction((unsigned int *)ip, op))
 		return -EPERM;
 
 	return 0;
@@ -380,7 +380,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 		return -1;
 	}
 
-	if (patch_branch((struct ppc_inst *)tramp, ptr, 0)) {
+	if (patch_branch((unsigned int *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
 	}
@@ -424,7 +424,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((struct ppc_inst *)ip, ppc_inst(PPC_INST_NOP))) {
+	if (patch_instruction((unsigned int *)ip, ppc_inst(PPC_INST_NOP))) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -589,10 +589,10 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	int err;
 	struct ppc_inst op;
-	unsigned long ip = rec->ip;
+	unsigned int *ip = (unsigned int *)rec->ip;
 
 	/* read where this goes */
-	if (copy_inst_from_kernel_nofault(&op, (void *)ip))
+	if (copy_inst_from_kernel_nofault(&op, ip))
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
@@ -608,8 +608,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* create the branch to the trampoline */
-	err = create_branch(&op, (struct ppc_inst *)ip,
-			    rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
+	err = create_branch(&op, ip, rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
 	if (err) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
@@ -617,7 +616,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	pr_devel("write to %lx\n", rec->ip);
 
-	if (patch_instruction((struct ppc_inst *)ip, op))
+	if (patch_instruction(ip, op))
 		return -EPERM;
 
 	return 0;
@@ -762,7 +761,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	/* The new target may be within range */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		if (patch_branch((struct ppc_inst *)ip, addr, BRANCH_SET_LINK)) {
+		if (patch_branch((unsigned int *)ip, addr, BRANCH_SET_LINK)) {
 			pr_err("REL24 out of range!\n");
 			return -EINVAL;
 		}
@@ -790,12 +789,12 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (create_branch(&op, (struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
+	if (create_branch(&op, (unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
-	if (patch_branch((struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
+	if (patch_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
 	}
@@ -851,7 +850,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	struct ppc_inst old, new;
 	int ret;
 
-	old = ppc_inst_read((struct ppc_inst *)&ftrace_call);
+	old = ppc_inst_read((unsigned int *)&ftrace_call);
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
@@ -859,7 +858,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	/* Also update the regs callback function */
 	if (!ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
-		old = ppc_inst_read((struct ppc_inst *)&ftrace_regs_call);
+		old = ppc_inst_read((unsigned int *)&ftrace_regs_call);
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 46971bb41d05..1aefd2ecbb8a 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -42,7 +42,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 		return -EINVAL;
 
 	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
-	    ppc_inst_prefixed(ppc_inst_read(&auprobe->insn)) &&
+	    ppc_inst_prefixed(ppc_inst_read(auprobe->insn)) &&
 	    (addr & 0x3f) == 60) {
 		pr_info_ratelimited("Cannot register a uprobe on 64 byte unaligned prefixed instruction\n");
 		return -EINVAL;
@@ -119,7 +119,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, &auprobe->insn);
+	regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, auprobe->insn);
 
 	user_disable_single_step(current);
 	return 0;
@@ -182,7 +182,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, ppc_inst_read(&auprobe->insn));
+	ret = emulate_step(regs, ppc_inst_read(auprobe->insn));
 	if (ret > 0)
 		return true;
 
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 508e9511ca96..bab8bd2d2714 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -18,8 +18,8 @@
 #include <asm/setup.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
-			       struct ppc_inst *patch_addr)
+static int __patch_instruction(unsigned int *exec_addr, struct ppc_inst instr,
+			       unsigned int *patch_addr)
 {
 	if (!ppc_inst_prefixed(instr)) {
 		u32 val = ppc_inst_val(instr);
@@ -40,7 +40,7 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
 	return -EFAULT;
 }
 
-int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
+int raw_patch_instruction(unsigned int *addr, struct ppc_inst instr)
 {
 	return __patch_instruction(addr, instr, addr);
 }
@@ -148,10 +148,10 @@ static inline int unmap_patch_area(unsigned long addr)
 	return 0;
 }
 
-static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
+static int do_patch_instruction(unsigned int *addr, struct ppc_inst instr)
 {
 	int err;
-	struct ppc_inst *patch_addr = NULL;
+	unsigned int *patch_addr = NULL;
 	unsigned long flags;
 	unsigned long text_poke_addr;
 	unsigned long kaddr = (unsigned long)addr;
@@ -172,7 +172,7 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 		goto out;
 	}
 
-	patch_addr = (struct ppc_inst *)(text_poke_addr + (kaddr & ~PAGE_MASK));
+	patch_addr = (unsigned int *)(text_poke_addr + (kaddr & ~PAGE_MASK));
 
 	__patch_instruction(addr, instr, patch_addr);
 
@@ -187,14 +187,14 @@ static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
-static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
+static int do_patch_instruction(unsigned int *addr, struct ppc_inst instr)
 {
 	return raw_patch_instruction(addr, instr);
 }
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
-int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
+int patch_instruction(unsigned int *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
 	if (init_mem_is_free && init_section_contains(addr, 4)) {
@@ -205,7 +205,7 @@ int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
-int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
+int patch_branch(unsigned int *addr, unsigned long target, int flags)
 {
 	struct ppc_inst instr;
 
@@ -258,7 +258,7 @@ bool is_conditional_branch(struct ppc_inst instr)
 NOKPROBE_SYMBOL(is_conditional_branch);
 
 int create_branch(struct ppc_inst *instr,
-		  const struct ppc_inst *addr,
+		  const unsigned int *addr,
 		  unsigned long target, int flags)
 {
 	long offset;
@@ -278,7 +278,7 @@ int create_branch(struct ppc_inst *instr,
 	return 0;
 }
 
-int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
+int create_cond_branch(struct ppc_inst *instr, const unsigned int *addr,
 		       unsigned long target, int flags)
 {
 	long offset;
@@ -325,7 +325,7 @@ int instr_is_relative_link_branch(struct ppc_inst instr)
 	return instr_is_relative_branch(instr) && (ppc_inst_val(instr) & BRANCH_SET_LINK);
 }
 
-static unsigned long branch_iform_target(const struct ppc_inst *instr)
+static unsigned long branch_iform_target(const unsigned int *instr)
 {
 	signed long imm;
 
@@ -341,7 +341,7 @@ static unsigned long branch_iform_target(const struct ppc_inst *instr)
 	return (unsigned long)imm;
 }
 
-static unsigned long branch_bform_target(const struct ppc_inst *instr)
+static unsigned long branch_bform_target(const unsigned int *instr)
 {
 	signed long imm;
 
@@ -357,7 +357,7 @@ static unsigned long branch_bform_target(const struct ppc_inst *instr)
 	return (unsigned long)imm;
 }
 
-unsigned long branch_target(const struct ppc_inst *instr)
+unsigned long branch_target(const unsigned int *instr)
 {
 	if (instr_is_branch_iform(ppc_inst_read(instr)))
 		return branch_iform_target(instr);
@@ -367,8 +367,8 @@ unsigned long branch_target(const struct ppc_inst *instr)
 	return 0;
 }
 
-int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
-		     const struct ppc_inst *src)
+int translate_branch(struct ppc_inst *instr, const unsigned int *dest,
+		     const unsigned int *src)
 {
 	unsigned long target;
 	target = branch_target(src);
@@ -395,13 +395,13 @@ void __patch_exception(int exc, unsigned long addr)
 	 * instruction of the exception, not the first one
 	 */
 
-	patch_branch((struct ppc_inst *)(ibase + (exc / 4) + 1), addr, 0);
+	patch_branch(ibase + (exc / 4) + 1, addr, 0);
 }
 #endif
 
 #ifdef CONFIG_CODE_PATCHING_SELFTEST
 
-static int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
+static int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr)
 {
 	if (instr_is_branch_iform(ppc_inst_read(instr)) ||
 	    instr_is_branch_bform(ppc_inst_read(instr)))
@@ -423,7 +423,7 @@ static void __init test_branch_iform(void)
 	int err;
 	struct ppc_inst instr;
 	unsigned int tmp[2];
-	struct ppc_inst *iptr = (struct ppc_inst *)tmp;
+	unsigned int *iptr = tmp;
 	unsigned long addr = (unsigned long)tmp;
 
 	/* The simplest case, branch to self, no flags */
@@ -501,12 +501,12 @@ static void __init test_branch_iform(void)
 
 static void __init test_create_function_call(void)
 {
-	struct ppc_inst *iptr;
+	unsigned int *iptr;
 	unsigned long dest;
 	struct ppc_inst instr;
 
 	/* Check we can create a function call */
-	iptr = (struct ppc_inst *)ppc_function_entry(test_trampoline);
+	iptr = (unsigned int *)ppc_function_entry(test_trampoline);
 	dest = ppc_function_entry(test_create_function_call);
 	create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
 	patch_instruction(iptr, instr);
@@ -517,11 +517,11 @@ static void __init test_branch_bform(void)
 {
 	int err;
 	unsigned long addr;
-	struct ppc_inst *iptr, instr;
+	struct ppc_inst instr;
 	unsigned int tmp[2];
+	unsigned int *iptr = tmp;
 	unsigned int flags;
 
-	iptr = (struct ppc_inst *)tmp;
 	addr = (unsigned long)iptr;
 
 	/* The simplest case, branch to self, no flags */
@@ -726,9 +726,9 @@ static void __init test_prefixed_patching(void)
 	extern unsigned int code_patching_test1_expected[];
 	extern unsigned int end_code_patching_test1[];
 
-	__patch_instruction((struct ppc_inst *)code_patching_test1,
+	__patch_instruction(code_patching_test1,
 			    ppc_inst_prefix(OP_PREFIX << 26, 0x00000000),
-			    (struct ppc_inst *)code_patching_test1);
+			    code_patching_test1);
 
 	check(!memcmp(code_patching_test1,
 		      code_patching_test1_expected,
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 8905b53109bc..801f34530133 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -33,18 +33,18 @@ struct fixup_entry {
 	long		alt_end_off;
 };
 
-static struct ppc_inst *calc_addr(struct fixup_entry *fcur, long offset)
+static unsigned int *calc_addr(struct fixup_entry *fcur, long offset)
 {
 	/*
 	 * We store the offset to the code as a negative offset from
 	 * the start of the alt_entry, to support the VDSO. This
 	 * routine converts that back into an actual address.
 	 */
-	return (struct ppc_inst *)((unsigned long)fcur + offset);
+	return (unsigned int *)((unsigned long)fcur + offset);
 }
 
-static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
-				 struct ppc_inst *alt_start, struct ppc_inst *alt_end)
+static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
+				 unsigned int *alt_start, unsigned int *alt_end)
 {
 	int err;
 	struct ppc_inst instr;
@@ -52,7 +52,7 @@ static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
 	instr = ppc_inst_read(src);
 
 	if (instr_is_relative_branch(ppc_inst_read(src))) {
-		struct ppc_inst *target = (struct ppc_inst *)branch_target(src);
+		unsigned int *target = (unsigned int *)branch_target(src);
 
 		/* Branch within the section doesn't need translating */
 		if (target < alt_start || target > alt_end) {
@@ -69,7 +69,7 @@ static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
 
 static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 {
-	struct ppc_inst *start, *end, *alt_start, *alt_end, *src, *dest, nop;
+	unsigned int *start, *end, *alt_start, *alt_end, *src, *dest;
 
 	start = calc_addr(fcur, fcur->start_off);
 	end = calc_addr(fcur, fcur->end_off);
@@ -91,9 +91,8 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 			return 1;
 	}
 
-	nop = ppc_inst(PPC_INST_NOP);
-	for (; dest < end; dest = ppc_inst_next(dest, &nop))
-		raw_patch_instruction(dest, nop);
+	for (; dest < end; dest++)
+		raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
 
 	return 0;
 }
@@ -152,14 +151,14 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 
 		// See comment in do_entry_flush_fixups() RE order of patching
 		if (types & STF_BARRIER_FALLBACK) {
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_branch((struct ppc_inst *)(dest + 1),
+			patch_instruction(dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_branch(dest + 1,
 				     (unsigned long)&stf_barrier_fallback, BRANCH_SET_LINK);
 		} else {
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 1, ppc_inst(instrs[1]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_instruction(dest, ppc_inst(instrs[0]));
 		}
 	}
 
@@ -213,12 +212,12 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
-		patch_instruction((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
-		patch_instruction((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
+		patch_instruction(dest, ppc_inst(instrs[0]));
+		patch_instruction(dest + 1, ppc_inst(instrs[1]));
+		patch_instruction(dest + 2, ppc_inst(instrs[2]));
+		patch_instruction(dest + 3, ppc_inst(instrs[3]));
+		patch_instruction(dest + 4, ppc_inst(instrs[4]));
+		patch_instruction(dest + 5, ppc_inst(instrs[5]));
 	}
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
@@ -282,11 +281,11 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction(dest, ppc_inst(instrs[0]));
 
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+		patch_instruction(dest + 1, ppc_inst(instrs[1]));
+		patch_instruction(dest + 2, ppc_inst(instrs[2]));
+		patch_instruction(dest + 3, ppc_inst(instrs[3]));
 	}
 
 	printk(KERN_DEBUG "uaccess-flush: patched %d locations (%s flush)\n", i,
@@ -358,14 +357,14 @@ static int __do_entry_flush_fixups(void *data)
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
 		if (types == L1D_FLUSH_FALLBACK) {
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_branch((struct ppc_inst *)(dest + 1),
+			patch_instruction(dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_branch(dest + 1,
 				     (unsigned long)&entry_flush_fallback, BRANCH_SET_LINK);
 		} else {
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 1, ppc_inst(instrs[1]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_instruction(dest, ppc_inst(instrs[0]));
 		}
 	}
 
@@ -377,14 +376,14 @@ static int __do_entry_flush_fixups(void *data)
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
 		if (types == L1D_FLUSH_FALLBACK) {
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_branch((struct ppc_inst *)(dest + 1),
+			patch_instruction(dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_branch(dest + 1,
 				     (unsigned long)&scv_entry_flush_fallback, BRANCH_SET_LINK);
 		} else {
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+			patch_instruction(dest + 1, ppc_inst(instrs[1]));
+			patch_instruction(dest + 2, ppc_inst(instrs[2]));
+			patch_instruction(dest, ppc_inst(instrs[0]));
 		}
 	}
 
@@ -443,9 +442,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction(dest, ppc_inst(instrs[0]));
+		patch_instruction(dest + 1, ppc_inst(instrs[1]));
+		patch_instruction(dest + 2, ppc_inst(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
@@ -478,7 +477,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
+		patch_instruction(dest, ppc_inst(instr));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -521,8 +520,8 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instr[1]));
+		patch_instruction(dest, ppc_inst(instr[0]));
+		patch_instruction(dest + 1, ppc_inst(instr[1]));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -536,7 +535,7 @@ static void patch_btb_flush_section(long *curr)
 	end = (void *)curr + *(curr + 1);
 	for (; start < end; start++) {
 		pr_devel("patching dest %lx\n", (unsigned long)start);
-		patch_instruction((struct ppc_inst *)start, ppc_inst(PPC_INST_NOP));
+		patch_instruction(start, ppc_inst(PPC_INST_NOP));
 	}
 }
 
@@ -555,7 +554,7 @@ void do_btb_flush_fixups(void)
 void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 {
 	long *start, *end;
-	struct ppc_inst *dest;
+	unsigned int *dest;
 
 	if (!(value & CPU_FTR_LWSYNC))
 		return ;
@@ -572,13 +571,14 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 static void do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
-	struct ppc_inst inst, *src, *dest, *end;
+	struct ppc_inst inst;
+	unsigned int *src, *dest, *end;
 
 	if (PHYSICAL_START == 0)
 		return;
 
-	src = (struct ppc_inst *)(KERNELBASE + PHYSICAL_START);
-	dest = (struct ppc_inst *)KERNELBASE;
+	src = (unsigned int *)(KERNELBASE + PHYSICAL_START);
+	dest = (unsigned int *)KERNELBASE;
 	end = (void *)src + (__end_interrupts - _stext);
 
 	while (src < end) {
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index a3c30a884076..de4279f770ed 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -12,7 +12,7 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
 
-int copy_inst_from_kernel_nofault(struct ppc_inst *inst, struct ppc_inst *src)
+int copy_inst_from_kernel_nofault(struct ppc_inst *inst, unsigned int *src)
 {
 	unsigned int val, suffix;
 	int err;
@@ -21,7 +21,7 @@ int copy_inst_from_kernel_nofault(struct ppc_inst *inst, struct ppc_inst *src)
 	if (err)
 		return err;
 	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
-		err = copy_from_kernel_nofault(&suffix, (void *)src + 4, 4);
+		err = copy_from_kernel_nofault(&suffix, src + 1, sizeof(suffix));
 		*inst = ppc_inst_prefix(val, suffix);
 	} else {
 		*inst = ppc_inst(val);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 16d4d1b6a1ff..3e864feaacf7 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -460,7 +460,7 @@ static __u64 power_pmu_bhrb_to(u64 addr)
 				sizeof(instr)))
 			return 0;
 
-		return branch_target((struct ppc_inst *)&instr);
+		return branch_target(&instr);
 	}
 
 	/* Userspace: need copy instruction here then translate it */
@@ -468,7 +468,7 @@ static __u64 power_pmu_bhrb_to(u64 addr)
 			sizeof(instr)))
 		return 0;
 
-	target = branch_target((struct ppc_inst *)&instr);
+	target = branch_target(&instr);
 	if ((!target) || (instr & BRANCH_ABSOLUTE))
 		return target;
 
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_smp.c b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
index 87f524e4b09c..302f2a1e0361 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_smp.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
@@ -83,7 +83,7 @@ smp_86xx_kick_cpu(int nr)
 		mdelay(1);
 
 	/* Restore the exception vector */
-	patch_instruction((struct ppc_inst *)vector, ppc_inst(save_vector));
+	patch_instruction(vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
 
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index adae2a6712e1..bdfea6d6ab69 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -810,7 +810,7 @@ static int smp_core99_kick_cpu(int nr)
 	 *   b __secondary_start_pmac_0 + nr*8
 	 */
 	target = (unsigned long) __secondary_start_pmac_0 + nr * 8;
-	patch_branch((struct ppc_inst *)vector, target, BRANCH_SET_LINK);
+	patch_branch(vector, target, BRANCH_SET_LINK);
 
 	/* Put some life in our friend */
 	pmac_call_feature(PMAC_FTR_RESET_CPU, NULL, nr, 0);
@@ -823,7 +823,7 @@ static int smp_core99_kick_cpu(int nr)
 	mdelay(1);
 
 	/* Restore our exception vector */
-	patch_instruction((struct ppc_inst *)vector, ppc_inst(save_vector));
+	patch_instruction(vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
 	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d..3b8770455551 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -100,7 +100,7 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	struct ppc_inst	*instr;
+	unsigned int	*instr;
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -946,11 +946,11 @@ static void insert_bpts(void)
 		}
 
 		patch_instruction(bp->instr, instr);
-		patch_instruction(ppc_inst_next(bp->instr, &instr),
+		patch_instruction(ppc_inst_next(bp->instr, bp->instr),
 				  ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
-		if (patch_instruction((struct ppc_inst *)bp->address,
+		if (patch_instruction((unsigned int *)bp->address,
 				      ppc_inst(bpinstr)) != 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
@@ -992,7 +992,7 @@ static void remove_bpts(void)
 		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
-			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
+			(unsigned int *)bp->address, ppc_inst_read(bp->instr)) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
@@ -2214,7 +2214,7 @@ mread_instr(unsigned long adrs, struct ppc_inst *instr)
 	if (setjmp(bus_error_jmp) == 0) {
 		catch_memory_errors = 1;
 		sync();
-		*instr = ppc_inst_read((struct ppc_inst *)adrs);
+		*instr = ppc_inst_read((unsigned int *)adrs);
 		sync();
 		/* wait a little while to see if we get a machine check */
 		__delay(200);
-- 
2.25.0



