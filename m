Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F0C1589B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:43:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsBS47SDzDqCK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:43:12 +1100 (AEDT)
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
 header.s=20161025 header.b=sq43+wzf; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs1S3XBxzDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:35:24 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id p14so4904991pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D+/ISjKxb8iC7dNeo8i7yvvhHOavRqW7gwt1ffEsrdU=;
 b=sq43+wzf4WOcDny2wx6r4EU2P8s3aHJ5SHThusFR+dFs+azQg2FHZxXKDdfNnKNYBu
 sO+PptzTm7OF/1n5/HFuGJH++4KBQWTkRSFxRwupboRr2Hs+s3abtt0OrfvPq6PeD0IO
 EYe1jI1YLj5ZesJSzz8iplB+iL11CVvk4+BmIq4CnN4VXxW/aMgWDKhBmdgR/+0OuQoD
 dMqCCZ/QY7SYW3iq65zvNy68JQSsHxNqN4uyFwyFWWsJlO/73lRujy87asgVK1zKG1iC
 CmfJW29tWVx9wYSdh4A++bW3Kb2EIQL5lHbGOoV4LSLgdH9g7U9nM9ME7VPWkOXYGATN
 r+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D+/ISjKxb8iC7dNeo8i7yvvhHOavRqW7gwt1ffEsrdU=;
 b=BMWB2CHQ0uHjYlfK6KwqaADgOM3xSFcSzkSTYskadxa8t8Nd5DJ6WLNJ1VC6ckFyYB
 seGeVm2CvdcuG8N315Fs8wrbOvTcbB4kQFtf50BaW+M7ZWdyc2H/O+rNLWhaIyPgIZBN
 C//B3g0g52iH/37ELuMYTP8ZgaVWzs7cGqIOL65dfsDx+BFS7wcLWlNoCvCBDqn2HhsM
 aygkauTLtfZzABLm39MyRxU8Q9mRDTP+nDM5EOPU6m24hA0zDARIpAj3z5s25nc6xByZ
 3qM2lDy/uiMn+dVY+xgrM7g9XlLe4LRQ8i7t1p25IIfR6+A4KJ5k+MHe/N78V+n0rM5O
 3HsA==
X-Gm-Message-State: APjAAAXETYZvpyVA38OYCHjYQfx183XySZD0buq9FgvR9UjD/dgS5mnh
 dSJSuhSL4dPatd0CALSvGxJt//ouoPDBAA==
X-Google-Smtp-Source: APXvYqz4SUBdMm0yetJ4ViAMQs2nPvxFQ0Efny9bwxg0uT4l1xSa2w19d6dtdJkmkBrL6yF2mKR2YQ==
X-Received: by 2002:aa7:82ce:: with SMTP id f14mr1567980pfn.167.1581399321551; 
 Mon, 10 Feb 2020 21:35:21 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:35:21 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/13] powerpc sstep: Prepare to support prefixed
 instructions
Date: Tue, 11 Feb 2020 16:33:45 +1100
Message-Id: <20200211053355.21574-4-jniethe5@gmail.com>
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

Currently all instructions are a single word long. A future ISA version
will include prefixed instructions which have a double word length. The
functions used for analysing and emulating instructions need to be
modified so that they can handle these new instruction types.

A prefixed instruction is a word prefix followed by a word suffix. All
prefixes uniquely have the primary op-code 1. Suffixes may be valid word
instructions or instructions that only exist as suffixes.

In handling prefixed instructions it will be convenient to treat the
suffix and prefix as separate words. To facilitate this modify
analyse_instr() and emulate_step() to take a suffix as a
parameter. For word instructions it does not matter what is passed in
here - it will be ignored.

We also define a new flag, PREFIXED, to be used in instruction_op:type.
This flag will indicate when emulating an analysed instruction if the
NIP should be advanced by word length or double word length.

The callers of analyse_instr() and emulate_step() will need their own
changes to be able to support prefixed instructions. For now modify them
to pass in 0 as a suffix.

Note that at this point no prefixed instructions are emulated or
analysed - this is just making it possible to do so.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: - Move definition of __get_user_instr() and
__get_user_instr_inatomic() to "powerpc: Support prefixed instructions
in alignment handler."
    - Use a macro for returning the length of an op
    - Rename sufx -> suffix
    - Define and use PPC_NO_SUFFIX instead of 0
---
 arch/powerpc/include/asm/ppc-opcode.h |  5 +++++
 arch/powerpc/include/asm/sstep.h      |  9 ++++++--
 arch/powerpc/kernel/align.c           |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c   |  4 ++--
 arch/powerpc/kernel/kprobes.c         |  2 +-
 arch/powerpc/kernel/mce_power.c       |  2 +-
 arch/powerpc/kernel/optprobes.c       |  3 ++-
 arch/powerpc/kernel/uprobes.c         |  2 +-
 arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
 arch/powerpc/lib/sstep.c              | 12 ++++++-----
 arch/powerpc/lib/test_emulate_step.c  | 30 +++++++++++++--------------
 arch/powerpc/xmon/xmon.c              |  5 +++--
 12 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c1df75edde44..72783bc92e50 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -377,6 +377,11 @@
 #define PPC_INST_VCMPEQUD		0x100000c7
 #define PPC_INST_VCMPEQUB		0x10000006
 
+/* macro to check if a word is a prefix */
+#define IS_PREFIX(x)	(((x) >> 26) == 1)
+#define	PPC_NO_SUFFIX	0
+#define	PPC_INST_LENGTH(x)	(IS_PREFIX(x) ? 8 : 4)
+
 /* macros to insert fields into opcodes */
 #define ___PPC_RA(a)	(((a) & 0x1f) << 16)
 #define ___PPC_RB(b)	(((b) & 0x1f) << 11)
diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 769f055509c9..9ea8904a1549 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -89,11 +89,15 @@ enum instruction_type {
 #define VSX_LDLEFT	4	/* load VSX register from left */
 #define VSX_CHECK_VEC	8	/* check MSR_VEC not MSR_VSX for reg >= 32 */
 
+/* Prefixed flag, ORed in with type */
+#define PREFIXED	0x800
+
 /* Size field in type word */
 #define SIZE(n)		((n) << 12)
 #define GETSIZE(w)	((w) >> 12)
 
 #define GETTYPE(t)	((t) & INSTR_TYPE_MASK)
+#define OP_LENGTH(t)	(((t) & PREFIXED) ? 8 : 4)
 
 #define MKOP(t, f, s)	((t) | (f) | SIZE(s))
 
@@ -132,7 +136,7 @@ union vsx_reg {
  * otherwise.
  */
 extern int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-			 unsigned int instr);
+			 unsigned int instr, unsigned int suffix);
 
 /*
  * Emulate an instruction that can be executed just by updating
@@ -149,7 +153,8 @@ void emulate_update_regs(struct pt_regs *reg, struct instruction_op *op);
  * 0 if it could not be emulated, or -1 for an instruction that
  * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
  */
-extern int emulate_step(struct pt_regs *regs, unsigned int instr);
+extern int emulate_step(struct pt_regs *regs, unsigned int instr,
+			unsigned int suffix);
 
 /*
  * Emulate a load or store instruction by reading/writing the
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 92045ed64976..ba3bf5c3ab62 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -334,7 +334,7 @@ int fix_alignment(struct pt_regs *regs)
 	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
 		return -EIO;
 
-	r = analyse_instr(&op, regs, instr);
+	r = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
 	if (r < 0)
 		return -EINVAL;
 
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2462cd7c565c..3a7ec6760dab 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -251,7 +251,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
 		goto fail;
 
-	ret = analyse_instr(&op, regs, instr);
+	ret = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
 	type = GETTYPE(op.type);
 	size = GETSIZE(op.type);
 
@@ -275,7 +275,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 		return false;
 	}
 
-	if (!emulate_step(regs, instr))
+	if (!emulate_step(regs, instr, PPC_NO_SUFFIX))
 		goto fail;
 
 	return true;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2d27ec4feee4..24a56f062d9e 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -219,7 +219,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 	unsigned int insn = *p->ainsn.insn;
 
 	/* regs->nip is also adjusted if emulate_step returns 1 */
-	ret = emulate_step(regs, insn);
+	ret = emulate_step(regs, insn, PPC_NO_SUFFIX);
 	if (ret > 0) {
 		/*
 		 * Once this instruction has been boosted
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index 1cbf7f1a4e3d..824eda536f5d 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
 	if (pfn != ULONG_MAX) {
 		instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
 		instr = *(unsigned int *)(instr_addr);
-		if (!analyse_instr(&op, &tmp, instr)) {
+		if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
 			pfn = addr_to_pfn(regs, op.ea);
 			*addr = op.ea;
 			*phys_addr = (pfn << PAGE_SHIFT);
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 024f7aad1952..f908d9422557 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -100,7 +100,8 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * and that can be emulated.
 	 */
 	if (!is_conditional_branch(*p->ainsn.insn) &&
-			analyse_instr(&op, &regs, *p->ainsn.insn) == 1) {
+			analyse_instr(&op, &regs, *p->ainsn.insn,
+				      PPC_NO_SUFFIX) == 1) {
 		emulate_update_regs(&regs, &op);
 		nip = regs.nip;
 	}
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 1cfef0e5fec5..4ab40c4b576f 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * emulate_step() returns 1 if the insn was successfully emulated.
 	 * For all other cases, we need to single-step in hardware.
 	 */
-	ret = emulate_step(regs, auprobe->insn);
+	ret = emulate_step(regs, auprobe->insn, PPC_NO_SUFFIX);
 	if (ret > 0)
 		return true;
 
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index 1139bc56e004..2fc1951cdae5 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -95,7 +95,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 
 	emulated = EMULATE_FAIL;
 	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
-	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
+	if (analyse_instr(&op, &vcpu->arch.regs, inst, PPC_NO_SUFFIX) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
 
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c077acb983a1..65143ab1bf64 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1163,7 +1163,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
  * otherwise.
  */
 int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
-		  unsigned int instr)
+		  unsigned int instr, unsigned int suffix)
 {
 	unsigned int opcode, ra, rb, rc, rd, spr, u;
 	unsigned long int imm;
@@ -2756,7 +2756,8 @@ void emulate_update_regs(struct pt_regs *regs, struct instruction_op *op)
 {
 	unsigned long next_pc;
 
-	next_pc = truncate_if_32bit(regs->msr, regs->nip + 4);
+	next_pc = truncate_if_32bit(regs->msr,
+				    regs->nip + OP_LENGTH(op->type));
 	switch (GETTYPE(op->type)) {
 	case COMPUTE:
 		if (op->type & SETREG)
@@ -3101,14 +3102,14 @@ NOKPROBE_SYMBOL(emulate_loadstore);
  * or -1 if the instruction is one that should not be stepped,
  * such as an rfid, or a mtmsrd that would clear MSR_RI.
  */
-int emulate_step(struct pt_regs *regs, unsigned int instr)
+int emulate_step(struct pt_regs *regs, unsigned int instr, unsigned int suffix)
 {
 	struct instruction_op op;
 	int r, err, type;
 	unsigned long val;
 	unsigned long ea;
 
-	r = analyse_instr(&op, regs, instr);
+	r = analyse_instr(&op, regs, instr, suffix);
 	if (r < 0)
 		return r;
 	if (r > 0) {
@@ -3200,7 +3201,8 @@ int emulate_step(struct pt_regs *regs, unsigned int instr)
 	return 0;
 
  instr_done:
-	regs->nip = truncate_if_32bit(regs->msr, regs->nip + 4);
+	regs->nip = truncate_if_32bit(regs->msr,
+				      regs->nip + OP_LENGTH(op.type));
 	return 1;
 }
 NOKPROBE_SYMBOL(emulate_step);
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 42347067739c..3bc042e15d00 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -103,7 +103,7 @@ static void __init test_ld(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* ld r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LD(5, 3, 0));
+	stepped = emulate_step(&regs, TEST_LD(5, 3, 0), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("ld", "PASS");
@@ -121,7 +121,7 @@ static void __init test_lwz(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* lwz r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LWZ(5, 3, 0));
+	stepped = emulate_step(&regs, TEST_LWZ(5, 3, 0), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("lwz", "PASS");
@@ -141,7 +141,7 @@ static void __init test_lwzx(void)
 	regs.gpr[5] = 0x8765;
 
 	/* lwzx r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LWZX(5, 3, 4));
+	stepped = emulate_step(&regs, TEST_LWZX(5, 3, 4), PPC_NO_SUFFIX);
 	if (stepped == 1 && regs.gpr[5] == a[2])
 		show_result("lwzx", "PASS");
 	else
@@ -159,7 +159,7 @@ static void __init test_std(void)
 	regs.gpr[5] = 0x5678;
 
 	/* std r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
+	stepped = emulate_step(&regs, TEST_STD(5, 3, 0), PPC_NO_SUFFIX);
 	if (stepped == 1 || regs.gpr[5] == a)
 		show_result("std", "PASS");
 	else
@@ -184,7 +184,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x5678;
 
 	/* ldarx r5, r3, r4, 0 */
-	stepped = emulate_step(&regs, TEST_LDARX(5, 3, 4, 0));
+	stepped = emulate_step(&regs, TEST_LDARX(5, 3, 4, 0), PPC_NO_SUFFIX);
 
 	/*
 	 * Don't touch 'a' here. Touching 'a' can do Load/store
@@ -202,7 +202,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x9ABC;
 
 	/* stdcx. r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STDCX(5, 3, 4));
+	stepped = emulate_step(&regs, TEST_STDCX(5, 3, 4), PPC_NO_SUFFIX);
 
 	/*
 	 * Two possible scenarios that indicates successful emulation
@@ -242,7 +242,7 @@ static void __init test_lfsx_stfsx(void)
 	regs.gpr[4] = 0;
 
 	/* lfsx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFSX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_LFSX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1)
 		show_result("lfsx", "PASS");
@@ -255,7 +255,7 @@ static void __init test_lfsx_stfsx(void)
 	c.a = 678.91;
 
 	/* stfsx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFSX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_STFSX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfsx", "PASS");
@@ -285,7 +285,7 @@ static void __init test_lfdx_stfdx(void)
 	regs.gpr[4] = 0;
 
 	/* lfdx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFDX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_LFDX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1)
 		show_result("lfdx", "PASS");
@@ -298,7 +298,7 @@ static void __init test_lfdx_stfdx(void)
 	c.a = 987654.32;
 
 	/* stfdx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFDX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_STFDX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfdx", "PASS");
@@ -344,7 +344,7 @@ static void __init test_lvx_stvx(void)
 	regs.gpr[4] = 0;
 
 	/* lvx vrt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LVX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_LVX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1)
 		show_result("lvx", "PASS");
@@ -360,7 +360,7 @@ static void __init test_lvx_stvx(void)
 	c.b[3] = 498532;
 
 	/* stvx vrs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STVX(10, 3, 4));
+	stepped = emulate_step(&regs, TEST_STVX(10, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3])
@@ -401,7 +401,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	regs.gpr[4] = 0;
 
 	/* lxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, TEST_LXVD2X(39, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
 		show_result("lxvd2x", "PASS");
@@ -421,7 +421,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	c.b[3] = 4;
 
 	/* stxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, TEST_STXVD2X(39, 3, 4), PPC_NO_SUFFIX);
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
@@ -848,7 +848,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 	if (!regs || !instr)
 		return -EINVAL;
 
-	if (analyse_instr(&op, regs, instr) != 1 ||
+	if (analyse_instr(&op, regs, instr, PPC_NO_SUFFIX) != 1 ||
 	    GETTYPE(op.type) != COMPUTE) {
 		pr_info("emulation failed, instruction = 0x%08x\n", instr);
 		return -EFAULT;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e8c84d265602..897e512c6379 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -705,7 +705,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
-			int stepped = emulate_step(regs, bp->instr[0]);
+			int stepped = emulate_step(regs, bp->instr[0],
+						   PPC_NO_SUFFIX);
 			if (stepped == 0) {
 				regs->nip = (unsigned long) &bp->instr[0];
 				atomic_inc(&bp->ref_count);
@@ -1170,7 +1171,7 @@ static int do_step(struct pt_regs *regs)
 	/* check we are in 64-bit kernel mode, translation enabled */
 	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
 		if (mread(regs->nip, &instr, 4) == 4) {
-			stepped = emulate_step(regs, instr);
+			stepped = emulate_step(regs, instr, PPC_NO_SUFFIX);
 			if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
 				       (IS_RFID(instr)? "rfid": "mtmsrd"));
-- 
2.17.1

