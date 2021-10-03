Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68A420090
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:55:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMbjr1qVtz2yPK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 18:55:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMbjP13Rhz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 18:54:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HMbjD08vbz9sVT;
 Sun,  3 Oct 2021 09:54:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcCDKZRFI_SV; Sun,  3 Oct 2021 09:54:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HMbjC6895z9sVS;
 Sun,  3 Oct 2021 09:54:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD1338B76D;
 Sun,  3 Oct 2021 09:54:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R6Tmec_Vzw1m; Sun,  3 Oct 2021 09:54:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po18950.idsi0.si.c-s.fr
 [192.168.203.204])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01B908B765;
 Sun,  3 Oct 2021 09:54:38 +0200 (CEST)
Subject: Re: [PATCH 2/9] powerpc/bpf: Validate branch ranges
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <d4a44c52712468b805cbf5c244b3c9ba0f802ab8.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <213cac08-b0d2-447f-8448-ab31cc7b1d47@csgroup.eu>
Date: Sun, 3 Oct 2021 09:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d4a44c52712468b805cbf5c244b3c9ba0f802ab8.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/10/2021 à 23:14, Naveen N. Rao a écrit :
> Add checks to ensure that we never emit branch instructions with
> truncated branch offsets.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        | 26 ++++++++++++++++++++------
>   arch/powerpc/net/bpf_jit_comp.c   |  6 +++++-
>   arch/powerpc/net/bpf_jit_comp32.c |  8 ++++++--
>   arch/powerpc/net/bpf_jit_comp64.c |  8 ++++++--
>   4 files changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 935ea95b66359e..7e9b978b768ed9 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -24,16 +24,30 @@
>   #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
>   
>   /* Long jump; (unconditional 'branch') */
> -#define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
> -				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
> +#define PPC_JMP(dest)							      \
> +	do {								      \
> +		long offset = (long)(dest) - (ctx->idx * 4);		      \
> +		if (!is_offset_in_branch_range(offset)) {		      \
> +			pr_err_ratelimited("Branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);			\

Does it really deserves a KERN_ERR ?
Isn't that something that can trigger with a userland request ?

> +			return -ERANGE;					      \
> +		}							      \
> +		EMIT(PPC_INST_BRANCH | (offset & 0x03fffffc));		      \
> +	} while (0)
> +
>   /* blr; (unconditional 'branch' with link) to absolute address */
>   #define PPC_BL_ABS(dest)	EMIT(PPC_INST_BL |			      \
>   				     (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
>   /* "cond" here covers BO:BI fields. */
> -#define PPC_BCC_SHORT(cond, dest)	EMIT(PPC_INST_BRANCH_COND |	      \
> -					     (((cond) & 0x3ff) << 16) |	      \
> -					     (((dest) - (ctx->idx * 4)) &     \
> -					      0xfffc))
> +#define PPC_BCC_SHORT(cond, dest)					      \
> +	do {								      \
> +		long offset = (long)(dest) - (ctx->idx * 4);		      \
> +		if (!is_offset_in_cond_branch_range(offset)) {		      \
> +			pr_err_ratelimited("Conditional branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);		\

Same

> +			return -ERANGE;					      \
> +		}							      \
> +		EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));					\
> +	} while (0)
> +
>   /* Sign-extended 32-bit immediate load */
>   #define PPC_LI32(d, i)		do {					      \
>   		if ((int)(uintptr_t)(i) >= -32768 &&			      \
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 53aefee3fe70be..fcbf7a917c566e 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -210,7 +210,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   		/* Now build the prologue, body code & epilogue for real. */
>   		cgctx.idx = 0;
>   		bpf_jit_build_prologue(code_base, &cgctx);
> -		bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass);
> +		if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass)) {
> +			bpf_jit_binary_free(bpf_hdr);
> +			fp = org_fp;
> +			goto out_addrs;
> +		}
>   		bpf_jit_build_epilogue(code_base, &cgctx);
>   
>   		if (bpf_jit_enable > 1)
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index beb12cbc8c2994..a74d52204f8da2 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -200,7 +200,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
>   	}
>   }
>   
> -static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
> +static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
>   {
>   	/*
>   	 * By now, the eBPF program has already setup parameters in r3-r6
> @@ -261,7 +261,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
>   	bpf_jit_emit_common_epilogue(image, ctx);
>   
>   	EMIT(PPC_RAW_BCTR());
> +
>   	/* out: */
> +	return 0;
>   }
>   
>   /* Assemble the body code between the prologue & epilogue */
> @@ -1090,7 +1092,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		 */
>   		case BPF_JMP | BPF_TAIL_CALL:
>   			ctx->seen |= SEEN_TAILCALL;
> -			bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +			if (ret < 0)
> +				return ret;
>   			break;
>   
>   		default:
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index b87a63dba9c8fb..f06c62089b1457 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -206,7 +206,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
>   	EMIT(PPC_RAW_BCTRL());
>   }
>   
> -static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
> +static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
>   {
>   	/*
>   	 * By now, the eBPF program has already setup parameters in r3, r4 and r5
> @@ -267,7 +267,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
>   	bpf_jit_emit_common_epilogue(image, ctx);
>   
>   	EMIT(PPC_RAW_BCTR());
> +
>   	/* out: */
> +	return 0;
>   }
>   
>   /* Assemble the body code between the prologue & epilogue */
> @@ -993,7 +995,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		 */
>   		case BPF_JMP | BPF_TAIL_CALL:
>   			ctx->seen |= SEEN_TAILCALL;
> -			bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +			ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +			if (ret < 0)
> +				return ret;
>   			break;
>   
>   		default:
> 
