Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70661538BAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 09:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC37d2q7dz3bt6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 17:00:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OvXUMmKC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC3736wzFz2x9X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OvXUMmKC;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LC3735tkBz4xD9;
	Tue, 31 May 2022 16:59:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653980383;
	bh=bsNytJseMZAl0faoG57/zcB0BrP5yWp5b/Cb3iHfzO4=;
	h=From:To:Cc:Subject:Date:From;
	b=OvXUMmKCHVFlDOKK6u0aySAEf0YU/sQvnb1D+W9noGggYydhBjVhnhgZWV/Cm8p7z
	 OLSHceCktmYPLPtKmnpAFt9ouHzPH3JeV1tlOg04P0PaQ12JHgqnazKKxdSBisDGTp
	 A/t1X5WiVDHE4vwVWW6222rhQY+q8IQjf4GCT8+jgWjbvGG04jilb2o1CYm5oIpZOI
	 eDfZF88lwtq0CIoDkUfEdGNYP9fRmlcRHISFbE9/Jun+vUkBumRUADnXlcVuRC5URF
	 QsxrmCne6i5M/TGiGDmVZe8pzUO5kRkUqKw6sNRyzQPd2AgEtufYW9FnmPHugQAiXY
	 PGCSr/zNebfKg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Date: Tue, 31 May 2022 16:59:36 +1000
Message-Id: <20220531065936.3674348-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ppc_inst_as_str() macro tries to make printing variable length,
aka "prefixed", instructions convenient. It mostly succeeds, but it does
hide an on-stack buffer, which triggers stack protector.

More problematically it doesn't compile at all with GCC 12, due to the
fact that it returns the char buffer declared inside the macro:

  arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_modify_call':
  ./include/linux/printk.h:475:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
    475 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
    ...
  arch/powerpc/kernel/trace/ftrace.c:567:17: note: in expansion of macro 'pr_err'
    567 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
        |                 ^~~~~~
  ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
    156 |         char __str[PPC_INST_STR_LEN];   \
        |              ^~~~~

This could be fixed by having the caller declare the buffer, but in some
places there'd need to be two buffers. In all cases where
ppc_inst_as_str() is used the output is not really meant for user
consumption, it's almost always indicative of a kernel bug.

A simpler solution is to just print the value as an unsigned long. For
normal instructions the output is identical. For prefixed instructions
the value is printed as a single 64-bit quantity, whereas previously the
low half was printed first. But that is good enough for debug output,
especially as prefixed instructions will be rare in practice.

Old:
  c000000000111170  60420000      ori     r2,r2,0
  c000000000111174  04100001 e580fb00     .long 0xe580fb0004100001

New:
  c00000000010f90c  60420000      ori     r2,r2,0
  c00000000010f910  e580fb0004100001      .long 0xe580fb0004100001

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reported-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/inst.h      | 19 -------------------
 arch/powerpc/kernel/kprobes.c        |  2 +-
 arch/powerpc/kernel/trace/ftrace.c   | 24 +++++++++++++-----------
 arch/powerpc/lib/test_emulate_step.c |  6 +++---
 arch/powerpc/xmon/xmon.c             |  2 +-
 5 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index b49aae9f6f27..684d3f453282 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -139,25 +139,6 @@ static inline void ppc_inst_write(u32 *ptr, ppc_inst_t x)
 		*(u64 *)ptr = ppc_inst_as_ulong(x);
 }
 
-#define PPC_INST_STR_LEN sizeof("00000000 00000000")
-
-static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], ppc_inst_t x)
-{
-	if (ppc_inst_prefixed(x))
-		sprintf(str, "%08x %08x", ppc_inst_val(x), ppc_inst_suffix(x));
-	else
-		sprintf(str, "%08x", ppc_inst_val(x));
-
-	return str;
-}
-
-#define ppc_inst_as_str(x)		\
-({					\
-	char __str[PPC_INST_STR_LEN];	\
-	__ppc_inst_as_str(__str, x);	\
-	__str;				\
-})
-
 static inline int __copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 {
 	unsigned int val, suffix;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 1c97c0f177ae..912d4f8a13be 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -269,7 +269,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 		 * So, we should never get here... but, its still
 		 * good to catch them, just in case...
 		 */
-		printk("Can't step on instruction %s\n", ppc_inst_as_str(insn));
+		printk("Can't step on instruction %08lx\n", ppc_inst_as_ulong(insn));
 		BUG();
 	} else {
 		/*
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 2a893e06e4f1..cab67b5120b9 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -69,8 +69,8 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
 
 	/* Make sure it is what we expect it to be */
 	if (!ppc_inst_equal(replaced, old)) {
-		pr_err("%p: replaced (%s) != old (%s)",
-		(void *)ip, ppc_inst_as_str(replaced), ppc_inst_as_str(old));
+		pr_err("%p: replaced (%08lx) != old (%08lx)", (void *)ip,
+		       ppc_inst_as_ulong(replaced), ppc_inst_as_ulong(old));
 		return -EINVAL;
 	}
 
@@ -127,7 +127,7 @@ __ftrace_make_nop(struct module *mod,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
+		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
 	}
 
@@ -159,8 +159,8 @@ __ftrace_make_nop(struct module *mod,
 		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
 		if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_MFLR(_R0))) &&
 		    !ppc_inst_equal(op, ppc_inst(PPC_INST_STD_LR))) {
-			pr_err("Unexpected instruction %s around bl _mcount\n",
-			       ppc_inst_as_str(op));
+			pr_err("Unexpected instruction %08lx around bl _mcount\n",
+			       ppc_inst_as_ulong(op));
 			return -EINVAL;
 		}
 	} else if (IS_ENABLED(CONFIG_PPC64)) {
@@ -174,7 +174,8 @@ __ftrace_make_nop(struct module *mod,
 		}
 
 		if (!ppc_inst_equal(op,  ppc_inst(PPC_INST_LD_TOC))) {
-			pr_err("Expected %08lx found %s\n", PPC_INST_LD_TOC, ppc_inst_as_str(op));
+			pr_err("Expected %08lx found %08lx\n", PPC_INST_LD_TOC,
+			       ppc_inst_as_ulong(op));
 			return -EINVAL;
 		}
 	}
@@ -312,7 +313,7 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrace *rec, unsigned long addr)
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
+		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
 	}
 
@@ -416,8 +417,8 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 		return -EFAULT;
 
 	if (!expected_nop_sequence(ip, op[0], op[1])) {
-		pr_err("Unexpected call sequence at %p: %s %s\n",
-		ip, ppc_inst_as_str(op[0]), ppc_inst_as_str(op[1]));
+		pr_err("Unexpected call sequence at %p: %08lx %08lx\n", ip,
+		       ppc_inst_as_ulong(op[0]), ppc_inst_as_ulong(op[1]));
 		return -EINVAL;
 	}
 
@@ -486,7 +487,8 @@ static int __ftrace_make_call_kernel(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	if (!ppc_inst_equal(op, ppc_inst(PPC_RAW_NOP()))) {
-		pr_err("Unexpected call sequence at %p: %s\n", ip, ppc_inst_as_str(op));
+		pr_err("Unexpected call sequence at %p: %08lx\n",
+		       ip, ppc_inst_as_ulong(op));
 		return -EINVAL;
 	}
 
@@ -564,7 +566,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 
 	/* Make sure that that this is still a 24bit jump */
 	if (!is_bl_op(op)) {
-		pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
+		pr_err("Not expected bl: opcode is %08lx\n", ppc_inst_as_ulong(op));
 		return -EINVAL;
 	}
 
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 4f141daafcff..f2e47be05e8c 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -1616,11 +1616,11 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 	if (analysed != 1 || GETTYPE(op.type) != COMPUTE) {
 		if (negative)
 			return -EFAULT;
-		pr_info("emulation failed, instruction = %s\n", ppc_inst_as_str(instr));
+		pr_info("emulation failed, instruction = %08lx\n", ppc_inst_as_ulong(instr));
 		return -EFAULT;
 	}
 	if (analysed == 1 && negative)
-		pr_info("negative test failed, instruction = %s\n", ppc_inst_as_str(instr));
+		pr_info("negative test failed, instruction = %08lx\n", ppc_inst_as_ulong(instr));
 	if (!negative)
 		emulate_update_regs(regs, &op);
 	return 0;
@@ -1637,7 +1637,7 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	/* Patch the NOP with the actual instruction */
 	patch_instruction_site(&patch__exec_instr, instr);
 	if (exec_instr(regs)) {
-		pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
+		pr_info("execution failed, instruction = %08lx\n", ppc_inst_as_ulong(instr));
 		return -EFAULT;
 	}
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fff81c2300fa..6043454842cb 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3048,7 +3048,7 @@ generic_inst_dump(unsigned long adr, long count, int praddr,
 		dotted = 0;
 		last_inst = inst;
 		if (praddr)
-			printf(REG"  %s", adr, ppc_inst_as_str(inst));
+			printf(REG"  %08lx", adr, ppc_inst_as_ulong(inst));
 		printf("\t");
 		if (!ppc_inst_prefixed(inst))
 			dump_func(ppc_inst_val(inst), adr);
-- 
2.35.3

