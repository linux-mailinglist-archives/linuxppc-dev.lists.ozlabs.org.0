Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1513E101D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 10:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgM5s6zH4z3dDQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 18:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgM5X2zG5z2xlC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 18:21:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgM5R1htRz9sWC;
 Thu,  5 Aug 2021 10:21:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnAEzZ1kYfV0; Thu,  5 Aug 2021 10:21:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgM5R0Rdlz9sVh;
 Thu,  5 Aug 2021 10:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E23DF8B7B9;
 Thu,  5 Aug 2021 10:21:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id r8X5v624agaT; Thu,  5 Aug 2021 10:21:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FC3B8B76A;
 Thu,  5 Aug 2021 10:21:30 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc/bpf: Reallocate BPF registers to volatile
 registers when possible on PPC64
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210727065539.299598-1-jniethe5@gmail.com>
 <20210727065539.299598-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0c70202c-54f7-78e7-0091-0dfa8e6ab207@csgroup.eu>
Date: Thu, 5 Aug 2021 10:21:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727065539.299598-3-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/07/2021 à 08:55, Jordan Niethe a écrit :
> Implement commit 40272035e1d0 ("powerpc/bpf: Reallocate BPF registers to
> volatile registers when possible on PPC32") for PPC64.
> 
> When the BPF routine doesn't call any function, the non volatile
> registers can be reallocated to volatile registers in order to avoid
> having to save them/restore on the stack. To keep track of which
> registers can be reallocated to make sure registers are set seen when
> used.

Maybe you could try and do as on PPC32, try to use r0 as much as possible instead of TMP regs.
r0 needs to be used carefully because for some instructions (ex: addi, lwz, etc) r0 means 0 instead 
of register 0, but it would help freeing one more register in several cases.

> 
> Before this patch, the test #359 ADD default X is:
>     0:   nop
>     4:   nop
>     8:   std     r27,-40(r1)
>     c:   std     r28,-32(r1)
>    10:   xor     r8,r8,r8
>    14:   rotlwi  r8,r8,0
>    18:   xor     r28,r28,r28
>    1c:   rotlwi  r28,r28,0
>    20:   mr      r27,r3
>    24:   li      r8,66
>    28:   add     r8,r8,r28
>    2c:   rotlwi  r8,r8,0
>    30:   ld      r27,-40(r1)
>    34:   ld      r28,-32(r1)
>    38:   mr      r3,r8
>    3c:   blr
> 
> After this patch, the same test has become:
>     0:   nop
>     4:   nop
>     8:   xor     r8,r8,r8
>     c:   rotlwi  r8,r8,0
>    10:   xor     r5,r5,r5
>    14:   rotlwi  r5,r5,0
>    18:   mr      r4,r3
>    1c:   li      r8,66
>    20:   add     r8,r8,r5
>    24:   rotlwi  r8,r8,0
>    28:   mr      r3,r8
>    2c:   blr
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/net/bpf_jit64.h      |  2 ++
>   arch/powerpc/net/bpf_jit_comp64.c | 60 +++++++++++++++++++++++++------
>   2 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
> index 89b625d9342b..e20521bf77bf 100644
> --- a/arch/powerpc/net/bpf_jit64.h
> +++ b/arch/powerpc/net/bpf_jit64.h
> @@ -70,6 +70,7 @@ const int b2p[MAX_BPF_JIT_REG + 2] = {
>    */
>   #define PPC_BPF_LL(ctx, r, base, i) do {						  \
>   				if ((i) % 4) {						  \
> +					bpf_set_seen_register(ctx, bpf_to_ppc(ctx, TMP_REG_2));\
>   					EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, TMP_REG_2), (i)));\
>   					EMIT(PPC_RAW_LDX(r, base,			  \
>   							bpf_to_ppc(ctx, TMP_REG_2)));	  \
> @@ -78,6 +79,7 @@ const int b2p[MAX_BPF_JIT_REG + 2] = {
>   				} while(0)
>   #define PPC_BPF_STL(ctx, r, base, i) do {						  \
>   				if ((i) % 4) {						  \
> +					bpf_set_seen_register(ctx, bpf_to_ppc(ctx, TMP_REG_2));\
>   					EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, TMP_REG_2), (i)));\
>   					EMIT(PPC_RAW_STDX(r, base,			  \
>   							bpf_to_ppc(ctx, TMP_REG_2)));	  \
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index f7a668c1e364..287e0322bbf3 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -66,6 +66,24 @@ static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
>   
>   void bpf_jit_realloc_regs(struct codegen_context *ctx)
>   {
> +	if (ctx->seen & SEEN_FUNC)
> +		return;
> +
> +	while (ctx->seen & SEEN_NVREG_MASK &&
> +	       (ctx->seen & SEEN_VREG_MASK) != SEEN_VREG_MASK) {
> +		int old = 32 - fls(ctx->seen & SEEN_NVREG_MASK);
> +		int new = 32 - fls(~ctx->seen & SEEN_VREG_MASK);
> +		int i;
> +
> +		for (i = BPF_REG_0; i <= TMP_REG_2; i++) {
> +			if (ctx->b2p[i] != old)
> +				continue;
> +			ctx->b2p[i] = new;
> +			bpf_set_seen_register(ctx, new);
> +			bpf_clear_seen_register(ctx, old);
> +			break;
> +		}
> +	}

This function is not very different from the one for PPC32. Maybe we could cook a common function.


>   }
>   
>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
> @@ -106,10 +124,9 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   	 * If we haven't created our own stack frame, we save these
>   	 * in the protected zone below the previous stack frame
>   	 */
> -	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> -		if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, i)))
> -			PPC_BPF_STL(ctx, bpf_to_ppc(ctx, i), 1,
> -				    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ctx, i)));
> +	for (i = BPF_PPC_NVR_MIN; i <= 31; i++)
> +		if (bpf_is_seen_register(ctx, i))
> +			PPC_BPF_STL(ctx, i, 1, bpf_jit_stack_offsetof(ctx, i));
>   
>   	/* Setup frame pointer to point to the bpf stack area */
>   	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_FP)))
> @@ -122,10 +139,9 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
>   	int i;
>   
>   	/* Restore NVRs */
> -	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
> -		if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, i)))
> -			PPC_BPF_LL(ctx, bpf_to_ppc(ctx, i), 1,
> -				   bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ctx, i)));
> +	for (i = BPF_PPC_NVR_MIN; i <= 31; i++)
> +		if (bpf_is_seen_register(ctx, i))
> +			PPC_BPF_LL(ctx, i, 1, bpf_jit_stack_offsetof(ctx, i));
>   
>   	/* Tear down our stack frame */
>   	if (bpf_has_stack_frame(ctx)) {
> @@ -223,6 +239,7 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
>   	 * if (index >= array->map.max_entries)
>   	 *   goto out;
>   	 */
> +	bpf_set_seen_register(ctx, bpf_to_ppc(ctx, TMP_REG_1));
>   	EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, TMP_REG_1), b2p_bpf_array,
>   			 offsetof(struct bpf_array, map.max_entries)));
>   	EMIT(PPC_RAW_RLWINM(b2p_index, b2p_index, 0, 0, 31));
> @@ -318,9 +335,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		 * optimization but everything else should work without
>   		 * any issues.
>   		 */
> -		if (dst_reg >= BPF_PPC_NVR_MIN && dst_reg < 32)
> +		if (dst_reg >= 3 && dst_reg < 32)
>   			bpf_set_seen_register(ctx, dst_reg);
> -		if (src_reg >= BPF_PPC_NVR_MIN && src_reg < 32)
> +		if (src_reg >= 3 && src_reg < 32)
>   			bpf_set_seen_register(ctx, src_reg);
>   
>   		switch (code) {
> @@ -345,6 +362,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   				if (imm >= -32768 && imm < 32768)
>   					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
>   				else {
> +					bpf_set_seen_register(ctx, tmp1_reg);
>   					PPC_LI32(tmp1_reg, imm);
>   					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, tmp1_reg));
>   				}
> @@ -362,6 +380,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			if (imm >= -32768 && imm < 32768)
>   				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, IMM_L(imm)));
>   			else {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				if (BPF_CLASS(code) == BPF_ALU)
>   					EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp1_reg));
> @@ -372,6 +391,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
>   		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
>   			if (BPF_OP(code) == BPF_MOD) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
>   				EMIT(PPC_RAW_MULW(tmp1_reg, src_reg, tmp1_reg));
>   				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
> @@ -381,6 +401,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
>   		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
>   			if (BPF_OP(code) == BPF_MOD) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
>   				EMIT(PPC_RAW_MULD(tmp1_reg, src_reg, tmp1_reg));
>   				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
> @@ -396,10 +417,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			else if (imm == 1)
>   				goto bpf_alu32_trunc;
>   
> +			bpf_set_seen_register(ctx, tmp1_reg);
>   			PPC_LI32(tmp1_reg, imm);
>   			switch (BPF_CLASS(code)) {
>   			case BPF_ALU:
>   				if (BPF_OP(code) == BPF_MOD) {
> +					bpf_set_seen_register(ctx, tmp2_reg);
>   					EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
>   					EMIT(PPC_RAW_MULW(tmp1_reg, tmp1_reg, tmp2_reg));
>   					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
> @@ -408,6 +431,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   				break;
>   			case BPF_ALU64:
>   				if (BPF_OP(code) == BPF_MOD) {
> +					bpf_set_seen_register(ctx, tmp2_reg);
>   					EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
>   					EMIT(PPC_RAW_MULD(tmp1_reg, tmp1_reg, tmp2_reg));
>   					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
> @@ -434,6 +458,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   				EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
>   			else {
>   				/* Sign-extended */
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				EMIT(PPC_RAW_AND(dst_reg, dst_reg, tmp1_reg));
>   			}
> @@ -446,6 +471,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
>   			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
>   				/* Sign-extended */
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp1_reg));
>   			} else {
> @@ -463,6 +489,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
>   			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
>   				/* Sign-extended */
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, tmp1_reg));
>   			} else {
> @@ -562,6 +589,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			if (BPF_SRC(code) == BPF_FROM_LE)
>   				goto emit_clear;
>   #endif
> +			bpf_set_seen_register(ctx, tmp1_reg);
>   			switch (imm) {
>   			case 16:
>   				/* Rotate 8 bits left & mask with 0x0000ff00 */
> @@ -625,6 +653,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src */
>   		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
>   			if (BPF_CLASS(code) == BPF_ST) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				EMIT(PPC_RAW_LI(tmp1_reg, imm));
>   				src_reg = tmp1_reg;
>   			}
> @@ -633,6 +662,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
>   		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
>   			if (BPF_CLASS(code) == BPF_ST) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				EMIT(PPC_RAW_LI(tmp1_reg, imm));
>   				src_reg = tmp1_reg;
>   			}
> @@ -641,6 +671,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
>   		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
>   			if (BPF_CLASS(code) == BPF_ST) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				src_reg = tmp1_reg;
>   			}
> @@ -649,6 +680,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
>   		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
>   			if (BPF_CLASS(code) == BPF_ST) {
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				PPC_LI32(tmp1_reg, imm);
>   				src_reg = tmp1_reg;
>   			}
> @@ -669,6 +701,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			/* *(u32 *)(dst + off) += src */
>   
>   			/* Get EA into TMP_REG_1 */
> +			bpf_set_seen_register(ctx, tmp1_reg);
> +			bpf_set_seen_register(ctx, tmp2_reg);
>   			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
>   			tmp_idx = ctx->idx * 4;
>   			/* load value from memory into TMP_REG_2 */
> @@ -689,6 +723,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			}
>   			/* *(u64 *)(dst + off) += src */
>   
> +			bpf_set_seen_register(ctx, tmp1_reg);
> +			bpf_set_seen_register(ctx, tmp2_reg);
>   			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
>   			tmp_idx = ctx->idx * 4;
>   			EMIT(PPC_RAW_LDARX(tmp2_reg, 0, tmp1_reg, 0));
> @@ -870,6 +906,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   				break;
>   			case BPF_JMP | BPF_JSET | BPF_X:
>   			case BPF_JMP32 | BPF_JSET | BPF_X:
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				if (BPF_CLASS(code) == BPF_JMP) {
>   					EMIT(PPC_RAW_AND_DOT(tmp1_reg, dst_reg, src_reg));
>   				} else {
> @@ -903,6 +940,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   						EMIT(PPC_RAW_CMPLDI(dst_reg, imm));
>   				} else {
>   					/* sign-extending load */
> +					bpf_set_seen_register(ctx, tmp1_reg);
>   					PPC_LI32(tmp1_reg, imm);
>   					/* ... but unsigned comparison */
>   					if (is_jmp32)
> @@ -933,6 +971,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   					else
>   						EMIT(PPC_RAW_CMPDI(dst_reg, imm));
>   				} else {
> +					bpf_set_seen_register(ctx, tmp1_reg);
>   					PPC_LI32(tmp1_reg, imm);
>   					if (is_jmp32)
>   						EMIT(PPC_RAW_CMPW(dst_reg, tmp1_reg));
> @@ -944,6 +983,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			case BPF_JMP | BPF_JSET | BPF_K:
>   			case BPF_JMP32 | BPF_JSET | BPF_K:
>   				/* andi does not sign-extend the immediate */
> +				bpf_set_seen_register(ctx, tmp1_reg);
>   				if (imm >= 0 && imm < 32768)
>   					/* PPC_ANDI is _only/always_ dot-form */
>   					EMIT(PPC_RAW_ANDI(tmp1_reg, dst_reg, imm));
> 
