Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE71589CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:56:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsTg1WgVzDqHR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:56:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L0wSnp5+; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs302JRLzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:36:44 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d9so3781140plo.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X4Uzz37/ngM15TebQpv4SjQkIeZSB0CPQenfosP5u0o=;
 b=L0wSnp5+0mosDpHOOtYp6rLgv1J6BKCuT4pwC29cOhD7eJWd0ZPOQYypyWycMbO/fJ
 GusxNkkAhrlfpfnBNimUoGTMFPte8XA5skmbV/xz7c5w2y7ggY2fDzEUA4xqBSnjKn0m
 rR+evQ+qlOFgOSVI8ZehENe/8+JA0SCVfsNMrO3HCniACwY5PDoI/g8zSfX4NgMHAjZu
 Kx46D6+R7RQaPhH9lCdnlNwaIDDeJeoSk4MQMRgvO5sj0omvmnW+RZ/3JUVbfrbA4dna
 ePKJJtat9diew3xvhyGxaCHO0oWJ7npQiVMy7qOwBFRfQULuFXpifZuo9z9ghlhKWi3L
 dTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X4Uzz37/ngM15TebQpv4SjQkIeZSB0CPQenfosP5u0o=;
 b=R7FJcnWTBNb0dzHQdNo30+VcsJT4I5qw2jXolqU/dCbH3h143w8lTMJ6sFMR8fvHk4
 7XfYNfRNc9rsUbppLXRwfoAMmnMrylewK8t94qq1N0ttxf87rNaqD/BMJQfbSmxqwG5j
 dbO+/W77QrcKYlImzev8drqgM0FVsdDGjTLKum+bSQlGXUlgLIO/+3FUw8Y80mu0X5Dh
 t78KI1yZ3EWsS9EoDZM19ATICmUG8pwZ0CvHhPKJrR5QDKnNdEKGrQjiGOQ0Bye/86Cl
 SUhKelrG4I3xyB30upqJJYOEtInUvZGFYFYR6jviTNA3iSaPqtKU6K3FxjDKc2z+OLdU
 EgQQ==
X-Gm-Message-State: APjAAAVGMn98seh6BaABEvxQPNhwR2RXJnJXYgCkfXx2sv7ecT3LpxN6
 sKbvxJVeYP9ak3625IBtVOnHGbmruy7f5A==
X-Google-Smtp-Source: APXvYqwNKgH/oZTJB9UtbkEpg4/ZcdeqTR0Sr32Gu9m9AE8QhjZjzno3F+xz4xS9GFgoCjjo3qkTMg==
X-Received: by 2002:a17:902:868e:: with SMTP id
 g14mr1587418plo.87.1581399401955; 
 Mon, 10 Feb 2020 21:36:41 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:36:41 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/13] powerpc/kprobes: Support kprobes on prefixed
 instructions
Date: Tue, 11 Feb 2020 16:33:52 +1100
Message-Id: <20200211053355.21574-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A prefixed instruction is composed of a word prefix followed by a word
suffix. It does not make sense to be able to have a kprobe on the suffix
of a prefixed instruction, so make this impossible.

Kprobes work by replacing an instruction with a trap and saving that
instruction to be single stepped out of place later. Currently there is
not enough space allocated to keep a prefixed instruction for single
stepping. Increase the amount of space allocated for holding the
instruction copy.

kprobe_post_handler() expects all instructions to be 4 bytes long which
means that it does not function correctly for prefixed instructions.
Add checks for prefixed instructions which will use a length of 8 bytes
instead.

For optprobes we normally patch in loading the instruction we put a
probe on into r4 before calling emulate_step(). We now make space and
patch in loading the suffix into r5 as well.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/kprobes.h   |  5 +--
 arch/powerpc/kernel/kprobes.c        | 47 +++++++++++++++++++++-------
 arch/powerpc/kernel/optprobes.c      | 32 ++++++++++---------
 arch/powerpc/kernel/optprobes_head.S |  6 ++++
 4 files changed, 63 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index 66b3f2983b22..0d44ce8a3163 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -38,12 +38,13 @@ extern kprobe_opcode_t optprobe_template_entry[];
 extern kprobe_opcode_t optprobe_template_op_address[];
 extern kprobe_opcode_t optprobe_template_call_handler[];
 extern kprobe_opcode_t optprobe_template_insn[];
+extern kprobe_opcode_t optprobe_template_suffix[];
 extern kprobe_opcode_t optprobe_template_call_emulate[];
 extern kprobe_opcode_t optprobe_template_ret[];
 extern kprobe_opcode_t optprobe_template_end[];
 
-/* Fixed instruction size for powerpc */
-#define MAX_INSN_SIZE		1
+/* Prefixed instructions are two words */
+#define MAX_INSN_SIZE		2
 #define MAX_OPTIMIZED_LENGTH	sizeof(kprobe_opcode_t)	/* 4 bytes */
 #define MAX_OPTINSN_SIZE	(optprobe_template_end - optprobe_template_entry)
 #define RELATIVEJUMP_SIZE	sizeof(kprobe_opcode_t)	/* 4 bytes */
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 24a56f062d9e..b061deba4fe7 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -104,17 +104,30 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
 
 int arch_prepare_kprobe(struct kprobe *p)
 {
+	int len;
 	int ret = 0;
+	struct kprobe *prev;
 	kprobe_opcode_t insn = *p->addr;
+	kprobe_opcode_t prefix = *(p->addr - 1);
 
+	preempt_disable();
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
 		ret = -EINVAL;
 	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
 		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
 		ret = -EINVAL;
+	} else if (IS_PREFIX(prefix)) {
+		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
+		ret = -EINVAL;
+	}
+	prev = get_kprobe(p->addr - 1);
+	if (prev && IS_PREFIX(*prev->ainsn.insn)) {
+		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
+		ret = -EINVAL;
 	}
 
+
 	/* insn must be on a special executable page on ppc64.  This is
 	 * not explicitly required on ppc32 (right now), but it doesn't hurt */
 	if (!ret) {
@@ -124,14 +137,18 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (!ret) {
-		memcpy(p->ainsn.insn, p->addr,
-				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
+		if (IS_PREFIX(insn))
+			len = MAX_INSN_SIZE * sizeof(kprobe_opcode_t);
+		else
+			len = sizeof(kprobe_opcode_t);
+		memcpy(p->ainsn.insn, p->addr, len);
 		p->opcode = *p->addr;
 		flush_icache_range((unsigned long)p->ainsn.insn,
 			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
 	}
 
 	p->ainsn.boostable = 0;
+	preempt_enable_no_resched();
 	return ret;
 }
 NOKPROBE_SYMBOL(arch_prepare_kprobe);
@@ -216,10 +233,11 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
-	unsigned int insn = *p->ainsn.insn;
+	unsigned int insn = p->ainsn.insn[0];
+	unsigned int suffix = p->ainsn.insn[1];
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
-	ret = emulate_step(regs, insn, PPC_NO_SUFFIX);
+	ret = emulate_step(regs, insn, suffix);
 	if (ret > 0) {
 		/*
 		 * Once this instruction has been boosted
@@ -233,7 +251,11 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 		 * So, we should never get here... but, its still
 		 * good to catch them, just in case...
 		 */
-		printk("Can't step on instruction %x\n", insn);
+		if (!IS_PREFIX(insn))
+			printk("Can't step on instruction %x\n", insn);
+		else
+			printk("Can't step on instruction %x %x\n", insn,
+			       suffix);
 		BUG();
 	} else {
 		/*
@@ -275,7 +297,7 @@ int kprobe_handler(struct pt_regs *regs)
 	if (kprobe_running()) {
 		p = get_kprobe(addr);
 		if (p) {
-			kprobe_opcode_t insn = *p->ainsn.insn;
+			kprobe_opcode_t insn = p->ainsn.insn[0];
 			if (kcb->kprobe_status == KPROBE_HIT_SS &&
 					is_trap(insn)) {
 				/* Turn off 'trace' bits */
@@ -448,9 +470,10 @@ static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
 	 * the link register properly so that the subsequent 'blr' in
 	 * kretprobe_trampoline jumps back to the right instruction.
 	 *
-	 * For nip, we should set the address to the previous instruction since
-	 * we end up emulating it in kprobe_handler(), which increments the nip
-	 * again.
+	 * To keep the nip at the correct address we need to counter the
+	 * increment that happens when we emulate the kretprobe_trampoline noop
+	 * in kprobe_handler(). We do this by decrementing the address by the
+	 * length of the noop which is always 4 bytes.
 	 */
 	regs->nip = orig_ret_address - 4;
 	regs->link = orig_ret_address;
@@ -478,12 +501,14 @@ int kprobe_post_handler(struct pt_regs *regs)
 {
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
+	kprobe_opcode_t insn;
 
 	if (!cur || user_mode(regs))
 		return 0;
 
+	insn = *cur->ainsn.insn;
 	/* make sure we got here for instruction we have a kprobe on */
-	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
+	if ((unsigned long)cur->ainsn.insn + PPC_INST_LENGTH(insn) != regs->nip)
 		return 0;
 
 	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
@@ -492,7 +517,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + 4;
+	regs->nip = (unsigned long)cur->addr + PPC_INST_LENGTH(insn);
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index f908d9422557..60cf8e8485ab 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -27,6 +27,8 @@
 	(optprobe_template_op_address - optprobe_template_entry)
 #define TMPL_INSN_IDX		\
 	(optprobe_template_insn - optprobe_template_entry)
+#define TMPL_SUFX_IDX		\
+	(optprobe_template_suffix - optprobe_template_entry)
 #define TMPL_END_IDX		\
 	(optprobe_template_end - optprobe_template_entry)
 
@@ -100,8 +102,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * and that can be emulated.
 	 */
 	if (!is_conditional_branch(*p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *p->ainsn.insn,
-				      PPC_NO_SUFFIX) == 1) {
+			analyse_instr(&op, &regs, p->ainsn.insn[0],
+				      p->ainsn.insn[1]) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
@@ -141,27 +143,27 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 }
 
 /*
- * emulate_step() requires insn to be emulated as
- * second parameter. Load register 'r4' with the
- * instruction.
+ * emulate_step() requires insn to be emulated as second parameter, and the
+ * suffix as the third parameter. Load these into registers.
  */
-void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
+static void patch_imm32_load_insns(int reg, unsigned int val,
+				   kprobe_opcode_t *addr)
 {
-	/* addis r4,0,(insn)@h */
-	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
+	/* addis reg,0,(insn)@h */
+	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(reg) |
 			  ((val >> 16) & 0xffff));
 	addr++;
 
-	/* ori r4,r4,(insn)@l */
-	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(4) |
-			  ___PPC_RS(4) | (val & 0xffff));
+	/* ori reg,reg,(insn)@l */
+	patch_instruction(addr, PPC_INST_ORI | ___PPC_RA(reg) |
+			  ___PPC_RS(reg) | (val & 0xffff));
 }
 
 /*
  * Generate instructions to load provided immediate 64-bit value
  * to register 'r3' and patch these instructions at 'addr'.
  */
-void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
+static void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
 {
 	/* lis r3,(op)@highest */
 	patch_instruction(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
@@ -267,9 +269,11 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
 
 	/*
-	 * 3. load instruction to be emulated into relevant register, and
+	 * 3. load instruction and suffix to be emulated into the relevant
+	 * registers, and
 	 */
-	patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
+	patch_imm32_load_insns(4, p->ainsn.insn[0], buff + TMPL_INSN_IDX);
+	patch_imm32_load_insns(5, p->ainsn.insn[1], buff + TMPL_SUFX_IDX);
 
 	/*
 	 * 4. branch back from trampoline
diff --git a/arch/powerpc/kernel/optprobes_head.S b/arch/powerpc/kernel/optprobes_head.S
index cf383520843f..395d1643f59d 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -95,6 +95,12 @@ optprobe_template_insn:
 	nop
 	nop
 
+	.global optprobe_template_suffix
+optprobe_template_suffix:
+	/* Pass suffix to be emulated in r5 */
+	nop
+	nop
+
 	.global optprobe_template_call_emulate
 optprobe_template_call_emulate:
 	/* Branch to emulate_step()  */
-- 
2.17.1

