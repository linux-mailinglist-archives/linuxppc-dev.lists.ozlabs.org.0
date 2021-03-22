Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6AA344BAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 17:38:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F40YF60KNz30BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F40Xw3T2Pz301N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:37:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F40Xk3KZLz9txkP;
 Mon, 22 Mar 2021 17:37:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kXWr-QFZSY8s; Mon, 22 Mar 2021 17:37:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F40Xk2Rr1z9txkL;
 Mon, 22 Mar 2021 17:37:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAE848B79C;
 Mon, 22 Mar 2021 17:37:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mTjpfe10-yXY; Mon, 22 Mar 2021 17:37:47 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F33C8B7A4;
 Mon, 22 Mar 2021 17:37:47 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 83678675FC; Mon, 22 Mar 2021 16:37:47 +0000 (UTC)
Message-Id: <0cd2506f598e7095ea43e62dca1f472de5474a0d.1616430991.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616430991.git.christophe.leroy@csgroup.eu>
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/8] powerpc/bpf: Change register numbering for
 bpf_set/is_seen_register()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@chromium.org, naveen.n.rao@linux.ibm.com, sandipan@linux.ibm.com
Date: Mon, 22 Mar 2021 16:37:47 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of using BPF register number as input in functions
bpf_set_seen_register() and bpf_is_seen_register(), use
CPU register number directly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp64.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index aaf1a887f653..51b3f440288c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -31,12 +31,12 @@ static inline void bpf_flush_icache(void *start, void *end)
 
 static inline bool bpf_is_seen_register(struct codegen_context *ctx, int i)
 {
-	return (ctx->seen & (1 << (31 - b2p[i])));
+	return ctx->seen & (1 << (31 - i));
 }
 
 static inline void bpf_set_seen_register(struct codegen_context *ctx, int i)
 {
-	ctx->seen |= (1 << (31 - b2p[i]));
+	ctx->seen |= 1 << (31 - i);
 }
 
 static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
@@ -47,7 +47,7 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, BPF_REG_FP);
+	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, b2p[BPF_REG_FP]);
 }
 
 /*
@@ -124,11 +124,11 @@ static void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * in the protected zone below the previous stack frame
 	 */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, i))
+		if (bpf_is_seen_register(ctx, b2p[i]))
 			PPC_BPF_STL(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i]));
 
 	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, BPF_REG_FP))
+	if (bpf_is_seen_register(ctx, b2p[BPF_REG_FP]))
 		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], 1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
@@ -139,7 +139,7 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, i))
+		if (bpf_is_seen_register(ctx, b2p[i]))
 			PPC_BPF_LL(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i]));
 
 	/* Tear down our stack frame */
@@ -330,9 +330,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		 * any issues.
 		 */
 		if (dst_reg >= BPF_PPC_NVR_MIN && dst_reg < 32)
-			bpf_set_seen_register(ctx, insn[i].dst_reg);
+			bpf_set_seen_register(ctx, dst_reg);
 		if (src_reg >= BPF_PPC_NVR_MIN && src_reg < 32)
-			bpf_set_seen_register(ctx, insn[i].src_reg);
+			bpf_set_seen_register(ctx, src_reg);
 
 		switch (code) {
 		/*
-- 
2.25.0

