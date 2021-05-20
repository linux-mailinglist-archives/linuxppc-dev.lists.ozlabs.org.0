Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196538A675
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5VY338Fz3dQ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Rr53qfz3bxs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RL0s92z9sVl;
 Thu, 20 May 2021 12:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTHxualYRF_R; Thu, 20 May 2021 12:23:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RK056Tz9sW7;
 Thu, 20 May 2021 12:23:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8E4B8B811;
 Thu, 20 May 2021 12:23:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id INr_Me_ffbfb; Thu, 20 May 2021 12:23:08 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 98CA98B80D;
 Thu, 20 May 2021 12:23:08 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6E6C564C44; Thu, 20 May 2021 10:23:08 +0000 (UTC)
Message-Id: <eb7ec6297b5d16f141c5866da3975b418e47431b.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 09/12] powerpc/ebpf32: Use _Rx macros instead of __REG_Rx
 ones
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:08 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To increase readability, use _Rx macros instead of __REG_Rx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/net/bpf_jit_comp32.c | 218 +++++++++++++++---------------
 1 file changed, 109 insertions(+), 109 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index bbb16099e8c7..92e17fbaaabb 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -108,20 +108,20 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	int i;
 
 	/* First arg comes in as a 32 bits pointer. */
-	EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_1), __REG_R3));
+	EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_1), _R3));
 	EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, BPF_REG_1) - 1, 0));
-	EMIT(PPC_RAW_STWU(__REG_R1, __REG_R1, -BPF_PPC_STACKFRAME(ctx)));
+	EMIT(PPC_RAW_STWU(_R1, _R1, -BPF_PPC_STACKFRAME(ctx)));
 
 	/*
 	 * Initialize tail_call_cnt in stack frame if we do tail calls.
 	 * Otherwise, put in NOPs so that it can be skipped when we are
 	 * invoked through a tail call.
 	 */
-	if (ctx->seen & SEEN_TAILCALL) {
-		EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_1) - 1, __REG_R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
-	} else {
+	if (ctx->seen & SEEN_TAILCALL)
+		EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_1) - 1, _R1,
+				 bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
+	else
 		EMIT(PPC_RAW_NOP());
-	}
 
 #define BPF_TAILCALL_PROLOGUE_SIZE	16
 
@@ -130,30 +130,30 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * save/restore LR unless we call other functions
 	 */
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_MFLR(__REG_R0));
+		EMIT(PPC_RAW_MFLR(_R0));
 
 	/*
 	 * Back up non-volatile regs -- registers r18-r31
 	 */
 	for (i = BPF_PPC_NVR_MIN; i <= 31; i++)
 		if (bpf_is_seen_register(ctx, i))
-			EMIT(PPC_RAW_STW(i, __REG_R1, bpf_jit_stack_offsetof(ctx, i)));
+			EMIT(PPC_RAW_STW(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 
 	/* If needed retrieve arguments 9 and 10, ie 5th 64 bits arg.*/
 	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_5))) {
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5) - 1, __REG_R1, BPF_PPC_STACKFRAME(ctx)) + 8);
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5), __REG_R1, BPF_PPC_STACKFRAME(ctx)) + 12);
+		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5) - 1, _R1, BPF_PPC_STACKFRAME(ctx)) + 8);
+		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5), _R1, BPF_PPC_STACKFRAME(ctx)) + 12);
 	}
 
 	/* Setup frame pointer to point to the bpf stack area */
 	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_FP))) {
 		EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, BPF_REG_FP) - 1, 0));
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, BPF_REG_FP), __REG_R1,
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, BPF_REG_FP), _R1,
 				  STACK_FRAME_MIN_SIZE + ctx->stack_size));
 	}
 
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_STW(__REG_R0, __REG_R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_STW(_R0, _R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
 }
 
 static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
@@ -163,24 +163,24 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 	/* Restore NVRs */
 	for (i = BPF_PPC_NVR_MIN; i <= 31; i++)
 		if (bpf_is_seen_register(ctx, i))
-			EMIT(PPC_RAW_LWZ(i, __REG_R1, bpf_jit_stack_offsetof(ctx, i)));
+			EMIT(PPC_RAW_LWZ(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 }
 
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 {
-	EMIT(PPC_RAW_MR(__REG_R3, bpf_to_ppc(ctx, BPF_REG_0)));
+	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(ctx, BPF_REG_0)));
 
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	/* Tear down our stack frame */
 
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_LWZ(__REG_R0, __REG_R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_LWZ(_R0, _R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
 
-	EMIT(PPC_RAW_ADDI(__REG_R1, __REG_R1, BPF_PPC_STACKFRAME(ctx)));
+	EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME(ctx)));
 
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_MTLR(__REG_R0));
+		EMIT(PPC_RAW_MTLR(_R0));
 
 	EMIT(PPC_RAW_BLR());
 }
@@ -193,9 +193,9 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
 		PPC_BL_ABS(func);
 	} else {
 		/* Load function address into r0 */
-		EMIT(PPC_RAW_LIS(__REG_R0, IMM_H(func)));
-		EMIT(PPC_RAW_ORI(__REG_R0, __REG_R0, IMM_L(func)));
-		EMIT(PPC_RAW_MTLR(__REG_R0));
+		EMIT(PPC_RAW_LIS(_R0, IMM_H(func)));
+		EMIT(PPC_RAW_ORI(_R0, _R0, IMM_L(func)));
+		EMIT(PPC_RAW_MTLR(_R0));
 		EMIT(PPC_RAW_BLRL());
 	}
 }
@@ -215,47 +215,47 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 * if (index >= array->map.max_entries)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LWZ(__REG_R0, b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
-	EMIT(PPC_RAW_CMPLW(b2p_index, __REG_R0));
-	EMIT(PPC_RAW_LWZ(__REG_R0, __REG_R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
+	EMIT(PPC_RAW_LWZ(_R0, b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
+	EMIT(PPC_RAW_CMPLW(b2p_index, _R0));
+	EMIT(PPC_RAW_LWZ(_R0, _R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
 	PPC_BCC(COND_GE, out);
 
 	/*
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_CMPLWI(__REG_R0, MAX_TAIL_CALL_CNT));
+	EMIT(PPC_RAW_CMPLWI(_R0, MAX_TAIL_CALL_CNT));
 	/* tail_call_cnt++; */
-	EMIT(PPC_RAW_ADDIC(__REG_R0, __REG_R0, 1));
+	EMIT(PPC_RAW_ADDIC(_R0, _R0, 1));
 	PPC_BCC(COND_GT, out);
 
 	/* prog = array->ptrs[index]; */
-	EMIT(PPC_RAW_RLWINM(__REG_R3, b2p_index, 2, 0, 29));
-	EMIT(PPC_RAW_ADD(__REG_R3, __REG_R3, b2p_bpf_array));
-	EMIT(PPC_RAW_LWZ(__REG_R3, __REG_R3, offsetof(struct bpf_array, ptrs)));
-	EMIT(PPC_RAW_STW(__REG_R0, __REG_R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
+	EMIT(PPC_RAW_RLWINM(_R3, b2p_index, 2, 0, 29));
+	EMIT(PPC_RAW_ADD(_R3, _R3, b2p_bpf_array));
+	EMIT(PPC_RAW_LWZ(_R3, _R3, offsetof(struct bpf_array, ptrs)));
+	EMIT(PPC_RAW_STW(_R0, _R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
 
 	/*
 	 * if (prog == NULL)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_CMPLWI(__REG_R3, 0));
+	EMIT(PPC_RAW_CMPLWI(_R3, 0));
 	PPC_BCC(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
-	EMIT(PPC_RAW_LWZ(__REG_R3, __REG_R3, offsetof(struct bpf_prog, bpf_func)));
+	EMIT(PPC_RAW_LWZ(_R3, _R3, offsetof(struct bpf_prog, bpf_func)));
 
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_LWZ(__REG_R0, __REG_R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
+		EMIT(PPC_RAW_LWZ(_R0, _R1, BPF_PPC_STACKFRAME(ctx) + PPC_LR_STKOFF));
 
-	EMIT(PPC_RAW_ADDIC(__REG_R3, __REG_R3, BPF_TAILCALL_PROLOGUE_SIZE));
+	EMIT(PPC_RAW_ADDIC(_R3, _R3, BPF_TAILCALL_PROLOGUE_SIZE));
 
 	if (ctx->seen & SEEN_FUNC)
-		EMIT(PPC_RAW_MTLR(__REG_R0));
+		EMIT(PPC_RAW_MTLR(_R0));
 
-	EMIT(PPC_RAW_MTCTR(__REG_R3));
+	EMIT(PPC_RAW_MTCTR(_R3));
 
-	EMIT(PPC_RAW_MR(__REG_R3, bpf_to_ppc(ctx, BPF_REG_1)));
+	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(ctx, BPF_REG_1)));
 
 	/* tear restore NVRs, ... */
 	bpf_jit_emit_common_epilogue(image, ctx);
@@ -352,8 +352,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (imm >= -32768 && imm < 32768) {
 				EMIT(PPC_RAW_ADDIC(dst_reg, dst_reg, imm));
 			} else {
-				PPC_LI32(__REG_R0, imm);
-				EMIT(PPC_RAW_ADDC(dst_reg, dst_reg, __REG_R0));
+				PPC_LI32(_R0, imm);
+				EMIT(PPC_RAW_ADDC(dst_reg, dst_reg, _R0));
 			}
 			if (imm >= 0)
 				EMIT(PPC_RAW_ADDZE(dst_reg_h, dst_reg_h));
@@ -362,11 +362,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			break;
 		case BPF_ALU64 | BPF_MUL | BPF_X: /* dst *= src */
 			bpf_set_seen_register(ctx, tmp_reg);
-			EMIT(PPC_RAW_MULW(__REG_R0, dst_reg, src_reg_h));
+			EMIT(PPC_RAW_MULW(_R0, dst_reg, src_reg_h));
 			EMIT(PPC_RAW_MULW(dst_reg_h, dst_reg_h, src_reg));
 			EMIT(PPC_RAW_MULHWU(tmp_reg, dst_reg, src_reg));
 			EMIT(PPC_RAW_MULW(dst_reg, dst_reg, src_reg));
-			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, _R0));
 			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, tmp_reg));
 			break;
 		case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
@@ -376,8 +376,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (imm >= -32768 && imm < 32768) {
 				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, imm));
 			} else {
-				PPC_LI32(__REG_R0, imm);
-				EMIT(PPC_RAW_MULW(dst_reg, dst_reg, __REG_R0));
+				PPC_LI32(_R0, imm);
+				EMIT(PPC_RAW_MULW(dst_reg, dst_reg, _R0));
 			}
 			break;
 		case BPF_ALU64 | BPF_MUL | BPF_K: /* dst *= imm */
@@ -398,17 +398,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_MULW(dst_reg_h, dst_reg_h, tmp_reg));
 			if (imm < 0)
 				EMIT(PPC_RAW_SUB(dst_reg_h, dst_reg_h, dst_reg));
-			EMIT(PPC_RAW_MULHWU(__REG_R0, dst_reg, tmp_reg));
+			EMIT(PPC_RAW_MULHWU(_R0, dst_reg, tmp_reg));
 			EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp_reg));
-			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, _R0));
 			break;
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
 			EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
-			EMIT(PPC_RAW_DIVWU(__REG_R0, dst_reg, src_reg));
-			EMIT(PPC_RAW_MULW(__REG_R0, src_reg, __REG_R0));
-			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, __REG_R0));
+			EMIT(PPC_RAW_DIVWU(_R0, dst_reg, src_reg));
+			EMIT(PPC_RAW_MULW(_R0, src_reg, _R0));
+			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, _R0));
 			break;
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 			return -EOPNOTSUPP;
@@ -420,8 +420,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (imm == 1)
 				break;
 
-			PPC_LI32(__REG_R0, imm);
-			EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, __REG_R0));
+			PPC_LI32(_R0, imm);
+			EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, _R0));
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
 			if (!imm)
@@ -430,9 +430,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (!is_power_of_2((u32)imm)) {
 				bpf_set_seen_register(ctx, tmp_reg);
 				PPC_LI32(tmp_reg, imm);
-				EMIT(PPC_RAW_DIVWU(__REG_R0, dst_reg, tmp_reg));
-				EMIT(PPC_RAW_MULW(__REG_R0, tmp_reg, __REG_R0));
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, __REG_R0));
+				EMIT(PPC_RAW_DIVWU(_R0, dst_reg, tmp_reg));
+				EMIT(PPC_RAW_MULW(_R0, tmp_reg, _R0));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, _R0));
 				break;
 			}
 			if (imm == 1)
@@ -503,8 +503,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0,
 						    32 - fls(imm), 32 - ffs(imm)));
 			} else {
-				PPC_LI32(__REG_R0, imm);
-				EMIT(PPC_RAW_AND(dst_reg, dst_reg, __REG_R0));
+				PPC_LI32(_R0, imm);
+				EMIT(PPC_RAW_AND(dst_reg, dst_reg, _R0));
 			}
 			break;
 		case BPF_ALU64 | BPF_OR | BPF_X: /* dst = dst | src */
@@ -555,12 +555,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			break;
 		case BPF_ALU64 | BPF_LSH | BPF_X: /* dst <<= src; */
 			bpf_set_seen_register(ctx, tmp_reg);
-			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
+			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
 			EMIT(PPC_RAW_SLW(dst_reg_h, dst_reg_h, src_reg));
 			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
-			EMIT(PPC_RAW_SRW(__REG_R0, dst_reg, __REG_R0));
+			EMIT(PPC_RAW_SRW(_R0, dst_reg, _R0));
 			EMIT(PPC_RAW_SLW(tmp_reg, dst_reg, tmp_reg));
-			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, _R0));
 			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
 			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, tmp_reg));
 			break;
@@ -591,12 +591,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			break;
 		case BPF_ALU64 | BPF_RSH | BPF_X: /* dst >>= src */
 			bpf_set_seen_register(ctx, tmp_reg);
-			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
+			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
 			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
 			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
-			EMIT(PPC_RAW_SLW(__REG_R0, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_SLW(_R0, dst_reg_h, _R0));
 			EMIT(PPC_RAW_SRW(tmp_reg, dst_reg_h, tmp_reg));
-			EMIT(PPC_RAW_OR(dst_reg, dst_reg, __REG_R0));
+			EMIT(PPC_RAW_OR(dst_reg, dst_reg, _R0));
 			EMIT(PPC_RAW_SRW(dst_reg_h, dst_reg_h, src_reg));
 			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
 			break;
@@ -627,15 +627,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			break;
 		case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
 			bpf_set_seen_register(ctx, tmp_reg);
-			EMIT(PPC_RAW_SUBFIC(__REG_R0, src_reg, 32));
+			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
 			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
-			EMIT(PPC_RAW_SLW(__REG_R0, dst_reg_h, __REG_R0));
+			EMIT(PPC_RAW_SLW(_R0, dst_reg_h, _R0));
 			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
-			EMIT(PPC_RAW_OR(dst_reg, dst_reg, __REG_R0));
-			EMIT(PPC_RAW_RLWINM(__REG_R0, tmp_reg, 0, 26, 26));
+			EMIT(PPC_RAW_OR(dst_reg, dst_reg, _R0));
+			EMIT(PPC_RAW_RLWINM(_R0, tmp_reg, 0, 26, 26));
 			EMIT(PPC_RAW_SRAW(tmp_reg, dst_reg_h, tmp_reg));
 			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg_h, src_reg));
-			EMIT(PPC_RAW_SLW(tmp_reg, tmp_reg, __REG_R0));
+			EMIT(PPC_RAW_SLW(tmp_reg, tmp_reg, _R0));
 			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
 			break;
 		case BPF_ALU | BPF_ARSH | BPF_K: /* (s32) dst >>= imm */
@@ -702,24 +702,24 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * 2 bytes are already in their final position
 				 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
 				 */
-				EMIT(PPC_RAW_RLWINM(__REG_R0, dst_reg, 8, 0, 31));
+				EMIT(PPC_RAW_RLWINM(_R0, dst_reg, 8, 0, 31));
 				/* Rotate 24 bits and insert byte 1 */
-				EMIT(PPC_RAW_RLWIMI(__REG_R0, dst_reg, 24, 0, 7));
+				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg, 24, 0, 7));
 				/* Rotate 24 bits and insert byte 3 */
-				EMIT(PPC_RAW_RLWIMI(__REG_R0, dst_reg, 24, 16, 23));
-				EMIT(PPC_RAW_MR(dst_reg, __REG_R0));
+				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg, 24, 16, 23));
+				EMIT(PPC_RAW_MR(dst_reg, _R0));
 				break;
 			case 64:
 				bpf_set_seen_register(ctx, tmp_reg);
 				EMIT(PPC_RAW_RLWINM(tmp_reg, dst_reg, 8, 0, 31));
-				EMIT(PPC_RAW_RLWINM(__REG_R0, dst_reg_h, 8, 0, 31));
+				EMIT(PPC_RAW_RLWINM(_R0, dst_reg_h, 8, 0, 31));
 				/* Rotate 24 bits and insert byte 1 */
 				EMIT(PPC_RAW_RLWIMI(tmp_reg, dst_reg, 24, 0, 7));
-				EMIT(PPC_RAW_RLWIMI(__REG_R0, dst_reg_h, 24, 0, 7));
+				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg_h, 24, 0, 7));
 				/* Rotate 24 bits and insert byte 3 */
 				EMIT(PPC_RAW_RLWIMI(tmp_reg, dst_reg, 24, 16, 23));
-				EMIT(PPC_RAW_RLWIMI(__REG_R0, dst_reg_h, 24, 16, 23));
-				EMIT(PPC_RAW_MR(dst_reg, __REG_R0));
+				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg_h, 24, 16, 23));
+				EMIT(PPC_RAW_MR(dst_reg, _R0));
 				EMIT(PPC_RAW_MR(dst_reg_h, tmp_reg));
 				break;
 			}
@@ -744,32 +744,32 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
 			break;
 		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
-			PPC_LI32(__REG_R0, imm);
-			EMIT(PPC_RAW_STB(__REG_R0, dst_reg, off));
+			PPC_LI32(_R0, imm);
+			EMIT(PPC_RAW_STB(_R0, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
 			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
 			break;
 		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
-			PPC_LI32(__REG_R0, imm);
-			EMIT(PPC_RAW_STH(__REG_R0, dst_reg, off));
+			PPC_LI32(_R0, imm);
+			EMIT(PPC_RAW_STH(_R0, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
 			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
 			break;
 		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
-			PPC_LI32(__REG_R0, imm);
-			EMIT(PPC_RAW_STW(__REG_R0, dst_reg, off));
+			PPC_LI32(_R0, imm);
+			EMIT(PPC_RAW_STW(_R0, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
 			EMIT(PPC_RAW_STW(src_reg_h, dst_reg, off));
 			EMIT(PPC_RAW_STW(src_reg, dst_reg, off + 4));
 			break;
 		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
-			PPC_LI32(__REG_R0, imm);
-			EMIT(PPC_RAW_STW(__REG_R0, dst_reg, off + 4));
-			PPC_EX32(__REG_R0, imm);
-			EMIT(PPC_RAW_STW(__REG_R0, dst_reg, off));
+			PPC_LI32(_R0, imm);
+			EMIT(PPC_RAW_STW(_R0, dst_reg, off + 4));
+			PPC_EX32(_R0, imm);
+			EMIT(PPC_RAW_STW(_R0, dst_reg, off));
 			break;
 
 		/*
@@ -780,11 +780,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			/* Get offset into TMP_REG */
 			EMIT(PPC_RAW_LI(tmp_reg, off));
 			/* load value from memory into r0 */
-			EMIT(PPC_RAW_LWARX(__REG_R0, tmp_reg, dst_reg, 0));
+			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
 			/* add value from src_reg into this */
-			EMIT(PPC_RAW_ADD(__REG_R0, __REG_R0, src_reg));
+			EMIT(PPC_RAW_ADD(_R0, _R0, src_reg));
 			/* store result back */
-			EMIT(PPC_RAW_STWCX(__REG_R0, tmp_reg, dst_reg));
+			EMIT(PPC_RAW_STWCX(_R0, tmp_reg, dst_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, (ctx->idx - 3) * 4);
 			break;
@@ -852,14 +852,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return ret;
 
 			if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_5))) {
-				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5) - 1, __REG_R1, 8));
-				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5), __REG_R1, 12));
+				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5) - 1, _R1, 8));
+				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5), _R1, 12));
 			}
 
 			bpf_jit_emit_func_call_rel(image, ctx, func_addr);
 
-			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0) - 1, __REG_R3));
-			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0), __REG_R4));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0) - 1, _R3));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0), _R4));
 			break;
 
 		/*
@@ -967,12 +967,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_CMPW(dst_reg, src_reg));
 				break;
 			case BPF_JMP | BPF_JSET | BPF_X:
-				EMIT(PPC_RAW_AND_DOT(__REG_R0, dst_reg_h, src_reg_h));
+				EMIT(PPC_RAW_AND_DOT(_R0, dst_reg_h, src_reg_h));
 				PPC_BCC_SHORT(COND_NE, (ctx->idx + 2) * 4);
-				EMIT(PPC_RAW_AND_DOT(__REG_R0, dst_reg, src_reg));
+				EMIT(PPC_RAW_AND_DOT(_R0, dst_reg, src_reg));
 				break;
 			case BPF_JMP32 | BPF_JSET | BPF_X: {
-				EMIT(PPC_RAW_AND_DOT(__REG_R0, dst_reg, src_reg));
+				EMIT(PPC_RAW_AND_DOT(_R0, dst_reg, src_reg));
 				break;
 			case BPF_JMP | BPF_JNE | BPF_K:
 			case BPF_JMP | BPF_JEQ | BPF_K:
@@ -990,11 +990,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					EMIT(PPC_RAW_CMPLWI(dst_reg, imm));
 				} else {
 					/* sign-extending load ... but unsigned comparison */
-					PPC_EX32(__REG_R0, imm);
-					EMIT(PPC_RAW_CMPLW(dst_reg_h, __REG_R0));
-					PPC_LI32(__REG_R0, imm);
+					PPC_EX32(_R0, imm);
+					EMIT(PPC_RAW_CMPLW(dst_reg_h, _R0));
+					PPC_LI32(_R0, imm);
 					PPC_BCC_SHORT(COND_NE, (ctx->idx + 2) * 4);
-					EMIT(PPC_RAW_CMPLW(dst_reg, __REG_R0));
+					EMIT(PPC_RAW_CMPLW(dst_reg, _R0));
 				}
 				break;
 			case BPF_JMP32 | BPF_JNE | BPF_K:
@@ -1006,8 +1006,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				if (imm >= 0 && imm < 65536) {
 					EMIT(PPC_RAW_CMPLWI(dst_reg, imm));
 				} else {
-					PPC_LI32(__REG_R0, imm);
-					EMIT(PPC_RAW_CMPLW(dst_reg, __REG_R0));
+					PPC_LI32(_R0, imm);
+					EMIT(PPC_RAW_CMPLW(dst_reg, _R0));
 				}
 				break;
 			}
@@ -1022,9 +1022,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				} else {
 					/* sign-extending load */
 					EMIT(PPC_RAW_CMPWI(dst_reg_h, imm < 0 ? -1 : 0));
-					PPC_LI32(__REG_R0, imm);
+					PPC_LI32(_R0, imm);
 					PPC_BCC_SHORT(COND_NE, (ctx->idx + 2) * 4);
-					EMIT(PPC_RAW_CMPLW(dst_reg, __REG_R0));
+					EMIT(PPC_RAW_CMPLW(dst_reg, _R0));
 				}
 				break;
 			case BPF_JMP32 | BPF_JSGT | BPF_K:
@@ -1039,32 +1039,32 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					EMIT(PPC_RAW_CMPWI(dst_reg, imm));
 				} else {
 					/* sign-extending load */
-					PPC_LI32(__REG_R0, imm);
-					EMIT(PPC_RAW_CMPW(dst_reg, __REG_R0));
+					PPC_LI32(_R0, imm);
+					EMIT(PPC_RAW_CMPW(dst_reg, _R0));
 				}
 				break;
 			case BPF_JMP | BPF_JSET | BPF_K:
 				/* andi does not sign-extend the immediate */
 				if (imm >= 0 && imm < 32768) {
 					/* PPC_ANDI is _only/always_ dot-form */
-					EMIT(PPC_RAW_ANDI(__REG_R0, dst_reg, imm));
+					EMIT(PPC_RAW_ANDI(_R0, dst_reg, imm));
 				} else {
-					PPC_LI32(__REG_R0, imm);
+					PPC_LI32(_R0, imm);
 					if (imm < 0) {
 						EMIT(PPC_RAW_CMPWI(dst_reg_h, 0));
 						PPC_BCC_SHORT(COND_NE, (ctx->idx + 2) * 4);
 					}
-					EMIT(PPC_RAW_AND_DOT(__REG_R0, dst_reg, __REG_R0));
+					EMIT(PPC_RAW_AND_DOT(_R0, dst_reg, _R0));
 				}
 				break;
 			case BPF_JMP32 | BPF_JSET | BPF_K:
 				/* andi does not sign-extend the immediate */
 				if (imm >= -32768 && imm < 32768) {
 					/* PPC_ANDI is _only/always_ dot-form */
-					EMIT(PPC_RAW_ANDI(__REG_R0, dst_reg, imm));
+					EMIT(PPC_RAW_ANDI(_R0, dst_reg, imm));
 				} else {
-					PPC_LI32(__REG_R0, imm);
-					EMIT(PPC_RAW_AND_DOT(__REG_R0, dst_reg, __REG_R0));
+					PPC_LI32(_R0, imm);
+					EMIT(PPC_RAW_AND_DOT(_R0, dst_reg, _R0));
 				}
 				break;
 			}
-- 
2.25.0

