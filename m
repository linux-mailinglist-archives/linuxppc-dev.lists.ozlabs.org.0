Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389018C70A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:32:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kC8v1qpmzDrhj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:32:47 +1100 (AEDT)
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
 header.s=20161025 header.b=cGUJZ0HY; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsK3C49zDrQg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:17 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id b72so2620141pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5h6ggFzcy3V91w/AOwjRs0iFE0F6SWUzKuIEtGHr8EQ=;
 b=cGUJZ0HYpxjhb1OMlM8mRzeyyXD2wwbq+9ZL8IPi0GGMp2JFU80DAZC37ow72xnGqY
 dJyEQ+ZPUEaFh2nL63/le/jv7T22scoCWShIOJWHM8O5bRylC3tdOUUDFbeNZwQngu98
 LDtsbqkdItGdTJ7Nlc7Vcyv05BmhV3SEQ6FrHXKaUaeN0s1ZIyje0MutqGFqaxyS84Al
 /noa2q1O34+sOHM0icLRrrZvzd2u/PK8rihvJZOP6zIWMalqyKDJKmVoUAmF0z9qh587
 NJVdYFmS67BvoxL5Bspzlv2mk6KZDa94xsZIC2hNKiEzq12S6saTIaBbRE2uuOhmQ54n
 24Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5h6ggFzcy3V91w/AOwjRs0iFE0F6SWUzKuIEtGHr8EQ=;
 b=sxCM/KRaffSO1AIwxGMNFldXhIC+8ctZ1sNkRFLgbSnnhpdRNpB4Lf+/8rrIhhQ+7p
 QGdqZ/P+9NbOSXFmr02trj7G521p2AHxNdCMFAtNuROTlYlxeBX6F4CVNEOvAwjwaU8W
 32B46V5L2ReSvpGJhxrtZGT6sBXzIjB2tGzDSDkgMp+Qze520SId3uq73Vfih9sPGalU
 ABOLn7NARXcdNHZjnoveXYPphmLEckFAMsSd1J4On2nJM4F2Q8m1baZNJIil7DiNCvJ0
 2EjL2cqDNV3cgI0ox4GUAmKvGdMiLgo9FyV2pOdL4wFHzWKIN666602C29zU+Yd91wSD
 bZdQ==
X-Gm-Message-State: ANhLgQ1u6QSoCxDtN8MKcOR+RXlCJEWkTrEcH0egG/jfgp43w6OXuH0A
 BvjC1YM+y1oQO9KKdQmD/HUNyHmiFYw=
X-Google-Smtp-Source: ADFU+vusMLYGCMDqx86uFBcy2ld5LkXeOJtS2igV93ekSHI09Wtb3HMGneOq7LUFo8HEKOPFm5mggg==
X-Received: by 2002:a62:1513:: with SMTP id 19mr7719887pfv.85.1584681555229;
 Thu, 19 Mar 2020 22:19:15 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/16] powerpc: Introduce functions for instruction nullity
 and equality
Date: Fri, 20 Mar 2020 16:18:00 +1100
Message-Id: <20200320051809.24332-8-jniethe5@gmail.com>
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

In preparation for an instruction data type that can not be directly
used with the '==' operator use functions for checking equality and
nullity.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/optprobes.c      |  2 +-
 arch/powerpc/kernel/trace/ftrace.c   | 33 +++++++++++++++-------------
 arch/powerpc/lib/code-patching.c     | 16 +++++++-------
 arch/powerpc/lib/feature-fixups.c    |  2 +-
 arch/powerpc/lib/test_emulate_step.c |  4 ++--
 arch/powerpc/xmon/xmon.c             |  4 ++--
 6 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 1025a7a3b3a8..6027425a85f2 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -259,7 +259,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 				(unsigned long)emulate_step_addr,
 				BRANCH_SET_LINK);
 
-	if (!branch_op_callback || !branch_emulate_step)
+	if (ppc_inst_null(branch_op_callback) || ppc_inst_null(branch_emulate_step))
 		goto error;
 
 	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index b189a34baaa2..b3645b664819 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -72,7 +72,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst old, ppc_inst new)
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
-	if (replaced != old) {
+	if (!ppc_inst_equal(replaced, old)) {
 		pr_err("%p: replaced (%#x) != old (%#x)",
 		(void *)ip, replaced, old);
 		return -EINVAL;
@@ -169,7 +169,8 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (op != PPC_INST(PPC_INST_MFLR) && op != PPC_INST(PPC_INST_STD_LR)) {
+	if (!ppc_inst_equal(op, PPC_INST(PPC_INST_MFLR)) &&
+	    !ppc_inst_equal(op, PPC_INST(PPC_INST_STD_LR))) {
 		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
 		return -EINVAL;
 	}
@@ -199,7 +200,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EFAULT;
 	}
 
-	if (op != PPC_INST(PPC_INST_LD_TOC)) {
+	if (!ppc_inst_equal(op,  PPC_INST(PPC_INST_LD_TOC))) {
 		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
 		return -EINVAL;
 	}
@@ -296,7 +297,7 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
 		if (!ftrace_tramps[i])
 			continue;
-		else if (create_branch((void *)ip, ftrace_tramps[i], 0))
+		else if (!ppc_inst_null(create_branch((void *)ip, ftrace_tramps[i], 0)))
 			return ftrace_tramps[i];
 
 	return 0;
@@ -368,7 +369,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 #else
 	ptr = ppc_global_function_entry((void *)ftrace_caller);
 #endif
-	if (!create_branch((void *)tramp, ptr, 0)) {
+	if (ppc_inst_null(create_branch((void *)tramp, ptr, 0))) {
 		pr_debug("%ps is not reachable from existing mcount tramp\n",
 				(void *)ptr);
 		return -1;
@@ -437,7 +438,7 @@ int ftrace_make_nop(struct module *mod,
 	 * then we had to use a trampoline to make the call.
 	 * Otherwise just update the call site.
 	 */
-	if (test_24bit_addr(ip, addr)) {
+	if (!ppc_inst_null(test_24bit_addr(ip, addr))) {
 		/* within range */
 		old = ftrace_call_replace(ip, addr, 1);
 		new = PPC_INST(PPC_INST_NOP);
@@ -494,7 +495,8 @@ expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
 	 * The load offset is different depending on the ABI. For simplicity
 	 * just mask it out when doing the compare.
 	 */
-	if ((op0 != 0x48000008) || (ppc_inst_mask(op1, 0xffff0000) != 0xe8410000))
+	if ((!ppc_inst_equal(op0, PPC_INST(0x48000008)) ||
+	     ((ppc_inst_mask(op1, 0xffff0000) != 0xe8410000))
 		return 0;
 	return 1;
 }
@@ -503,7 +505,7 @@ static int
 expected_nop_sequence(void *ip, ppc_inst op0, ppc_inst op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
-	if (op0 != PPC_INST(PPC_INST_NOP))
+	if (!ppc_inst_equal(op0, PPC_INST(PPC_INST_NOP)))
 		return 0;
 	return 1;
 }
@@ -559,7 +561,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch(ip, tramp, BRANCH_SET_LINK)) {
+	if (ppc_inst_null(create_branch(ip, tramp, BRANCH_SET_LINK))) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
@@ -584,7 +586,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
-	if (op != PPC_INST(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op,  PPC_INST(PPC_INST_NOP))) {
 		pr_err("Expected NOP but have %x\n", op);
 		return -EINVAL;
 	}
@@ -641,7 +643,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	if (op != PPC_INST(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op, PPC_INST(PPC_INST_NOP))) {
 		pr_err("Unexpected call sequence at %p: %x\n", ip, op);
 		return -EINVAL;
 	}
@@ -670,7 +672,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	 * then we had to use a trampoline to make the call.
 	 * Otherwise just update the call site.
 	 */
-	if (test_24bit_addr(ip, addr)) {
+	if (!ppc_inst_null(test_24bit_addr(ip, addr))) {
 		/* within range */
 		old = PPC_INST(PPC_INST_NOP);
 		new = ftrace_call_replace(ip, addr, 1);
@@ -748,7 +750,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* The new target may be within range */
-	if (test_24bit_addr(ip, addr)) {
+	if (!ppc_inst_null(test_24bit_addr(ip, addr))) {
 		/* within range */
 		if (patch_branch((ppc_inst *)ip, addr, BRANCH_SET_LINK)) {
 			pr_err("REL24 out of range!\n");
@@ -778,7 +780,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch((ppc_inst *)ip, tramp, BRANCH_SET_LINK)) {
+	if (ppc_inst_null(create_branch((ppc_inst *)ip, tramp, BRANCH_SET_LINK))) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
@@ -803,7 +805,8 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	 * then we had to use a trampoline to make the call.
 	 * Otherwise just update the call site.
 	 */
-	if (test_24bit_addr(ip, addr) && test_24bit_addr(ip, old_addr)) {
+	if (!ppc_inst_null(test_24bit_addr(ip, addr)) &&
+	    !ppc_inst_null(test_24bit_addr(ip, old_addr))) {
 		/* within range */
 		old = ftrace_call_replace(ip, old_addr, 1);
 		new = ftrace_call_replace(ip, addr, 1);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 04a303c059e2..ec3abe1a6927 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -461,20 +461,20 @@ static void __init test_branch_iform(void)
 
 	/* Out of range relative negative offset, - 32 MB + 4*/
 	instr = create_branch(&instr, addr - 0x2000004, BRANCH_SET_LINK);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Out of range relative positive offset, + 32 MB */
 	instr = create_branch(&instr, addr + 0x2000000, BRANCH_SET_LINK);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Unaligned target */
 	instr = create_branch(&instr, addr + 3, BRANCH_SET_LINK);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Check flags are masked correctly */
 	instr = create_branch(&instr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == PPC_INST(0x48000000));
+	check(ppc_inst_equal(instr, PPC_INST(0x48000000)));
 }
 
 static void __init test_create_function_call(void)
@@ -544,20 +544,20 @@ static void __init test_branch_bform(void)
 
 	/* Out of range relative negative offset, - 32 KB + 4*/
 	instr = create_cond_branch(iptr, addr - 0x8004, flags);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Out of range relative positive offset, + 32 KB */
 	instr = create_cond_branch(iptr, addr + 0x8000, flags);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Unaligned target */
 	instr = create_cond_branch(iptr, addr + 3, flags);
-	check(instr == 0);
+	check(ppc_inst_null(instr));
 
 	/* Check flags are masked correctly */
 	instr = create_cond_branch(iptr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == 0x43FF0000);
+	check(ppc_inst_equal(instr, PPC_INST(0x43FF0000)));
 }
 
 static void __init test_translate_branch(void)
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index a5f3d98862e9..552106d1f64a 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -55,7 +55,7 @@ static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 		/* Branch within the section doesn't need translating */
 		if (target < alt_start || target > alt_end) {
 			instr = translate_branch(dest, src);
-			if (!instr)
+			if (ppc_inst_null(instr))
 				return 1;
 		}
 	}
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 227ebae9ba5a..486e057e5be1 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -846,7 +846,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 {
 	struct instruction_op op;
 
-	if (!regs || !instr)
+	if (!regs || ppc_inst_null(instr))
 		return -EINVAL;
 
 	if (analyse_instr(&op, regs, instr) != 1 ||
@@ -865,7 +865,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	extern int exec_instr(struct pt_regs *regs);
 	extern s32 patch__exec_instr;
 
-	if (!regs || !instr)
+	if (!regs || ppc_inst_null(instr))
 		return -EINVAL;
 
 	/* Patch the NOP with the actual instruction */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f8a7a55e6ab2..d045e583f1c9 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -951,7 +951,7 @@ static void remove_bpts(void)
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
 		if (mread(bp->address, &instr, 4) == 4
-		    && instr == PPC_INST(bpinstr)
+		    && ppc_inst_equal(instr, PPC_INST(bpinstr))
 		    && patch_instruction(
 			(ppc_inst *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
@@ -2861,7 +2861,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			break;
 		}
 		inst = PPC_INST(GETWORD(val));
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && ppc_inst_equal(inst, last_inst)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
-- 
2.17.1

