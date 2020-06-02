Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FE51EB54F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:32:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bgfN6cxTzDqJT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 15:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bgXx2mYwzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LFJt1y7T; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49bgXv6x1hz8tRw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 15:27:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49bgXv662jz9sSy; Tue,  2 Jun 2020 15:27:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LFJt1y7T; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49bgXv5BQDz9sSg
 for <linuxppc-dev@ozlabs.org>; Tue,  2 Jun 2020 15:27:43 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id q11so1986580wrp.3
 for <linuxppc-dev@ozlabs.org>; Mon, 01 Jun 2020 22:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EiKVuFVvR1kzcWp0pO+XluerRBoW/f/kBeVZgtUljuI=;
 b=LFJt1y7T55q8Ut+ZOUEMbb9XkqBoThtbGIrFRE1OYVEU+QJGbiuO6JpPAgTBZct/9W
 V8LuTiZY6ZNhXEmhCqTLWBTkDfscAoYyiHnLTnDKFuuWHPlZzafZi7JWYU517eJVSYVD
 1E7oukfMG7cHHsvmhNtCINRlDnKNvj4ulPgcx9MRcqTnGlS4Yir9ZNh2f7P3SM3Xv301
 7kL55nVqKpkf+U3pNi95tdLsjW4FnPN0YLF2d+wj6wglgsWtmXP9BqcRca7extOrosrj
 3+HfFUeF9A7fb+/xDn5vQdWDT6SHyGWkQ7pepNdtGnZks6mS1IjiHNCzNU/Vr4tVUHjG
 86TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EiKVuFVvR1kzcWp0pO+XluerRBoW/f/kBeVZgtUljuI=;
 b=Ssx97Yhe4roTtuJOWOCMyXNiB3xa4uIM+3hl+iJwNKE0FxQteeGXNpX46MLDvS0s/o
 qJamxFG11MSLNdfjmh4FLvcc4nIlqUwzUQ5GMbLo9ZqsCRwJXppc1XgN6kPzqPGGt38i
 UW5pnkBJ3pDOODqrfcDHaI6TBMHAfsJhE54uAzeA3O+naAsZmmpufb9O59dG3qdqe3/z
 T7XPl4uy02WnVkcbXsEPskXDKK/vsdCsxO8o+nOiyKMSHKNxkMkRtioD3j+NyRGOzJHc
 6u+fJfw/19t3SNy2rPyrwK2NIe+MZq9FbUEtAfWa7ioJ6CpWylT1FXLLdE+l+4Y4jrwb
 BALg==
X-Gm-Message-State: AOAM532jukJFNckwsBs/tu8l7Dt9JHT8aruBO2Ez/bZtVCo3yCQsU3Jd
 dghxNiVU5zquHRAfELnM4wlyJM8S
X-Google-Smtp-Source: ABdhPJyhS1s9ew6Lv2b2Fkx0zrNzpVSsiSLZbhJOnQUw6VBlOP+3VsdzCQ+scaJqnAJ1Sfp5FedatA==
X-Received: by 2002:adf:d84a:: with SMTP id k10mr24348730wrl.336.1591075658516; 
 Mon, 01 Jun 2020 22:27:38 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a124sm1831336wmh.4.2020.06.01.22.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:27:37 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/4] powerpc: Add a ppc_inst_as_str() helper
Date: Tue,  2 Jun 2020 15:27:25 +1000
Message-Id: <20200602052728.18227-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>, alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are quite a few places where instructions are printed, this is
done using a '%x' format specifier. With the introduction of prefixed
instructions, this does not work well. Currently in these places,
ppc_inst_val() is used for the value for %x so only the first word of
prefixed instructions are printed.

When the instructions are word instructions, only a single word should
be printed. For prefixed instructions both the prefix and suffix should
be printed. To accommodate both of these situations, instead of a '%x'
specifier use '%s' and introduce a helper, __ppc_inst_as_str() which
returns a char *. The char * __ppc_inst_as_str() returns is buffer that
is passed to it by the caller.

It is cumbersome to require every caller of __ppc_inst_as_str() to now
declare a buffer. To make it more convenient to use __ppc_inst_as_str(),
wrap it in a macro that uses a compound statement to allocate a buffer
on the caller's stack before calling it.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/inst.h      | 19 +++++++++++++++++++
 arch/powerpc/kernel/kprobes.c        |  2 +-
 arch/powerpc/kernel/trace/ftrace.c   | 26 +++++++++++++-------------
 arch/powerpc/lib/test_emulate_step.c |  4 ++--
 arch/powerpc/xmon/xmon.c             |  2 +-
 5 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 45f3ec868258..3df7806e6dc3 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -122,6 +122,25 @@ static inline u64 ppc_inst_as_u64(struct ppc_inst x)
 #endif
 }
 
+#define PPC_INST_STR_LEN sizeof("0x00000000 0x00000000")
+
+static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], struct ppc_inst x)
+{
+	if (ppc_inst_prefixed(x))
+		sprintf(str, "0x%08x 0x%08x", ppc_inst_val(x), ppc_inst_suffix(x));
+	else
+		sprintf(str, "0x%08x", ppc_inst_val(x));
+
+	return str;
+}
+
+#define ppc_inst_as_str(x)		\
+({					\
+	char __str[PPC_INST_STR_LEN];	\
+	__ppc_inst_as_str(__str, x);	\
+	__str;				\
+})
+
 int probe_user_read_inst(struct ppc_inst *inst,
 			 struct ppc_inst __user *nip);
 
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 227510df8c55..d0797171dba3 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -244,7 +244,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 		 * So, we should never get here... but, its still
 		 * good to catch them, just in case...
 		 */
-		printk("Can't step on instruction %x\n", ppc_inst_val(insn));
+		printk("Can't step on instruction %s\n", ppc_inst_as_str(insn));
 		BUG();
 	} else {
 		/*
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 5e399628f51a..da11a26d8213 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -73,8 +73,8 @@ ftrace_modify_code(unsigned long ip, struct ppc_inst old, struct ppc_inst new)
 
 	/* Make sure it is what we expect it to be */
 	if (!ppc_inst_equal(replaced, old)) {
-		pr_err("%p: replaced (%#x) != old (%#x)",
-		(void *)ip, ppc_inst_val(replaced), ppc_inst_val(old));
+		pr_err("%p: replaced (%s) != old (%s)",
+		(void *)ip, ppc_inst_as_str(replaced), ppc_inst_as_str(old));
 		return -EINVAL;
 	}
 
@@ -137,7 +137,7 @@ __ftrace_make_nop(struct module *mod,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
+		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
@@ -172,8 +172,8 @@ __ftrace_make_nop(struct module *mod,
 	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
 	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_MFLR)) &&
 	    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
-		pr_err("Unexpected instruction %08x around bl _mcount\n",
-		       ppc_inst_val(op));
+		pr_err("Unexpected instruction %s around bl _mcount\n",
+		       ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 #else
@@ -203,7 +203,7 @@ __ftrace_make_nop(struct module *mod,
 	}
 
 	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, ppc_inst_val(op));
+		pr_err("Expected %08x found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 #endif /* CONFIG_MPROFILE_KERNEL */
@@ -231,7 +231,7 @@ __ftrace_make_nop(struct module *mod,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
+		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
@@ -406,7 +406,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
+		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
@@ -533,8 +533,8 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
-		pr_err("Unexpected call sequence at %p: %x %x\n",
-		ip, ppc_inst_val(op[0]), ppc_inst_val(op[1]));
+		pr_err("Unexpected call sequence at %p: %s %s\n",
+		ip, ppc_inst_as_str(op[0]), ppc_inst_as_str(op[1]));
 		return -EINVAL;
 	}
 
@@ -597,7 +597,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	/* It should be pointing to a nop */
 	if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_NOP))) {
-		pr_err("Expected NOP but have %x\n", ppc_inst_val(op));
+		pr_err("Expected NOP but have %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
@@ -654,7 +654,7 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	if (!ppc_inst_equal(op, ppc_inst(PPC_INST_NOP))) {
-		pr_err("Unexpected call sequence at %p: %x\n", ip, ppc_inst_val(op));
+		pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
@@ -733,7 +733,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %x\n", ppc_inst_val(op));
+		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
 		return -EINVAL;
 	}
 
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 46af80279ebc..5fb6f5267d70 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -852,7 +852,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 
 	if (analyse_instr(&op, regs, instr) != 1 ||
 	    GETTYPE(op.type) != COMPUTE) {
-		pr_info("emulation failed, instruction = 0x%08x\n", ppc_inst_val(instr));
+		pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
 		return -EFAULT;
 	}
 
@@ -872,7 +872,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	/* Patch the NOP with the actual instruction */
 	patch_instruction_site(&patch__exec_instr, instr);
 	if (exec_instr(regs)) {
-		pr_info("execution failed, instruction = 0x%08x\n", ppc_inst_val(instr));
+		pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
 		return -EFAULT;
 	}
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 16ee6639a60c..1dd3bf02021b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2958,7 +2958,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		dotted = 0;
 		last_inst = inst;
 		if (praddr)
-			printf(REG"  %.8x", adr, ppc_inst_val(inst));
+			printf(REG"  %s", adr, ppc_inst_as_str(inst));
 		printf("\t");
 		dump_func(ppc_inst_val(inst), adr);
 		printf("\n");
-- 
2.17.1

