Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636A1BB3BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:10:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B4qd3tFSzDqN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q6c7Unu5; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B4Zz36MkzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 11:59:39 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 7so527929pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 18:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+oRQ2xGugB8FSLbqVfI6cLL+kgKQKS1otRovZg3lbf0=;
 b=Q6c7Unu5AQPbUxsOfSjgOiYpItrocXrQD9AZM2XoRBgkLBJWOetQFxzwSxJ0aB67zs
 UX8umeS9ko5JjFzvafaVRdC4d+/ziHM7Q/+8Sz1IjVBqhbT8r1O4sX9SPUz5fZ+qfkqI
 2iNGnntXmvmh4CYfMz/RUblb4jFFN/Ym7oTrriXMlZO8VFppKJjLiKSS2eihRdq9T0OB
 6IQyvnFHDanQAFN/1dzDP8SKO5rSNIkV9X5rQmNeTk/ZNyax5rAWmIrThzIdm3VG+rZ8
 TFhd7pHbd4thByQNxGIL9VKjuxOWquHbqYD+nitiRu/3JxWEP9Y0bEag9wHGEf48tD8a
 q9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+oRQ2xGugB8FSLbqVfI6cLL+kgKQKS1otRovZg3lbf0=;
 b=E1MMiOhw6ldqzkUFuWin9X1b3Qk/8yrGjOGGwROOaEhnXukhjZbtZSJl9/Pop6UqlU
 DJHxK9WLE7dD0XtwiOo1TG8oMWhVti4MHYufCnx3A0ZkJLd6sifnRoqvF9wBLUtI30HN
 pnmFQeRsmt9gUAASYkahIqis6P8Z/N64PYkLS9dFye8pDOoQNtnyAGaewZ0UYvbC31Kr
 ehf+dInVdMu+S5rk/3hnZj5l83q0yFKH4VkQw5gFVF7MZSJ/YUEu0QlgfR0k2uABU68X
 7sRp3Bs9fpfYksXIdmKOzotGvO7Q0dTgfmsBTEkDQ6klgbyFJ6KoJedj2SSAiCmK7tSF
 ZmfA==
X-Gm-Message-State: AGi0Pub/9/guQxnmMQrGOYKebxmVAlzsq96Tdu+emmvPeDL/HpxPLqw6
 EtrhQmPwPURNcJvXwsB3Pz/Q7gDTQIM=
X-Google-Smtp-Source: APiQypKy5rkdxGW+kxNcvI8nMuOI3orjbsHvgov9I3AxM38MCNoqXIelW6s2xgIB+aRctPcyGjlEtA==
X-Received: by 2002:a17:90a:df15:: with SMTP id
 gp21mr2121257pjb.2.1588039175775; 
 Mon, 27 Apr 2020 18:59:35 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id o68sm13666642pfb.206.2020.04.27.18.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 18:59:35 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 05/28] powerpc: Change calling convention for
 create_branch() et. al.
Date: Tue, 28 Apr 2020 11:57:51 +1000
Message-Id: <20200428015814.15380-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
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

create_branch(), create_cond_branch() and translate_branch() return the
instruction that they create, or return 0 to signal an error. Separate
these concerns in preparation for an instruction type that is not just
an unsigned int.  Fill the created instruction to a pointer passed as
the first parameter to the function and use a non-zero return value to
signify an error.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v5: New to series
v6: - setup_32.c: machine_init(): change insn to unsigned int
    - Fix typo in commit message
    - __ftrace_make_call(): test for err not !err
---
 arch/powerpc/include/asm/code-patching.h |  12 +-
 arch/powerpc/kernel/optprobes.c          |  24 ++--
 arch/powerpc/kernel/setup_32.c           |   4 +-
 arch/powerpc/kernel/trace/ftrace.c       |  24 ++--
 arch/powerpc/lib/code-patching.c         | 134 +++++++++++++----------
 arch/powerpc/lib/feature-fixups.c        |   5 +-
 6 files changed, 119 insertions(+), 84 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 898b54262881..351dda7215b6 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -22,10 +22,10 @@
 #define BRANCH_ABSOLUTE	0x2
 
 bool is_offset_in_branch_range(long offset);
-unsigned int create_branch(const unsigned int *addr,
-			   unsigned long target, int flags);
-unsigned int create_cond_branch(const unsigned int *addr,
-				unsigned long target, int flags);
+int create_branch(unsigned int *instr, const unsigned int *addr,
+		  unsigned long target, int flags);
+int create_cond_branch(unsigned int *instr, const unsigned int *addr,
+		       unsigned long target, int flags);
 int patch_branch(unsigned int *addr, unsigned long target, int flags);
 int patch_instruction(unsigned int *addr, unsigned int instr);
 int raw_patch_instruction(unsigned int *addr, unsigned int instr);
@@ -60,8 +60,8 @@ int instr_is_relative_branch(unsigned int instr);
 int instr_is_relative_link_branch(unsigned int instr);
 int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr);
 unsigned long branch_target(const unsigned int *instr);
-unsigned int translate_branch(const unsigned int *dest,
-			      const unsigned int *src);
+int translate_branch(unsigned int *instr, const unsigned int *dest,
+		     const unsigned int *src);
 extern bool is_conditional_branch(unsigned int instr);
 #ifdef CONFIG_PPC_BOOK3E_64
 void __patch_exception(int exc, unsigned long addr);
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 024f7aad1952..445b3dad82dc 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -251,15 +251,17 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 		goto error;
 	}
 
-	branch_op_callback = create_branch((unsigned int *)buff + TMPL_CALL_HDLR_IDX,
-				(unsigned long)op_callback_addr,
-				BRANCH_SET_LINK);
+	rc = create_branch(&branch_op_callback,
+			   (unsigned int *)buff + TMPL_CALL_HDLR_IDX,
+			   (unsigned long)op_callback_addr,
+			   BRANCH_SET_LINK);
 
-	branch_emulate_step = create_branch((unsigned int *)buff + TMPL_EMULATE_IDX,
-				(unsigned long)emulate_step_addr,
-				BRANCH_SET_LINK);
+	rc |= create_branch(&branch_emulate_step,
+			    (unsigned int *)buff + TMPL_EMULATE_IDX,
+			    (unsigned long)emulate_step_addr,
+			    BRANCH_SET_LINK);
 
-	if (!branch_op_callback || !branch_emulate_step)
+	if (rc)
 		goto error;
 
 	patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
@@ -305,6 +307,7 @@ int arch_check_optimized_kprobe(struct optimized_kprobe *op)
 
 void arch_optimize_kprobes(struct list_head *oplist)
 {
+	unsigned int instr;
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
 
@@ -315,9 +318,10 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		 */
 		memcpy(op->optinsn.copied_insn, op->kp.addr,
 					       RELATIVEJUMP_SIZE);
-		patch_instruction(op->kp.addr,
-			create_branch((unsigned int *)op->kp.addr,
-				      (unsigned long)op->optinsn.insn, 0));
+		create_branch(&instr,
+			      (unsigned int *)op->kp.addr,
+			      (unsigned long)op->optinsn.insn, 0);
+		patch_instruction(op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
 }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 5b49b26eb154..350e7fc8971e 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -76,7 +76,7 @@ EXPORT_SYMBOL(DMA_MODE_WRITE);
 notrace void __init machine_init(u64 dt_ptr)
 {
 	unsigned int *addr = (unsigned int *)patch_site_addr(&patch__memset_nocache);
-	unsigned long insn;
+	unsigned int insn;
 
 	/* Configure static keys first, now that we're relocated. */
 	setup_feature_keys();
@@ -88,7 +88,7 @@ notrace void __init machine_init(u64 dt_ptr)
 
 	patch_instruction_site(&patch__memcpy_nocache, PPC_INST_NOP);
 
-	insn = create_cond_branch(addr, branch_target(addr), 0x820000);
+	create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
 	patch_instruction(addr, insn);	/* replace b by bne cr0 */
 
 	/* Do some early initialization based on the flat device tree */
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 7ea0ca044b65..828c5f64ca1e 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -48,7 +48,7 @@ ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
 	addr = ppc_function_entry((void *)addr);
 
 	/* if (link) set op to 'bl' else 'b' */
-	op = create_branch((unsigned int *)ip, addr, link ? 1 : 0);
+	create_branch(&op, (unsigned int *)ip, addr, link ? 1 : 0);
 
 	return op;
 }
@@ -89,10 +89,11 @@ ftrace_modify_code(unsigned long ip, unsigned int old, unsigned int new)
  */
 static int test_24bit_addr(unsigned long ip, unsigned long addr)
 {
+	unsigned int op;
 	addr = ppc_function_entry((void *)addr);
 
 	/* use the create_branch to verify that this offset can be branched */
-	return create_branch((unsigned int *)ip, addr, 0);
+	return create_branch(&op, (unsigned int *)ip, addr, 0) == 0;
 }
 
 static int is_bl_op(unsigned int op)
@@ -287,6 +288,7 @@ __ftrace_make_nop(struct module *mod,
 static unsigned long find_ftrace_tramp(unsigned long ip)
 {
 	int i;
+	unsigned int instr;
 
 	/*
 	 * We have the compiler generated long_branch tramps at the end
@@ -295,7 +297,8 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 	for (i = NUM_FTRACE_TRAMPS - 1; i >= 0; i--)
 		if (!ftrace_tramps[i])
 			continue;
-		else if (create_branch((void *)ip, ftrace_tramps[i], 0))
+		else if (create_branch(&instr, (void *)ip,
+				  ftrace_tramps[i], 0) == 0)
 			return ftrace_tramps[i];
 
 	return 0;
@@ -324,6 +327,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 {
 	int i, op;
 	unsigned long ptr;
+	unsigned int instr;
 	static unsigned long ftrace_plt_tramps[NUM_FTRACE_TRAMPS];
 
 	/* Is this a known long jump tramp? */
@@ -366,7 +370,7 @@ static int setup_mcount_compiler_tramp(unsigned long tramp)
 #else
 	ptr = ppc_global_function_entry((void *)ftrace_caller);
 #endif
-	if (!create_branch((void *)tramp, ptr, 0)) {
+	if (create_branch(&instr, (void *)tramp, ptr, 0)) {
 		pr_debug("%ps is not reachable from existing mcount tramp\n",
 				(void *)ptr);
 		return -1;
@@ -511,6 +515,7 @@ static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned int op[2];
+	unsigned int instr;
 	void *ip = (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
 	struct module *mod = rec->arch.mod;
@@ -557,7 +562,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch(ip, tramp, BRANCH_SET_LINK)) {
+	if (create_branch(&instr, ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
@@ -574,6 +579,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 static int
 __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
+	int err;
 	unsigned int op;
 	unsigned long ip = rec->ip;
 
@@ -594,9 +600,9 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	}
 
 	/* create the branch to the trampoline */
-	op = create_branch((unsigned int *)ip,
-			   rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
-	if (!op) {
+	err = create_branch(&op, (unsigned int *)ip,
+			    rec->arch.mod->arch.tramp, BRANCH_SET_LINK);
+	if (err) {
 		pr_err("REL24 out of range!\n");
 		return -EINVAL;
 	}
@@ -776,7 +782,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	}
 
 	/* Ensure branch is within 24 bits */
-	if (!create_branch((unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
+	if (create_branch(&op, (unsigned int *)ip, tramp, BRANCH_SET_LINK)) {
 		pr_err("Branch out of range\n");
 		return -EINVAL;
 	}
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3345f039a876..6ed3301c0582 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -196,7 +196,10 @@ NOKPROBE_SYMBOL(patch_instruction);
 
 int patch_branch(unsigned int *addr, unsigned long target, int flags)
 {
-	return patch_instruction(addr, create_branch(addr, target, flags));
+	unsigned int instr;
+
+	create_branch(&instr, addr, target, flags);
+	return patch_instruction(addr, instr);
 }
 
 bool is_offset_in_branch_range(long offset)
@@ -243,30 +246,30 @@ bool is_conditional_branch(unsigned int instr)
 }
 NOKPROBE_SYMBOL(is_conditional_branch);
 
-unsigned int create_branch(const unsigned int *addr,
-			   unsigned long target, int flags)
+int create_branch(unsigned int *instr,
+		  const unsigned int *addr,
+		  unsigned long target, int flags)
 {
-	unsigned int instruction;
 	long offset;
 
+	*instr = 0;
 	offset = target;
 	if (! (flags & BRANCH_ABSOLUTE))
 		offset = offset - (unsigned long)addr;
 
 	/* Check we can represent the target in the instruction format */
 	if (!is_offset_in_branch_range(offset))
-		return 0;
+		return 1;
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	instruction = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
+	*instr = 0x48000000 | (flags & 0x3) | (offset & 0x03FFFFFC);
 
-	return instruction;
+	return 0;
 }
 
-unsigned int create_cond_branch(const unsigned int *addr,
-				unsigned long target, int flags)
+int create_cond_branch(unsigned int *instr, const unsigned int *addr,
+		       unsigned long target, int flags)
 {
-	unsigned int instruction;
 	long offset;
 
 	offset = target;
@@ -275,12 +278,12 @@ unsigned int create_cond_branch(const unsigned int *addr,
 
 	/* Check we can represent the target in the instruction format */
 	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
-		return 0;
+		return 1;
 
 	/* Mask out the flags and target, so they don't step on each other. */
-	instruction = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
+	*instr = 0x40000000 | (flags & 0x3FF0003) | (offset & 0xFFFC);
 
-	return instruction;
+	return 0;
 }
 
 static unsigned int branch_opcode(unsigned int instr)
@@ -361,18 +364,19 @@ int instr_is_branch_to_addr(const unsigned int *instr, unsigned long addr)
 	return 0;
 }
 
-unsigned int translate_branch(const unsigned int *dest, const unsigned int *src)
+int translate_branch(unsigned int *instr, const unsigned int *dest,
+		     const unsigned int *src)
 {
 	unsigned long target;
 
 	target = branch_target(src);
 
 	if (instr_is_branch_iform(*src))
-		return create_branch(dest, target, *src);
+		return create_branch(instr, dest, target, *src);
 	else if (instr_is_branch_bform(*src))
-		return create_cond_branch(dest, target, *src);
+		return create_cond_branch(instr, dest, target, *src);
 
-	return 0;
+	return 1;
 }
 
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -403,6 +407,7 @@ static void __init test_trampoline(void)
 
 static void __init test_branch_iform(void)
 {
+	int err;
 	unsigned int instr;
 	unsigned long addr;
 
@@ -443,35 +448,35 @@ static void __init test_branch_iform(void)
 	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
 
 	/* Branch to self, with link */
-	instr = create_branch(&instr, addr, BRANCH_SET_LINK);
+	err = create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
 	check(instr_is_branch_to_addr(&instr, addr));
 
 	/* Branch to self - 0x100, with link */
-	instr = create_branch(&instr, addr - 0x100, BRANCH_SET_LINK);
+	err = create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
 	check(instr_is_branch_to_addr(&instr, addr - 0x100));
 
 	/* Branch to self + 0x100, no link */
-	instr = create_branch(&instr, addr + 0x100, 0);
+	err = create_branch(&instr, &instr, addr + 0x100, 0);
 	check(instr_is_branch_to_addr(&instr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 MB */
-	instr = create_branch(&instr, addr - 0x2000000, BRANCH_SET_LINK);
+	err = create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK);
 	check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
 
 	/* Out of range relative negative offset, - 32 MB + 4*/
-	instr = create_branch(&instr, addr - 0x2000004, BRANCH_SET_LINK);
-	check(instr == 0);
+	err = create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK);
+	check(err);
 
 	/* Out of range relative positive offset, + 32 MB */
-	instr = create_branch(&instr, addr + 0x2000000, BRANCH_SET_LINK);
-	check(instr == 0);
+	err = create_branch(&instr, &instr, addr + 0x2000000, BRANCH_SET_LINK);
+	check(err);
 
 	/* Unaligned target */
-	instr = create_branch(&instr, addr + 3, BRANCH_SET_LINK);
-	check(instr == 0);
+	err = create_branch(&instr, &instr, addr + 3, BRANCH_SET_LINK);
+	check(err);
 
 	/* Check flags are masked correctly */
-	instr = create_branch(&instr, addr, 0xFFFFFFFC);
+	err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
 	check(instr == 0x48000000);
 }
@@ -480,16 +485,19 @@ static void __init test_create_function_call(void)
 {
 	unsigned int *iptr;
 	unsigned long dest;
+	unsigned int instr;
 
 	/* Check we can create a function call */
 	iptr = (unsigned int *)ppc_function_entry(test_trampoline);
 	dest = ppc_function_entry(test_create_function_call);
-	patch_instruction(iptr, create_branch(iptr, dest, BRANCH_SET_LINK));
+	create_branch(&instr, iptr, dest, BRANCH_SET_LINK);
+	patch_instruction(iptr, instr);
 	check(instr_is_branch_to_addr(iptr, dest));
 }
 
 static void __init test_branch_bform(void)
 {
+	int err;
 	unsigned long addr;
 	unsigned int *iptr, instr, flags;
 
@@ -525,35 +533,35 @@ static void __init test_branch_bform(void)
 	flags = 0x3ff000 | BRANCH_SET_LINK;
 
 	/* Branch to self */
-	instr = create_cond_branch(iptr, addr, flags);
+	err = create_cond_branch(&instr, iptr, addr, flags);
 	check(instr_is_branch_to_addr(&instr, addr));
 
 	/* Branch to self - 0x100 */
-	instr = create_cond_branch(iptr, addr - 0x100, flags);
+	err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
 	check(instr_is_branch_to_addr(&instr, addr - 0x100));
 
 	/* Branch to self + 0x100 */
-	instr = create_cond_branch(iptr, addr + 0x100, flags);
+	err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
 	check(instr_is_branch_to_addr(&instr, addr + 0x100));
 
 	/* Maximum relative negative offset, - 32 KB */
-	instr = create_cond_branch(iptr, addr - 0x8000, flags);
+	err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
 	check(instr_is_branch_to_addr(&instr, addr - 0x8000));
 
 	/* Out of range relative negative offset, - 32 KB + 4*/
-	instr = create_cond_branch(iptr, addr - 0x8004, flags);
-	check(instr == 0);
+	err = create_cond_branch(&instr, iptr, addr - 0x8004, flags);
+	check(err);
 
 	/* Out of range relative positive offset, + 32 KB */
-	instr = create_cond_branch(iptr, addr + 0x8000, flags);
-	check(instr == 0);
+	err = create_cond_branch(&instr, iptr, addr + 0x8000, flags);
+	check(err);
 
 	/* Unaligned target */
-	instr = create_cond_branch(iptr, addr + 3, flags);
-	check(instr == 0);
+	err = create_cond_branch(&instr, iptr, addr + 3, flags);
+	check(err);
 
 	/* Check flags are masked correctly */
-	instr = create_cond_branch(iptr, addr, 0xFFFFFFFC);
+	err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
 	check(instr_is_branch_to_addr(&instr, addr));
 	check(instr == 0x43FF0000);
 }
@@ -562,6 +570,7 @@ static void __init test_translate_branch(void)
 {
 	unsigned long addr;
 	unsigned int *p, *q;
+	unsigned int instr;
 	void *buf;
 
 	buf = vmalloc(PAGE_ALIGN(0x2000000 + 1));
@@ -575,7 +584,8 @@ static void __init test_translate_branch(void)
 	patch_branch(p, addr, 0);
 	check(instr_is_branch_to_addr(p, addr));
 	q = p + 1;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Maximum negative case, move b . to addr + 32 MB */
@@ -583,7 +593,8 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	q = buf + 0x2000000;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(*q == 0x4a000000);
@@ -593,7 +604,8 @@ static void __init test_translate_branch(void)
 	addr = (unsigned long)p;
 	patch_branch(p, addr, 0);
 	q = buf + 4;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(*q == 0x49fffffc);
@@ -603,7 +615,8 @@ static void __init test_translate_branch(void)
 	addr = 0x1000000 + (unsigned long)buf;
 	patch_branch(p, addr, BRANCH_SET_LINK);
 	q = buf + 0x1400000;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
@@ -612,7 +625,8 @@ static void __init test_translate_branch(void)
 	addr = 0x2000000 + (unsigned long)buf;
 	patch_branch(p, addr, 0);
 	q = buf + 4;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
@@ -622,18 +636,22 @@ static void __init test_translate_branch(void)
 	/* Simple case, branch to self moved a little */
 	p = buf;
 	addr = (unsigned long)p;
-	patch_instruction(p, create_cond_branch(p, addr, 0));
+	create_cond_branch(&instr, p, addr, 0);
+	patch_instruction(p, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	q = p + 1;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Maximum negative case, move b . to addr + 32 KB */
 	p = buf;
 	addr = (unsigned long)p;
-	patch_instruction(p, create_cond_branch(p, addr, 0xFFFFFFFC));
+	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
+	patch_instruction(p, instr);
 	q = buf + 0x8000;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(*q == 0x43ff8000);
@@ -641,9 +659,11 @@ static void __init test_translate_branch(void)
 	/* Maximum positive case, move x to x - 32 KB + 4 */
 	p = buf + 0x8000;
 	addr = (unsigned long)p;
-	patch_instruction(p, create_cond_branch(p, addr, 0xFFFFFFFC));
+	create_cond_branch(&instr, p, addr, 0xFFFFFFFC);
+	patch_instruction(p, instr);
 	q = buf + 4;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 	check(*q == 0x43ff7ffc);
@@ -651,18 +671,22 @@ static void __init test_translate_branch(void)
 	/* Jump to x + 12 KB moved to x + 20 KB */
 	p = buf;
 	addr = 0x3000 + (unsigned long)buf;
-	patch_instruction(p, create_cond_branch(p, addr, BRANCH_SET_LINK));
+	create_cond_branch(&instr, p, addr, BRANCH_SET_LINK);
+	patch_instruction(p, instr);
 	q = buf + 0x5000;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
 	/* Jump to x + 8 KB moved to x - 8 KB + 4 */
 	p = buf + 0x2000;
 	addr = 0x4000 + (unsigned long)buf;
-	patch_instruction(p, create_cond_branch(p, addr, 0));
+	create_cond_branch(&instr, p, addr, 0);
+	patch_instruction(p, instr);
 	q = buf + 4;
-	patch_instruction(q, translate_branch(q, p));
+	translate_branch(&instr, q, p);
+	patch_instruction(q, instr);
 	check(instr_is_branch_to_addr(p, addr));
 	check(instr_is_branch_to_addr(q, addr));
 
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 4ba634b89ce5..b129d7b4e7dd 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -44,6 +44,7 @@ static unsigned int *calc_addr(struct fixup_entry *fcur, long offset)
 static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 				 unsigned int *alt_start, unsigned int *alt_end)
 {
+	int err;
 	unsigned int instr;
 
 	instr = *src;
@@ -53,8 +54,8 @@ static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
 
 		/* Branch within the section doesn't need translating */
 		if (target < alt_start || target > alt_end) {
-			instr = translate_branch(dest, src);
-			if (!instr)
+			err = translate_branch(&instr, dest, src);
+			if (err)
 				return 1;
 		}
 	}
-- 
2.17.1

