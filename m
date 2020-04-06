Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FF19F17E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:23:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wk845GCWzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:23:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C+wEXz5F; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjrq6q4kzDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:19 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d24so5607183pll.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4m7BQlF7TdYJE9EWUpYqnJpg38VlH3+0BTMle9Vyb/s=;
 b=C+wEXz5FE6qcP60kYzYmUTcz3tiEEnXQbHVYsysbxz7Oz1cWVzyFQ0rGOrpLJxdglS
 rIZoTLIk9zFcTaWJFSHbaVqDm5NQUWFnilBqLU9pMVVhvpc6KCwHwDf1NiyOVflxc4ya
 q3rilF1S6ZZadbCeaVT8Thp92BTj8v9Lx12A0cAiJxDhk/Q2qDfXEff7qSL8e6MxI3V2
 8Uo89VI1G7SKvV92P9zDgVf7w/aXK5E17pthbZDYZY/Nev0tRlVCOpwAPy5TfAQ0eEtT
 5zUQtrdtNAazJ35gM1B3pfepalQIAKPoXuXOuAycZQd/HPPfTrQUnrcIivJ49tL4ecoo
 I1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4m7BQlF7TdYJE9EWUpYqnJpg38VlH3+0BTMle9Vyb/s=;
 b=Aq0Hyqb70QiN22KmDughq2RS9KadnanZPnzObP1vLFADrQPiwYLE4DJzswWyXeE6qB
 eZgcW/D+Ohs0GZOWu6eL3JfT4SL5zKwlAM2/zTVayTA8s5cRzKZxkBZxHF+0SKNY+zV1
 YPFu1GyTrWTsY/prrJFPG9wK4/Fw8moTRpP0QzwG6B5pnXcbwiAzl+bry3wctCFemtDW
 se/FbYgS2PiPzI+Qup4kwZH2S4H3nyVMhxCUkiC6PKFTe5AUr3YcpesOjWsUv6mJmaCa
 8Ef1GJmo1bOQEty0f/iolrwNoc9SXanuUBFyphItJkp6VpaLmMyU25/GV+zhlOXS6BZs
 GCdA==
X-Gm-Message-State: AGi0PuZp39iEPHoV/6BfEHfw/aTYdR8MiVgCifKL9v1DDuWAu/B3FNZA
 /HzoIwqKT3ieGJ0arCRJ8zNMo3+ZzUI=
X-Google-Smtp-Source: APiQypKmH6PdtXPlfcPYOq0Yepyu+noybFsSHGPfbDdHZXZkmvIt8E81fB8EnuQljMC8MM8QwoVHyg==
X-Received: by 2002:a17:90a:aa95:: with SMTP id
 l21mr9771262pjq.4.1586160616089; 
 Mon, 06 Apr 2020 01:10:16 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:15 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 06/21] powerpc: Use an accessor for instructions
Date: Mon,  6 Apr 2020 18:09:21 +1000
Message-Id: <20200406080936.7180-7-jniethe5@gmail.com>
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

In preparation for introducing a more complicated instruction type to
accomodate prefixed instructions use an accessor for getting an
instruction as a u32. Currently this does nothing.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4: New to series
v5: Remove references to 'word' instructions
---
 arch/powerpc/include/asm/inst.h      |   5 +
 arch/powerpc/include/asm/sstep.h     |   6 +-
 arch/powerpc/kernel/align.c          |   4 +-
 arch/powerpc/kernel/kprobes.c        |   2 +-
 arch/powerpc/kernel/trace/ftrace.c   |  22 +--
 arch/powerpc/kernel/vecemu.c         |  17 +-
 arch/powerpc/lib/code-patching.c     |  18 +-
 arch/powerpc/lib/sstep.c             | 270 ++++++++++++++-------------
 arch/powerpc/lib/test_emulate_step.c |   6 +-
 arch/powerpc/xmon/xmon.c             |   4 +-
 10 files changed, 182 insertions(+), 172 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 93959016fe4b..15f570bef936 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -8,6 +8,11 @@
 
 #define ppc_inst(x) (x)
 
+static inline u32 ppc_inst_val(u32 x)
+{
+	return x;
+}
+
 static inline int ppc_inst_opcode(u32 x)
 {
 	return x >> 26;
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
index 691013aa9f3c..a83d32c6513d 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -315,7 +315,7 @@ int fix_alignment(struct pt_regs *regs)
 
 #ifdef CONFIG_SPE
 	if (ppc_inst_opcode(instr) == 0x4) {
-		int reg = (instr >> 21) & 0x1f;
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
index a1a3686f41c6..8420b1944164 100644
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
index 47233e671c18..62ff429bddc4 100644
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
index 4acd3fb2b38e..c8d21e812d8c 100644
--- a/arch/powerpc/kernel/vecemu.c
+++ b/arch/powerpc/kernel/vecemu.c
@@ -10,6 +10,7 @@
 #include <asm/processor.h>
 #include <asm/switch_to.h>
 #include <linux/uaccess.h>
+#include <asm/inst.h>
 
 /* Functions in vector.S */
 extern void vaddfp(vector128 *dst, vector128 *a, vector128 *b);
@@ -260,21 +261,23 @@ static unsigned int rfin(unsigned int x)
 
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
index 099a515202aa..3f88d2a4400c 100644
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
@@ -372,9 +372,9 @@ int translate_branch(unsigned int *instr, const unsigned int *dest, const unsign
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
index c077acb983a1..26e37176692e 100644
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
 
-	opcode = instr >> 26;
+	opcode = word >> 26;
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
index 88b17226a493..60f7eb24d742 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -846,12 +846,12 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
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
 
@@ -871,7 +871,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	/* Patch the NOP with the actual instruction */
 	patch_instruction_site(&patch__exec_instr, instr);
 	if (exec_instr(regs)) {
-		pr_info("execution failed, instruction = 0x%08x\n", instr);
+		pr_info("execution failed, instruction = 0x%08x\n", ppc_inst_val(instr));
 		return -EFAULT;
 	}
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 68ecb39dd9cc..3c1fb46bfacf 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2870,9 +2870,9 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
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

