Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A94A80A967
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:39:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tNc8PeKx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smxgj0BF7z3vhy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:39:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tNc8PeKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxZq14CCz3dHK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B577CE28A6;
	Fri,  8 Dec 2023 16:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09800C433C8;
	Fri,  8 Dec 2023 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053327;
	bh=NrFJSrx/3KR19QzR5TYpYUFTEJbo+oQ4qyOEwL/i7oY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNc8PeKxSqfDlHuiQBneADfgcw9l8lFQKQFHNKGLDEayi4SBRjtLo5pSh7n9IkhM/
	 addO+WlSlvXzV6wJ+ajcWwMC+DlK7gX2W/KkBuOwvicad2MgqE8hjE29GLHCCthSyX
	 Z30585QGQp6wo0eykt2xGLeAlUdKhLwd9rytH+HS1+X/vdk31Owgi5CDeEO9QNGQD7
	 F35eZAUdOwp2yUSWmtZX6CjSVidZ6T8ngt8cTXdyb31Iw4S+S+zHqiLUua4EAscvWG
	 CeH7CSOYauI9OcJcC+bNyGwAxriZpbitzWD/fhmh/DjZnhHA+wSUHfw33w6FviTaSu
	 fB3Cj5nk9s2TA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 6/9] powerpc/ftrace: Update and move function profile instructions out-of-line
Date: Fri,  8 Dec 2023 22:00:45 +0530
Message-ID: <39363eb6b1857f26f9fa51808ad48b0121899b84.1702045299.git.naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function profile sequence on powerpc includes two instructions at the
beginning of each function:

	mflr	r0
	bl	ftrace_caller

The call to ftrace_caller() gets nop'ed out during kernel boot and is
patched in when ftrace is enabled.

There are two issues with this:
1. The 'mflr r0' instruction at the beginning of each function remains
   even though ftrace is not being used.
2. When ftrace is activated, we return from ftrace_caller() with a bctr
   instruction to preserve r0 and LR, resulting in the link stack
   becoming unbalanced.

To address (1), we have tried to nop'out the 'mflr r0' instruction when
nop'ing out the call to ftrace_caller() and restoring it when enabling
ftrace. But, that required additional synchronization slowing down
ftrace activation. It also left an additional nop instruction at the
beginning of each function and that wasn't desirable on 32-bit powerpc.

Instead of that, move the function profile sequence out-of-line leaving
a single nop at function entry. On ftrace activation, the nop is changed
to an unconditional branch to the out-of-line sequence that in turn
calls ftrace_caller(). This removes the need for complex synchronization
during ftrace activation and simplifies the code. More importantly, this
improves performance of the kernel when ftrace is not in use.

To address (2), change the ftrace trampoline to return with a 'blr'
instruction with the original return address in r0 intact. Then, an
additional 'mtlr r0' instruction in the function profile sequence can
move the correct return address back to LR.

With the above two changes, the function profile sequence now looks like
the following:

 [func:		# GEP -- 64-bit powerpc, optional
	addis	r2,r12,imm1
	addi	r2,r2,imm2]
  tramp:
	mflr	r0
	bl	ftrace_caller
	mtlr	r0
	b	func
	nop
	[nop]	# 64-bit powerpc only
  func:		# LEP
	nop

On 32-bit powerpc, the ftrace mcount trampoline is now completely
outside the function. This is also the case on 64-bit powerpc for
functions that do not need a GEP. However, for functions that need a
GEP, the additional instructions are inserted between the GEP and the
LEP. Since we can only have a fixed number of instructions between GEP
and LEP, we choose to emit 6 instructions. Four of those instructions
are used for the function profile sequence and two instruction slots are
reserved for implementing support for DYNAMIC_FTRACE_WITH_CALL_OPS. On
32-bit powerpc, we emit one additional nop for this purpose resulting in
a total of 5 nops before function entry.

To enable ftrace, the nop at function entry is changed to an
unconditional branch to 'tramp'. The call to ftrace_caller() may be
updated to ftrace_regs_caller() depending on the registered ftrace ops.
On 64-bit powerpc, we additionally change the instruction at 'tramp' to
'mflr r0' from an unconditional branch back to func+4. This is so that
functions entered through the GEP can skip the function profile sequence
unless ftrace is enabled.

With the context_switch microbenchmark on a P9 machine, there is a
performance improvement of ~6% with this patch applied, going from 650k
context switches to 690k context switches without ftrace enabled. With
ftrace enabled, the performance was similar at 86k context switches.

The downside of this approach is the increase in vmlinux size,
especially on 32-bit powerpc. We now emit 3 additional instructions for
each function (excluding the one or two instructions for supporting
DYNAMIC_FTRACE_WITH_CALL_OPS). On 64-bit powerpc with the current
implementation of -fpatchable-function-entry though, this is not
avoidable since we are forced to emit 6 instructions between the GEP and
the LEP even if we are to only support DYNAMIC_FTRACE_WITH_CALL_OPS.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Makefile                    |   6 +-
 arch/powerpc/include/asm/code-patching.h |  15 ++-
 arch/powerpc/include/asm/ftrace.h        |  18 ++-
 arch/powerpc/kernel/kprobes.c            |  51 +++++++-
 arch/powerpc/kernel/trace/ftrace.c       | 149 ++++++++++++++++++-----
 arch/powerpc/kernel/trace/ftrace_entry.S |  54 ++++++--
 6 files changed, 246 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f19dbaa1d541..91ef34be8eb9 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -145,7 +145,11 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+ifdef CONFIG_PPC32
+CC_FLAGS_FTRACE := -fpatchable-function-entry=6,5
+else
+CC_FLAGS_FTRACE := -fpatchable-function-entry=7,6
+endif
 else
 CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 84f6ccd7de7a..9a54bb9e0dde 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -185,10 +185,21 @@ static inline unsigned long ppc_function_entry(void *func)
 	 */
 	if ((((*insn & OP_RT_RA_MASK) == ADDIS_R2_R12) ||
 	     ((*insn & OP_RT_RA_MASK) == LIS_R2)) &&
-	    ((*(insn+1) & OP_RT_RA_MASK) == ADDI_R2_R2))
+	    ((*(insn+1) & OP_RT_RA_MASK) == ADDI_R2_R2)) {
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+		/*
+		 * Heuristic: look for the 'mtlr r0' instruction assuming ftrace init is done.
+		 * If it is not found, look for two consecutive nops after the GEP.
+		 * Longer term, we really should be parsing the symbol table to determine LEP.
+		 */
+		if ((*(insn+4) == PPC_RAW_MTLR(_R0)) ||
+		    ((*(insn+2) == PPC_RAW_NOP() && *(insn+3) == PPC_RAW_NOP())))
+			return (unsigned long)(insn + 8);
+#endif
 		return (unsigned long)(insn + 2);
-	else
+	} else {
 		return (unsigned long)func;
+	}
 #elif defined(CONFIG_PPC64_ELF_ABI_V1)
 	/*
 	 * On PPC64 ABIv1 the function pointer actually points to the
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 1ebd2ca97f12..d9b99781bea3 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -11,10 +11,20 @@
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
 /* Ignore unused weak functions which will have larger offsets */
-#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
-#define FTRACE_MCOUNT_MAX_OFFSET	16
+#if defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
+#if defined(CONFIG_PPC64)
+#define FTRACE_MCOUNT_MAX_OFFSET	(MCOUNT_INSN_SIZE * 8)
+#define FTRACE_MCOUNT_TRAMP_OFFSET	(MCOUNT_INSN_SIZE * 6)
+#else
+#define FTRACE_MCOUNT_MAX_OFFSET	0
+#define FTRACE_MCOUNT_TRAMP_OFFSET	(MCOUNT_INSN_SIZE * 5)
+#endif /* CONFIG_PPC64 */
+#elif defined(CONFIG_MPROFILE_KERNEL)
+#define FTRACE_MCOUNT_MAX_OFFSET	(MCOUNT_INSN_SIZE * 4)
+#define FTRACE_MCOUNT_TRAMP_OFFSET	0
 #elif defined(CONFIG_PPC32)
-#define FTRACE_MCOUNT_MAX_OFFSET	8
+#define FTRACE_MCOUNT_MAX_OFFSET	(MCOUNT_INSN_SIZE * 2)
+#define FTRACE_MCOUNT_TRAMP_OFFSET	0
 #endif
 
 #ifndef __ASSEMBLY__
@@ -23,7 +33,7 @@ extern void _mcount(void);
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
-		addr += MCOUNT_INSN_SIZE;
+		addr += FTRACE_MCOUNT_TRAMP_OFFSET;
 
 	return addr;
 }
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 42665dfab59e..21557cf8544d 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -33,12 +33,61 @@ DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
 
 struct kretprobe_blackpoint kretprobe_blacklist[] = {{NULL, NULL}};
 
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+/*
+ * Reject probes on the ftrace mcount trampoline instruction sequence.  There
+ * are two scenarios to handle:
+ * 1. Functions that can be traced and have a GEP.
+ * 2. Functions without a GEP, wherein the ftrace mcount trampoline ends up
+ * being part of the previous function
+ */
+static inline bool addr_within_ftrace_mcount_trampoline(unsigned long addr)
+{
+	unsigned long ip, size, offset;
+
+	if (!kallsyms_lookup_size_offset(addr, &size, &offset))
+		return false;
+
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		ip = ftrace_location(addr - offset);
+
+		/* If the function is traceable and has GEP... */
+		if (ip && ip != (addr - offset))
+			/* ... reject probes on 6 instructions after the GEP entry sequence */
+			if (offset >= 2 * MCOUNT_INSN_SIZE && offset < 8 * MCOUNT_INSN_SIZE)
+				return true;
+
+		/* If the next function is traceable and does not have GEP... */
+		ip = addr + offset;
+		if (ftrace_location(ip) == ip)
+			/* ... reject probes on 6 instructions at the end of the function */
+			if (offset >= (size - 6 * MCOUNT_INSN_SIZE))
+				return true;
+	} else {
+		/* If the next function is traceable ... */
+		ip = addr + offset;
+		if (ftrace_location(ip) == ip)
+			/* ... reject probes on the last 5 instructions of the function */
+			if (offset >= (size - 5 * MCOUNT_INSN_SIZE))
+				return true;
+	}
+
+	return false;
+}
+#else
+static inline bool addr_within_ftrace_mcount_trampoline(unsigned long addr)
+{
+	return false;
+}
+#endif
+
 bool arch_within_kprobe_blacklist(unsigned long addr)
 {
 	return  (addr >= (unsigned long)__kprobes_text_start &&
 		 addr < (unsigned long)__kprobes_text_end) ||
 		(addr >= (unsigned long)_stext &&
-		 addr < (unsigned long)__head_end);
+		 addr < (unsigned long)__head_end) ||
+		addr_within_ftrace_mcount_trampoline(addr);
 }
 
 kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 2956196c98ff..d3b4949142a8 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -70,7 +70,7 @@ static inline int ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_
 {
 	int ret = ftrace_validate_inst(ip, old);
 
-	if (!ret)
+	if (!ret && !ppc_inst_equal(old, new))
 		ret = patch_instruction((u32 *)ip, new);
 
 	return ret;
@@ -96,7 +96,8 @@ static unsigned long find_ftrace_tramp(unsigned long ip)
 
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
 {
-	unsigned long ip = rec->ip;
+	unsigned long ip = rec->ip - (FTRACE_MCOUNT_TRAMP_OFFSET ?
+				      FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE : 0);
 	unsigned long stub;
 
 	if (is_offset_in_branch_range(addr - ip)) {
@@ -135,18 +136,38 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	ppc_inst_t old, new;
-	int ret;
+	unsigned long ip;
+	int ret = 0;
 
-	/* This can only ever be called during module load */
 	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec->ip)))
 		return -EINVAL;
 
-	old = ppc_inst(PPC_RAW_NOP());
-	ret = ftrace_get_call_inst(rec, addr, &new);
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
+		ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &old);
+	else
+		old = ppc_inst(PPC_RAW_NOP());
+	ret |= ftrace_get_call_inst(rec, addr, &new);
 	if (ret)
 		return ret;
 
-	return ftrace_modify_code(rec->ip, old, new);
+	ip = rec->ip - (FTRACE_MCOUNT_TRAMP_OFFSET ?
+			FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE : 0);
+
+	/* This can only ever be called during module load */
+	ret = ftrace_modify_code(ip, old, new);
+
+	if (ret || !IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
+		return ret;
+
+	ip = rec->ip;
+	ret = ftrace_modify_code(ip, ppc_inst(PPC_RAW_NOP()),
+				 ppc_inst(PPC_RAW_BRANCH(-FTRACE_MCOUNT_TRAMP_OFFSET)));
+	if (IS_ENABLED(CONFIG_PPC64) && !ret)
+		ret = ftrace_modify_code(ip - FTRACE_MCOUNT_TRAMP_OFFSET,
+			  ppc_inst(PPC_RAW_BRANCH(FTRACE_MCOUNT_TRAMP_OFFSET + MCOUNT_INSN_SIZE)),
+			  ppc_inst(PPC_RAW_MFLR(_R0)));
+
+	return ret;
 }
 
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
@@ -170,7 +191,8 @@ void ftrace_replace_code(int enable)
 
 	for_ftrace_rec_iter(iter) {
 		rec = ftrace_rec_iter_record(iter);
-		ip = rec->ip;
+		ip = rec->ip - (FTRACE_MCOUNT_TRAMP_OFFSET ?
+				FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE : 0);
 
 		if (rec->flags & FTRACE_FL_DISABLED && !(rec->flags & FTRACE_FL_ENABLED))
 			continue;
@@ -179,6 +201,12 @@ void ftrace_replace_code(int enable)
 		new_addr = ftrace_get_addr_new(rec);
 		update = ftrace_update_record(rec, enable);
 
+		if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
+			ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &nop_inst);
+			if (ret)
+				goto out;
+		}
+
 		switch (update) {
 		case FTRACE_UPDATE_IGNORE:
 		default:
@@ -205,6 +233,35 @@ void ftrace_replace_code(int enable)
 			ret = ftrace_modify_code(ip, old, new);
 		if (ret)
 			goto out;
+
+		if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
+		    (update == FTRACE_UPDATE_MAKE_NOP || update == FTRACE_UPDATE_MAKE_CALL)) {
+			/* Update the actual ftrace location */
+			call_inst = ppc_inst(PPC_RAW_BRANCH(-FTRACE_MCOUNT_TRAMP_OFFSET));
+			nop_inst = ppc_inst(PPC_RAW_NOP());
+			ip = rec->ip;
+
+			if (update == FTRACE_UPDATE_MAKE_NOP)
+				ret = ftrace_modify_code(ip, call_inst, nop_inst);
+			else
+				ret = ftrace_modify_code(ip, nop_inst, call_inst);
+
+			/* Switch unconditional branch after GEP to/from 'mflr r0' */
+			if (IS_ENABLED(CONFIG_PPC64) && !ret) {
+				call_inst = ppc_inst(PPC_RAW_BRANCH(FTRACE_MCOUNT_TRAMP_OFFSET + MCOUNT_INSN_SIZE));
+				old = ppc_inst(PPC_RAW_MFLR(_R0));
+
+				if (update == FTRACE_UPDATE_MAKE_NOP)
+					ret = ftrace_modify_code(ip - FTRACE_MCOUNT_TRAMP_OFFSET,
+								 old, call_inst);
+				else
+					ret = ftrace_modify_code(ip - FTRACE_MCOUNT_TRAMP_OFFSET,
+								 call_inst, old);
+			}
+
+			if (ret)
+				goto out;
+		}
 	}
 
 out:
@@ -217,15 +274,62 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
 	unsigned long addr, ip = rec->ip;
 	ppc_inst_t old, new;
-	int ret = 0;
+	int i, ret = 0;
+	u32 ftrace_mcount_tramp_insns[] = {
+#ifdef CONFIG_PPC64
+		PPC_RAW_BRANCH(FTRACE_MCOUNT_TRAMP_OFFSET + MCOUNT_INSN_SIZE),
+#else
+		PPC_RAW_MFLR(_R0),
+#endif
+		PPC_RAW_BL(0), /* bl ftrace_caller */
+		PPC_RAW_MTLR(_R0), /* also see update ppc_function_entry() */
+		PPC_RAW_BRANCH(FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE * 2)
+	};
+
+	if (!core_kernel_text(ip)) {
+		if (!mod) {
+			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
+			return -EFAULT;
+		}
+		rec->arch.mod = mod;
+	}
+
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
+		ip -= FTRACE_MCOUNT_TRAMP_OFFSET;
+
+		/* First instruction from the sequence */
+		old = ppc_inst(PPC_RAW_NOP());
+		ret = ftrace_modify_code(ip, old, ppc_inst(ftrace_mcount_tramp_insns[0]));
+		ip += MCOUNT_INSN_SIZE;
+
+		/* Default the mcount trampoline to go to ftrace_caller */
+		ret |= ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &new);
+		ret |= ftrace_modify_code(ip, old, new);
+		ip += MCOUNT_INSN_SIZE;
+
+		/* Rest of the instructions from the sequence */
+		for (i = 2; i < 4; i++, ip += MCOUNT_INSN_SIZE)
+			ret |= ftrace_modify_code(ip, old, ppc_inst(ftrace_mcount_tramp_insns[i]));
+
+		if (IS_ENABLED(CONFIG_PPC64)) {
+			/* two more nops */
+			ret |= ftrace_validate_inst(ip, old);
+			ip += MCOUNT_INSN_SIZE;
+			ret |= ftrace_validate_inst(ip, old);
+			ip += MCOUNT_INSN_SIZE;
+		} else {
+			ret |= ftrace_validate_inst(ip, old);
+			ip += MCOUNT_INSN_SIZE;
+		}
+
+		/* nop at ftrace location */
+		ret |= ftrace_validate_inst(ip, old);
+
+		return ret;
+	}
 
 	/* Verify instructions surrounding the ftrace location */
-	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
-		/* Expect nops */
-		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
-		if (!ret)
-			ret = ftrace_validate_inst(ip, ppc_inst(PPC_RAW_NOP()));
-	} else if (IS_ENABLED(CONFIG_PPC32)) {
+	if (IS_ENABLED(CONFIG_PPC32)) {
 		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
 		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
 		if (!ret)
@@ -246,23 +350,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	if (ret)
 		return ret;
 
-	if (!core_kernel_text(ip)) {
-		if (!mod) {
-			pr_err("0x%lx: No module provided for non-kernel address\n", ip);
-			return -EFAULT;
-		}
-		rec->arch.mod = mod;
-	}
-
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
 	addr = MCOUNT_ADDR;
-	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
-		/* we instead patch-in the 'mflr r0' */
-		old = ppc_inst(PPC_RAW_NOP());
-		new = ppc_inst(PPC_RAW_MFLR(_R0));
-		ret = ftrace_modify_code(ip - 4, old, new);
-	} else if (is_offset_in_branch_range(addr - ip)) {
+	if (is_offset_in_branch_range(addr - ip)) {
 		/* Within range */
 		old = ftrace_create_branch_inst(ip, addr, 1);
 		ret = ftrace_modify_code(ip, old, new);
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 244a1c7bb1e8..537c14b12904 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -78,6 +78,14 @@
 
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	/*
+	 * This points after the bl at 'mtlr r0', but this sequence could be
+	 * outside the function. Move this to point just after the ftrace
+	 * location inside the function for proper unwind.
+	 */
+	addi	r7, r7, FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE
+#endif
 	/* Save it as pt_regs->nip */
 	PPC_STL	r7, _NIP(r1)
 	/* Also save it in B's stackframe header for proper unwind */
@@ -121,12 +129,18 @@
 .macro	ftrace_regs_exit allregs
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
-	mtctr	r3
 
 #ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
 #endif
 
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	subi	r3, r3, FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE
+	mtlr	r3
+#else
+	mtctr	r3
+#endif
+
 	/* Restore gprs */
 	.if \allregs == 1
 	REST_GPRS(2, 31, r1)
@@ -139,7 +153,9 @@
 
 	/* Restore possibly modified LR */
 	PPC_LL	r0, _LINK(r1)
+#ifndef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	mtlr	r0
+#endif
 
 #ifdef CONFIG_PPC64
 	/* Restore callee's TOC */
@@ -153,7 +169,12 @@
         /* Based on the cmpd above, if the NIP was altered handle livepatch */
 	bne-	livepatch_handler
 #endif
-	bctr			/* jump after _mcount site */
+	/* jump after _mcount site */
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	blr
+#else
+	bctr
+#endif
 .endm
 
 _GLOBAL(ftrace_regs_caller)
@@ -177,6 +198,11 @@ _GLOBAL(ftrace_stub)
 
 #ifdef CONFIG_PPC64
 ftrace_no_trace:
+#ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	REST_GPR(3, r1)
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	blr
+#else
 	mflr	r3
 	mtctr	r3
 	REST_GPR(3, r1)
@@ -184,6 +210,7 @@ ftrace_no_trace:
 	mtlr	r0
 	bctr
 #endif
+#endif
 
 #ifdef CONFIG_LIVEPATCH_64
 	/*
@@ -196,9 +223,9 @@ ftrace_no_trace:
 	 *
 	 * On entry:
 	 *  - we have no stack frame and can not allocate one
-	 *  - LR points back to the original caller (in A)
-	 *  - CTR holds the new NIP in C
-	 *  - r0, r11 & r12 are free
+	 *  - LR/r0 points back to the original caller (in A)
+	 *  - CTR/LR holds the new NIP in C
+	 *  - r11 & r12 are free
 	 */
 livepatch_handler:
 	ld	r12, PACA_THREAD_INFO(r13)
@@ -208,19 +235,26 @@ livepatch_handler:
 	addi	r11, r11, 24
 	std	r11, TI_livepatch_sp(r12)
 
-	/* Save toc & real LR on livepatch stack */
-	std	r2,  -24(r11)
-	mflr	r12
-	std	r12, -16(r11)
-
 	/* Store stack end marker */
 	lis     r12, STACK_END_MAGIC@h
 	ori     r12, r12, STACK_END_MAGIC@l
 	std	r12, -8(r11)
 
+	/* Save toc & real LR on livepatch stack */
+	std	r2,  -24(r11)
+#ifndef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	mflr	r12
+	std	r12, -16(r11)
 	/* Put ctr in r12 for global entry and branch there */
 	mfctr	r12
 	bctrl
+#else
+	std	r0, -16(r11)
+	mflr	r12
+	addi	r12, r12, FTRACE_MCOUNT_TRAMP_OFFSET - MCOUNT_INSN_SIZE
+	mtlr	r12
+	blrl
+#endif
 
 	/*
 	 * Now we are returning from the patched function to the original
-- 
2.43.0

