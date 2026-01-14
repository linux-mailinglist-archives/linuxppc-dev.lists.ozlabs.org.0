Return-Path: <linuxppc-dev+bounces-15729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18139D1EBC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlkh4lchz2xMt;
	Wed, 14 Jan 2026 23:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768393676;
	cv=none; b=Q8SunFPNT7PzeY2vnO4cw5V9FnNxjeFPLmtgQ1UkaRoGd//8g+k+plMcCoGIfmG69Y6C7y34I61rj5djJ1eTO49dpfOTv2H7YD69TZEg9aiiIbMjhpBvhAICV7tg0ehg2CQyv02JRSx65N9BI5nt5wYP1TvTsXJjQ/IWmwn8ibMxYDW7MGvuuuVMBKKb9b/JB/Fcu3h4XCja+GFfJqxdRj5Xmq/yNMeHPl/TW2GSh61fqhvxkpcEhBPKiOXotKEvd0uia0qrRVFpG7Q5/3jFX+eM3SP5cmdevd2+ZMX3tzdba/+ENAph9xEVnom01joRAIgy6nFI/WPHUUuryhQJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768393676; c=relaxed/relaxed;
	bh=i0tjK5M+JelOGzaxBzyRlJPDT2Kq9fZlgjc8EvkUjjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPuscxVyDWth62UQznV7sbeR6PAhy3QhJ31p+gr/d9vAZV7MbfTLyAEqt+SLmXcphN0ECrX9wOJaUIdNe7kVjGKW2Ov8K9LPGvT3R076ebyGgfKQRKvaQHzw2wSP6VsAoEEOoB8VatIrb30aWuvGPQDx4tHOFh/RBCb9+jfSmBXnM0WOTXyTrswz3YTwtOcDuH1ZMCB8n6yBGwJAFq320I45IjEpjbqXa4+m89TAuNPt9v/IyJJuaJ0aBBnMg/vW/g2Xpdq+Hp8rzsuDNXhlw7hGOCYUGPa27iNoNC+1EHijcvpyVm2aHakY/9+WGTxrIj2PEuI4oMFuO1Jh2QTZbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eb5iOM4T; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eb5iOM4T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlkg4VgDz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:27:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 383BB44319;
	Wed, 14 Jan 2026 12:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41817C4CEF7;
	Wed, 14 Jan 2026 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768393672;
	bh=DYAr8uZefUILpwfnCmaoF2xmqlYDZ09mukiO+4g9r94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eb5iOM4Tp80KUlMCviLbJWAoOoNYnyiQFT1orrpSLV99MIRIeR2YO0ifWLBxyBm7u
	 bUaBvk/mRg1TkB9fZfnjEI8URwWOVhkxRatJvET3DbeWFy+P0505ZZ942nlKwdLLeM
	 l8J9M/z1sSbdcBGN/deqmee/jpETe2QC0ZvARzNqiq5gWL1GrdZBUVaIL+IE0K+Jlb
	 suhMbTGGyLpmKOkjAHGEtO8yRXNMlwY4IIrXmpKDKZ2N2+5/yT0afrpa4gFOidZjvb
	 WET/8WK81T7qYwYVCq20ynmQRk5BIje35AmfzQL/M8IdZDQ/JT6Zo4x0FcIKRw4e5h
	 4oeocK+cyoOpg==
Message-ID: <42d41a0d-9d26-4eeb-af46-200083261c09@kernel.org>
Date: Wed, 14 Jan 2026 13:27:45 +0100
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
Subject: Re: [PATCH v2 2/6] powerpc64/bpf: Support tailcalls with subprogs
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-3-adubey@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260114114450.30405-3-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> Enabling tailcalls with subprog combinations by referencing
> method. The actual tailcall count is always maintained in the
> tail_call_info variable present in the frame of main function
> (also called entry function). The tail_call_info variables in
> the frames of all other subprog contains reference to the
> tail_call_info present in frame of main function.
> 
> Dynamic resolution interprets the tail_call_info either as
> value or reference depending on the context of active frame
> while tailcall is invoked.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        | 12 +++++-
>   arch/powerpc/net/bpf_jit_comp.c   | 10 ++++-
>   arch/powerpc/net/bpf_jit_comp64.c | 68 +++++++++++++++++++++++--------
>   3 files changed, 70 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 45d419c0ee73..5d735bc5e6bd 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -51,6 +51,12 @@
>   		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
>   	} while (0)
>   
> +/* Same as PPC_BCC_SHORT, except valid dest is known prior to call. */
> +#define PPC_COND_BRANCH(cond, dest)                                           \
> +	do {								      \
> +		long offset = (long)(dest) - CTX_NIA(ctx);		      \
> +		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));    \
> +	} while (0)

I don't like the idea of duplicating PPC_BCC_SHORT() to just kick the 
verification out. Now we will have two macros doing the exact same thing 
with one handling failure case and one ignoring failure case. There is a 
big risk that one day or another someone will use the wrong macro.

Could you change bpf_jit_build_prologue() to return an int add use 
PPC_BCC_SHORT() instead of that new PPC_COND_BRANCH() ?


>   /*
>    * Sign-extended 32-bit immediate load
>    *
> @@ -75,6 +81,8 @@
>   
>   /* for tailcall counter */
>   #define BPF_PPC_TAILCALL        8
> +/* for gpr non volatile registers BPG_REG_6 to 10 */
> +#define BPF_PPC_STACK_SAVE      (6*8)

Add spaces before and after the *

>   
>   /* If dummy pass (!image), account for maximum possible instructions */
>   #define PPC_LI64(d, i)		do {					      \
> @@ -170,6 +178,7 @@ struct codegen_context {
>   	unsigned int alt_exit_addr;
>   	u64 arena_vm_start;
>   	u64 user_vm_start;
> +	bool is_subprog;
>   };
>   
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
> @@ -204,11 +213,10 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>   void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx);
>   void bpf_jit_realloc_regs(struct codegen_context *ctx);
>   int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
> -
>   int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
>   			  struct codegen_context *ctx, int insn_idx,
>   			  int jmp_off, int dst_reg, u32 code);
> -

Not sure why this patch needs to remove those blank lines here and above.

> +int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx);
>   #endif
>   
>   #endif
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 5e976730b2f5..069a8822c30d 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -206,6 +206,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
>   	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
>   	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
> +	cgctx.is_subprog = bpf_is_subprog(fp);
>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -435,6 +436,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>   	bpf_prog_unlock_free(fp);
>   }
>   
> +bool bpf_jit_supports_subprog_tailcalls(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   bool bpf_jit_supports_kfunc_call(void)
>   {
>   	return true;
> @@ -604,7 +610,7 @@ static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_contex
>   					       int func_frame_offset, int r4_off)
>   {
>   	if (IS_ENABLED(CONFIG_PPC64)) {
> -		/* See bpf_jit_stack_tailcallcnt() */
> +		/* See bpf_jit_stack_tailcallinfo_offset() */
>   		int tailcallcnt_offset = 7 * 8;
>   
>   		EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
> @@ -619,7 +625,7 @@ static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_cont
>   						 int func_frame_offset, int r4_off)
>   {
>   	if (IS_ENABLED(CONFIG_PPC64)) {
> -		/* See bpf_jit_stack_tailcallcnt() */
> +		/* See bpf_jit_stack_tailcallinfo_offset() */
>   		int tailcallcnt_offset = 7 * 8;
>   
>   		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 39061cd742c1..cebf81fbd59f 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -26,8 +26,12 @@
>    * Ensure the top half (upto local_tmp_var) stays consistent
>    * with our redzone usage.
>    *
> + * tail_call_info - stores tailcall count value in main program's
> + *                  frame, stores reference to tail_call_info of
> + *                  main's frame in sub-prog's frame.
> + *
>    *		[	prev sp		] <-------------
> - *		[    tail_call_cnt	] 8		|
> + *		[    tail_call_info	] 8		|
>    *		[   nv gpr save area	] 6*8		|
>    *		[    local_tmp_var	] 24		|
>    * fp (r31) -->	[   ebpf stack space	] upto 512	|
> @@ -35,8 +39,6 @@
>    * sp (r1) --->	[    stack pointer	] --------------
>    */
>   
> -/* for gpr non volatile registers BPG_REG_6 to 10 */
> -#define BPF_PPC_STACK_SAVE	(6*8)
>   /* for bpf JIT code internal usage */
>   #define BPF_PPC_STACK_LOCALS	24
>   /* stack frame excluding BPF stack, ensure this is quadword aligned */
> @@ -98,7 +100,7 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>    *		[	prev sp		] <-------------
>    *		[	  ...       	] 		|
>    * sp (r1) --->	[    stack pointer	] --------------
> - *		[    tail_call_cnt	] 8
> + *		[    tail_call_info	] 8
>    *		[   nv gpr save area	] 6*8
>    *		[    local_tmp_var	] 24
>    *		[   unused red zone	] 224
> @@ -114,7 +116,7 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
>   	}
>   }
>   
> -static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
> +int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
>   {
>   	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + BPF_PPC_STACK_SAVE;
>   }
> @@ -147,17 +149,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   #endif
>   
>   	/*
> -	 * Initialize tail_call_cnt if we do tail calls.
> -	 * Otherwise, put in NOPs so that it can be skipped when we are
> -	 * invoked through a tail call.
> +	 * Tail call count(tcc) is saved & updated only in main
> +	 * program's frame and the address of tcc in main program's
> +	 * frame (tcc_ptr) is saved in subprogs frame.
> +	 *
> +	 * Offset of tail_call_info on any frame will be interpreted
> +	 * as either tcc_ptr or tcc value depending on whether it is
> +	 * greater than MAX_TAIL_CALL_CNT or not.
>   	 */
> -	if (ctx->seen & SEEN_TAILCALL) {
> +	if (!ctx->is_subprog) {
>   		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
>   		/* this goes in the redzone */
>   		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
>   	} else {
> -		EMIT(PPC_RAW_NOP());
> -		EMIT(PPC_RAW_NOP());
> +		/*
> +		 * if tail_call_info < MAX_TAIL_CALL_CNT
> +		 *     main prog calling first subprog -> copy reference
> +		 * else
> +		 *     subsequent subprog calling another subprog -> directly copy content
> +		 */
> +		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, 0));
> +		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), -(BPF_PPC_TAILCALL)));
> +		EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
> +		PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
> +		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2),
> +							-(BPF_PPC_TAILCALL)));
> +		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_TAILCALL)));
>   	}
>   
>   	if (bpf_has_stack_frame(ctx)) {
> @@ -352,19 +369,38 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
>   	EMIT(PPC_RAW_CMPLW(b2p_index, bpf_to_ppc(TMP_REG_1)));
>   	PPC_BCC_SHORT(COND_GE, out);
>   
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
> +	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
> +	PPC_COND_BRANCH(COND_LE, CTX_NIA(ctx) + 8);
> +
> +	/* dereference TMP_REG_1 */
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 0));
> +
>   	/*
> -	 * if (tail_call_cnt >= MAX_TAIL_CALL_CNT)
> +	 * if (tail_call_info == MAX_TAIL_CALL_CNT)
>   	 *   goto out;
>   	 */
> -	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
>   	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
> -	PPC_BCC_SHORT(COND_GE, out);
> +	PPC_COND_BRANCH(COND_EQ, out);
>   
>   	/*
> -	 * tail_call_cnt++;
> +	 * tail_call_info++; <- Actual value of tcc here
>   	 */
>   	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 1));
> -	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
> +
> +	/*
> +	 * Before writing updated tail_call_info, distinguish if current frame
> +	 * is storing a reference to tail_call_info or actual tcc value in
> +	 * tail_call_info.
> +	 */
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
> +	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_2), MAX_TAIL_CALL_CNT));
> +	PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
> +
> +	/* First get address of tail_call_info */
> +	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), _R1, bpf_jit_stack_tailcallinfo_offset(ctx)));
> +	/* Writeback updated value to tail_call_info */
> +	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), 0));
>   
>   	/* prog = array->ptrs[index]; */
>   	EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_1), b2p_index, 8));


