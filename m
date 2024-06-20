Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026179111D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 21:11:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPyzbi7y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4qpD4jvRz3cZs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 05:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RPyzbi7y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4qmr47Zbz3cYW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 05:09:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A0BCCE28B5;
	Thu, 20 Jun 2024 19:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC93C2BD10;
	Thu, 20 Jun 2024 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718910587;
	bh=13GFPwydLSEBN9vpa04BPNvFnpkcKl9YVFtQB7AEGV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPyzbi7y0H6LuTdgSwPog7paSQniTTmPV1DrH0CxdNC7lsERmAI+TE2eLuLy3wEYi
	 /eA22pHJvLr8DlWPVMwQweCecjhkEyCY9BeSkZJP/jTy1OU1Tc56xP5B0CXjpL31FS
	 e5AL0wxYzkLY7Lme7sJQlbnkdI+YLPzo2jfRcfSO4tCCSlHqQmu9odrnodbafq535A
	 2S8tLKwrIuzZjtXdFcp0FJlR/JQSSkE0yK1LVXT6SUadXJ63LINiR4ZLScgEuWO8iR
	 0Wyi4xk+a1LfzvIZibKE4m0KOl3HLfBybSE9iNNpTVFjjd/nNYe8jhdm/WDW9n9Mzb
	 1ZQDm7hQfPT8w==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>
Subject: [RFC PATCH v3 11/11] powerpc64/bpf: Add support for bpf trampolines
Date: Fri, 21 Jun 2024 00:39:11 +0530
Message-ID: <a88b5b57d7e9b6db96323a6d6b236d567ebd6443.1718908016.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718908016.git.naveen@kernel.org>
References: <cover.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for bpf_arch_text_poke() and arch_prepare_bpf_trampoline()
for 64-bit powerpc.

BPF prog JIT is extended to mimic 64-bit powerpc approach for ftrace
having a single nop at function entry, followed by the function
profiling sequence out-of-line and a separate long branch stub for calls
to trampolines that are out of range. A dummy_tramp is provided to
simplify synchronization similar to arm64.

BPF Trampolines adhere to the existing ftrace ABI utilizing a
two-instruction profiling sequence, as well as the newer ABI utilizing a
three-instruction profiling sequence enabling return with a 'blr'. The
trampoline code itself closely follows x86 implementation.

While the code is generic, BPF trampolines are only enabled on 64-bit
powerpc. 32-bit powerpc will need testing and some updates.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ppc-opcode.h |  14 +
 arch/powerpc/net/bpf_jit.h            |  11 +
 arch/powerpc/net/bpf_jit_comp.c       | 702 +++++++++++++++++++++++++-
 arch/powerpc/net/bpf_jit_comp32.c     |   7 +-
 arch/powerpc/net/bpf_jit_comp64.c     |   7 +-
 5 files changed, 738 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 076ae60b4a55..9eaa2c5d9b73 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -585,12 +585,26 @@
 #define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(spr))
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
 
+/* bcl 20,31,$+4 */
+#define PPC_RAW_BCL()			(0x429f0005)
 #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
 #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
 #define PPC_RAW_TW(t0, a, b)		(0x7c000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
 #define PPC_RAW_SETB(t, bfa)		(0x7c000100 | ___PPC_RT(t) | ___PPC_RA((bfa) << 2))
 
+#ifdef CONFIG_PPC32
+#define PPC_RAW_STL		PPC_RAW_STW
+#define PPC_RAW_STLU		PPC_RAW_STWU
+#define PPC_RAW_LL		PPC_RAW_LWZ
+#define PPC_RAW_CMPLI		PPC_RAW_CMPWI
+#else
+#define PPC_RAW_STL		PPC_RAW_STD
+#define PPC_RAW_STLU		PPC_RAW_STDU
+#define PPC_RAW_LL		PPC_RAW_LD
+#define PPC_RAW_CMPLI		PPC_RAW_CMPDI
+#endif
+
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_RAW_CP_ABORT)
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index cdea5dccaefe..58cdfbfbef94 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -21,6 +21,9 @@
 
 #define CTX_NIA(ctx) ((unsigned long)ctx->idx * 4)
 
+#define SZL			sizeof(unsigned long)
+#define BPF_INSN_SAFETY		64
+
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
@@ -81,6 +84,13 @@
 				EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
 							0xffff));             \
 		} } while (0)
+#define PPC_LI_ADDR	PPC_LI64
+#define PPC64_LOAD_PACA()						      \
+	EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
+#else
+#define PPC_LI64	BUILD_BUG
+#define PPC_LI_ADDR	PPC_LI32
+#define PPC64_LOAD_PACA() BUILD_BUG()
 #endif
 
 /*
@@ -165,6 +175,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		       u32 *addrs, int pass, bool extra_pass);
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
+void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx);
 void bpf_jit_realloc_regs(struct codegen_context *ctx);
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 984655419da5..54df51ce54c8 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -22,11 +22,81 @@
 
 #include "bpf_jit.h"
 
+/* These offsets are from bpf prog end and stay the same across progs */
+static int bpf_jit_ool_stub, bpf_jit_long_branch_stub;
+
 static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
 {
 	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
 }
 
+void dummy_tramp(void);
+
+asm (
+"	.pushsection .text, \"ax\", @progbits	;"
+"	.global dummy_tramp			;"
+"	.type dummy_tramp, @function		;"
+"dummy_tramp:					;"
+#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
+"	blr					;"
+#else
+"	mflr	11				;"
+"	mtctr	11				;"
+"	mtlr	0				;"
+"	bctr					;"
+#endif
+"	.size dummy_tramp, .-dummy_tramp	;"
+"	.popsection				;"
+);
+
+void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx)
+{
+	int ool_stub_idx, long_branch_stub_idx;
+
+	/*
+	 * Out-of-line stub:
+	 *	mflr	r0
+	 *	[b|bl]	tramp
+	 *	mtlr	r0 // only with CONFIG_FTRACE_PFE_OUT_OF_LINE
+	 *	b	bpf_func + 4
+	 */
+	ool_stub_idx = ctx->idx;
+	EMIT(PPC_RAW_MFLR(_R0));
+	EMIT(PPC_RAW_NOP());
+	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
+		EMIT(PPC_RAW_MTLR(_R0));
+	WARN_ON_ONCE(!is_offset_in_branch_range(4 - (long)ctx->idx * 4)); /* TODO */
+	EMIT(PPC_RAW_BRANCH(4 - (long)ctx->idx * 4));
+
+	/*
+	 * Long branch stub:
+	 *	.long	<dummy_tramp_addr>
+	 *	mflr	r11
+	 *	bcl	20,31,$+4
+	 *	mflr	r12
+	 *	ld	r12, -8-SZL(r12)
+	 *	mtctr	r12
+	 *	mtlr	r11 // needed to retain ftrace ABI
+	 *	bctr
+	 */
+	if (image)
+		*((unsigned long *)&image[ctx->idx]) = (unsigned long)dummy_tramp;
+	ctx->idx += SZL / 4;
+	long_branch_stub_idx = ctx->idx;
+	EMIT(PPC_RAW_MFLR(_R11));
+	EMIT(PPC_RAW_BCL());
+	EMIT(PPC_RAW_MFLR(_R12));
+	EMIT(PPC_RAW_LL(_R12, _R12, -8-SZL));
+	EMIT(PPC_RAW_MTCTR(_R12));
+	EMIT(PPC_RAW_MTLR(_R11));
+	EMIT(PPC_RAW_BCTR());
+
+	if (!bpf_jit_ool_stub) {
+		bpf_jit_ool_stub = (ctx->idx - ool_stub_idx) * 4;
+		bpf_jit_long_branch_stub = (ctx->idx - long_branch_stub_idx) * 4;
+	}
+}
+
 int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr)
 {
 	if (!exit_addr || is_offset_in_branch_range(exit_addr - (ctx->idx * 4))) {
@@ -222,7 +292,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 
 	fp->bpf_func = (void *)fimage;
 	fp->jited = 1;
-	fp->jited_len = proglen + FUNCTION_DESCR_SIZE;
+	fp->jited_len = cgctx.idx * 4 + FUNCTION_DESCR_SIZE;
 
 	if (!fp->is_func || extra_pass) {
 		if (bpf_jit_binary_pack_finalize(fp, fhdr, hdr)) {
@@ -369,3 +439,633 @@ bool bpf_jit_supports_far_kfunc_call(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
 }
+
+void *arch_alloc_bpf_trampoline(unsigned int size)
+{
+	return bpf_prog_pack_alloc(size, bpf_jit_fill_ill_insns);
+}
+
+void arch_free_bpf_trampoline(void *image, unsigned int size)
+{
+	bpf_prog_pack_free(image, size);
+}
+
+int arch_protect_bpf_trampoline(void *image, unsigned int size)
+{
+	return 0;
+}
+
+static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ctx, struct bpf_tramp_link *l,
+			   int regs_off, int retval_off, int run_ctx_off, bool save_ret)
+{
+	struct bpf_prog *p = l->link.prog;
+	ppc_inst_t branch_insn;
+	u32 jmp_idx;
+	int ret = 0;
+
+	/* Save cookie */
+	if (IS_ENABLED(CONFIG_PPC64)) {
+		PPC_LI64(_R3, l->cookie);
+		EMIT(PPC_RAW_STD(_R3, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie)));
+	} else {
+		PPC_LI32(_R3, l->cookie >> 32);
+		PPC_LI32(_R4, l->cookie);
+		EMIT(PPC_RAW_STW(_R3, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie)));
+		EMIT(PPC_RAW_STW(_R4, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie) + 4));
+	}
+
+	/* __bpf_prog_enter(p, &bpf_tramp_run_ctx) */
+	PPC_LI_ADDR(_R3, p);
+	EMIT(PPC_RAW_MR(_R25, _R3));
+	EMIT(PPC_RAW_ADDI(_R4, _R1, run_ctx_off));
+	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx, (unsigned long)bpf_trampoline_enter(p));
+	if (ret)
+		return ret;
+
+	/* Remember prog start time returned by __bpf_prog_enter */
+	EMIT(PPC_RAW_MR(_R26, _R3));
+
+	/*
+	 * if (__bpf_prog_enter(p) == 0)
+	 *	goto skip_exec_of_prog;
+	 *
+	 * Emit a nop to be later patched with conditional branch, once offset is known
+	 */
+	EMIT(PPC_RAW_CMPLI(_R3, 0));
+	jmp_idx = ctx->idx;
+	EMIT(PPC_RAW_NOP());
+
+	/* p->bpf_func(ctx) */
+	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
+	if (!p->jited)
+		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
+	if (!create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx], (unsigned long)p->bpf_func, BRANCH_SET_LINK)) {
+		if (image)
+			image[ctx->idx] = ppc_inst_val(branch_insn);
+		ctx->idx++;
+	} else {
+		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
+		EMIT(PPC_RAW_MTCTR(_R12));
+		EMIT(PPC_RAW_BCTRL());
+	}
+
+	if (save_ret)
+		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
+
+	/* Fix up branch */
+	if (image) {
+		if (create_cond_branch(&branch_insn, &image[jmp_idx],
+				       (unsigned long)&image[ctx->idx], COND_EQ << 16))
+			return -EINVAL;
+		image[jmp_idx] = ppc_inst_val(branch_insn);
+	}
+
+	/* __bpf_prog_exit(p, start_time, &bpf_tramp_run_ctx) */
+	EMIT(PPC_RAW_MR(_R3, _R25));
+	EMIT(PPC_RAW_MR(_R4, _R26));
+	EMIT(PPC_RAW_ADDI(_R5, _R1, run_ctx_off));
+	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx, (unsigned long)bpf_trampoline_exit(p));
+
+	return ret;
+}
+
+static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context *ctx, struct bpf_tramp_links *tl,
+			      int regs_off, int retval_off, int run_ctx_off, u32 *branches)
+{
+	int i;
+
+	/*
+	 * The first fmod_ret program will receive a garbage return value.
+	 * Set this to 0 to avoid confusing the program.
+	 */
+	EMIT(PPC_RAW_LI(_R3, 0));
+	EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
+	for (i = 0; i < tl->nr_links; i++) {
+		if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off, run_ctx_off, true))
+			return -EINVAL;
+
+		/*
+		 * mod_ret prog stored return value after prog ctx. Emit:
+		 * if (*(u64 *)(ret_val) !=  0)
+		 *	goto do_fexit;
+		 */
+		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
+		EMIT(PPC_RAW_CMPLI(_R3, 0));
+
+		/*
+		 * Save the location of the branch and generate a nop, which is
+		 * replaced with a conditional jump once do_fexit (i.e. the
+		 * start of the fexit invocation) is finalized.
+		 */
+		branches[i] = ctx->idx;
+		EMIT(PPC_RAW_NOP());
+	}
+
+	return 0;
+}
+
+static void bpf_trampoline_save_args(u32 *image, struct codegen_context *ctx, int nr_regs, int regs_off)
+{
+	for (int i = 0; i < nr_regs; i++)
+		EMIT(PPC_RAW_STL(_R3 + i, _R1, regs_off + i * SZL));
+}
+
+static void bpf_trampoline_restore_args(u32 *image, struct codegen_context *ctx, int nr_regs, int regs_off)
+{
+	for (int i = 0; i < nr_regs; i++)
+		EMIT(PPC_RAW_LL(_R3 + i, _R1, regs_off + i * SZL));
+}
+
+static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
+					 void *rw_image_end, void *ro_image,
+					 const struct btf_func_model *m, u32 flags,
+					 struct bpf_tramp_links *tlinks,
+					 void *func_addr)
+{
+	int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off;
+	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
+	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
+	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
+	int i, ret, nr_regs = m->nr_args, stack_size = 0;
+	struct codegen_context codegen_ctx, *ctx;
+	u32 *image = (u32 *)rw_image;
+	ppc_inst_t branch_insn;
+	u32 *branches = NULL;
+	bool save_ret;
+
+	/* TODO: 32-bit enablement */
+	if (IS_ENABLED(CONFIG_PPC32))
+		return -ENOTSUPP;
+
+	/* Extra registers for struct arguments */
+	for (i = 0; i < m->nr_args; i++)
+		if (m->arg_size[i] > sizeof(unsigned long))
+			nr_regs += round_up(m->arg_size[i], sizeof(unsigned long)) / sizeof(unsigned long) - 1;
+
+	/* TODO: We only support functions with in-register arguments - up to 8 per powerpc ABI */
+	if (nr_regs > 8)
+		return -ENOTSUPP;
+
+	ctx = &codegen_ctx;
+	memset(ctx, 0, sizeof(*ctx));
+
+	/*
+	 * Generated stack layout:
+	 *
+	 * func prev back chain         [ back chain        ]
+	 *                              [                   ] --
+	 * LR save area                 [ r0 save (64-bit)  ]   | header
+	 *                              [ r0 save (32-bit)  ]   |
+	 * dummy frame for unwind       [ back chain 1      ] --
+	 *                              [ padding           ] align stack frame
+	 *       alt_lr_off             [ real lr (pfe ool) ] optional - actual lr
+	 *                              [ r26?              ]
+	 *       nvr_off                [ r25?              ] nvr save area
+	 *       retval_off             [ return value      ]
+	 *                              [ reg argN          ]
+	 *                              [ ...               ]
+	 *       regs_off               [ reg_arg1          ] prog ctx context
+	 *       nregs_off              [ args count        ]
+	 *       ip_off                 [ traced function   ]
+	 *                              [ ...               ]
+	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
+	 *                              [ TOC save (64-bit) ] --
+	 *                              [ LR save (64-bit)  ]   | header
+	 *                              [ LR save (32-bit)  ]   |
+	 * bpf trampoline frame	        [ back chain 2      ] --
+	 *
+	 * TODO: tail call cnt?
+	 */
+
+	/* Minimum stack frame header */
+	stack_size = STACK_FRAME_MIN_SIZE;
+
+	/* Room for struct bpf_tramp_run_ctx */
+	run_ctx_off = stack_size;
+	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), SZL);
+
+	/* Room for IP address argument */
+	ip_off = stack_size;
+	if (flags & BPF_TRAMP_F_IP_ARG)
+		stack_size += SZL;
+
+	/* Room for args count */
+	nregs_off = stack_size;
+	stack_size += SZL;
+
+	/* Room for args */
+	regs_off = stack_size;
+	stack_size += nr_regs * SZL;
+
+	/* Room for return value of func_addr or fentry prog */
+	retval_off = stack_size;
+	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
+	if (save_ret)
+		stack_size += SZL;
+
+	/* Room for nvr save area */
+	nvr_off = stack_size;
+	stack_size += 2 * SZL;
+
+	/* Optional save area for actual LR in case of ool ftrace */
+	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE)) {
+		alt_lr_off = stack_size;
+		stack_size += SZL;
+	}
+
+	/* Padding to align stack frame, if any */
+	stack_size = round_up(stack_size, SZL * 2);
+
+
+	/* Create dummy frame for unwind, store original return value */
+	EMIT(PPC_RAW_STL(_R0, _R1, PPC_LR_STKOFF));
+	EMIT(PPC_RAW_STLU(_R1, _R1, -STACK_FRAME_MIN_SIZE));
+
+	/* Create our stack frame */
+	EMIT(PPC_RAW_STLU(_R1, _R1, -stack_size));
+
+	/* 64-bit: Save TOC and load kernel TOC */
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
+		EMIT(PPC_RAW_STD(_R2, _R1, 24));
+		PPC64_LOAD_PACA();
+	}
+
+	bpf_trampoline_save_args(image, ctx, nr_regs, regs_off);
+
+	/* Save our return address */
+	EMIT(PPC_RAW_MFLR(_R3));
+	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
+		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
+	else
+		EMIT(PPC_RAW_STL(_R3, _R1, stack_size + PPC_LR_STKOFF));
+
+	/*
+	 * Save ip address of the traced function.
+	 * We could recover this from LR, but we will need to address for OOL trampoline,
+	 * and optional GEP area.
+	 */
+	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE) || flags & BPF_TRAMP_F_IP_ARG) {
+		EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
+		EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
+		EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
+		EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
+		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
+	}
+
+	if (flags & BPF_TRAMP_F_IP_ARG)
+		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
+
+	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
+		/* Fake our LR for unwind */
+		EMIT(PPC_RAW_STL(_R3, _R1, stack_size + PPC_LR_STKOFF));
+
+	/* Save function arg count -- see bpf_get_func_arg_cnt() */
+	/* TODO: should this be nr_args? */
+	EMIT(PPC_RAW_LI(_R3, nr_regs));
+	EMIT(PPC_RAW_STL(_R3, _R1, nregs_off));
+
+	/* Save nv regs */
+	EMIT(PPC_RAW_STL(_R25, _R1, nvr_off));
+	EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
+
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		PPC_LI_ADDR(_R3, (unsigned long)im);
+		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx, (unsigned long)__bpf_tramp_enter);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < fentry->nr_links; i++)
+		if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off, run_ctx_off,
+				    flags & BPF_TRAMP_F_RET_FENTRY_RET))
+			return -EINVAL;
+
+	if (fmod_ret->nr_links) {
+		branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
+		if (!branches)
+			return -ENOMEM;
+
+		if (invoke_bpf_mod_ret(image, ro_image, ctx, fmod_ret, regs_off, retval_off, run_ctx_off, branches)) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+	}
+
+	/* Call the traced function */
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		/*
+		 * The address in LR save area points to the correct point in the original function
+		 * with both FTRACE_PFE_OUT_OF_LINE as well as with traditional ftrace instruction
+		 * sequence
+		 */
+		EMIT(PPC_RAW_LL(_R3, _R1, stack_size + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_MTCTR(_R3));
+
+		/* Restore args */
+		bpf_trampoline_restore_args(image, ctx, nr_regs, regs_off);
+
+		/* Restore TOC for 64-bit */
+		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+			EMIT(PPC_RAW_LD(_R2, _R1, 24));
+		EMIT(PPC_RAW_BCTRL());
+		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+			PPC64_LOAD_PACA();
+
+		/* Store return value for bpf prog to access */
+		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
+
+		/* Reserve space to patch branch instruction to skip fexit progs */
+		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
+		EMIT(PPC_RAW_NOP());
+	}
+
+	/* Update branches saved in invoke_bpf_mod_ret with address of do_fexit */
+	for (i = 0; i < fmod_ret->nr_links && image; i++) {
+		if (create_cond_branch(&branch_insn, &image[branches[i]],
+				       (unsigned long)&image[ctx->idx], COND_NE << 16)) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+		image[branches[i]] = ppc_inst_val(branch_insn);
+	}
+
+	for (i = 0; i < fexit->nr_links; i++)
+		if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off, run_ctx_off, false)) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
+		PPC_LI_ADDR(_R3, im);
+		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx, (unsigned long)__bpf_tramp_exit);
+		if (ret)
+			goto cleanup;
+	}
+
+	if (flags & BPF_TRAMP_F_RESTORE_REGS)
+		bpf_trampoline_restore_args(image, ctx, nr_regs, regs_off);
+
+	/* Restore return value of func_addr or fentry prog */
+	if (save_ret)
+		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
+
+	/* Restore nv regs */
+	EMIT(PPC_RAW_LL(_R26, _R1, nvr_off + SZL));
+	EMIT(PPC_RAW_LL(_R25, _R1, nvr_off));
+
+	/* Epilogue */
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		EMIT(PPC_RAW_LD(_R2, _R1, 24));
+	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
+		/* Skip the traced function and return to parent */
+		EMIT(PPC_RAW_ADDI(_R1, _R1, stack_size + STACK_FRAME_MIN_SIZE));
+		EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
+		EMIT(PPC_RAW_MTLR(_R0));
+		EMIT(PPC_RAW_BLR());
+	} else {
+		if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE)) {
+			EMIT(PPC_RAW_LL(_R0, _R1, alt_lr_off));
+			EMIT(PPC_RAW_MTLR(_R0));
+			EMIT(PPC_RAW_ADDI(_R1, _R1, stack_size + STACK_FRAME_MIN_SIZE));
+			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
+			EMIT(PPC_RAW_BLR());
+		} else {
+			EMIT(PPC_RAW_LL(_R0, _R1, stack_size + PPC_LR_STKOFF));
+			EMIT(PPC_RAW_MTCTR(_R0));
+			EMIT(PPC_RAW_ADDI(_R1, _R1, stack_size + STACK_FRAME_MIN_SIZE));
+			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
+			EMIT(PPC_RAW_MTLR(_R0));
+			EMIT(PPC_RAW_BCTR());
+		}
+	}
+
+	/* Make sure the trampoline generation logic doesn't overflow */
+	if (image && WARN_ON_ONCE(&image[ctx->idx] > (u32 *)rw_image_end - BPF_INSN_SAFETY)) {
+		ret = -EFAULT;
+		goto cleanup;
+	}
+	ret = ctx->idx * 4 + BPF_INSN_SAFETY * 4;
+
+cleanup:
+	kfree(branches);
+	return ret;
+}
+
+int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
+			     struct bpf_tramp_links *tlinks, void *func_addr)
+{
+	struct bpf_tramp_image im;
+	void *image;
+	int ret;
+
+	/*
+	 * Allocate a temporary buffer for __arch_prepare_bpf_trampoline().
+	 * This will NOT cause fragmentation in direct map, as we do not
+	 * call set_memory_*() on this buffer.
+	 *
+	 * We cannot use kvmalloc here, because we need image to be in
+	 * module memory range.
+	 */
+	image = bpf_jit_alloc_exec(PAGE_SIZE);
+	if (!image)
+		return -ENOMEM;
+
+	ret = __arch_prepare_bpf_trampoline(&im, image, image + PAGE_SIZE, image,
+					    m, flags, tlinks, func_addr);
+	bpf_jit_free_exec(image);
+
+	return ret;
+}
+
+int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
+				const struct btf_func_model *m, u32 flags,
+				struct bpf_tramp_links *tlinks,
+				void *func_addr)
+{
+	u32 size = image_end - image;
+	void *rw_image, *tmp;
+	int ret;
+
+	/*
+	 * rw_image doesn't need to be in module memory range, so we can
+	 * use kvmalloc.
+	 */
+	rw_image = kvmalloc(size, GFP_KERNEL);
+	if (!rw_image)
+		return -ENOMEM;
+
+	ret = __arch_prepare_bpf_trampoline(im, rw_image, rw_image + size, image, m,
+					    flags, tlinks, func_addr);
+	if (ret < 0)
+		goto out;
+
+	if (bpf_jit_enable > 1)
+		bpf_jit_dump(1, ret - BPF_INSN_SAFETY * 4, 1, rw_image);
+
+	tmp = bpf_arch_text_copy(image, rw_image, size);
+	if (IS_ERR(tmp))
+		ret = PTR_ERR(tmp);
+
+out:
+	kvfree(rw_image);
+	return ret;
+}
+
+static int bpf_modify_inst(void *ip, ppc_inst_t old_inst, ppc_inst_t new_inst)
+{
+	ppc_inst_t org_inst;
+
+	if (copy_inst_from_kernel_nofault(&org_inst, ip)) {
+		pr_err("0x%lx: fetching instruction failed\n", (unsigned long)ip);
+		return -EFAULT;
+	}
+
+	if (!ppc_inst_equal(org_inst, old_inst)) {
+		pr_err("0x%lx: expected (%08lx) != found (%08lx)\n",
+		       (unsigned long)ip, ppc_inst_as_ulong(old_inst), ppc_inst_as_ulong(org_inst));
+		return -EINVAL;
+	}
+
+	if (ppc_inst_equal(old_inst, new_inst))
+		return 0;
+
+	return patch_instruction(ip, new_inst);
+}
+
+/*
+ * A 3-step process for bpf prog entry:
+ * 1. At bpf prog entry, a single nop/b:
+ * bpf_func:
+ *	[nop|b]	ool_stub
+ * 2. Out-of-line stub:
+ * ool_stub:
+ *	mflr	r0
+ *	[b|bl]	<bpf_prog>/<long_branch_stub>
+ *	mtlr	r0 // CONFIG_FTRACE_PFE_OUT_OF_LINE only
+ *	b	bpf_func + 4
+ * 3. Long branch stub:
+ * long_branch_stub:
+ *	.long	<branch_addr>/<dummy_tramp>
+ *	mflr	r11
+ *	bcl	20,31,$+4
+ *	mflr	r12
+ *	ld	r12, -16(r12)
+ *	mtctr	r12
+ *	mtlr	r11 // needed to retain ftrace ABI
+ *	bctr
+ *
+ * dummy_tramp is used to reduce synchronization requirements. Old trampoline is only freed
+ * through bpf_tramp_image_put() which uses rcu_tasks, so we don't need to do the same here.
+ */
+int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
+		       void *old_addr, void *new_addr)
+{
+	unsigned long bpf_func, bpf_func_end, size, offset;
+	ppc_inst_t old_inst, new_inst;
+	int ret = 0, branch_flags;
+	char name[KSYM_NAME_LEN];
+
+	/* TODO: 32-bit enablement */
+	if (IS_ENABLED(CONFIG_PPC32))
+		return -ENOTSUPP;
+
+	bpf_func = (unsigned long)ip;
+	branch_flags = poke_type == BPF_MOD_CALL ? BRANCH_SET_LINK : 0;
+
+	/* We currently only support poking bpf programs */
+	if (!__bpf_address_lookup(bpf_func, &size, &offset, name)) {
+		pr_err("%s (0x%lx): kernel/modules are not supported\n", __func__, bpf_func);
+		return -ENOTSUPP;
+	}
+
+	/*
+	 * If we are not poking at bpf prog entry, then we are simply patching in/out
+	 * an unconditional branch instruction at im->ip_after_call
+	 */
+	if (offset) {
+		if (poke_type != BPF_MOD_JUMP) {
+			pr_err("%s (0x%lx): calls are not supported in bpf prog body\n", __func__,
+			       bpf_func);
+			return -ENOTSUPP;
+		}
+		old_inst = ppc_inst(PPC_RAW_NOP());
+		if (old_addr)
+			if (create_branch(&old_inst, ip, (unsigned long)old_addr, 0))
+				return -ERANGE;
+		new_inst = ppc_inst(PPC_RAW_NOP());
+		if (new_addr)
+			if (create_branch(&new_inst, ip, (unsigned long)new_addr, 0))
+				return -ERANGE;
+		mutex_lock(&text_mutex);
+		ret = bpf_modify_inst(ip, old_inst, new_inst);
+		mutex_unlock(&text_mutex);
+		return ret;
+	}
+
+	bpf_func_end = bpf_func + size;
+
+	/* Address of the jmp/call instruction in the out-of-line stub */
+	ip = (void *)(bpf_func_end - bpf_jit_ool_stub + 4);
+
+	if (!is_offset_in_branch_range((long)ip - 4 - bpf_func)) {
+		pr_err("%s (0x%lx): bpf prog too large, ool stub out of branch range\n", __func__,
+		       bpf_func);
+		return -ERANGE;
+	}
+
+	old_inst = ppc_inst(PPC_RAW_NOP());
+	if (old_addr) {
+		if (is_offset_in_branch_range(ip - old_addr))
+			create_branch(&old_inst, ip, (unsigned long)old_addr, branch_flags);
+		else
+			create_branch(&old_inst, ip, bpf_func_end - bpf_jit_long_branch_stub,
+				      branch_flags);
+	}
+	new_inst = ppc_inst(PPC_RAW_NOP());
+	if (new_addr) {
+		if (is_offset_in_branch_range(ip - new_addr))
+			create_branch(&new_inst, ip, (unsigned long)new_addr, branch_flags);
+		else
+			create_branch(&new_inst, ip, bpf_func_end - bpf_jit_long_branch_stub,
+				      branch_flags);
+	}
+
+	mutex_lock(&text_mutex);
+
+	/*
+	 * 1. Update the address in the long branch stub:
+	 * If new_addr is out of range, we will have to use the long branch stub, so patch new_addr
+	 * here. Otherwise, revert to dummy_tramp, but only if we had patched old_addr here.
+	 */
+	if ((new_addr && !is_offset_in_branch_range(new_addr - ip)) ||
+	    (old_addr && !is_offset_in_branch_range(old_addr - ip)))
+		ret = patch_ulong((void *)(bpf_func_end - bpf_jit_long_branch_stub - SZL),
+				  (new_addr && !is_offset_in_branch_range(new_addr - ip)) ?
+				  (unsigned long)new_addr : (unsigned long)dummy_tramp);
+	if (ret)
+		goto out;
+
+	/* 2. Update the branch/call in the out-of-line stub */
+	ret = bpf_modify_inst(ip, old_inst, new_inst);
+	if (ret)
+		goto out;
+
+	/* 3. Update instruction at bpf prog entry */
+	ip = (void *)bpf_func;
+	if (!old_addr || !new_addr) {
+		if (!old_addr) {
+			old_inst = ppc_inst(PPC_RAW_NOP());
+			create_branch(&new_inst, ip, bpf_func_end - bpf_jit_ool_stub, 0);
+		} else {
+			new_inst = ppc_inst(PPC_RAW_NOP());
+			create_branch(&old_inst, ip, bpf_func_end - bpf_jit_ool_stub, 0);
+		}
+		ret = bpf_modify_inst(ip, old_inst, new_inst);
+	}
+
+out:
+	mutex_unlock(&text_mutex);
+	return ret;
+}
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index a0c4f1bde83e..c4db278dae36 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -127,13 +127,16 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
+	/* Instruction for trampoline attach */
+	EMIT(PPC_RAW_NOP());
+
 	/* Initialize tail_call_cnt, to be skipped if we do tail calls. */
 	if (ctx->seen & SEEN_TAILCALL)
 		EMIT(PPC_RAW_LI(_R4, 0));
 	else
 		EMIT(PPC_RAW_NOP());
 
-#define BPF_TAILCALL_PROLOGUE_SIZE	4
+#define BPF_TAILCALL_PROLOGUE_SIZE	8
 
 	if (bpf_has_stack_frame(ctx))
 		EMIT(PPC_RAW_STWU(_R1, _R1, -BPF_PPC_STACKFRAME(ctx)));
@@ -198,6 +201,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	EMIT(PPC_RAW_BLR());
+
+	bpf_jit_build_fentry_stubs(image, ctx);
 }
 
 /* Relative offset needs to be calculated based on final image location */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 288ff32d676f..b58d1be63ea4 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,6 +126,9 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
+	/* Instruction for trampoline attach */
+	EMIT(PPC_RAW_NOP());
+
 #ifndef CONFIG_PPC_KERNEL_PCREL
 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
@@ -200,6 +203,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_0)));
 
 	EMIT(PPC_RAW_BLR());
+
+	bpf_jit_build_fentry_stubs(image, ctx);
 }
 
 int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
@@ -303,7 +308,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 */
 	int b2p_bpf_array = bpf_to_ppc(BPF_REG_2);
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
-	int bpf_tailcall_prologue_size = 8;
+	int bpf_tailcall_prologue_size = 12;
 
 	if (!IS_ENABLED(CONFIG_PPC_KERNEL_PCREL) && IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
 		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
-- 
2.45.2

