Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24436E60C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:33:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6fv5Gqbz30KL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:33:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:209;
 helo=mout-y-209.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org
 [IPv6:2001:67c:2050:1::465:209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cd1BBmz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:13 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4FW6Pj0ftyzQjbj;
 Thu, 29 Apr 2021 09:21:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id N-bp2Uw-0WFG; Thu, 29 Apr 2021 09:21:41 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/11] powerpc: Use patch_instruction_unlocked() in loops
Date: Thu, 29 Apr 2021 02:20:57 -0500
Message-Id: <20210429072057.8870-12-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.90 / 15.00 / 15.00
X-Rspamd-Queue-Id: 219BC17E8
X-Rspamd-UID: 9b4904
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that patching requires a lock to prevent concurrent access to
patching_mm, every call to patch_instruction() acquires and releases a
spinlock. There are several places where patch_instruction() is called
in a loop. Convert these to acquire the lock once before the loop, call
patch_instruction_unlocked() in the loop body, and then release the lock
again after the loop terminates - as in:

	for (i = 0; i < n; ++i)
		patch_instruction(...); <-- lock/unlock every iteration

changes to:

	flags = lock_patching(); <-- lock once

	for (i = 0; i < n; ++i)
		patch_instruction_unlocked(...);

	unlock_patching(flags); <-- unlock once

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * New to series.
---
 arch/powerpc/kernel/epapr_paravirt.c |   9 ++-
 arch/powerpc/kernel/optprobes.c      |  22 ++++--
 arch/powerpc/lib/feature-fixups.c    | 114 +++++++++++++++++++--------
 arch/powerpc/xmon/xmon.c             |  22 ++++--
 4 files changed, 120 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/epapr_paravirt.c
index 2ed14d4a47f59..b639e71cf9dec 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -28,6 +28,7 @@ static int __init early_init_dt_scan_epapr(unsigned long node,
 	const u32 *insts;
 	int len;
 	int i;
+	unsigned long flags;
 
 	insts = of_get_flat_dt_prop(node, "hcall-instructions", &len);
 	if (!insts)
@@ -36,14 +37,18 @@ static int __init early_init_dt_scan_epapr(unsigned long node,
 	if (len % 4 || len > (4 * 4))
 		return -1;
 
+	flags = lock_patching();
+
 	for (i = 0; i < (len / 4); i++) {
 		struct ppc_inst inst = ppc_inst(be32_to_cpu(insts[i]));
-		patch_instruction((struct ppc_inst *)(epapr_hypercall_start + i), inst);
+		patch_instruction_unlocked((struct ppc_inst *)(epapr_hypercall_start + i), inst);
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
-		patch_instruction((struct ppc_inst *)(epapr_ev_idle_start + i), inst);
+		patch_instruction_unlocked((struct ppc_inst *)(epapr_ev_idle_start + i), inst);
 #endif
 	}
 
+	unlock_patching(flags);
+
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
 	if (of_get_flat_dt_prop(node, "has-idle", NULL))
 		epapr_has_idle = true;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index cdf87086fa33a..deaeb6e8d1a00 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -200,7 +200,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
 	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
-	unsigned long nip, size;
+	unsigned long nip, size, flags;
 	int rc, i;
 
 	kprobe_ppc_optinsn_slots.insn_size = MAX_OPTINSN_SIZE;
@@ -237,13 +237,20 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/* We can optimize this via patch_instruction_window later */
 	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
+
+	flags = lock_patching();
+
 	for (i = 0; i < size; i++) {
-		rc = patch_instruction((struct ppc_inst *)(buff + i),
-				       ppc_inst(*(optprobe_template_entry + i)));
-		if (rc < 0)
+		rc = patch_instruction_unlocked((struct ppc_inst *)(buff + i),
+						ppc_inst(*(optprobe_template_entry + i)));
+		if (rc < 0) {
+			unlock_patching(flags);
 			goto error;
+		}
 	}
 
+	unlock_patching(flags);
+
 	/*
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
@@ -322,6 +329,9 @@ void arch_optimize_kprobes(struct list_head *oplist)
 	struct ppc_inst instr;
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
+	unsigned long flags;
+
+	flags = lock_patching();
 
 	list_for_each_entry_safe(op, tmp, oplist, list) {
 		/*
@@ -333,9 +343,11 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		create_branch(&instr,
 			      (struct ppc_inst *)op->kp.addr,
 			      (unsigned long)op->optinsn.insn, 0);
-		patch_instruction((struct ppc_inst *)op->kp.addr, instr);
+		patch_instruction_unlocked((struct ppc_inst *)op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
+
+	unlock_patching(flags);
 }
 
 void arch_unoptimize_kprobe(struct optimized_kprobe *op)
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 1fd31b4b0e139..2c3d413c9d9b3 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -123,6 +123,7 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = PTRRELOC(&__start___stf_entry_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
@@ -144,24 +145,29 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
 	}
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
 
 		if (types & STF_BARRIER_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1),
-				     (unsigned long)&stf_barrier_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&stf_barrier_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1),
-					  ppc_inst(instrs[1]));
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2),
+					   ppc_inst(instrs[2]));
 	}
 
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
 		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
@@ -175,6 +181,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 	unsigned int instrs[6], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = PTRRELOC(&__start___stf_exit_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_exit_barrier_fixup);
@@ -207,18 +214,23 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
 	}
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
-		patch_instruction((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
-		patch_instruction((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
 	}
+
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\n", i,
 		(types == STF_BARRIER_NONE)                  ? "no" :
 		(types == STF_BARRIER_FALLBACK)              ? "fallback" :
@@ -239,6 +251,7 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 	unsigned int instrs[4], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = PTRRELOC(&__start___uaccess_flush_fixup);
 	end = PTRRELOC(&__stop___uaccess_flush_fixup);
@@ -262,18 +275,22 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
 
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
 	}
 
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "uaccess-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
 		(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
@@ -289,6 +306,7 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	instrs[0] = 0x60000000; /* nop */
 	instrs[1] = 0x60000000; /* nop */
@@ -309,6 +327,8 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
 
+	flags = lock_patching();
+
 	start = PTRRELOC(&__start___entry_flush_fixup);
 	end = PTRRELOC(&__stop___entry_flush_fixup);
 	for (i = 0; start < end; start++, i++) {
@@ -316,15 +336,17 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
 
 		if (types == L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&entry_flush_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&entry_flush_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
 	start = PTRRELOC(&__start___scv_entry_flush_fixup);
@@ -334,17 +356,20 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
 
 		if (types == L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&scv_entry_flush_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&scv_entry_flush_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
 
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
+	unlock_patching(flags);
 
 	printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
@@ -361,6 +386,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = PTRRELOC(&__start___rfi_flush_fixup);
 	end = PTRRELOC(&__stop___rfi_flush_fixup);
@@ -382,16 +408,20 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 	}
 
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
 		(types == L1D_FLUSH_NONE)       ? "no" :
 		(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
@@ -407,6 +437,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	unsigned int instr, *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = fixup_start;
 	end = fixup_end;
@@ -418,13 +449,17 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		instr = 0x63ff0000; /* ori 31,31,0 speculation barrier */
 	}
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instr));
 	}
 
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
 
@@ -448,6 +483,7 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	unsigned int instr[2], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
 
 	start = fixup_start;
 	end = fixup_end;
@@ -461,27 +497,37 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 		instr[1] = PPC_INST_SYNC;
 	}
 
+	flags = lock_patching();
+
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instr[1]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instr[0]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(instr[1]));
 	}
 
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
 
 static void patch_btb_flush_section(long *curr)
 {
 	unsigned int *start, *end;
+	unsigned long flags;
 
 	start = (void *)curr + *curr;
 	end = (void *)curr + *(curr + 1);
+
+	flags = lock_patching();
+
 	for (; start < end; start++) {
 		pr_devel("patching dest %lx\n", (unsigned long)start);
-		patch_instruction((struct ppc_inst *)start, ppc_inst(PPC_INST_NOP));
+		patch_instruction_unlocked((struct ppc_inst *)start, ppc_inst(PPC_INST_NOP));
 	}
+
+	unlock_patching(flags);
 }
 
 void do_btb_flush_fixups(void)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index ff2b92bfeedcc..e8a00041c04bf 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -905,6 +905,9 @@ static void insert_bpts(void)
 	int i;
 	struct ppc_inst instr, instr2;
 	struct bpt *bp, *bp2;
+	unsigned long flags;
+
+	flags = lock_patching();
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
@@ -945,19 +948,21 @@ static void insert_bpts(void)
 			continue;
 		}
 
-		patch_instruction(bp->instr, instr);
-		patch_instruction(ppc_inst_next(bp->instr, &instr),
-				  ppc_inst(bpinstr));
+		patch_instruction_unlocked(bp->instr, instr);
+		patch_instruction_unlocked(ppc_inst_next(bp->instr, &instr),
+					   ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
-		if (patch_instruction((struct ppc_inst *)bp->address,
-				      ppc_inst(bpinstr)) != 0) {
+		if (patch_instruction_unlocked((struct ppc_inst *)bp->address,
+						ppc_inst(bpinstr)) != 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled &= ~BP_TRAP;
 			continue;
 		}
 	}
+
+	unlock_patching(flags);
 }
 
 static void insert_cpu_bpts(void)
@@ -984,6 +989,9 @@ static void remove_bpts(void)
 	int i;
 	struct bpt *bp;
 	struct ppc_inst instr;
+	unsigned long flags;
+
+	flags = lock_patching();
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp) {
@@ -991,11 +999,13 @@ static void remove_bpts(void)
 			continue;
 		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
-		    && patch_instruction(
+		    && patch_instruction_unlocked(
 			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
+
+	unlock_patching(flags);
 }
 
 static void remove_cpu_bpts(void)
-- 
2.26.1

