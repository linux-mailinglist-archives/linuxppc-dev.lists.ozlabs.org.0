Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BB1C6692
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:04:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2zY08fszDr55
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:04:41 +1000 (AEST)
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
 header.s=20161025 header.b=HprmKDQv; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2Y24kl6zDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:45:10 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 18so328975pfv.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/H89od/jIzKeWHj9+hU0IypkQehR2cjSWb23uhWVh9U=;
 b=HprmKDQvwhJfFopieVMmGsu4irrITOtIddazQfOBBolmxGgk7B5CEIxYn6cgNTUfrE
 f6F9iRa+wV+5+zl69LtziG9f1YF0eWzam2eBNyxj35E2GEE0KyPFajgQS4oZ0BvHCo58
 nAFh2k4/GgNHSrMu/EwzsFOiFOoU3ii3BVWtW+TSDyWc9rsTh6ozi/Jmm6vCIt4XaRTh
 iFNskYG1ImTdd6BicWlAtuXf/5DTNuB9CIXIJit8h70OBeta410slOkGFiY/2W1mbCda
 Hr1m3Q3/nB2b7S4hkdJfqwEQTnNVZqkSkaJh/l9gW9rwgptERjp4z/KXh8++SdkfKUxY
 cbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/H89od/jIzKeWHj9+hU0IypkQehR2cjSWb23uhWVh9U=;
 b=ApJSEogcYP0rA4kwJzspfnqx3Diefti77yl2L54s3DX72V6grSzVPir9E73Y4fYTNS
 q7Rg+27bLWsUt90UiPXYzKQwP2AOmoHXVDXVSi7UW1F22h388YaxtwCunk60fECicUjw
 K3JlYEQr312ccS8rWThckW29n48OIOwtcWE3Rv/Gu6+wefWOPDuHfn5OTLkXHI9Ll8rc
 ZHGJdfIIer4x3+c3yEg08l/MlaVNyUWZ/ZnaBjFlDZYiQyzy3jHRIvrBRLp5p4iuKla7
 1w3c5c1RimeN7Yw8th0+/EgzdvDvxhR/cP91nxCjmg6UYL1EmZPfimCmuF1IzcnwVWxO
 Ze1A==
X-Gm-Message-State: AGi0PuY0kdzL5lltLxHKFZ1DMWeddBGc87xUNU9I6IkkiOjU3SPUNSFt
 Poq2qIZjB9BUmzwKrLi+dsS80ksxZAogdQ==
X-Google-Smtp-Source: APiQypLEPIYFC4EY8I7FKKSds1VGZtzWTI49dkcgU4HGruCQoyRZlsC2A7c5qU3L9WBp4Fr5yUALFg==
X-Received: by 2002:a65:5a47:: with SMTP id z7mr5321889pgs.229.1588736705845; 
 Tue, 05 May 2020 20:45:05 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:45:05 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 11/30] powerpc: Use a datatype for instructions
Date: Wed,  6 May 2020 13:40:31 +1000
Message-Id: <20200506034050.24806-12-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently unsigned ints are used to represent instructions on powerpc.
This has worked well as instructions have always been 4 byte words.
However, a future ISA version will introduce some changes to
instructions that mean this scheme will no longer work as well. This
change is Prefixed Instructions. A prefixed instruction is made up of a
word prefix followed by a word suffix to make an 8 byte double word
instruction. No matter the endianness of the system the prefix always
comes first. Prefixed instructions are only planned for powerpc64.

Introduce a ppc_inst type to represent both prefixed and word
instructions on powerpc64 while keeping it possible to exclusively have
word instructions on powerpc32.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: Add to epapr_paravirt.c, kgdb.c
v6: - setup_32.c: machine_init(): Use type
    - feature-fixups.c: do_final_fixups(): Use type
    - optprobes.c: arch_prepare_optimized_kprobe(): change a void * to
      struct ppc_inst *
    - fault.c: store_updates_sp(): Use type
    - Change ppc_inst_equal() implementation from memcpy()
v7: - Fix compilation issue in early_init_dt_scan_epapr() and
      do_patch_instruction() with CONFIG_STRICT_KERNEL_RWX
v8: - style
    - Use in crash_dump.c, mpc86xx_smp.c, smp.c
---
 arch/powerpc/include/asm/code-patching.h  | 32 ++++-----
 arch/powerpc/include/asm/inst.h           | 18 +++--
 arch/powerpc/include/asm/sstep.h          |  5 +-
 arch/powerpc/include/asm/uprobes.h        |  5 +-
 arch/powerpc/kernel/align.c               |  4 +-
 arch/powerpc/kernel/crash_dump.c          |  2 +-
 arch/powerpc/kernel/epapr_paravirt.c      |  6 +-
 arch/powerpc/kernel/hw_breakpoint.c       |  4 +-
 arch/powerpc/kernel/jump_label.c          |  2 +-
 arch/powerpc/kernel/kgdb.c                |  4 +-
 arch/powerpc/kernel/kprobes.c             |  8 +--
 arch/powerpc/kernel/mce_power.c           |  5 +-
 arch/powerpc/kernel/optprobes.c           | 64 +++++++++--------
 arch/powerpc/kernel/setup_32.c            |  4 +-
 arch/powerpc/kernel/trace/ftrace.c        | 83 ++++++++++++-----------
 arch/powerpc/kernel/vecemu.c              |  5 +-
 arch/powerpc/lib/code-patching.c          | 76 ++++++++++-----------
 arch/powerpc/lib/feature-fixups.c         | 60 ++++++++--------
 arch/powerpc/lib/sstep.c                  |  4 +-
 arch/powerpc/lib/test_emulate_step.c      |  9 +--
 arch/powerpc/mm/fault.c                   |  4 +-
 arch/powerpc/perf/core-book3s.c           |  4 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c |  4 +-
 arch/powerpc/platforms/powermac/smp.c     |  4 +-
 arch/powerpc/xmon/xmon.c                  | 22 +++---
 arch/powerpc/xmon/xmon_bpts.h             |  6 +-
 26 files changed, 233 insertions(+), 211 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 48e021957ee5..eacc9102c251 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -23,33 +23,33 @@
 #define BRANCH_ABSOLUTE	0x2
 
 bool is_offset_in_branch_range(long offset);
-int create_branch(unsigned int *instr, const unsigned int *addr,
+int create_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
 		  unsigned long target, int flags);
-int create_cond_branch(unsigned int *instr, const unsigned int *addr,
+int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
 		       unsigned long target, int flags);
-int patch_branch(unsigned int *addr, unsigned long target, int flags);
-int patch_instruction(unsigned int *addr, unsigned int instr);
-int raw_patch_instruction(unsigned int *addr, unsigned int instr);
+int patch_branch(struct ppc_inst *addr, unsigned long target, int flags);
+int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
+int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
 	return (unsigned long)site + *site;
 }
 
-static inline int patch_instruction_site(s32 *site, unsigned int instr)
+static inline int patch_instruction_site(s32 *site, struct ppc_inst instr)
 {
-	return patch_instruction((unsigned int *)patch_site_addr(site), instr);
+	return patch_instruction((struct ppc_inst *)patch_site_addr(site), instr);
 }
 
 static inline int patch_branch_site(s32 *site, unsigned long target, int flags)
 {
-	return patch_branch((unsigned int *)patch_site_addr(site), target, flags);
+	return patch_branch((struct ppc_inst *)patch_site_addr(site), target, flags);
 }
 
 static inline int modify_instruction(unsigned int *addr, unsigned int clr,
 				     unsigned int set)
 {
-	return patch_instruction(addr, ppc_inst((*addr & ~clr) | set));
+	return patch_instruction((struct ppc_inst *)addr, ppc_inst((*addr & ~clr) | set));
 }
 
 static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned int set)
@@ -57,13 +57,13 @@ static inline int modify_instruction_site(s32 *site, unsigned int clr, unsigned
 	return modify_instruction((unsigned int *)patch_site_addr(site), clr, set);
 }
 
-int instr_is_relative_branch(unsigned int instr);
-int instr_is_relative_link_branch(unsigned int instr);
-int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr);
-unsigned long branch_target(const unsigned int *instr);
-int translate_branch(unsigned int *instr, const unsigned int *dest,
-		     const unsigned int *src);
-extern bool is_conditional_branch(unsigned int instr);
+int instr_is_relative_branch(struct ppc_inst instr);
+int instr_is_relative_link_branch(struct ppc_inst instr);
+int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr);
+unsigned long branch_target(const struct ppc_inst *instr);
+int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
+		     const struct ppc_inst *src);
+extern bool is_conditional_branch(struct ppc_inst instr);
 #ifdef CONFIG_PPC_BOOK3E_64
 void __patch_exception(int exc, unsigned long addr);
 #define patch_exception(exc, name) do { \
diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 0c5dc539160a..19d8bb7a1c2b 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -6,26 +6,30 @@
  * Instruction data type for POWER
  */
 
-#define ppc_inst(x) (x)
+struct ppc_inst {
+	u32 val;
+} __packed;
 
-static inline u32 ppc_inst_val(u32 x)
+#define ppc_inst(x) ((struct ppc_inst){ .val = x })
+
+static inline u32 ppc_inst_val(struct ppc_inst x)
 {
-	return x;
+	return x.val;
 }
 
-static inline int ppc_inst_primary_opcode(u32 x)
+static inline int ppc_inst_primary_opcode(struct ppc_inst x)
 {
 	return ppc_inst_val(x) >> 26;
 }
 
-static inline u32 ppc_inst_swab(u32 x)
+static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
 {
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
-static inline bool ppc_inst_equal(u32 x, u32 y)
+static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 {
-	return x == y;
+	return ppc_inst_val(x) == ppc_inst_val(y);
 }
 
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 26d729562fe2..c3ce903ac488 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2004 Paul Mackerras <paulus@au.ibm.com>, IBM
  */
+#include <asm/inst.h>
 
 struct pt_regs;
 
@@ -132,7 +133,7 @@ union vsx_reg {
  * otherwise.
  */
 extern int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-			 unsigned int instr);
+			 struct ppc_inst instr);
 
 /*
  * Emulate an instruction that can be executed just by updating
@@ -149,7 +150,7 @@ void emulate_update_regs(struct pt_regs *reg, struct instruction_op *op);
  * 0 if it could not be emulated, or -1 for an instruction that
  * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
  */
-extern int emulate_step(struct pt_regs *regs, unsigned int instr);
+extern int emulate_step(struct pt_regs *regs, struct ppc_inst instr);
 
 /*
  * Emulate a load or store instruction by reading/writing the
diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
index 2bbdf27d09b5..7e3b329ba2d3 100644
--- a/arch/powerpc/include/asm/uprobes.h
+++ b/arch/powerpc/include/asm/uprobes.h
@@ -11,6 +11,7 @@
 
 #include <linux/notifier.h>
 #include <asm/probes.h>
+#include <asm/inst.h>
 
 typedef ppc_opcode_t uprobe_opcode_t;
 
@@ -23,8 +24,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
 
 struct arch_uprobe {
 	union {
-		u32	insn;
-		u32	ixol;
+		struct ppc_inst	insn;
+		struct ppc_inst	ixol;
 	};
 };
 
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index a63216da8cf1..9e66e6c62354 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -294,7 +294,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 int fix_alignment(struct pt_regs *regs)
 {
-	unsigned int instr;
+	struct ppc_inst instr;
 	struct instruction_op op;
 	int r, type;
 
@@ -304,7 +304,7 @@ int fix_alignment(struct pt_regs *regs)
 	 */
 	CHECK_FULL_REGS(regs);
 
-	if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
+	if (unlikely(__get_user(instr.val, (unsigned int __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
 		/* We don't handle PPC little-endian any more... */
diff --git a/arch/powerpc/kernel/crash_dump.c b/arch/powerpc/kernel/crash_dump.c
index 78e556b131db..72bafb47e757 100644
--- a/arch/powerpc/kernel/crash_dump.c
+++ b/arch/powerpc/kernel/crash_dump.c
@@ -35,7 +35,7 @@ void __init reserve_kdump_trampoline(void)
 
 static void __init create_trampoline(unsigned long addr)
 {
-	unsigned int *p = (unsigned int *)addr;
+	struct ppc_inst *p = (struct ppc_inst *)addr;
 
 	/* The maximum range of a single instruction branch, is the current
 	 * instruction's address + (32 MB - 4) bytes. For the trampoline we
diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/epapr_paravirt.c
index e8eb72a65572..2ed14d4a47f5 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -37,10 +37,10 @@ static int __init early_init_dt_scan_epapr(unsigned long node,
 		return -1;
 
 	for (i = 0; i < (len / 4); i++) {
-		u32 inst = ppc_inst(be32_to_cpu(insts[i]));
-		patch_instruction(epapr_hypercall_start + i, inst);
+		struct ppc_inst inst = ppc_inst(be32_to_cpu(insts[i]));
+		patch_instruction((struct ppc_inst *)(epapr_hypercall_start + i), inst);
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
-		patch_instruction(epapr_ev_idle_start + i, inst);
+		patch_instruction((struct ppc_inst *)(epapr_ev_idle_start + i), inst);
 #endif
 	}
 
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 46e09ac8b84a..2db9a7ac7bcb 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -244,12 +244,12 @@ dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 			     struct arch_hw_breakpoint *info)
 {
-	unsigned int instr = ppc_inst(0);
+	struct ppc_inst instr = ppc_inst(0);
 	int ret, type, size;
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+	if (__get_user_inatomic(instr.val, (unsigned int *)regs->nip))
 		goto fail;
 
 	ret = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
index daa4afce7ec8..144858027fa3 100644
--- a/arch/powerpc/kernel/jump_label.c
+++ b/arch/powerpc/kernel/jump_label.c
@@ -11,7 +11,7 @@
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
-	u32 *addr = (u32 *)(unsigned long)entry->code;
+	struct ppc_inst *addr = (struct ppc_inst *)(unsigned long)entry->code;
 
 	if (type == JUMP_LABEL_JMP)
 		patch_branch(addr, entry->target, 0);
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index a6b38a19133f..652b2852bea3 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -419,7 +419,7 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
 	unsigned int instr;
-	unsigned int *addr = (unsigned int *)bpt->bpt_addr;
+	struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
 
 	err = probe_kernel_address(addr, instr);
 	if (err)
@@ -438,7 +438,7 @@ int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
 	unsigned int instr = *(unsigned int *)bpt->saved_instr;
-	unsigned int *addr = (unsigned int *)bpt->bpt_addr;
+	struct ppc_inst *addr = (struct ppc_inst *)bpt->bpt_addr;
 
 	err = patch_instruction(addr, ppc_inst(instr));
 	if (err)
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 92fa3070d905..a08ae5803622 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -106,7 +106,7 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
-	kprobe_opcode_t insn = *p->addr;
+	struct ppc_inst insn = *(struct ppc_inst *)p->addr;
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -139,13 +139,13 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
 
 void arch_arm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
+	patch_instruction((struct ppc_inst *)p->addr, ppc_inst(BREAKPOINT_INSTRUCTION));
 }
 NOKPROBE_SYMBOL(arch_arm_kprobe);
 
 void arch_disarm_kprobe(struct kprobe *p)
 {
-	patch_instruction(p->addr, ppc_inst(p->opcode));
+	patch_instruction((struct ppc_inst *)p->addr, ppc_inst(p->opcode));
 }
 NOKPROBE_SYMBOL(arch_disarm_kprobe);
 
@@ -217,7 +217,7 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	unsigned int insn = *p->ainsn.insn;
+	struct ppc_inst insn = *(struct ppc_inst *)p->ainsn.insn;
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
 	ret = emulate_step(regs, insn);
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 067b094bfeff..cd23218c60bb 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -20,6 +20,7 @@
 #include <asm/sstep.h>
 #include <asm/exception-64s.h>
 #include <asm/extable.h>
+#include <asm/inst.h>
 
 /*
  * Convert an address related to an mm to a PFN. NOTE: we are in real
@@ -365,7 +366,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	 * in real-mode is tricky and can lead to recursive
 	 * faults
 	 */
-	int instr;
+	struct ppc_inst instr;
 	unsigned long pfn, instr_addr;
 	struct instruction_op op;
 	struct pt_regs tmp = *regs;
@@ -373,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	pfn = addr_to_pfn(regs, regs->nip);
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
-		instr = *(unsigned int *)(instr_addr);
+		instr = *(struct ppc_inst *)(instr_addr);
 		if (!analyse_instr(&op, &tmp, instr)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 44006c4ca4f1..5a71fef71c22 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -100,8 +100,9 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * Ensure that the instruction is not a conditional branch,
 	 * and that can be emulated.
 	 */
-	if (!is_conditional_branch(*p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *p->ainsn.insn) == 1) {
+	if (!is_conditional_branch(*(struct ppc_inst *)p->ainsn.insn) &&
+	    analyse_instr(&op, &regs,
+			  *(struct ppc_inst *)p->ainsn.insn) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
@@ -148,13 +149,15 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 {
 	/* addis r4,0,(insn)@h */
-	patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(4) |
-			  ((val >> 16) & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(4) |
+				   ((val >> 16) & 0xffff)));
 	addr++;
 
 	/* ori r4,r4,(insn)@l */
-	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(4) |
-			  ___PPC_RS(4) | (val & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(4) |
+				   ___PPC_RS(4) | (val & 0xffff)));
 }
 
 /*
@@ -164,34 +167,39 @@ void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
 void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
 {
 	/* lis r3,(op)@highest */
-	patch_instruction(addr, ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
-			  ((val >> 48) & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(3) |
+				   ((val >> 48) & 0xffff)));
 	addr++;
 
 	/* ori r3,r3,(op)@higher */
-	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
+				   ___PPC_RS(3) | ((val >> 32) & 0xffff)));
 	addr++;
 
 	/* rldicr r3,r3,32,31 */
-	patch_instruction(addr, ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(3) |
+				   ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31)));
 	addr++;
 
 	/* oris r3,r3,(op)@h */
-	patch_instruction(addr, ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(3) |
+				   ___PPC_RS(3) | ((val >> 16) & 0xffff)));
 	addr++;
 
 	/* ori r3,r3,(op)@l */
-	patch_instruction(addr, ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff)));
+	patch_instruction((struct ppc_inst *)addr,
+			  ppc_inst(PPC_INST_ORI | ___PPC_RA(3) |
+				   ___PPC_RS(3) | (val & 0xffff)));
 }
 
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
-	kprobe_opcode_t *buff, branch_op_callback, branch_emulate_step;
-	kprobe_opcode_t *op_callback_addr, *emulate_step_addr;
+	struct ppc_inst branch_op_callback, branch_emulate_step;
+	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
 	unsigned long nip, size;
 	int rc, i;
@@ -231,7 +239,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
 	for (i = 0; i < size; i++) {
-		rc = patch_instruction(buff + i,
+		rc = patch_instruction((struct ppc_inst *)(buff + i),
 				       ppc_inst(*(optprobe_template_entry + i)));
 		if (rc < 0)
 			goto error;
@@ -254,20 +262,22 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	}
 
 	rc = create_branch(&branch_op_callback,
-			   (unsigned int *)buff + TMPL_CALL_HDLR_IDX,
+			   (struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
 			   (unsigned long)op_callback_addr,
 			   BRANCH_SET_LINK);
 
 	rc |= create_branch(&branch_emulate_step,
-			    (unsigned int *)buff + TMPL_EMULATE_IDX,
+			    (struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
 			    (unsigned long)emulate_step_addr,
 			    BRANCH_SET_LINK);
 
 	if (rc)
 		goto error;
 
-	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
-	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
+	patch_instruction((struct ppc_inst *)(buff + TMPL_CALL_HDLR_IDX),
+			  branch_op_callback);
+	patch_instruction((struct ppc_inst *)(buff + TMPL_EMULATE_IDX),
+			  branch_emulate_step);
 
 	/*
 	 * 3. load instruction to be emulated into relevant register, and
@@ -277,7 +287,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 4. branch back from trampoline
 	 */
-	patch_branch(buff + TMPL_RET_IDX, (unsigned long)nip, 0);
+	patch_branch((struct ppc_inst *)(buff + TMPL_RET_IDX), (unsigned long)nip, 0);
 
 	flush_icache_range((unsigned long)buff,
 			   (unsigned long)(&buff[TMPL_END_IDX]));
@@ -309,7 +319,7 @@ int arch_check_optimized_kprobe(struct optimized_kprobe *op)
 
 void arch_optimize_kprobes(struct list_head *oplist)
 {
-	unsigned int instr;
+	struct ppc_inst instr;
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
 
@@ -321,9 +331,9 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		memcpy(op->optinsn.copied_insn, op->kp.addr,
 					       RELATIVEJUMP_SIZE);
 		create_branch(&instr,
-			      (unsigned int *)op->kp.addr,
+			      (struct ppc_inst *)op->kp.addr,
 			      (unsigned long)op->optinsn.insn, 0);
-		patch_instruction(op->kp.addr, instr);
+		patch_instruction((struct ppc_inst *)op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
 }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 0536e4aed330..15f0a7c84944 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -74,8 +74,8 @@ EXPORT_SYMBOL(DMA_MODE_WRITE);
  */
 notrace void __init machine_init(u64 dt_ptr)
 {
-	unsigned int *addr = (unsigned int *)patch_site_addr(&patch__memset_nocache);
-	unsigned int insn;
+	struct ppc_inst *addr = (struct ppc_inst *)patch_site_addr(&patch__memset_nocache);
+	struct ppc_inst insn;
 
 	/* Configure static keys first, now that we're relocated. */
 	setup_feature_keys();
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index cbb19af4a72a..3117ed675735 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -41,23 +41,23 @@
 #define	NUM_FTRACE_TRAMPS	8
 static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
 
-static unsigned int
+static struct ppc_inst
 ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 {
-	unsigned int op;
+	struct ppc_inst op;
 
 	addr = ppc_function_entry((void *)addr);
 
 	/* if (link) set op to 'bl' else 'b' */
-	create_branch(&op, (unsigned int *)ip, addr, link ? 1 : 0);
+	create_branch(&op, (struct ppc_inst *)ip, addr, link ? 1 : 0);
 
 	return op;
 }
 
 static int
-ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
+ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 {
-	unsigned int replaced;
+	struct ppc_inst replaced;
 
 	/*
 	 * Note:
@@ -79,7 +79,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 	}
 
 	/* replace the text with the new text */
-	if (patch_instruction((unsigned int *)ip, new))
+	if (patch_instruction((struct ppc_inst *)ip, new))
 		return -EPERM;
 
 	return 0;
@@ -90,24 +90,24 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
  */
 static int test_24bit_addr(unsigned long ip, unsigned long addr)
 {
-	unsigned int op;
+	struct ppc_inst op;
 	addr = ppc_function_entry((void *)addr);
 
 	/* use the create_branch to verify that this offset can be branched */
-	return create_branch(&op, (unsigned int *)ip, addr, 0) == 0;
+	return create_branch(&op, (struct ppc_inst *)ip, addr, 0) == 0;
 }
 
-static int is_bl_op(unsigned int op)
+static int is_bl_op(struct ppc_inst op)
 {
 	return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
 }
 
-static int is_b_op(unsigned int op)
+static int is_b_op(struct ppc_inst op)
 {
 	return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
 }
 
-static unsigned long find_bl_target(unsigned long ip, unsigned int op)
+static unsigned long find_bl_target(unsigned long ip, struct ppc_inst op)
 {
 	int offset;
 
@@ -127,7 +127,7 @@ __ftrace_make_nop(struct module *mod,
 {
 	unsigned long entry, ptr, tramp;
 	unsigned long ip = rec->ip;
-	unsigned int op, pop;
+	struct ppc_inst op, pop;
 
 	/* read where this goes */
 	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
@@ -208,7 +208,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
 
-	if (patch_instruction((unsigned int *)ip, pop)) {
+	if (patch_instruction((struct ppc_inst *)ip, pop)) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -221,7 +221,7 @@ static int
 __ftrace_make_nop(struct module *mod,
 		  struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int op;
+	struct ppc_inst op;
 	unsigned int jmp[4];
 	unsigned long ip = rec->ip;
 	unsigned long tramp;
@@ -280,7 +280,7 @@ __ftrace_make_nop(struct module *mod,
 
 	op = ppc_inst(PPC_INST_NOP);
 
-	if (patch_instruction((unsigned int *)ip, op))
+	if (patch_instruction((struct ppc_inst *)ip, op))
 		return -EPERM;
 
 	return 0;
@@ -291,7 +291,7 @@ __ftrace_make_nop(struct module *mod,
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
-	unsigned int instr;
+	struct ppc_inst instr;
 
 	/*
 	 * We have the compiler generated long_branch tramps at the end
@@ -328,9 +328,10 @@ static int add_ftrace_tramp(unsigned long tramp)
  */
 static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
-	int i, op;
+	int i;
+	struct ppc_inst op;
 	unsigned long ptr;
-	unsigned int instr;
+	struct ppc_inst instr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
 	/* Is this a known long jump tramp? */
@@ -379,7 +380,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 		return -1;
 	}
 
-	if (patch_branch((unsigned int *)tramp, ptr, 0)) {
+	if (patch_branch((struct ppc_inst *)tramp, ptr, 0)) {
 		pr_debug("REL24 out of range!\n");
 		return -1;
 	}
@@ -395,7 +396,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long tramp, ip = rec->ip;
-	unsigned int op;
+	struct ppc_inst op;
 
 	/* Read where this goes */
 	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
@@ -423,7 +424,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		}
 	}
 
-	if (patch_instruction((unsigned int *)ip, ppc_inst(PPC_INST_NOP))) {
+	if (patch_instruction((struct ppc_inst *)ip, ppc_inst(PPC_INST_NOP))) {
 		pr_err("Patching NOP failed.\n");
 		return -EPERM;
 	}
@@ -435,7 +436,7 @@ int ftrace_make_nop(struct module *mod,
 		    struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	unsigned int old, new;
+	struct ppc_inst old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -488,7 +489,7 @@ int ftrace_make_nop(struct module *mod,
  */
 #ifndef CONFIG_MPROFILE_KERNEL
 static int
-expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
+expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
 {
 	/*
 	 * We expect to see:
@@ -506,7 +507,7 @@ expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 }
 #else
 static int
-expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
+expected_nop_sequence(void *ip, struct ppc_inst op0, struct ppc_inst op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
@@ -518,8 +519,8 @@ expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int op[2];
-	unsigned int instr;
+	struct ppc_inst op[2];
+	struct ppc_inst instr;
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -584,7 +585,7 @@ static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	int err;
-	unsigned int op;
+	struct ppc_inst op;
 	unsigned long ip = rec->ip;
 
 	/* read where this goes */
@@ -604,7 +605,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* create the branch to the trampoline */
-	err = create_branch(&op, (unsigned int *)ip,
+	err = create_branch(&op, (struct ppc_inst *)ip,
 			    rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
 	if (err) {
 		pr_err("REL24 out of range!\n");
@@ -613,7 +614,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	pr_devel("write to %lx\n", rec->ip);
 
-	if (patch_instruction((unsigned int *)ip, op))
+	if (patch_instruction((struct ppc_inst *)ip, op))
 		return -EPERM;
 
 	return 0;
@@ -623,7 +624,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int op;
+	struct ppc_inst op;
 	void *ip = (void *)rec->ip;
 	unsigned long tramp, entry, ptr;
 
@@ -671,7 +672,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	unsigned int old, new;
+	struct ppc_inst old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -710,7 +711,7 @@ static int
 __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 					unsigned long addr)
 {
-	unsigned int op;
+	struct ppc_inst op;
 	unsigned long ip = rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -758,7 +759,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	/* The new target may be within range */
 	if (test_24bit_addr(ip, addr)) {
 		/* within range */
-		if (patch_branch((unsigned int *)ip, addr, BRANCH_SET_LINK)) {
+		if (patch_branch((struct ppc_inst *)ip, addr, BRANCH_SET_LINK)) {
 			pr_err("REL24 out of range!\n");
 			return -EINVAL;
 		}
@@ -786,12 +787,12 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (create_branch(&op, (unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
+	if (create_branch(&op, (struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
 
-	if (patch_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
+	if (patch_branch((struct ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
 	}
@@ -804,7 +805,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 			unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-	unsigned int old, new;
+	struct ppc_inst old, new;
 
 	/*
 	 * If the calling address is more that 24 bits away,
@@ -844,10 +845,10 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
-	unsigned int old, new;
+	struct ppc_inst old, new;
 	int ret;
 
-	old = *(unsigned int *)&ftrace_call;
+	old = *(struct ppc_inst *)&ftrace_call;
 	new = ftrace_call_replace(ip, (unsigned long)func, 1);
 	ret = ftrace_modify_code(ip, old, new);
 
@@ -855,7 +856,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	/* Also update the regs callback function */
 	if (!ret) {
 		ip = (unsigned long)(&ftrace_regs_call);
-		old = *(unsigned int *)&ftrace_regs_call;
+		old = *(struct ppc_inst *)&ftrace_regs_call;
 		new = ftrace_call_replace(ip, (unsigned long)func, 1);
 		ret = ftrace_modify_code(ip, old, new);
 	}
@@ -929,7 +930,7 @@ int ftrace_enable_ftrace_graph_caller(void)
 	unsigned long ip = (unsigned long)(&ftrace_graph_call);
 	unsigned long addr = (unsigned long)(&ftrace_graph_caller);
 	unsigned long stub = (unsigned long)(&ftrace_graph_stub);
-	unsigned int old, new;
+	struct ppc_inst old, new;
 
 	old = ftrace_call_replace(ip, stub, 0);
 	new = ftrace_call_replace(ip, addr, 0);
@@ -942,7 +943,7 @@ int ftrace_disable_ftrace_graph_caller(void)
 	unsigned long ip = (unsigned long)(&ftrace_graph_call);
 	unsigned long addr = (unsigned long)(&ftrace_graph_caller);
 	unsigned long stub = (unsigned long)(&ftrace_graph_stub);
-	unsigned int old, new;
+	struct ppc_inst old, new;
 
 	old = ftrace_call_replace(ip, addr, 0);
 	new = ftrace_call_replace(ip, stub, 0);
diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
index a544590b90e5..3dd70eeb10c5 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -261,11 +261,12 @@ static unsigned int rfin(unsigned int x)
 
 int emulate_altivec(struct pt_regs *regs)
 {
-	unsigned int instr, i, word;
+	struct ppc_inst instr;
+	unsigned int i, word;
 	unsigned int va, vb, vc, vd;
 	vector128 *vrs;
 
-	if (get_user(instr, (unsigned int __user *) regs->nip))
+	if (get_user(instr.val, (unsigned int __user *)regs->nip))
 		return -EFAULT;
 
 	word = ppc_inst_val(instr);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index d298bb16936e..1dff9d9d6645 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -19,12 +19,12 @@
 #include <asm/setup.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
-			       unsigned int *patch_addr)
+static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
+			       struct ppc_inst *patch_addr)
 {
 	int err = 0;
 
-	__put_user_asm(instr, patch_addr, err, "stw");
+	__put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
 	if (err)
 		return err;
 
@@ -34,7 +34,7 @@ static int __patch_instruction(unsigned int *exec_addr, unsigned int instr,
 	return 0;
 }
 
-int raw_patch_instruction(unsigned int *addr, unsigned int instr)
+int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
 	return __patch_instruction(addr, instr, addr);
 }
@@ -137,10 +137,10 @@ static inline int unmap_patch_area(unsigned long addr)
 	return 0;
 }
 
-static int do_patch_instruction(unsigned int *addr, unsigned int instr)
+static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
 	int err;
-	unsigned int *patch_addr = NULL;
+	struct ppc_inst *patch_addr = NULL;
 	unsigned long flags;
 	unsigned long text_poke_addr;
 	unsigned long kaddr = (unsigned long)addr;
@@ -161,8 +161,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 		goto out;
 	}
 
-	patch_addr = (unsigned int *)(text_poke_addr) +
-			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
+	patch_addr = (struct ppc_inst *)(text_poke_addr + (kaddr & ~PAGE_MASK));
 
 	__patch_instruction(addr, instr, patch_addr);
 
@@ -177,14 +176,14 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
-static int do_patch_instruction(unsigned int *addr, unsigned int instr)
+static int do_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
 	return raw_patch_instruction(addr, instr);
 }
 
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
-int patch_instruction(unsigned int *addr, unsigned int instr)
+int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
 	if (init_mem_is_free && init_section_contains(addr, 4)) {
@@ -195,9 +194,9 @@ int patch_instruction(unsigned int *addr, unsigned int instr)
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
-int patch_branch(unsigned int *addr, unsigned long target, int flags)
+int patch_branch(struct ppc_inst *addr, unsigned long target, int flags)
 {
-	unsigned int instr;
+	struct ppc_inst instr;
 
 	create_branch(&instr, addr, target, flags);
 	return patch_instruction(addr, instr);
@@ -229,7 +228,7 @@ bool is_offset_in_branch_range(long offset)
  * Helper to check if a given instruction is a conditional branch
  * Derived from the conditional checks in analyse_instr()
  */
-bool is_conditional_branch(unsigned int instr)
+bool is_conditional_branch(struct ppc_inst instr)
 {
 	unsigned int opcode = ppc_inst_primary_opcode(instr);
 
@@ -247,13 +246,13 @@ bool is_conditional_branch(unsigned int instr)
 }
 NOKPROBE_SYMBOL(is_conditional_branch);
 
-int create_branch(unsigned int *instr,
-		  const unsigned int *addr,
+int create_branch(struct ppc_inst *instr,
+		  const struct ppc_inst *addr,
 		  unsigned long target, int flags)
 {
 	long offset;
 
-	*instr = 0;
+	*instr = ppc_inst(0);
 	offset = target;
 	if (! (flags & BRANCH_ABSOLUTE))
 		offset = offset - (unsigned long)addr;
@@ -263,12 +262,12 @@ int create_branch(unsigned int *instr,
 		return 1;
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	*instr = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
+	*instr = ppc_inst(0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC));
 
 	return 0;
 }
 
-int create_cond_branch(unsigned int *instr, const unsigned int *addr,
+int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
 		       unsigned long target, int flags)
 {
 	long offset;
@@ -282,27 +281,27 @@ int create_cond_branch(unsigned int *instr, const unsigned int *addr,
 		return 1;
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	*instr = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
+	*instr = ppc_inst(0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC));
 
 	return 0;
 }
 
-static unsigned int branch_opcode(unsigned int instr)
+static unsigned int branch_opcode(struct ppc_inst instr)
 {
 	return ppc_inst_primary_opcode(instr) & 0x3F;
 }
 
-static int instr_is_branch_iform(unsigned int instr)
+static int instr_is_branch_iform(struct ppc_inst instr)
 {
 	return branch_opcode(instr) == 18;
 }
 
-static int instr_is_branch_bform(unsigned int instr)
+static int instr_is_branch_bform(struct ppc_inst instr)
 {
 	return branch_opcode(instr) == 16;
 }
 
-int instr_is_relative_branch(unsigned int instr)
+int instr_is_relative_branch(struct ppc_inst instr)
 {
 	if (ppc_inst_val(instr) & BRANCH_ABSOLUTE)
 		return 0;
@@ -310,12 +309,12 @@ int instr_is_relative_branch(unsigned int instr)
 	return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
 }
 
-int instr_is_relative_link_branch(unsigned int instr)
+int instr_is_relative_link_branch(struct ppc_inst instr)
 {
 	return instr_is_relative_branch(instr) && (ppc_inst_val(instr) & BRANCH_SET_LINK);
 }
 
-static unsigned long branch_iform_target(const unsigned int *instr)
+static unsigned long branch_iform_target(const struct ppc_inst *instr)
 {
 	signed long imm;
 
@@ -331,7 +330,7 @@ static unsigned long branch_iform_target(const unsigned int *instr)
 	return (unsigned long)imm;
 }
 
-static unsigned long branch_bform_target(const unsigned int *instr)
+static unsigned long branch_bform_target(const struct ppc_inst *instr)
 {
 	signed long imm;
 
@@ -347,7 +346,7 @@ static unsigned long branch_bform_target(const unsigned int *instr)
 	return (unsigned long)imm;
 }
 
-unsigned long branch_target(const unsigned int *instr)
+unsigned long branch_target(const struct ppc_inst *instr)
 {
 	if (instr_is_branch_iform(*instr))
 		return branch_iform_target(instr);
@@ -357,7 +356,7 @@ unsigned long branch_target(const unsigned int *instr)
 	return 0;
 }
 
-int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr)
+int instr_is_branch_to_addr(const struct ppc_inst *instr, unsigned long addr)
 {
 	if (instr_is_branch_iform(*instr) || instr_is_branch_bform(*instr))
 		return branch_target(instr) == addr;
@@ -365,8 +364,8 @@ int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr)
 	return 0;
 }
 
-int translate_branch(unsigned int *instr, const unsigned int *dest,
-		     const unsigned int *src)
+int translate_branch(struct ppc_inst *instr, const struct ppc_inst *dest,
+		     const struct ppc_inst *src)
 {
 	unsigned long target;
 
@@ -392,7 +391,7 @@ void __patch_exception(int exc, unsigned long addr)
 	 * instruction of the exception, not the first one
 	 */
 
-	patch_branch(ibase + (exc / 4) + 1, addr, 0);
+	patch_branch((struct ppc_inst *)(ibase + (exc / 4) + 1), addr, 0);
 }
 #endif
 
@@ -409,7 +408,7 @@ static void __init test_trampoline(void)
 static void __init test_branch_iform(void)
 {
 	int err;
-	unsigned int instr;
+	struct ppc_inst instr;
 	unsigned long addr;
 
 	addr = (unsigned long)&instr;
@@ -484,12 +483,12 @@ static void __init test_branch_iform(void)
 
 static void __init test_create_function_call(void)
 {
-	unsigned int *iptr;
+	struct ppc_inst *iptr;
 	unsigned long dest;
-	unsigned int instr;
+	struct ppc_inst instr;
 
 	/* Check we can create a function call */
-	iptr = (unsigned int *)ppc_function_entry(test_trampoline);
+	iptr = (struct ppc_inst *)ppc_function_entry(test_trampoline);
 	dest = ppc_function_entry(test_create_function_call);
 	create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
 	patch_instruction(iptr, instr);
@@ -500,7 +499,8 @@ static void __init test_branch_bform(void)
 {
 	int err;
 	unsigned long addr;
-	unsigned int *iptr, instr, flags;
+	struct ppc_inst *iptr, instr;
+	unsigned int flags;
 
 	iptr = &instr;
 	addr = (unsigned long)iptr;
@@ -570,8 +570,8 @@ static void __init test_branch_bform(void)
 static void __init test_translate_branch(void)
 {
 	unsigned long addr;
-	unsigned int *p, *q;
-	unsigned int instr;
+	struct ppc_inst *p, *q;
+	struct ppc_inst instr;
 	void *buf;
 
 	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 6e7479b8887a..fb6e8e8abf4e 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -32,26 +32,26 @@ struct fixup_entry {
 	long		alt_end_off;
 };
 
-static unsigned int *calc_addr(struct fixup_entry *fcur, long offset)
+static struct ppc_inst *calc_addr(struct fixup_entry *fcur, long offset)
 {
 	/*
 	 * We store the offset to the code as a negative offset from
 	 * the start of the alt_entry, to support the VDSO. This
 	 * routine converts that back into an actual address.
 	 */
-	return (unsigned int *)((unsigned long)fcur + offset);
+	return (struct ppc_inst *)((unsigned long)fcur + offset);
 }
 
-static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
-				 unsigned int *alt_start, unsigned int *alt_end)
+static int patch_alt_instruction(struct ppc_inst *src, struct ppc_inst *dest,
+				 struct ppc_inst *alt_start, struct ppc_inst *alt_end)
 {
 	int err;
-	unsigned int instr;
+	struct ppc_inst instr;
 
 	instr = *src;
 
 	if (instr_is_relative_branch(*src)) {
-		unsigned int *target = (unsigned int *)branch_target(src);
+		struct ppc_inst *target = (struct ppc_inst *)branch_target(src);
 
 		/* Branch within the section doesn't need translating */
 		if (target < alt_start || target > alt_end) {
@@ -68,7 +68,7 @@ static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 
 static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 {
-	unsigned int *start, *end, *alt_start, *alt_end, *src, *dest;
+	struct ppc_inst *start, *end, *alt_start, *alt_end, *src, *dest;
 
 	start = calc_addr(fcur, fcur->start_off);
 	end = calc_addr(fcur, fcur->end_off);
@@ -147,15 +147,17 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, ppc_inst(instrs[0]));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
 
 		if (types & STF_BARRIER_FALLBACK)
-			patch_branch(dest + 1, (unsigned long)&stf_barrier_fallback,
+			patch_branch((struct ppc_inst *)(dest + 1),
+				     (unsigned long)&stf_barrier_fallback,
 				     BRANCH_SET_LINK);
 		else
-			patch_instruction(dest + 1, ppc_inst(instrs[1]));
+			patch_instruction((struct ppc_inst *)(dest + 1),
+					  ppc_inst(instrs[1]));
 
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
@@ -208,12 +210,12 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, ppc_inst(instrs[0]));
-		patch_instruction(dest + 1, ppc_inst(instrs[1]));
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
-		patch_instruction(dest + 3, ppc_inst(instrs[3]));
-		patch_instruction(dest + 4, ppc_inst(instrs[4]));
-		patch_instruction(dest + 5, ppc_inst(instrs[5]));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+		patch_instruction((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
+		patch_instruction((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
 	}
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
@@ -261,9 +263,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction(dest, ppc_inst(instrs[0]));
-		patch_instruction(dest + 1, ppc_inst(instrs[1]));
-		patch_instruction(dest + 2, ppc_inst(instrs[2]));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
@@ -296,7 +298,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, ppc_inst(instr));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -339,8 +341,8 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction(dest, ppc_inst(instr[0]));
-		patch_instruction(dest + 1, ppc_inst(instr[1]));
+		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr[0]));
+		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instr[1]));
 	}
 
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
@@ -373,7 +375,7 @@ void do_btb_flush_fixups(void)
 void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 {
 	long *start, *end;
-	unsigned int *dest;
+	struct ppc_inst *dest;
 
 	if (!(value & CPU_FTR_LWSYNC))
 		return ;
@@ -390,18 +392,18 @@ void do_lwsync_fixups(unsigned long value, void *fixup_start, void *fixup_end)
 static void do_final_fixups(void)
 {
 #if defined(CONFIG_PPC64) && defined(CONFIG_RELOCATABLE)
-	int *src, *dest;
+	struct ppc_inst *src, *dest;
 	unsigned long length;
 
 	if (PHYSICAL_START == 0)
 		return;
 
-	src = (int *)(KERNELBASE + PHYSICAL_START);
-	dest = (int *)KERNELBASE;
-	length = (__end_interrupts - _stext) / sizeof(int);
+	src = (struct ppc_inst *)(KERNELBASE + PHYSICAL_START);
+	dest = (struct ppc_inst *)KERNELBASE;
+	length = (__end_interrupts - _stext) / sizeof(struct ppc_inst);
 
 	while (length--) {
-		raw_patch_instruction(dest, ppc_inst(*src));
+		raw_patch_instruction(dest, *src);
 		src++;
 		dest++;
 	}
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 7f7be154da7e..95a56bb1ba3f 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1163,7 +1163,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
  * otherwise.
  */
 int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-		  unsigned int instr)
+		  struct ppc_inst instr)
 {
 	unsigned int opcode, ra, rb, rc, rd, spr, u;
 	unsigned long int imm;
@@ -3103,7 +3103,7 @@ NOKPROBE_SYMBOL(emulate_loadstore);
  * or -1 if the instruction is one that should not be stepped,
  * such as an rfid, or a mtmsrd that would clear MSR_RI.
  */
-int emulate_step(struct pt_regs *regs, unsigned int instr)
+int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 {
 	struct instruction_op op;
 	int r, err, type;
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index b928b21feac1..46af80279ebc 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -462,7 +462,7 @@ struct compute_test {
 	struct {
 		char *descr;
 		unsigned long flags;
-		unsigned int instr;
+		struct ppc_inst instr;
 		struct pt_regs regs;
 	} subtests[MAX_SUBTESTS + 1];
 };
@@ -843,7 +843,7 @@ static struct compute_test compute_tests[] = {
 };
 
 static int __init emulate_compute_instr(struct pt_regs *regs,
-					unsigned int instr)
+					struct ppc_inst instr)
 {
 	struct instruction_op op;
 
@@ -861,7 +861,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 }
 
 static int __init execute_compute_instr(struct pt_regs *regs,
-					unsigned int instr)
+					struct ppc_inst instr)
 {
 	extern int exec_instr(struct pt_regs *regs);
 	extern s32 patch__exec_instr;
@@ -892,7 +892,8 @@ static void __init run_tests_compute(void)
 	unsigned long flags;
 	struct compute_test *test;
 	struct pt_regs *regs, exp, got;
-	unsigned int i, j, k, instr;
+	unsigned int i, j, k;
+	struct ppc_inst instr;
 	bool ignore_gpr, ignore_xer, ignore_ccr, passed;
 
 	for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0e7e145d5cad..4a50f125ec18 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -47,7 +47,7 @@
  * Check whether the instruction inst is a store using
  * an update addressing form which will update r1.
  */
-static bool store_updates_sp(unsigned int inst)
+static bool store_updates_sp(struct ppc_inst inst)
 {
 	/* check for 1 in the rA field */
 	if (((ppc_inst_val(inst) >> 16) & 0x1f) != 1)
@@ -279,7 +279,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 
 		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
 		    access_ok(nip, sizeof(*nip))) {
-			unsigned int inst;
+			struct ppc_inst inst;
 
 			if (!probe_user_read(&inst, nip, sizeof(inst)))
 				return !store_updates_sp(inst);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3dcfecf858f3..13b9dd5e4a76 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -421,14 +421,14 @@ static __u64 power_pmu_bhrb_to(u64 addr)
 		if (probe_kernel_read(&instr, (void *)addr, sizeof(instr)))
 			return 0;
 
-		return branch_target(&instr);
+		return branch_target((struct ppc_inst *)&instr);
 	}
 
 	/* Userspace: need copy instruction here then translate it */
 	if (probe_user_read(&instr, (unsigned int __user *)addr, sizeof(instr)))
 		return 0;
 
-	target = branch_target(&instr);
+	target = branch_target((struct ppc_inst *)&instr);
 	if ((!target) || (instr & BRANCH_ABSOLUTE))
 		return target;
 
diff --git a/arch/powerpc/platforms/86xx/mpc86xx_smp.c b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
index 31540ebf1e29..dba3aa73c062 100644
--- a/arch/powerpc/platforms/86xx/mpc86xx_smp.c
+++ b/arch/powerpc/platforms/86xx/mpc86xx_smp.c
@@ -73,7 +73,7 @@ smp_86xx_kick_cpu(int nr)
 
 	/* Setup fake reset vector to call __secondary_start_mpc86xx. */
 	target = (unsigned long) __secondary_start_mpc86xx;
-	patch_branch(vector, target, BRANCH_SET_LINK);
+	patch_branch((struct ppc_inst *)vector, target, BRANCH_SET_LINK);
 
 	/* Kick that CPU */
 	smp_86xx_release_core(nr);
@@ -83,7 +83,7 @@ smp_86xx_kick_cpu(int nr)
 		mdelay(1);
 
 	/* Restore the exception vector */
-	patch_instruction(vector, ppc_inst(save_vector));
+	patch_instruction((struct ppc_inst *)vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
 
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 44a00990af9d..9969c07035b6 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -814,7 +814,7 @@ static int smp_core99_kick_cpu(int nr)
 	 *   b __secondary_start_pmac_0 + nr*8
 	 */
 	target = (unsigned long) __secondary_start_pmac_0 + nr * 8;
-	patch_branch(vector, target, BRANCH_SET_LINK);
+	patch_branch((struct ppc_inst *)vector, target, BRANCH_SET_LINK);
 
 	/* Put some life in our friend */
 	pmac_call_feature(PMAC_FTR_RESET_CPU, NULL, nr, 0);
@@ -827,7 +827,7 @@ static int smp_core99_kick_cpu(int nr)
 	mdelay(1);
 
 	/* Restore our exception vector */
-	patch_instruction(vector, ppc_inst(save_vector));
+	patch_instruction((struct ppc_inst *)vector, ppc_inst(save_vector));
 
 	local_irq_restore(flags);
 	if (ppc_md.progress) ppc_md.progress("smp_core99_kick_cpu done", 0x347);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 2e8ed8cdcf28..e0132d6d24d0 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -100,7 +100,7 @@ static long *xmon_fault_jmp[NR_CPUS];
 /* Breakpoint stuff */
 struct bpt {
 	unsigned long	address;
-	unsigned int	*instr;
+	struct ppc_inst	*instr;
 	atomic_t	ref_count;
 	int		enabled;
 	unsigned long	pad;
@@ -876,8 +876,8 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
-			patch_instruction(bp->instr + 1, bpinstr);
+			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
+			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
 			return bp;
 		}
 	}
@@ -889,7 +889,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 static void insert_bpts(void)
 {
 	int i;
-	unsigned int instr;
+	struct ppc_inst instr;
 	struct bpt *bp;
 
 	bp = bpts;
@@ -911,8 +911,8 @@ static void insert_bpts(void)
 		patch_instruction(bp->instr, instr);
 		if (bp->enabled & BP_CIABR)
 			continue;
-		if (patch_instruction((unsigned int *)bp->address,
-							bpinstr) != 0) {
+		if (patch_instruction((struct ppc_inst *)bp->address,
+				      ppc_inst(bpinstr)) != 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled &= ~BP_TRAP;
@@ -940,7 +940,7 @@ static void remove_bpts(void)
 {
 	int i;
 	struct bpt *bp;
-	unsigned instr;
+	struct ppc_inst instr;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
@@ -949,7 +949,7 @@ static void remove_bpts(void)
 		if (mread(bp->address, &instr, 4) == 4
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
-			(unsigned int *)bp->address, bp->instr[0]) != 0)
+			(struct ppc_inst *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
@@ -1156,7 +1156,7 @@ static int do_step(struct pt_regs *regs)
  */
 static int do_step(struct pt_regs *regs)
 {
-	unsigned int instr;
+	struct ppc_inst instr;
 	int stepped;
 
 	force_enable_xmon();
@@ -1322,7 +1322,7 @@ csum(void)
  */
 static long check_bp_loc(unsigned long addr)
 {
-	unsigned int instr;
+	struct ppc_inst instr;
 
 	addr &= ~3;
 	if (!is_kernel_addr(addr)) {
@@ -2848,7 +2848,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 {
 	int nr, dotted;
 	unsigned long first_adr;
-	unsigned int inst, last_inst = ppc_inst(0);
+	struct ppc_inst inst, last_inst = ppc_inst(0);
 	unsigned char val[4];
 
 	dotted = 0;
diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
index b7e94375db86..57e6fb03de48 100644
--- a/arch/powerpc/xmon/xmon_bpts.h
+++ b/arch/powerpc/xmon/xmon_bpts.h
@@ -4,11 +4,11 @@
 
 #define NBPTS	256
 #ifndef __ASSEMBLY__
-#define BPT_SIZE	(sizeof(unsigned int) * 2)
-#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
+#include <asm/inst.h>
+#define BPT_SIZE	(sizeof(struct ppc_inst) * 2)
+#define BPT_WORDS	(BPT_SIZE / sizeof(struct ppc_inst))
 
 extern unsigned int bpt_table[NBPTS * BPT_WORDS];
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* XMON_BPTS_H */
-- 
2.17.1

