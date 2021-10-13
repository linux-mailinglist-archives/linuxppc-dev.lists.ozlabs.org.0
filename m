Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B242B171
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 02:57:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTYzY6nnVz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:57:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJAmGoWv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HJAmGoWv; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTYws1j3wz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 11:55:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A7C360FDA;
 Wed, 13 Oct 2021 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086523;
 bh=NybbkMHmLslVYZonyQ/Hqo1Od3uUBAN4ZODuEQZ39jQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJAmGoWvgb+usewO7kYzLWlfwEG0WNIm19DG7gFibv4CEBtflS/qXiuSVWBYDpz9q
 FmQVBQjhOKWF6Gw4nsN/IlP2xznn+IuSVDoDs+bLRGw1kKUiZQ2sWWRZxLP6XbAcPX
 LTbYvh8voZTsBcSAUxx+Gx8a1WSWst6bxfADX3JdwR0463APvy6YBrbr9XG1yIU8qQ
 rNW7BrvRH0czAtT5jZB+IqCAKL18zIETp78RZi2haz5ECqLOxEBYD2LvF468XJwh6d
 N2Vs6Iek+BrRrNuj6Zd/cEOOeaGGVTslAWLXPRCVcq33zn/Zb8mhqxRngaT0QBnMpG
 +2j8GPpsH2WQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 16/17] powerpc/bpf: Emit stf barrier instruction
 sequences for BPF_NOSPEC
Date: Tue, 12 Oct 2021 20:54:40 -0400
Message-Id: <20211013005441.699846-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013005441.699846-1-sashal@kernel.org>
References: <20211013005441.699846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, daniel@iogearbox.net, ast@kernel.org,
 andrii@kernel.org, netdev@vger.kernel.org, naveen.n.rao@linux.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

[ Upstream commit b7540d62509453263604a155bf2d5f0ed450cba2 ]

Emit similar instruction sequences to commit a048a07d7f4535
("powerpc/64s: Add support for a store forwarding barrier at kernel
entry/exit") when encountering BPF_NOSPEC.

Mitigations are enabled depending on what the firmware advertises. In
particular, we do not gate these mitigations based on current settings,
just like in x86. Due to this, we don't need to take any action if
mitigations are enabled or disabled at runtime.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/956570cbc191cd41f8274bed48ee757a86dac62a.1633464148.git.naveen.n.rao@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/net/bpf_jit64.h      |  8 ++---
 arch/powerpc/net/bpf_jit_comp64.c | 55 ++++++++++++++++++++++++++++---
 2 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index 7b713edfa7e2..b63b35e45e55 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -16,18 +16,18 @@
  * with our redzone usage.
  *
  *		[	prev sp		] <-------------
- *		[   nv gpr save area	] 6*8		|
+ *		[   nv gpr save area	] 5*8		|
  *		[    tail_call_cnt	] 8		|
- *		[    local_tmp_var	] 8		|
+ *		[    local_tmp_var	] 16		|
  * fp (r31) -->	[   ebpf stack space	] upto 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  */
 
 /* for gpr non volatile registers BPG_REG_6 to 10 */
-#define BPF_PPC_STACK_SAVE	(6*8)
+#define BPF_PPC_STACK_SAVE	(5*8)
 /* for bpf JIT code internal usage */
-#define BPF_PPC_STACK_LOCALS	16
+#define BPF_PPC_STACK_LOCALS	24
 /* stack frame excluding BPF stack, ensure this is quadword aligned */
 #define BPF_PPC_STACKFRAME	(STACK_FRAME_MIN_SIZE + \
 				 BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE)
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index f06c62089b14..1a567c46730a 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -15,6 +15,7 @@
 #include <linux/if_vlan.h>
 #include <asm/kprobes.h>
 #include <linux/bpf.h>
+#include <asm/security_features.h>
 
 #include "bpf_jit64.h"
 
@@ -35,9 +36,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
  *		[	prev sp		] <-------------
  *		[	  ...       	] 		|
  * sp (r1) --->	[    stack pointer	] --------------
- *		[   nv gpr save area	] 6*8
+ *		[   nv gpr save area	] 5*8
  *		[    tail_call_cnt	] 8
- *		[    local_tmp_var	] 8
+ *		[    local_tmp_var	] 16
  *		[   unused red zone	] 208 bytes protected
  */
 static int bpf_jit_stack_local(struct codegen_context *ctx)
@@ -45,12 +46,12 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
 	if (bpf_has_stack_frame(ctx))
 		return STACK_FRAME_MIN_SIZE + ctx->stack_size;
 	else
-		return -(BPF_PPC_STACK_SAVE + 16);
+		return -(BPF_PPC_STACK_SAVE + 24);
 }
 
 static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
 {
-	return bpf_jit_stack_local(ctx) + 8;
+	return bpf_jit_stack_local(ctx) + 16;
 }
 
 static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
@@ -272,10 +273,33 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	return 0;
 }
 
+/*
+ * We spill into the redzone always, even if the bpf program has its own stackframe.
+ * Offsets hardcoded based on BPF_PPC_STACK_SAVE -- see bpf_jit_stack_local()
+ */
+void bpf_stf_barrier(void);
+
+asm (
+"		.global bpf_stf_barrier		;"
+"	bpf_stf_barrier:			;"
+"		std	21,-64(1)		;"
+"		std	22,-56(1)		;"
+"		sync				;"
+"		ld	21,-64(1)		;"
+"		ld	22,-56(1)		;"
+"		ori	31,31,0			;"
+"		.rept 14			;"
+"		b	1f			;"
+"	1:					;"
+"		.endr				;"
+"		blr				;"
+);
+
 /* Assemble the body code between the prologue & epilogue */
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
 		       u32 *addrs, bool extra_pass)
 {
+	enum stf_barrier_type stf_barrier = stf_barrier_type_get();
 	const struct bpf_insn *insn = fp->insnsi;
 	int flen = fp->len;
 	int i, ret;
@@ -633,6 +657,29 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * BPF_ST NOSPEC (speculation barrier)
 		 */
 		case BPF_ST | BPF_NOSPEC:
+			if (!security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) ||
+					!security_ftr_enabled(SEC_FTR_STF_BARRIER))
+				break;
+
+			switch (stf_barrier) {
+			case STF_BARRIER_EIEIO:
+				EMIT(PPC_RAW_EIEIO() | 0x02000000);
+				break;
+			case STF_BARRIER_SYNC_ORI:
+				EMIT(PPC_RAW_SYNC());
+				EMIT(PPC_RAW_LD(b2p[TMP_REG_1], _R13, 0));
+				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
+				break;
+			case STF_BARRIER_FALLBACK:
+				EMIT(PPC_RAW_MFLR(b2p[TMP_REG_1]));
+				PPC_LI64(12, dereference_kernel_function_descriptor(bpf_stf_barrier));
+				EMIT(PPC_RAW_MTCTR(12));
+				EMIT(PPC_RAW_BCTRL());
+				EMIT(PPC_RAW_MTLR(b2p[TMP_REG_1]));
+				break;
+			case STF_BARRIER_NONE:
+				break;
+			}
 			break;
 
 		/*
-- 
2.33.0

