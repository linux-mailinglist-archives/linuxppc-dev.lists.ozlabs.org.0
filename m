Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC00686360
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6HdB6KDgz3fT0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6HbS6yBLz3f3B
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 21:05:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P6HbJ714zz9sgw;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPigNB4XDnrD; Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P6HbJ5k4vz9sgT;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AF9228B781;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uptZuZdrL9Dx; Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 45B678B77E;
	Wed,  1 Feb 2023 11:05:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 311A4qaH3908574
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 11:04:52 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 311A4p843908571;
	Wed, 1 Feb 2023 11:04:51 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v2 3/9] powerpc/bpf/32: Only set a stack frame when necessary
Date: Wed,  1 Feb 2023 11:04:25 +0100
Message-Id: <62d7b654a3cfe73d998697cb29bbc5ffd89bfdb1.1675245773.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
References: <4fd69ef7945518c3e27f96b95046a5c1468d35bf.1675245773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675245868; l=2645; s=20211009; h=from:subject:message-id; bh=qHcZ9FGfqBG0re943EgcCn633R4vXJj9AdzNzdKvRmY=; b=waf4d3d8pjTxKhrWc2MzLXSzMxuB3d+K0pFiBLocmR3YPFJLzyBc742CxVqkM+dzHiAGOzo9p6xN I6/+/CZ7CMNBjpOldGDNfGjbb1+OcqyIuQistADinJ7xhYvhcvOu
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
2.39.1

