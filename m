Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D5163EAC1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 09:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN7pQ6S1Fz3fdT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 19:02:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN7j30lbtz3cFv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:57:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NN7hN1YMnz9sZm;
	Thu,  1 Dec 2022 08:57:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qodRSHBAPw_y; Thu,  1 Dec 2022 08:57:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NN7hD4RGyz9sb1;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 837DB8B788;
	Thu,  1 Dec 2022 08:57:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oDVJLje2fhiV; Thu,  1 Dec 2022 08:57:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D81E28B78B;
	Thu,  1 Dec 2022 08:56:59 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2B17uuOg130820
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Dec 2022 08:56:56 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2B17uuEr130819;
	Thu, 1 Dec 2022 08:56:56 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v1 04/10] powerpc/bpf/32: Only set a stack frame when necessary
Date: Thu,  1 Dec 2022 08:56:29 +0100
Message-Id: <01949e27523916850fe17e87e774c08b9ffea4fe.1669881248.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
References: <fa025537f584599c0271fc129c5cf4f57fbe7505.1669881248.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669881390; l=2645; s=20211009; h=from:subject:message-id; bh=Th6pI9aT8WZokbYGGkcX3VXZ2tYVta6n6C2EO5biRt0=; b=FrTWCdvOwq1ZVy8tre7lNePq9iNu8Qn888IQ1HZ47f2BHpdWUijFnHo6zptT4cnDp3kRswEakAg3 qd8Ui6ZLAg8OLOT4WG6zbJrYOVSAGdcDTbCGqHWYeh3hZWcTOCfp
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Until now a stack frame was set at all time due to the need
to keep tail call counter in the stack.

But since commit fa025537f584 ("powerpc/bpf/32: Fix Oops on tail call
tests"), the tail call counter is passed via register r4. It is
therefore not necessary anymore to have a stack frame for that.

Just like PPC64, implement bpf_has_stack_frame() and only sets the frame
when needed.

The difference with PPC64 is that PPC32 doesn't have a redzone, so
the stack is required as soon as non volatile registers are used or
when tail call count is set up.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp32.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 4e6caee9c98a..7f54d37bede6 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -79,6 +79,20 @@ static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 #define SEEN_NVREG_FULL_MASK	0x0003ffff /* Non volatile registers r14-r31 */
 #define SEEN_NVREG_TEMP_MASK	0x00001e01 /* BPF_REG_5, BPF_REG_AX, TMP_REG */
 
+static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
+{
+	/*
+	 * We only need a stack frame if:
+	 * - we call other functions (kernel helpers), or
+	 * - we use non volatile registers, or
+	 * - we use tail call counter
+	 * - the bpf program uses its stack area
+	 * The latter condition is deduced from the usage of BPF_REG_FP
+	 */
+	return ctx->seen & (SEEN_FUNC | SEEN_TAILCALL | SEEN_NVREG_FULL_MASK) ||
+	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
+}
+
 void bpf_jit_realloc_regs(struct codegen_context *ctx)
 {
 	unsigned int nvreg_mask;
@@ -121,7 +135,8 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 
 #define BPF_TAILCALL_PROLOGUE_SIZE	4
 
-	EMIT(PPC_RAW_STWU(_R1, _R1, -BPF_PPC_STACKFRAME(ctx)));
+	if (bpf_has_stack_frame(ctx))
+		EMIT(PPC_RAW_STWU(_R1, _R1, -BPF_PPC_STACKFRAME(ctx)));
 
 	if (ctx->seen & SEEN_TAILCALL)
 		EMIT(PPC_RAW_STW(_R4, _R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
@@ -174,7 +189,8 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 		EMIT(PPC_RAW_LWZ(_R0, _R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
 
 	/* Tear down our stack frame */
-	EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME(ctx)));
+	if (bpf_has_stack_frame(ctx))
+		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME(ctx)));
 
 	if (ctx->seen & SEEN_FUNC)
 		EMIT(PPC_RAW_MTLR(_R0));
-- 
2.38.1

