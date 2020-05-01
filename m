Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC111C0CEB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:58:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cz4X5KTwzDrNq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:58:20 +1000 (AEST)
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
 header.s=20161025 header.b=NMCq0fSB; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CynH6WCmzDrKh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:45:07 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id x2so1062013pfx.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IEf3grf/VoDT6IlRiT9F+wD0z29xWbKxoa6RIT25BkM=;
 b=NMCq0fSBAqcU0dZtPjnqDvcooZA8hYHif846ekTovlLdfNKA8bEETR4tpte+LUC2Eh
 psJmUE2flDSVqYBr0SzVydK5bYmYJxF5o9lls+KngxeAR+AIfXOq0GwqSRoyS4GfKzMw
 aqZIAmPihJrWTb34qOrXE5427MarXwZvzvpW0+GzrtYjtd6D5bm6FMWH+1S9V4QgKWEL
 eDBkHERHEx6VH+162pepXNxYGiddAyvplEiD8BDc366DVb+SoK1UvxV4r8IukEWLczCX
 Yl0OiwTgEeU7Qm4GfVGokig/aklHgXNwcNcokWyuRnSAGluCP7e+zzmUGmOg15XFHPOb
 dtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IEf3grf/VoDT6IlRiT9F+wD0z29xWbKxoa6RIT25BkM=;
 b=WY9rqJ1S9/Gk9PCkujX0b7rk1kQxjFgOYW4CMlwKci8diK4bn+CZJJuocEqtHmkmDp
 uw9vul8zyzsls1JGbyhHIiXUCdyk/+lOvrytfmctIGCIS4Lx/Oid5kgr8XABTN54CuBw
 vkiVCxlbRQ3+vVVD0syJTmU2Sw6kKGhkxQwqI2pQMoS4EZDX64k+DNNbkzrQzoPZG1ZG
 qbH5Q5dVdiuWet2TaQwEWlKvcKvVm2KnBDggQ0rms9rlrwdRwCEn0J4OcqL8iiodYKf9
 RIhJ7JytXSWBGBdtpX0CmetsrBVSZPbCEpuBL6YBj76NLW114gsPkZif2UThWYNKSYTk
 hE0g==
X-Gm-Message-State: AGi0PuZXkMJvVU+/LqH/zhthPapW6L1/nHZALfqI9jAKunmYYB/l0OcV
 tKQDsl52X4j63JOcGAge0ZyY82JLRIcK4g==
X-Google-Smtp-Source: APiQypJl0rYw0X5ljo7MKpcdJvFcSAHWsJeYOrISJLwGDz4HR947AI7QqRQA9x68fPCEAQ1idV2B0A==
X-Received: by 2002:a63:c241:: with SMTP id l1mr2335041pgg.42.1588304703857;
 Thu, 30 Apr 2020 20:45:03 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:45:03 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 07/28] powerpc: Use an accessor for instructions
Date: Fri,  1 May 2020 13:41:59 +1000
Message-Id: <20200501034220.8982-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

In preparation for introducing a more complicated instruction type to
accomodate prefixed instructions use an accessor for getting an
instruction as a u32.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: Remove references to 'word' instructions
v6: - test_emulate_step.c: execute_compute_instr(): Introduce
      ppc_inst_val() here instead of in a later patch
    - ftrace.c: __ftrace_make_call(): Introduce adding ppc_inst_val() in
      this patch
    - fault.c: store_updates_sp(): Start using ppc_inst_val()
    - Move this patch before the ppc_inst_primary_opcode() patch
---
 arch/powerpc/include/asm/inst.h      |   5 +
 arch/powerpc/include/asm/sstep.h     |   6 +-
 arch/powerpc/kernel/align.c          |   6 +-
 arch/powerpc/kernel/kprobes.c        |   2 +-
 arch/powerpc/kernel/trace/ftrace.c   |  24 +--
 arch/powerpc/kernel/vecemu.c         |  16 +-
 arch/powerpc/lib/code-patching.c     |  18 +-
 arch/powerpc/lib/sstep.c             | 268 ++++++++++++++-------------
 arch/powerpc/lib/test_emulate_step.c |   8 +-
 arch/powerpc/mm/fault.c              |   6 +-
 arch/powerpc/xmon/xmon.c             |   4 +-
 11 files changed, 186 insertions(+), 177 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 5298ba33b6e5..8a9e73bfbd27 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -8,4 +8,9 @@
 
 #define ppc_inst(x) (x)
 
+static inline u32 ppc_inst_val(u32 x)
+{
+	return x;
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 769f055509c9..26d729562fe2 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -15,9 +15,9 @@ struct pt_regs;
  * Note that IS_MTMSRD returns true for both an mtmsr (32-bit)
  * and an mtmsrd (64-bit).
  */
-#define IS_MTMSRD(instr)	(((instr) & 0xfc0007be) == 0x7c000124)
-#define IS_RFID(instr)		(((instr) & 0xfc0007fe) == 0x4c000024)
-#define IS_RFI(instr)		(((instr) & 0xfc0007fe) == 0x4c000064)
+#define IS_MTMSRD(instr)	((ppc_inst_val(instr) & 0xfc0007be) == 0x7c000124)
+#define IS_RFID(instr)		((ppc_inst_val(instr) & 0xfc0007fe) == 0x4c000024)
+#define IS_RFI(instr)		((ppc_inst_val(instr) & 0xfc0007fe) == 0x4c000064)
 
 enum instruction_type {
 	COMPUTE,		/* arith/logical/CR op, etc. */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 86e9bf62f18c..44921001f84a 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -314,8 +314,8 @@ int fix_alignment(struct pt_regs *regs)
 	}
 
 #ifdef CONFIG_SPE
-	if ((instr >> 26) == 0x4) {
-		int reg = (instr >> 21) & 0x1f;
+	if ((ppc_inst_val(instr) >> 26) == 0x4) {
+		int reg = (ppc_inst_val(instr) >> 21) & 0x1f;
 		PPC_WARN_ALIGNMENT(spe, regs);
 		return emulate_spe(regs, reg, instr);
 	}
@@ -332,7 +332,7 @@ int fix_alignment(struct pt_regs *regs)
 	 * when pasting to a co-processor. Furthermore, paste_last is the
 	 * synchronisation point for preceding copy/paste sequences.
 	 */
-	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
+	if ((ppc_inst_val(instr) & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
 		return -EIO;
 
 	r = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2378a7ed4438..92fa3070d905 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -234,7 +234,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 		 * So, we should never get here... but, its still
 		 * good to catch them, just in case...
 		 */
-		printk("Can't step on instruction %x\n", insn);
+		printk("Can't step on instruction %x\n", ppc_inst_val(insn));
 		BUG();
 	} else {
 		/*
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 0318e1ed6248..335b10008035 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -74,7 +74,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 	/* Make sure it is what we expect it to be */
 	if (replaced != old) {
 		pr_err("%p: replaced (%#x) != old (%#x)",
-		(void *)ip, replaced, old);
+		(void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
 		return -EINVAL;
 	}
 
@@ -99,19 +99,19 @@ static int test_24bit_addr(unsigned long ip, unsigned long addr)
 
 static int is_bl_op(unsigned int op)
 {
-	return (op & 0xfc000003) == 0x48000001;
+	return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
 }
 
 static int is_b_op(unsigned int op)
 {
-	return (op & 0xfc000003) == 0x48000000;
+	return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
 }
 
 static unsigned long find_bl_target(unsigned long ip, unsigned int op)
 {
 	int offset;
 
-	offset = (op & 0x03fffffc);
+	offset = (ppc_inst_val(op) & 0x03fffffc);
 	/* make it signed */
 	if (offset & 0x02000000)
 		offset |= 0xfe000000;
@@ -137,7 +137,7 @@ __ftrace_make_nop(struct module *mod,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", op);
+		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
 
@@ -171,7 +171,7 @@ __ftrace_make_nop(struct module *mod,
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
 	if (op != ppc_inst(PPC_INST_MFLR) && op != ppc_inst(PPC_INST_STD_LR)) {
-		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
+		pr_err("Unexpected instruction %08x around bl _mcount\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
 #else
@@ -201,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	if (op != ppc_inst(PPC_INST_LD_TOC)) {
-		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
+		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, ppc_inst_val(op));
 		return -EINVAL;
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
@@ -403,7 +403,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", op);
+		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
 
@@ -497,7 +497,7 @@ expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 	 * The load offset is different depending on the ABI. For simplicity
 	 * just mask it out when doing the compare.
 	 */
-	if ((op0 != ppc_inst(0x48000008)) || ((op1 & 0xffff0000) != 0xe8410000))
+	if ((op0 != ppc_inst(0x48000008)) || (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
 		return 0;
 	return 1;
 }
@@ -527,7 +527,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
 		pr_err("Unexpected call sequence at %p: %x %x\n",
-		ip, op[0], op[1]);
+		ip, ppc_inst_val(op[0]), ppc_inst_val(op[1]));
 		return -EINVAL;
 	}
 
@@ -647,7 +647,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	if (op != ppc_inst(PPC_INST_NOP)) {
-		pr_err("Unexpected call sequence at %p: %x\n", ip, op);
+		pr_err("Unexpected call sequence at %p: %x\n", ip, ppc_inst_val(op));
 		return -EINVAL;
 	}
 
@@ -726,7 +726,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", op);
+		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
 
diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
index 4acd3fb2b38e..1f5e3b4c8ae4 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -260,21 +260,23 @@ static unsigned int rfin(unsigned int x)
 
 int emulate_altivec(struct pt_regs *regs)
 {
-	unsigned int instr, i;
+	unsigned int instr, i, word;
 	unsigned int va, vb, vc, vd;
 	vector128 *vrs;
 
 	if (get_user(instr, (unsigned int __user *) regs->nip))
 		return -EFAULT;
-	if ((instr >> 26) != 4)
+
+	word = ppc_inst_val(instr);
+	if ((word >> 26) != 4)
 		return -EINVAL;		/* not an altivec instruction */
-	vd = (instr >> 21) & 0x1f;
-	va = (instr >> 16) & 0x1f;
-	vb = (instr >> 11) & 0x1f;
-	vc = (instr >> 6) & 0x1f;
+	vd = (word >> 21) & 0x1f;
+	va = (word >> 16) & 0x1f;
+	vb = (word >> 11) & 0x1f;
+	vc = (word >> 6) & 0x1f;
 
 	vrs = current->thread.vr_state.vr;
-	switch (instr & 0x3f) {
+	switch (word & 0x3f) {
 	case 10:
 		switch (vc) {
 		case 0:	/* vaddfp */
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 6c30ddadd971..baa849b1a1f9 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -236,7 +236,7 @@ bool is_conditional_branch(unsigned int instr)
 	if (opcode == 16)       /* bc, bca, bcl, bcla */
 		return true;
 	if (opcode == 19) {
-		switch ((instr >> 1) & 0x3ff) {
+		switch ((ppc_inst_val(instr) >> 1) & 0x3ff) {
 		case 16:        /* bclr, bclrl */
 		case 528:       /* bcctr, bcctrl */
 		case 560:       /* bctar, bctarl */
@@ -304,7 +304,7 @@ static int instr_is_branch_bform(unsigned int instr)
 
 int instr_is_relative_branch(unsigned int instr)
 {
-	if (instr & BRANCH_ABSOLUTE)
+	if (ppc_inst_val(instr) & BRANCH_ABSOLUTE)
 		return 0;
 
 	return instr_is_branch_iform(instr) || instr_is_branch_bform(instr);
@@ -312,20 +312,20 @@ int instr_is_relative_branch(unsigned int instr)
 
 int instr_is_relative_link_branch(unsigned int instr)
 {
-	return instr_is_relative_branch(instr) && (instr & BRANCH_SET_LINK);
+	return instr_is_relative_branch(instr) && (ppc_inst_val(instr) & BRANCH_SET_LINK);
 }
 
 static unsigned long branch_iform_target(const unsigned int *instr)
 {
 	signed long imm;
 
-	imm = *instr & 0x3FFFFFC;
+	imm = ppc_inst_val(*instr) & 0x3FFFFFC;
 
 	/* If the top bit of the immediate value is set this is negative */
 	if (imm & 0x2000000)
 		imm -= 0x4000000;
 
-	if ((*instr & BRANCH_ABSOLUTE) == 0)
+	if ((ppc_inst_val(*instr) & BRANCH_ABSOLUTE) == 0)
 		imm += (unsigned long)instr;
 
 	return (unsigned long)imm;
@@ -335,13 +335,13 @@ static unsigned long branch_bform_target(const unsigned int *instr)
 {
 	signed long imm;
 
-	imm = *instr & 0xFFFC;
+	imm = ppc_inst_val(*instr) & 0xFFFC;
 
 	/* If the top bit of the immediate value is set this is negative */
 	if (imm & 0x8000)
 		imm -= 0x10000;
 
-	if ((*instr & BRANCH_ABSOLUTE) == 0)
+	if ((ppc_inst_val(*instr) & BRANCH_ABSOLUTE) == 0)
 		imm += (unsigned long)instr;
 
 	return (unsigned long)imm;
@@ -373,9 +373,9 @@ int translate_branch(unsigned int *instr, const unsigned int *dest,
 	target = branch_target(src);
 
 	if (instr_is_branch_iform(*src))
-		return create_branch(instr, dest, target, *src);
+		return create_branch(instr, dest, target, ppc_inst_val(*src));
 	else if (instr_is_branch_bform(*src))
-		return create_cond_branch(instr, dest, target, *src);
+		return create_cond_branch(instr, dest, target, ppc_inst_val(*src));
 
 	return 1;
 }
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5f3a7bd9d90d..14c93ee4ffc8 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1169,26 +1169,28 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
+	unsigned int word;
 	long ival;
 
+	word = ppc_inst_val(instr);
 	op->type = COMPUTE;
 
 	opcode = instr >> 26;
 	switch (opcode) {
 	case 16:	/* bc */
 		op->type = BRANCH;
-		imm = (signed short)(instr & 0xfffc);
-		if ((instr & 2) == 0)
+		imm = (signed short)(word & 0xfffc);
+		if ((word & 2) == 0)
 			imm += regs->nip;
 		op->val = truncate_if_32bit(regs->msr, imm);
-		if (instr & 1)
+		if (word & 1)
 			op->type |= SETLK;
-		if (branch_taken(instr, regs, op))
+		if (branch_taken(word, regs, op))
 			op->type |= BRTAKEN;
 		return 1;
 #ifdef CONFIG_PPC64
 	case 17:	/* sc */
-		if ((instr & 0xfe2) == 2)
+		if ((word & 0xfe2) == 2)
 			op->type = SYSCALL;
 		else
 			op->type = UNKNOWN;
@@ -1196,21 +1198,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 	case 18:	/* b */
 		op->type = BRANCH | BRTAKEN;
-		imm = instr & 0x03fffffc;
+		imm = word & 0x03fffffc;
 		if (imm & 0x02000000)
 			imm -= 0x04000000;
-		if ((instr & 2) == 0)
+		if ((word & 2) == 0)
 			imm += regs->nip;
 		op->val = truncate_if_32bit(regs->msr, imm);
-		if (instr & 1)
+		if (word & 1)
 			op->type |= SETLK;
 		return 1;
 	case 19:
-		switch ((instr >> 1) & 0x3ff) {
+		switch ((word >> 1) & 0x3ff) {
 		case 0:		/* mcrf */
 			op->type = COMPUTE + SETCC;
-			rd = 7 - ((instr >> 23) & 0x7);
-			ra = 7 - ((instr >> 18) & 0x7);
+			rd = 7 - ((word >> 23) & 0x7);
+			ra = 7 - ((word >> 18) & 0x7);
 			rd *= 4;
 			ra *= 4;
 			val = (regs->ccr >> ra) & 0xf;
@@ -1220,11 +1222,11 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 16:	/* bclr */
 		case 528:	/* bcctr */
 			op->type = BRANCH;
-			imm = (instr & 0x400)? regs->ctr: regs->link;
+			imm = (word & 0x400)? regs->ctr: regs->link;
 			op->val = truncate_if_32bit(regs->msr, imm);
-			if (instr & 1)
+			if (word & 1)
 				op->type |= SETLK;
-			if (branch_taken(instr, regs, op))
+			if (branch_taken(word, regs, op))
 				op->type |= BRTAKEN;
 			return 1;
 
@@ -1247,23 +1249,23 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 417:	/* crorc */
 		case 449:	/* cror */
 			op->type = COMPUTE + SETCC;
-			ra = (instr >> 16) & 0x1f;
-			rb = (instr >> 11) & 0x1f;
-			rd = (instr >> 21) & 0x1f;
+			ra = (word >> 16) & 0x1f;
+			rb = (word >> 11) & 0x1f;
+			rd = (word >> 21) & 0x1f;
 			ra = (regs->ccr >> (31 - ra)) & 1;
 			rb = (regs->ccr >> (31 - rb)) & 1;
-			val = (instr >> (6 + ra * 2 + rb)) & 1;
+			val = (word >> (6 + ra * 2 + rb)) & 1;
 			op->ccval = (regs->ccr & ~(1UL << (31 - rd))) |
 				(val << (31 - rd));
 			return 1;
 		}
 		break;
 	case 31:
-		switch ((instr >> 1) & 0x3ff) {
+		switch ((word >> 1) & 0x3ff) {
 		case 598:	/* sync */
 			op->type = BARRIER + BARRIER_SYNC;
 #ifdef __powerpc64__
-			switch ((instr >> 21) & 3) {
+			switch ((word >> 21) & 3) {
 			case 1:		/* lwsync */
 				op->type = BARRIER + BARRIER_LWSYNC;
 				break;
@@ -1285,20 +1287,20 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	if (!FULL_REGS(regs))
 		return -1;
 
-	rd = (instr >> 21) & 0x1f;
-	ra = (instr >> 16) & 0x1f;
-	rb = (instr >> 11) & 0x1f;
-	rc = (instr >> 6) & 0x1f;
+	rd = (word >> 21) & 0x1f;
+	ra = (word >> 16) & 0x1f;
+	rb = (word >> 11) & 0x1f;
+	rc = (word >> 6) & 0x1f;
 
 	switch (opcode) {
 #ifdef __powerpc64__
 	case 2:		/* tdi */
-		if (rd & trap_compare(regs->gpr[ra], (short) instr))
+		if (rd & trap_compare(regs->gpr[ra], (short) word))
 			goto trap;
 		return 1;
 #endif
 	case 3:		/* twi */
-		if (rd & trap_compare((int)regs->gpr[ra], (short) instr))
+		if (rd & trap_compare((int)regs->gpr[ra], (short) word))
 			goto trap;
 		return 1;
 
@@ -1307,7 +1309,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
 			return -1;
 
-		switch (instr & 0x3f) {
+		switch (word & 0x3f) {
 		case 48:	/* maddhd */
 			asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
 				     "=r" (op->val) : "r" (regs->gpr[ra]),
@@ -1335,16 +1337,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 
 	case 7:		/* mulli */
-		op->val = regs->gpr[ra] * (short) instr;
+		op->val = regs->gpr[ra] * (short) word;
 		goto compute_done;
 
 	case 8:		/* subfic */
-		imm = (short) instr;
+		imm = (short) word;
 		add_with_carry(regs, op, rd, ~regs->gpr[ra], imm, 1);
 		return 1;
 
 	case 10:	/* cmpli */
-		imm = (unsigned short) instr;
+		imm = (unsigned short) word;
 		val = regs->gpr[ra];
 #ifdef __powerpc64__
 		if ((rd & 1) == 0)
@@ -1354,7 +1356,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		return 1;
 
 	case 11:	/* cmpi */
-		imm = (short) instr;
+		imm = (short) word;
 		val = regs->gpr[ra];
 #ifdef __powerpc64__
 		if ((rd & 1) == 0)
@@ -1364,35 +1366,35 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		return 1;
 
 	case 12:	/* addic */
-		imm = (short) instr;
+		imm = (short) word;
 		add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
 		return 1;
 
 	case 13:	/* addic. */
-		imm = (short) instr;
+		imm = (short) word;
 		add_with_carry(regs, op, rd, regs->gpr[ra], imm, 0);
 		set_cr0(regs, op);
 		return 1;
 
 	case 14:	/* addi */
-		imm = (short) instr;
+		imm = (short) word;
 		if (ra)
 			imm += regs->gpr[ra];
 		op->val = imm;
 		goto compute_done;
 
 	case 15:	/* addis */
-		imm = ((short) instr) << 16;
+		imm = ((short) word) << 16;
 		if (ra)
 			imm += regs->gpr[ra];
 		op->val = imm;
 		goto compute_done;
 
 	case 19:
-		if (((instr >> 1) & 0x1f) == 2) {
+		if (((word >> 1) & 0x1f) == 2) {
 			/* addpcis */
-			imm = (short) (instr & 0xffc1);	/* d0 + d2 fields */
-			imm |= (instr >> 15) & 0x3e;	/* d1 field */
+			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
+			imm |= (word >> 15) & 0x3e;	/* d1 field */
 			op->val = regs->nip + (imm << 16) + 4;
 			goto compute_done;
 		}
@@ -1400,65 +1402,65 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		return 0;
 
 	case 20:	/* rlwimi */
-		mb = (instr >> 6) & 0x1f;
-		me = (instr >> 1) & 0x1f;
+		mb = (word >> 6) & 0x1f;
+		me = (word >> 1) & 0x1f;
 		val = DATA32(regs->gpr[rd]);
 		imm = MASK32(mb, me);
 		op->val = (regs->gpr[ra] & ~imm) | (ROTATE(val, rb) & imm);
 		goto logical_done;
 
 	case 21:	/* rlwinm */
-		mb = (instr >> 6) & 0x1f;
-		me = (instr >> 1) & 0x1f;
+		mb = (word >> 6) & 0x1f;
+		me = (word >> 1) & 0x1f;
 		val = DATA32(regs->gpr[rd]);
 		op->val = ROTATE(val, rb) & MASK32(mb, me);
 		goto logical_done;
 
 	case 23:	/* rlwnm */
-		mb = (instr >> 6) & 0x1f;
-		me = (instr >> 1) & 0x1f;
+		mb = (word >> 6) & 0x1f;
+		me = (word >> 1) & 0x1f;
 		rb = regs->gpr[rb] & 0x1f;
 		val = DATA32(regs->gpr[rd]);
 		op->val = ROTATE(val, rb) & MASK32(mb, me);
 		goto logical_done;
 
 	case 24:	/* ori */
-		op->val = regs->gpr[rd] | (unsigned short) instr;
+		op->val = regs->gpr[rd] | (unsigned short) word;
 		goto logical_done_nocc;
 
 	case 25:	/* oris */
-		imm = (unsigned short) instr;
+		imm = (unsigned short) word;
 		op->val = regs->gpr[rd] | (imm << 16);
 		goto logical_done_nocc;
 
 	case 26:	/* xori */
-		op->val = regs->gpr[rd] ^ (unsigned short) instr;
+		op->val = regs->gpr[rd] ^ (unsigned short) word;
 		goto logical_done_nocc;
 
 	case 27:	/* xoris */
-		imm = (unsigned short) instr;
+		imm = (unsigned short) word;
 		op->val = regs->gpr[rd] ^ (imm << 16);
 		goto logical_done_nocc;
 
 	case 28:	/* andi. */
-		op->val = regs->gpr[rd] & (unsigned short) instr;
+		op->val = regs->gpr[rd] & (unsigned short) word;
 		set_cr0(regs, op);
 		goto logical_done_nocc;
 
 	case 29:	/* andis. */
-		imm = (unsigned short) instr;
+		imm = (unsigned short) word;
 		op->val = regs->gpr[rd] & (imm << 16);
 		set_cr0(regs, op);
 		goto logical_done_nocc;
 
 #ifdef __powerpc64__
 	case 30:	/* rld* */
-		mb = ((instr >> 6) & 0x1f) | (instr & 0x20);
+		mb = ((word >> 6) & 0x1f) | (word & 0x20);
 		val = regs->gpr[rd];
-		if ((instr & 0x10) == 0) {
-			sh = rb | ((instr & 2) << 4);
+		if ((word & 0x10) == 0) {
+			sh = rb | ((word & 2) << 4);
 			val = ROTATE(val, sh);
-			switch ((instr >> 2) & 3) {
+			switch ((word >> 2) & 3) {
 			case 0:		/* rldicl */
 				val &= MASK64_L(mb);
 				break;
@@ -1478,7 +1480,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		} else {
 			sh = regs->gpr[rb] & 0x3f;
 			val = ROTATE(val, sh);
-			switch ((instr >> 1) & 7) {
+			switch ((word >> 1) & 7) {
 			case 0:		/* rldcl */
 				op->val = val & MASK64_L(mb);
 				goto logical_done;
@@ -1493,8 +1495,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 	case 31:
 		/* isel occupies 32 minor opcodes */
-		if (((instr >> 1) & 0x1f) == 15) {
-			mb = (instr >> 6) & 0x1f; /* bc field */
+		if (((word >> 1) & 0x1f) == 15) {
+			mb = (word >> 6) & 0x1f; /* bc field */
 			val = (regs->ccr >> (31 - mb)) & 1;
 			val2 = (ra) ? regs->gpr[ra] : 0;
 
@@ -1502,7 +1504,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			goto compute_done;
 		}
 
-		switch ((instr >> 1) & 0x3ff) {
+		switch ((word >> 1) & 0x3ff) {
 		case 4:		/* tw */
 			if (rd == 0x1f ||
 			    (rd & trap_compare((int)regs->gpr[ra],
@@ -1536,17 +1538,17 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->reg = rd;
 			/* only MSR_EE and MSR_RI get changed if bit 15 set */
 			/* mtmsrd doesn't change MSR_HV, MSR_ME or MSR_LE */
-			imm = (instr & 0x10000)? 0x8002: 0xefffffffffffeffeUL;
+			imm = (word & 0x10000)? 0x8002: 0xefffffffffffeffeUL;
 			op->val = imm;
 			return 0;
 #endif
 
 		case 19:	/* mfcr */
 			imm = 0xffffffffUL;
-			if ((instr >> 20) & 1) {
+			if ((word >> 20) & 1) {
 				imm = 0xf0000000UL;
 				for (sh = 0; sh < 8; ++sh) {
-					if (instr & (0x80000 >> sh))
+					if (word & (0x80000 >> sh))
 						break;
 					imm >>= 4;
 				}
@@ -1560,7 +1562,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			val = regs->gpr[rd];
 			op->ccval = regs->ccr;
 			for (sh = 0; sh < 8; ++sh) {
-				if (instr & (0x80000 >> sh))
+				if (word & (0x80000 >> sh))
 					op->ccval = (op->ccval & ~imm) |
 						(val & imm);
 				imm >>= 4;
@@ -1568,7 +1570,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			return 1;
 
 		case 339:	/* mfspr */
-			spr = ((instr >> 16) & 0x1f) | ((instr >> 6) & 0x3e0);
+			spr = ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
 			op->type = MFSPR;
 			op->reg = rd;
 			op->spr = spr;
@@ -1578,7 +1580,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			return 0;
 
 		case 467:	/* mtspr */
-			spr = ((instr >> 16) & 0x1f) | ((instr >> 6) & 0x3e0);
+			spr = ((word >> 16) & 0x1f) | ((word >> 6) & 0x3e0);
 			op->type = MTSPR;
 			op->val = regs->gpr[rd];
 			op->spr = spr;
@@ -1948,7 +1950,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 826:	/* sradi with sh_5 = 0 */
 		case 827:	/* sradi with sh_5 = 1 */
 			op->type = COMPUTE + SETREG + SETXER;
-			sh = rb | ((instr & 2) << 4);
+			sh = rb | ((word & 2) << 4);
 			ival = (signed long int) regs->gpr[rd];
 			op->val = ival >> sh;
 			op->xerval = regs->xer;
@@ -1964,7 +1966,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
 				return -1;
 			op->type = COMPUTE + SETREG;
-			sh = rb | ((instr & 2) << 4);
+			sh = rb | ((word & 2) << 4);
 			val = (signed int) regs->gpr[rd];
 			if (sh)
 				op->val = ROTATE(val, sh) & MASK64(0, 63 - sh);
@@ -1979,34 +1981,34 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
  */
 		case 54:	/* dcbst */
 			op->type = MKOP(CACHEOP, DCBST, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			return 0;
 
 		case 86:	/* dcbf */
 			op->type = MKOP(CACHEOP, DCBF, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			return 0;
 
 		case 246:	/* dcbtst */
 			op->type = MKOP(CACHEOP, DCBTST, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			op->reg = rd;
 			return 0;
 
 		case 278:	/* dcbt */
 			op->type = MKOP(CACHEOP, DCBTST, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			op->reg = rd;
 			return 0;
 
 		case 982:	/* icbi */
 			op->type = MKOP(CACHEOP, ICBI, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			return 0;
 
 		case 1014:	/* dcbz */
 			op->type = MKOP(CACHEOP, DCBZ, 0);
-			op->ea = xform_ea(instr, regs);
+			op->ea = xform_ea(word, regs);
 			return 0;
 		}
 		break;
@@ -2019,14 +2021,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	op->update_reg = ra;
 	op->reg = rd;
 	op->val = regs->gpr[rd];
-	u = (instr >> 20) & UPDATE;
+	u = (word >> 20) & UPDATE;
 	op->vsx_flags = 0;
 
 	switch (opcode) {
 	case 31:
-		u = instr & UPDATE;
-		op->ea = xform_ea(instr, regs);
-		switch ((instr >> 1) & 0x3ff) {
+		u = word & UPDATE;
+		op->ea = xform_ea(word, regs);
+		switch ((word >> 1) & 0x3ff) {
 		case 20:	/* lwarx */
 			op->type = MKOP(LARX, 0, 4);
 			break;
@@ -2271,25 +2273,25 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 #ifdef CONFIG_VSX
 		case 12:	/* lxsiwzx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 8;
 			break;
 
 		case 76:	/* lxsiwax */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, SIGNEXT, 4);
 			op->element_size = 8;
 			break;
 
 		case 140:	/* stxsiwx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 4);
 			op->element_size = 8;
 			break;
 
 		case 268:	/* lxvx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 16;
 			op->vsx_flags = VSX_CHECK_VEC;
@@ -2298,33 +2300,33 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 269:	/* lxvl */
 		case 301: {	/* lxvll */
 			int nb;
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
 			if (nb > 16)
 				nb = 16;
 			op->type = MKOP(LOAD_VSX, 0, nb);
 			op->element_size = 16;
-			op->vsx_flags = ((instr & 0x20) ? VSX_LDLEFT : 0) |
+			op->vsx_flags = ((word & 0x20) ? VSX_LDLEFT : 0) |
 				VSX_CHECK_VEC;
 			break;
 		}
 		case 332:	/* lxvdsx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 8);
 			op->element_size = 8;
 			op->vsx_flags = VSX_SPLAT;
 			break;
 
 		case 364:	/* lxvwsx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 4;
 			op->vsx_flags = VSX_SPLAT | VSX_CHECK_VEC;
 			break;
 
 		case 396:	/* stxvx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 16;
 			op->vsx_flags = VSX_CHECK_VEC;
@@ -2333,118 +2335,118 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 397:	/* stxvl */
 		case 429: {	/* stxvll */
 			int nb;
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->ea = ra ? regs->gpr[ra] : 0;
 			nb = regs->gpr[rb] & 0xff;
 			if (nb > 16)
 				nb = 16;
 			op->type = MKOP(STORE_VSX, 0, nb);
 			op->element_size = 16;
-			op->vsx_flags = ((instr & 0x20) ? VSX_LDLEFT : 0) |
+			op->vsx_flags = ((word & 0x20) ? VSX_LDLEFT : 0) |
 				VSX_CHECK_VEC;
 			break;
 		}
 		case 524:	/* lxsspx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
 			op->element_size = 8;
 			op->vsx_flags = VSX_FPCONV;
 			break;
 
 		case 588:	/* lxsdx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 8);
 			op->element_size = 8;
 			break;
 
 		case 652:	/* stxsspx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 4);
 			op->element_size = 8;
 			op->vsx_flags = VSX_FPCONV;
 			break;
 
 		case 716:	/* stxsdx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 8);
 			op->element_size = 8;
 			break;
 
 		case 780:	/* lxvw4x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 4;
 			break;
 
 		case 781:	/* lxsibzx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 1);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 812:	/* lxvh8x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 2;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 813:	/* lxsihzx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 2);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 844:	/* lxvd2x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 8;
 			break;
 
 		case 876:	/* lxvb16x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 1;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 908:	/* stxvw4x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 4;
 			break;
 
 		case 909:	/* stxsibx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 1);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 940:	/* stxvh8x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 2;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 941:	/* stxsihx */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 2);
 			op->element_size = 8;
 			op->vsx_flags = VSX_CHECK_VEC;
 			break;
 
 		case 972:	/* stxvd2x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 8;
 			break;
 
 		case 1004:	/* stxvb16x */
-			op->reg = rd | ((instr & 1) << 5);
+			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 1;
 			op->vsx_flags = VSX_CHECK_VEC;
@@ -2457,80 +2459,80 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	case 32:	/* lwz */
 	case 33:	/* lwzu */
 		op->type = MKOP(LOAD, u, 4);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 34:	/* lbz */
 	case 35:	/* lbzu */
 		op->type = MKOP(LOAD, u, 1);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 36:	/* stw */
 	case 37:	/* stwu */
 		op->type = MKOP(STORE, u, 4);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 38:	/* stb */
 	case 39:	/* stbu */
 		op->type = MKOP(STORE, u, 1);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 40:	/* lhz */
 	case 41:	/* lhzu */
 		op->type = MKOP(LOAD, u, 2);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 42:	/* lha */
 	case 43:	/* lhau */
 		op->type = MKOP(LOAD, SIGNEXT | u, 2);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 44:	/* sth */
 	case 45:	/* sthu */
 		op->type = MKOP(STORE, u, 2);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 46:	/* lmw */
 		if (ra >= rd)
 			break;		/* invalid form, ra in range to load */
 		op->type = MKOP(LOAD_MULTI, 0, 4 * (32 - rd));
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 47:	/* stmw */
 		op->type = MKOP(STORE_MULTI, 0, 4 * (32 - rd));
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 #ifdef CONFIG_PPC_FPU
 	case 48:	/* lfs */
 	case 49:	/* lfsu */
 		op->type = MKOP(LOAD_FP, u | FPCONV, 4);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 50:	/* lfd */
 	case 51:	/* lfdu */
 		op->type = MKOP(LOAD_FP, u, 8);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 52:	/* stfs */
 	case 53:	/* stfsu */
 		op->type = MKOP(STORE_FP, u | FPCONV, 4);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 
 	case 54:	/* stfd */
 	case 55:	/* stfdu */
 		op->type = MKOP(STORE_FP, u, 8);
-		op->ea = dform_ea(instr, regs);
+		op->ea = dform_ea(word, regs);
 		break;
 #endif
 
@@ -2538,14 +2540,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	case 56:	/* lq */
 		if (!((rd & 1) || (rd == ra)))
 			op->type = MKOP(LOAD, 0, 16);
-		op->ea = dqform_ea(instr, regs);
+		op->ea = dqform_ea(word, regs);
 		break;
 #endif
 
 #ifdef CONFIG_VSX
 	case 57:	/* lfdp, lxsd, lxssp */
-		op->ea = dsform_ea(instr, regs);
-		switch (instr & 3) {
+		op->ea = dsform_ea(word, regs);
+		switch (word & 3) {
 		case 0:		/* lfdp */
 			if (rd & 1)
 				break;		/* reg must be even */
@@ -2569,8 +2571,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 #ifdef __powerpc64__
 	case 58:	/* ld[u], lwa */
-		op->ea = dsform_ea(instr, regs);
-		switch (instr & 3) {
+		op->ea = dsform_ea(word, regs);
+		switch (word & 3) {
 		case 0:		/* ld */
 			op->type = MKOP(LOAD, 0, 8);
 			break;
@@ -2586,16 +2588,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 #ifdef CONFIG_VSX
 	case 61:	/* stfdp, lxv, stxsd, stxssp, stxv */
-		switch (instr & 7) {
+		switch (word & 7) {
 		case 0:		/* stfdp with LSB of DS field = 0 */
 		case 4:		/* stfdp with LSB of DS field = 1 */
-			op->ea = dsform_ea(instr, regs);
+			op->ea = dsform_ea(word, regs);
 			op->type = MKOP(STORE_FP, 0, 16);
 			break;
 
 		case 1:		/* lxv */
-			op->ea = dqform_ea(instr, regs);
-			if (instr & 8)
+			op->ea = dqform_ea(word, regs);
+			if (word & 8)
 				op->reg = rd + 32;
 			op->type = MKOP(LOAD_VSX, 0, 16);
 			op->element_size = 16;
@@ -2604,7 +2606,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 2:		/* stxsd with LSB of DS field = 0 */
 		case 6:		/* stxsd with LSB of DS field = 1 */
-			op->ea = dsform_ea(instr, regs);
+			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 8);
 			op->element_size = 8;
@@ -2613,7 +2615,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 		case 3:		/* stxssp with LSB of DS field = 0 */
 		case 7:		/* stxssp with LSB of DS field = 1 */
-			op->ea = dsform_ea(instr, regs);
+			op->ea = dsform_ea(word, regs);
 			op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 4);
 			op->element_size = 8;
@@ -2621,8 +2623,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			break;
 
 		case 5:		/* stxv */
-			op->ea = dqform_ea(instr, regs);
-			if (instr & 8)
+			op->ea = dqform_ea(word, regs);
+			if (word & 8)
 				op->reg = rd + 32;
 			op->type = MKOP(STORE_VSX, 0, 16);
 			op->element_size = 16;
@@ -2634,8 +2636,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
 #ifdef __powerpc64__
 	case 62:	/* std[u] */
-		op->ea = dsform_ea(instr, regs);
-		switch (instr & 3) {
+		op->ea = dsform_ea(word, regs);
+		switch (word & 3) {
 		case 0:		/* std */
 			op->type = MKOP(STORE, 0, 8);
 			break;
@@ -2663,7 +2665,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	return 0;
 
  logical_done:
-	if (instr & 1)
+	if (word & 1)
 		set_cr0(regs, op);
  logical_done_nocc:
 	op->reg = ra;
@@ -2671,7 +2673,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	return 1;
 
  arith_done:
-	if (instr & 1)
+	if (word & 1)
 		set_cr0(regs, op);
  compute_done:
 	op->reg = rd;
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 85d62f16d07a..b928b21feac1 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -847,12 +847,12 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 {
 	struct instruction_op op;
 
-	if (!regs || !instr)
+	if (!regs || !ppc_inst_val(instr))
 		return -EINVAL;
 
 	if (analyse_instr(&op, regs, instr) != 1 ||
 	    GETTYPE(op.type) != COMPUTE) {
-		pr_info("emulation failed, instruction = 0x%08x\n", instr);
+		pr_info("emulation failed, instruction = 0x%08x\n", ppc_inst_val(instr));
 		return -EFAULT;
 	}
 
@@ -866,13 +866,13 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	extern int exec_instr(struct pt_regs *regs);
 	extern s32 patch__exec_instr;
 
-	if (!regs || !instr)
+	if (!regs || !ppc_inst_val(instr))
 		return -EINVAL;
 
 	/* Patch the NOP with the actual instruction */
 	patch_instruction_site(&patch__exec_instr, instr);
 	if (exec_instr(regs)) {
-		pr_info("execution failed, instruction = 0x%08x\n", instr);
+		pr_info("execution failed, instruction = 0x%08x\n", ppc_inst_val(instr));
 		return -EFAULT;
 	}
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 84af6c8eecf7..9364921870df 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -49,7 +49,7 @@
 static bool store_updates_sp(unsigned int inst)
 {
 	/* check for 1 in the rA field */
-	if (((inst >> 16) & 0x1f) != 1)
+	if (((ppc_inst_val(inst) >> 16) & 0x1f) != 1)
 		return false;
 	/* check major opcode */
 	switch (inst >> 26) {
@@ -60,10 +60,10 @@ static bool store_updates_sp(unsigned int inst)
 	case OP_STFDU:
 		return true;
 	case OP_STD:	/* std or stdu */
-		return (inst & 3) == 1;
+		return (ppc_inst_val(inst) & 3) == 1;
 	case OP_31:
 		/* check minor opcode */
-		switch ((inst >> 1) & 0x3ff) {
+		switch ((ppc_inst_val(inst) >> 1) & 0x3ff) {
 		case OP_31_XOP_STDUX:
 		case OP_31_XOP_STWUX:
 		case OP_31_XOP_STBUX:
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7e60327a9483..855676785c56 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2872,9 +2872,9 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		dotted = 0;
 		last_inst = inst;
 		if (praddr)
-			printf(REG"  %.8x", adr, inst);
+			printf(REG"  %.8x", adr, ppc_inst_val(inst));
 		printf("\t");
-		dump_func(inst, adr);
+		dump_func(ppc_inst_val(inst), adr);
 		printf("\n");
 	}
 	return adr - first_adr;
-- 
2.17.1

