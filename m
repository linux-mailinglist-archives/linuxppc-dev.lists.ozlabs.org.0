Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69819F18F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:27:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkDZ1pY9zDqkk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rvETa4Fz; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wjs135HpzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:10:29 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 142so7167703pgf.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mdrt2Toa423na4I1OSyqPqF5pWjV85ZEZ8fepi/nPVU=;
 b=rvETa4FzjU9A9aywfatBcC/w7/q69l0qHZEA7wfY0AD5IXclTA6ciOgJoF8J+34k3R
 frZmRCtn4torhMe6CY3UgHzecmGyOyY7BRmw8k0ureC2qoBsQW3GxLf6AvFaFe64U+1M
 VnPedalYhGifNPjyRd/ZkmRPKHJCm+b+kG+AFvruZnhtYsaqS2SIiNOOOLCe+HG4VBPg
 RQ2djHRfkvtJKR/2OAxEuelOz6+7tK+Wb0N4nFTQSJ6wxam4p4v5yQOqTZhcZ3j1CYsr
 QThJHT7RTe3zoeTr7Kx5UPUXlAt5vYnj8NcoN3g3MSGVenaKF1be1JR0mQeIgRng58xe
 GXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mdrt2Toa423na4I1OSyqPqF5pWjV85ZEZ8fepi/nPVU=;
 b=PfzESXWnay2VGnEsgbPgfrMed7ydzdcnT8jb9Q2xZuv1snhMrrw9lQrZMLMdoNynY8
 EIZMNSCWmHQ+FPjetaXPDLLfIMpjie3wts2S7Md+gB4+fQjmLf7IXbUhpPS0W8NHzk20
 NE95+ePztlciG2oAQmUkQ9Q/NIxm1Q+rBoYEnsVgCLTE+GaOd9GHx6kE0EjrVQK3AVR9
 lYmWZKRKepl7OoZwloONKdp+MIe2uWM8MBwsFZVgMOT6h1cxLQeYSQIVdQkZYco9YVxg
 1iI995ixmT8MqMQqb6xXxVS0mfXfFm0ISfhY5uCiIAC5eZGqD1lTqKwoUxgE+A2uHZL8
 mPsA==
X-Gm-Message-State: AGi0PubYdAMv4A6rGJDmZrJEogMGFCiO4+9mHrpV+IMibALWILlQQqHH
 kwXwZVrCGQCtVeTvaOwHbm++keKzETU=
X-Google-Smtp-Source: APiQypLimZr6aHoYK6v4W3adyR2O15U9g8ZDlL0LPwQb5LSxYlZVBPhn2b2JgcAcPNTT77s4j0mXNA==
X-Received: by 2002:a63:b548:: with SMTP id u8mr13147714pgo.98.1586160623439; 
 Mon, 06 Apr 2020 01:10:23 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id m2sm11460406pjk.4.2020.04.06.01.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 01:10:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 08/21] powerpc: Introduce functions for instruction equality
Date: Mon,  6 Apr 2020 18:09:23 +1000
Message-Id: <20200406080936.7180-9-jniethe5@gmail.com>
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

In preparation for an instruction data type that can not be directly
used with the '==' operator use functions for checking equality.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v5: Remove ppc_inst_null()
---
 arch/powerpc/include/asm/inst.h      |  5 +++++
 arch/powerpc/kernel/trace/ftrace.c   | 15 ++++++++-------
 arch/powerpc/lib/code-patching.c     | 12 ++++++------
 arch/powerpc/lib/test_emulate_step.c |  2 +-
 arch/powerpc/xmon/xmon.c             |  4 ++--
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 78eb1481f1f6..54ee46b0a7c9 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -23,4 +23,9 @@ static inline u32 ppc_inst_swab(u32 x)
 	return ppc_inst(swab32(ppc_inst_val(x)));
 }
 
+static inline bool ppc_inst_equal(u32 x, u32 y)
+{
+	return x == y;
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 62ff429bddc4..784b5746cc55 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -72,7 +72,7 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
 		return -EFAULT;
 
 	/* Make sure it is what we expect it to be */
-	if (replaced != old) {
+	if (!ppc_inst_equal(replaced, old)) {
 		pr_err("%p: replaced (%#x) != old (%#x)",
 		(void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
 		return -EINVAL;
@@ -170,7 +170,8 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
-	if (op != ppc_inst(PPC_INST_MFLR) && op != ppc_inst(PPC_INST_STD_LR)) {
+	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
+	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
 		pr_err("Unexpected instruction %08x around bl _mcount\n", ppc_inst_val(op));
 		return -EINVAL;
 	}
@@ -200,7 +201,7 @@ __ftrace_make_nop(struct module *mod,
 		return -EFAULT;
 	}
 
-	if (op != ppc_inst(PPC_INST_LD_TOC)) {
+	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
 		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, ppc_inst_val(op));
 		return -EINVAL;
 	}
@@ -497,7 +498,7 @@ expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 	 * The load offset is different depending on the ABI. For simplicity
 	 * just mask it out when doing the compare.
 	 */
-	if ((op0 != ppc_inst(0x48000008)) || (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
+	if ((!ppc_inst_equal(op0), ppc_inst(0x48000008)) || (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
 		return 0;
 	return 1;
 }
@@ -506,7 +507,7 @@ static int
 expected_nop_sequence(void *ip, unsigned int op0, unsigned int op1)
 {
 	/* look for patched "NOP" on ppc64 with -mprofile-kernel */
-	if (op0 != ppc_inst(PPC_INST_NOP))
+	if (!ppc_inst_equal(op0, ppc_inst(PPC_INST_NOP)))
 		return 0;
 	return 1;
 }
@@ -589,7 +590,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	/* It should be pointing to a nop */
-	if (op != ppc_inst(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
 		pr_err("Expected NOP but have %x\n", op);
 		return -EINVAL;
 	}
@@ -646,7 +647,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 	}
 
-	if (op != ppc_inst(PPC_INST_NOP)) {
+	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
 		pr_err("Unexpected call sequence at %p: %x\n", ip, ppc_inst_val(op));
 		return -EINVAL;
 	}
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3f88d2a4400c..33654c6334a9 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -478,7 +478,7 @@ static void __init test_branch_iform(void)
 	/* Check flags are masked correctly */
 	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == ppc_inst(0x48000000));
+	check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
 }
 
 static void __init test_create_function_call(void)
@@ -563,7 +563,7 @@ static void __init test_branch_bform(void)
 	/* Check flags are masked correctly */
 	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
-	check(instr == ppc_inst(0x43FF0000));
+	check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
 }
 
 static void __init test_translate_branch(void)
@@ -597,7 +597,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x4a000000));
+	check(ppc_inst_equal(*q, ppc_inst(0x4a000000)));
 
 	/* Maximum positive case, move x to x - 32 MB + 4 */
 	p = buf + 0x2000000;
@@ -608,7 +608,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x49fffffc));
+	check(ppc_inst_equal(*q, ppc_inst(0x49fffffc)));
 
 	/* Jump to x + 16 MB moved to x + 20 MB */
 	p = buf;
@@ -654,7 +654,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x43ff8000));
+	check(ppc_inst_equal(*q, ppc_inst(0x43ff8000)));
 
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
@@ -666,7 +666,7 @@ static void __init test_translate_branch(void)
 	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
-	check(*q == ppc_inst(0x43ff7ffc));
+	check(ppc_inst_equal(*q, ppc_inst(0x43ff7ffc)));
 
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 60f7eb24d742..16387a9bfda0 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -865,7 +865,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	extern int exec_instr(struct pt_regs *regs);
 	extern s32 patch__exec_instr;
 
-	if (!regs || !instr)
+	if (!regs || !ppc_inst_val(instr))
 		return -EINVAL;
 
 	/* Patch the NOP with the actual instruction */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3c1fb46bfacf..f6c87d3d53ea 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -950,7 +950,7 @@ static void remove_bpts(void)
 		if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
 			continue;
 		if (mread(bp->address, &instr, 4) == 4
-		    && instr == ppc_inst(bpinstr)
+		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
 		    && patch_instruction(
 			(unsigned int *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
@@ -2860,7 +2860,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 			break;
 		}
 		inst = ppc_inst(GETWORD(val));
-		if (adr > first_adr && inst == last_inst) {
+		if (adr > first_adr && ppc_inst_equal(inst, last_inst)) {
 			if (!dotted) {
 				printf(" ...\n");
 				dotted = 1;
-- 
2.17.1

