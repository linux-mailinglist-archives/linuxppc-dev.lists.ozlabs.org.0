Return-Path: <linuxppc-dev+bounces-10646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F208DB1B28F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 13:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx9vp1Qldz3069;
	Tue,  5 Aug 2025 21:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754392838;
	cv=none; b=ic1ZEs66KAiPvLLBDb8PGoS0nFKBm68wrazJ544B0o8AKM0dGQ5SJJXcnua2YtnjOGxUxBx2favdR2GqYwuEuA893K32cLpkT3cbfncFjMmTrVtM51ISRW/uYd9JnAZS62b/9JGCpDR/VJWnBEbfUtf5lNsONNVYVTIyjmJhRO88TH126W5lFaVj/cXiyDrnjUPEVZqefumTW81wHRfT4uTcngVmID3cwHZYXM6Fnn8WkAkLiMKgHHtOduCx6fN1mj8mczSzoN62+yJBTzSEj3z5/AIzhy6+j22LEw2gRW1RB4XNP0RNRFoG0KkhfNWU3U6RNmDQDf5rkwoETpRDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754392838; c=relaxed/relaxed;
	bh=Nerc2y0ZazWAm4E4mqD8MPdQgtQUjY9cjnQi6wChhCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwNcRUF+MVCv+NMFF4b+PssDMagWw0IZBWwHakYSWNKvNAqiagpSmvIQVQcrV1hXRjqXmhME+rdIs8tcnyM/WBPoBAariq5xMSOaNwBBzoMXmcbxokCKF6DcB6JXFSmQMraMeg1yZ7rQwsXWn4WpEi4HGakaHFMV3rdKdmD+y1+D6dzDv33CAAXsCBdmpTkAV+qId+K/8QulplqMD1Gn9dMcl0zdODXse4ejWJCmGFdkAN86rpNndNcl5dXYl6Fw5/ZGNQRwh5rNJGRGIEcZM2X+Tjo9okiqjGCgsZnRd3TNgbc9hQ7R98Wd7fI4px65ZCwrGgurXX05LVmpzCLYUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx9vn1yp5z3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 21:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx5365ZZNz9tKP;
	Tue,  5 Aug 2025 09:41:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OEbE3GMNzcM; Tue,  5 Aug 2025 09:41:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx5364c1qz9tCB;
	Tue,  5 Aug 2025 09:41:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 945C38B765;
	Tue,  5 Aug 2025 09:41:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SrGpeUTETfvg; Tue,  5 Aug 2025 09:41:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 54E308B763;
	Tue,  5 Aug 2025 09:41:37 +0200 (CEST)
Message-ID: <c53da8e9-c15d-47b4-9422-4461f0b7c188@csgroup.eu>
Date: Tue, 5 Aug 2025 09:41:37 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next 2/6] bpf,powerpc: Implement PROBE_MEM32 pseudo
 instructions
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
 <20250805062747.3479221-3-skb99@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250805062747.3479221-3-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
> Add support for [LDX | STX | ST], PROBE_MEM32, [B | H | W | DW]
> instructions.  They are similar to PROBE_MEM instructions with the
> following differences:
> - PROBE_MEM32 supports store.
> - PROBE_MEM32 relies on the verifier to clear upper 32-bit of the
> src/dst register
> - PROBE_MEM32 adds 64-bit kern_vm_start address (which is stored in _R26
> in the prologue). Due to bpf_arena constructions such _R26 + reg +
> off16 access is guaranteed to be within arena virtual range, so no
> address check at run-time.
> - PROBE_MEM32 allows STX and ST. If they fault the store is a nop. When
> LDX faults the destination register is zeroed.
> 
> To support these on powerpc, we do tmp1 = _R26 + src/dst reg and then use
> tmp1 as the new src/dst register. This allows us to reuse most of the
> code for normal [LDX | STX | ST].
> 
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |   5 +-
>   arch/powerpc/net/bpf_jit_comp.c   |  10 ++-
>   arch/powerpc/net/bpf_jit_comp32.c |   2 +-
>   arch/powerpc/net/bpf_jit_comp64.c | 108 ++++++++++++++++++++++++++++--
>   4 files changed, 114 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 4c26912c2e3c..2d095a873305 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -161,9 +161,10 @@ struct codegen_context {
>   	unsigned int seen;
>   	unsigned int idx;
>   	unsigned int stack_size;
> -	int b2p[MAX_BPF_JIT_REG + 2];
> +	int b2p[MAX_BPF_JIT_REG + 3];
>   	unsigned int exentry_idx;
>   	unsigned int alt_exit_addr;
> +	u64 arena_vm_start;
>   };
>   
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
> @@ -201,7 +202,7 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
>   
>   int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
>   			  struct codegen_context *ctx, int insn_idx,
> -			  int jmp_off, int dst_reg);
> +			  int jmp_off, int dst_reg, u32 code);
>   
>   #endif
>   
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index c0684733e9d6..35bfdf4d8785 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -204,6 +204,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   
>   	/* Make sure that the stack is quadword aligned. */
>   	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
> +	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -326,7 +327,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>    */
>   int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
>   			  struct codegen_context *ctx, int insn_idx, int jmp_off,
> -			  int dst_reg)
> +			  int dst_reg, u32 code)
>   {
>   	off_t offset;
>   	unsigned long pc;
> @@ -354,7 +355,12 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass
>   		(fp->aux->num_exentries * BPF_FIXUP_LEN * 4) +
>   		(ctx->exentry_idx * BPF_FIXUP_LEN * 4);
>   
> -	fixup[0] = PPC_RAW_LI(dst_reg, 0);
> +	if ((BPF_CLASS(code) == BPF_LDX && BPF_MODE(code) == BPF_PROBE_MEM32) ||
> +	    (BPF_CLASS(code) == BPF_LDX && BPF_MODE(code) == BPF_PROBE_MEM))
> +		fixup[0] = PPC_RAW_LI(dst_reg, 0);
> +	else if (BPF_CLASS(code) == BPF_ST || BPF_CLASS(code) == BPF_STX)
> +		fixup[0] = PPC_RAW_NOP();
> +

Is there also a 'else' to consider ? If not, why not just a 'else' 
instead of an 'if else' ?

>   	if (IS_ENABLED(CONFIG_PPC32))
>   		fixup[1] = PPC_RAW_LI(dst_reg - 1, 0); /* clear higher 32-bit register too */
>   
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 0aace304dfe1..3087e744fb25 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -1087,7 +1087,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   				}
>   
>   				ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx, insn_idx,
> -							    jmp_off, dst_reg);
> +							    jmp_off, dst_reg, code);
>   				if (ret)
>   					return ret;
>   			}
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 489de21fe3d6..16e62766c757 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -44,6 +44,7 @@
>   /* BPF register usage */
>   #define TMP_REG_1	(MAX_BPF_JIT_REG + 0)
>   #define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
> +#define ARENA_VM_START  (MAX_BPF_JIT_REG + 2)
>   
>   /* BPF to ppc register mappings */
>   void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
> @@ -61,6 +62,8 @@ void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
>   	ctx->b2p[BPF_REG_7] = _R28;
>   	ctx->b2p[BPF_REG_8] = _R29;
>   	ctx->b2p[BPF_REG_9] = _R30;
> +	/* non volatile register for kern_vm_start address */
> +	ctx->b2p[ARENA_VM_START] = _R26;
>   	/* frame pointer aka BPF_REG_10 */
>   	ctx->b2p[BPF_REG_FP] = _R31;
>   	/* eBPF jit internal registers */
> @@ -69,8 +72,8 @@ void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
>   	ctx->b2p[TMP_REG_2] = _R10;
>   }
>   
> -/* PPC NVR range -- update this if we ever use NVRs below r27 */
> -#define BPF_PPC_NVR_MIN		_R27
> +/* PPC NVR range -- update this if we ever use NVRs below r26 */
> +#define BPF_PPC_NVR_MIN		_R26
>   
>   static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>   {
> @@ -170,10 +173,17 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>   			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>   
> +	if (ctx->arena_vm_start)
> +		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
> +				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
> +
>   	/* Setup frame pointer to point to the bpf stack area */
>   	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>   		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>   				STACK_FRAME_MIN_SIZE + ctx->stack_size));
> +
> +	if (ctx->arena_vm_start)
> +		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
>   }
>   
>   static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
> @@ -185,6 +195,10 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
>   		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>   			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>   
> +	if (ctx->arena_vm_start)
> +		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
> +				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
> +
>   	/* Tear down our stack frame */
>   	if (bpf_has_stack_frame(ctx)) {
>   		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
> @@ -990,6 +1004,50 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   			}
>   			break;
>   
> +		case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
> +		case BPF_STX | BPF_PROBE_MEM32 | BPF_H:
> +		case BPF_STX | BPF_PROBE_MEM32 | BPF_W:
> +		case BPF_STX | BPF_PROBE_MEM32 | BPF_DW:
> +
> +			EMIT(PPC_RAW_ADD(tmp1_reg, dst_reg, bpf_to_ppc(ARENA_VM_START)));
> +
> +			ret = bpf_jit_emit_probe_mem_store(ctx, src_reg, off, code, image);
> +			if (ret)
> +				return ret;
> +
> +			ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
> +						    ctx->idx - 1, 4, -1, code);
> +			if (ret)
> +				return ret;
> +
> +			break;
> +
> +		case BPF_ST | BPF_PROBE_MEM32 | BPF_B:
> +		case BPF_ST | BPF_PROBE_MEM32 | BPF_H:
> +		case BPF_ST | BPF_PROBE_MEM32 | BPF_W:
> +		case BPF_ST | BPF_PROBE_MEM32 | BPF_DW:
> +
> +			EMIT(PPC_RAW_ADD(tmp1_reg, dst_reg, bpf_to_ppc(ARENA_VM_START)));
> +
> +			if (BPF_SIZE(code) == BPF_W || BPF_SIZE(code) == BPF_DW) {
> +				PPC_LI32(tmp2_reg, imm);
> +				src_reg = tmp2_reg;
> +			} else {
> +				EMIT(PPC_RAW_LI(tmp2_reg, imm));
> +				src_reg = tmp2_reg;
> +			}
> +
> +			ret = bpf_jit_emit_probe_mem_store(ctx, src_reg, off, code, image);
> +			if (ret)
> +				return ret;
> +
> +			ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
> +						    ctx->idx - 1, 4, -1, code);
> +			if (ret)
> +				return ret;
> +
> +			break;
> +
>   		/*
>   		 * BPF_STX ATOMIC (atomic ops)
>   		 */
> @@ -1142,9 +1200,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   				 * Check if 'off' is word aligned for BPF_DW, because
>   				 * we might generate two instructions.
>   				 */
> -				if ((BPF_SIZE(code) == BPF_DW ||
> -				    (BPF_SIZE(code) == BPF_B && BPF_MODE(code) == BPF_PROBE_MEMSX)) &&
> -						(off & 3))
> +				if ((BPF_SIZE(code) == BPF_DW && (off & 3)) ||
> +				    (BPF_SIZE(code) == BPF_B &&
> +				     BPF_MODE(code) == BPF_PROBE_MEMSX) ||
> +				    (BPF_SIZE(code) == BPF_B && BPF_MODE(code) == BPF_MEMSX))
>   					PPC_JMP((ctx->idx + 3) * 4);
>   				else
>   					PPC_JMP((ctx->idx + 2) * 4);
> @@ -1190,12 +1249,49 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   
>   			if (BPF_MODE(code) == BPF_PROBE_MEM) {
>   				ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
> -							    ctx->idx - 1, 4, dst_reg);
> +							    ctx->idx - 1, 4, dst_reg, code);
>   				if (ret)
>   					return ret;
>   			}
>   			break;
>   
> +		/* dst = *(u64 *)(ul) (src + ARENA_VM_START + off) */
> +		case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
> +		case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
> +		case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
> +		case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
> +
> +			EMIT(PPC_RAW_ADD(tmp1_reg, src_reg, bpf_to_ppc(ARENA_VM_START)));
> +
> +			switch (size) {
> +			case BPF_B:
> +				EMIT(PPC_RAW_LBZ(dst_reg, tmp1_reg, off));
> +				break;
> +			case BPF_H:
> +				EMIT(PPC_RAW_LHZ(dst_reg, tmp1_reg, off));
> +				break;
> +			case BPF_W:
> +				EMIT(PPC_RAW_LWZ(dst_reg, tmp1_reg, off));
> +				break;
> +			case BPF_DW:
> +				if (off % 4) {
> +					EMIT(PPC_RAW_LI(tmp2_reg, off));
> +					EMIT(PPC_RAW_LDX(dst_reg, tmp1_reg, tmp2_reg));
> +				} else {
> +					EMIT(PPC_RAW_LD(dst_reg, tmp1_reg, off));
> +				}
> +				break;
> +			}
> +
> +			if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
> +				addrs[++i] = ctx->idx * 4;
> +
> +			ret = bpf_add_extable_entry(fp, image, fimage, pass, ctx,
> +						    ctx->idx - 1, 4, dst_reg, code);
> +			if (ret)
> +				return ret;
> +			break;
> +
>   		/*
>   		 * Doubleword load
>   		 * 16 byte instruction that uses two 'struct bpf_insn'


