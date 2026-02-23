Return-Path: <linuxppc-dev+bounces-17040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CZiOr81nGmiBQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 12:10:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F2175507
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 12:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKJ7H5VRcz2yFc;
	Mon, 23 Feb 2026 22:10:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771845051;
	cv=none; b=N1/Jy6H7vERzrOmbAxewZXXV6qVbEKYTFBXvQ2+KU9dcyZc8SVzEbNMZz7hBuEiGIBM7iGyzpi6+ID2CVhKks/YThktangEs3t/3X/B7tNNGAtJC17+SO5P/aTOM7AAmwQF/C5B4RjzUOz/tppSGo4wcXTvPNOLCEysR9OQKUDM1dxdPBIHMSgzrBW6Xsf/ImEdih0nZFIlon1x8XapcDEKBMTogGRnO9R/jwXSRErRY3E+tBK597BV36T4pWJQwbbc5etFDzYIiQd0bxuDgzdfKofWvsYYGjxCxYS3iTyvVoMUS3t8x4OUHW83GW22yQ/lbW7LOBiGCIfbgSwUm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771845051; c=relaxed/relaxed;
	bh=JY0xG/JSklNw+nICmG7kSiujxNtulWA2JXpBUc/xhLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHQGLnd+L9ZKFVDAWrcPoNnEQLK7TjiLfp+K8GhpAlgbJyIf1xVEyIsy2EYnHt10reSgMWLlOz8Asi73ePDj5lne0DErR9x83996N2qvjW2W2DN+juOGJ0+MZX3t3HXzzzHNfnvShCHMPWMH0Za8WUCxJQ8Zn2xlGKH7nLn5L7qydzIgBsYiZdJKUkct/lj3Sg6exghzjBdr2YU5dRTorE37J236hJiFd1Sjp9uKTe4NOSv90ikTGkWgsTBXC/JgRbPv6VMo0s2MhreopstlAWLsmT/9YlyjzNptAAGOUrEqxt7YanZrwKH9RJlN20nyM3GlMoKb/kltzfq2VDSVDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EE6WHHt+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EE6WHHt+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKJ7G5SMvz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 22:10:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87CBE442A6;
	Mon, 23 Feb 2026 11:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F6CC116C6;
	Mon, 23 Feb 2026 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771845048;
	bh=FsKgtEnl0LkI8xPm0wa55X6azGAgdkP8hsP2D/3AvFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EE6WHHt+ogtBrVn95v2zV3TzxfQpsmQHkop4SsALngr+/5KRYF4NNtLGMd2mHkjJZ
	 9gkur3A8Oyx24UpqCkoeDBI5iW9ZF79NkGkDbbYP2kvf1B0d6l+/ShAsS+3aGJv1wU
	 NaD2DR2uRoisgf1ji/xs+Zz+shNRZjl7kMzQU4C1WS4YrbWM2nZvNyElACy8pF1Re6
	 8fqRukj3jb4/Oht+F+SmhCv9BQieiMvYnCyfEgcpXAQPA936fE4ha6wi2W/k0EzlN+
	 d461BA3RMh3hD7VAguy1VT3Pa+sxNkYapEWx1crcdPLGJJwW/N3hbt9sLHik3anrWw
	 BCH8pR0W2URDw==
Message-ID: <665838c8-d921-403e-a45c-eefad4902209@kernel.org>
Date: Mon, 23 Feb 2026 12:10:44 +0100
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
Subject: Re: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private
 stack
To: adubey@linux.ibm.com, bpf@vger.kernel.org
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org,
 eddyz87@gmail.com, yonghong.song@linux.dev, clm@meta.com,
 ihor.solodrai@linux.dev
References: <20260216152234.36632-1-adubey@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260216152234.36632-1-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	TAGGED_FROM(0.00)[bounces-17040-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_TWELVE(0.00)[12]
X-Rspamd-Queue-Id: 873F2175507
X-Rspamd-Action: no action



Le 16/02/2026 à 16:22, adubey@linux.ibm.com a écrit :
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> Provision the private stack as a per-CPU allocation during
> bpf_int_jit_compile(). Align the stack to 16 bytes and place guard
> regions at both ends to detect runtime stack overflow and underflow.
> 
> Round the private stack size up to the nearest 16-byte boundary.
> Make each guard region 16 bytes to preserve the required overall
> 16-byte alignment. When private stack is set, skip bpf stack size
> accounting in kernel stack.
> 
> There is no stack pointer in powerpc. Stack referencing during JIT
> is done using frame pointer. Frame pointer calculation goes like:
> 
> BPF frame pointer = Priv stack allocation start address +
>                      Overflow guard +
>                      Actual stack size defined by verifier
> 
> Memory layout:
> 
> High Addr          +--------------------------------------------------+
>                     |                                                  |
>                     | 16 bytes Underflow guard (0xEB9F12345678eb9fULL) |
>                     |                                                  |
>           BPF FP -> +--------------------------------------------------+
>                     |                                                  |
>                     | Private stack - determined by verifier           |
>                     | 16-bytes aligned                                 |
>                     |                                                  |
>                     +--------------------------------------------------+
>                     |                                                  |
> Lower Addr         | 16 byte Overflow guard (0xEB9F12345678eb9fULL)   |
>                     |                                                  |
> Priv stack alloc ->+--------------------------------------------------+
> start
> 
> Update BPF_REG_FP to point to the calculated offset within the
> allocated private stack buffer. Now, BPF stack usage reference
> in the allocated private stack.
> 
> The patch is rebase over fixes by Hari:
> https://lore.kernel.org/bpf/20260216065639.1750181-1-hbathini@linux.ibm.com/T/#mf02cad9096fa4ad1f05610b1f464da1cddf7445a
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  5 +++
>   arch/powerpc/net/bpf_jit_comp.c   | 74 +++++++++++++++++++++++++++++++
>   arch/powerpc/net/bpf_jit_comp64.c | 38 +++++++++++++---
>   3 files changed, 112 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 7354e1d72f79..5a115c54e43a 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -178,8 +178,13 @@ struct codegen_context {
>   	bool is_subprog;
>   	bool exception_boundary;
>   	bool exception_cb;
> +	u64 priv_sp;

Are you sure you want a u64, not a long ?

>   };
>   
> +/* Memory size & magic-value to detect private stack overflow/underflow */
> +#define PRIV_STACK_GUARD_SZ    16
> +#define PRIV_STACK_GUARD_VAL   0xEB9F12345678eb9fULL
> +
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
>   
>   #ifdef CONFIG_PPC32
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 278e09b57560..7a78e03d482f 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -129,6 +129,39 @@ bool bpf_jit_needs_zext(void)
>   	return true;
>   }
>   
> +static void priv_stack_init_guard(void __percpu *priv_stack_ptr, int alloc_size)
> +{
> +	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
> +	u64 *stack_ptr;
> +
> +	for_each_possible_cpu(cpu) {
> +		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
> +		stack_ptr[0] = PRIV_STACK_GUARD_VAL;
> +		stack_ptr[1] = PRIV_STACK_GUARD_VAL;
> +		stack_ptr[underflow_idx] = PRIV_STACK_GUARD_VAL;
> +		stack_ptr[underflow_idx + 1] = PRIV_STACK_GUARD_VAL;
> +	}
> +}
> +
> +static void priv_stack_check_guard(void __percpu *priv_stack_ptr, int alloc_size,
> +								struct bpf_prog *fp)
> +{
> +	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
> +	u64 *stack_ptr;
> +
> +	for_each_possible_cpu(cpu) {
> +		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
> +		if (stack_ptr[0] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[1] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[underflow_idx] != PRIV_STACK_GUARD_VAL ||
> +			stack_ptr[underflow_idx + 1] != PRIV_STACK_GUARD_VAL) {
> +			pr_err("BPF private stack overflow/underflow detected for prog %sx\n",
> +			bpf_jit_get_prog_name(fp));
> +			break;
> +		}
> +	}
> +}
> +
>   struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   {
>   	u32 proglen;
> @@ -140,6 +173,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	struct codegen_context cgctx;
>   	int pass;
>   	int flen;
> +	int priv_stack_alloc_size;
> +	void __percpu *priv_stack_ptr = NULL;
>   	struct bpf_binary_header *fhdr = NULL;
>   	struct bpf_binary_header *hdr = NULL;
>   	struct bpf_prog *org_fp = fp;
> @@ -173,6 +208,25 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   		fp->aux->jit_data = jit_data;
>   	}
>   
> +	if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
> +		/*
> +		 * Allocate private stack of size equivalent to
> +		 * verifier-calculated stack size plus two memory
> +		 * guard regions to detect private stack overflow
> +		 * and underflow.
> +		 */
> +		priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
> +							2 * PRIV_STACK_GUARD_SZ;
> +		priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
> +		if (!priv_stack_ptr) {
> +			fp = org_fp;
> +			goto out_priv_stack;
> +		}
> +
> +		priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
> +		fp->aux->priv_stack_ptr = priv_stack_ptr;
> +	}
> +
>   	flen = fp->len;
>   	addrs = jit_data->addrs;
>   	if (addrs) {
> @@ -209,6 +263,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	cgctx.is_subprog = bpf_is_subprog(fp);
>   	cgctx.exception_boundary = fp->aux->exception_boundary;
>   	cgctx.exception_cb = fp->aux->exception_cb;
> +	cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;

priv_stack_ptr is a pointer, ie a long.
priv_sp is a u64, ie a long long.

This will mismatch on powerpc/32

>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -306,7 +361,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   		}
>   		bpf_prog_fill_jited_linfo(fp, addrs);
>   out_addrs:
> +		if (!image && priv_stack_ptr) {
> +			free_percpu(priv_stack_ptr);
> +			fp->aux->priv_stack_ptr = NULL;

Shouldn't those two lines be swapped ?

> +		}
>   		kfree(addrs);
> +out_priv_stack:
>   		kfree(jit_data);
>   		fp->aux->jit_data = NULL;
>   	} else {
> @@ -419,6 +479,8 @@ void bpf_jit_free(struct bpf_prog *fp)
>   	if (fp->jited) {
>   		struct powerpc_jit_data *jit_data = fp->aux->jit_data;
>   		struct bpf_binary_header *hdr;
> +		void __percpu *priv_stack_ptr;
> +		int priv_stack_alloc_size;
>   
>   		/*
>   		 * If we fail the final pass of JIT (from jit_subprogs),
> @@ -432,6 +494,13 @@ void bpf_jit_free(struct bpf_prog *fp)
>   		}
>   		hdr = bpf_jit_binary_pack_hdr(fp);
>   		bpf_jit_binary_pack_free(hdr, NULL);
> +		priv_stack_ptr = fp->aux->priv_stack_ptr;
> +		if (priv_stack_ptr) {
> +			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
> +							2 * PRIV_STACK_GUARD_SZ;
> +			priv_stack_check_guard(priv_stack_ptr, priv_stack_alloc_size, fp);
> +			free_percpu(priv_stack_ptr);
> +		}
>   		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(fp));
>   	}
>   
> @@ -453,6 +522,11 @@ bool bpf_jit_supports_kfunc_call(void)
>   	return true;
>   }
>   
> +bool bpf_jit_supports_private_stack(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   bool bpf_jit_supports_arena(void)
>   {
>   	return IS_ENABLED(CONFIG_PPC64);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 640b84409687..206ef43b4090 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -183,6 +183,20 @@ void bpf_jit_realloc_regs(struct codegen_context *ctx)
>   {
>   }
>   
> +static void emit_fp_priv_stack(u32 *image, struct codegen_context *ctx, void __percpu *ptr)
> +{
> +	/* Load percpu data offset */
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
> +			offsetof(struct paca_struct, data_offset)));
> +	PPC_LI64(bpf_to_ppc(BPF_REG_FP), (u64)ptr);
> +	/*
> +	 * Set frame pointer with percpu allocated
> +	 * buffer for private stack.
> +	 */
> +	EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
> +			bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
> +}
> +
>   /*
>    * For exception boundary & exception_cb progs:
>    *     return increased size to accommodate additional NVRs.
> @@ -197,6 +211,12 @@ static int bpf_jit_stack_size(struct codegen_context *ctx)
>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   {
>   	int i;
> +	void __percpu *priv_frame_ptr = NULL;
> +
> +	if (ctx->priv_sp) {
> +		priv_frame_ptr = (void*) ctx->priv_sp + PRIV_STACK_GUARD_SZ +
> +					round_up(ctx->stack_size, 16);
> +	}
>   
>   	/* Instruction for trampoline attach */
>   	EMIT(PPC_RAW_NOP());
> @@ -251,7 +271,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   		}
>   
>   		EMIT(PPC_RAW_STDU(_R1, _R1,
> -				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
> +			-(bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size))));
>   	}
>   
>   	/*
> @@ -307,9 +327,16 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>   	 * Exception_cb not restricted from using stack area or arena.
>   	 * Setup frame pointer to point to the bpf stack area
>   	 */
> -	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
> -		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> -			STACK_FRAME_MIN_SIZE + ctx->stack_size));
> +	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
> +		if (ctx->priv_sp && priv_frame_ptr) {
> +			/* Set up private stack pointer */
> +			emit_fp_priv_stack(image, ctx, priv_frame_ptr);
> +		} else {
> +			/* Setup frame pointer to point to the bpf stack area */
> +			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
> +				STACK_FRAME_MIN_SIZE + ctx->stack_size));
> +		}
> +	}
>   
>   	if (ctx->arena_vm_start)
>   		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
> @@ -339,7 +366,8 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
>   
>   	/* Tear down our stack frame */
>   	if (bpf_has_stack_frame(ctx)) {
> -		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + ctx->stack_size));
> +		EMIT(PPC_RAW_ADDI(_R1, _R1,
> +			bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size)));
>   
>   		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>   			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));


