Return-Path: <linuxppc-dev+bounces-10647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C729B1B2C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 13:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxBZP5MdNz3069;
	Tue,  5 Aug 2025 21:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754394637;
	cv=none; b=ArGpz9NuKNKeRVgu4dJYCHs4u6f2IJuQ8ge6TpF9BqaGzJnnSctQrM7Ii05gte0xu/svV7onBRkmmAp7+1AtNVvDgoOFjX/AFO7r+zPeXNiZkoVhzmiI8ioQUr+6y0nVASGLXOsYt2MWk2sFvZHKtwlaFFf//Py+v6uMUDEITnkY4VlYVMrEwC1NG+/E36nyyXaZ0TdNBzTbFh8IM/fQsQhpOj+pdoo7+MxanbMcGZoqoV7cxBTQw5ed1Exhk5A4dWJbIpnjE+Hw11bJ13U01SqIe2OFiDKBlUOqW/w6+s5xJQS1BUnpnW+MsErbIWkbXayx6Xwymck4jgeDNjBR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754394637; c=relaxed/relaxed;
	bh=0XegkD5Rd5Nq6xn48Zh63K19hcHMe+xuFfJJ0ywcfIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWdvJafPnj9OQJ1nFqb0aQyV19aBndOC9jwtF4zxOaa4m9lVvWMVXvMHU/JnA+KiovKB70o7msioJ3uGRn6eP6pvdMvA+fdvbxqeoX+fHmizSamWI0HIlpmnQun89/1LKGNAd0eLAMicYffk5mlmygqP7SpSliaJihGT95vi5MnV4vp/BNxVNo/nqPnMHhD2g4Z43ig/jzJtY44DDS5QfnN7bfco3K4KUtfjzCQby0LDxHilQP751xpPlngXtlzKcGrrsQxIt6YU5MGoi0rkM9wYWDz7xc6ael7/pHc3gDk80LZSp6kVIccDqOaOXufU2fp4cK/JWq5BPF3tuvtkbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxBZN6cPWz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 21:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx4mh5xdKz9snj;
	Tue,  5 Aug 2025 09:29:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 223RPuL6PMvc; Tue,  5 Aug 2025 09:29:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx4mh57Wpz9slR;
	Tue,  5 Aug 2025 09:29:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A64AA8B765;
	Tue,  5 Aug 2025 09:29:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9rErELeUWBy6; Tue,  5 Aug 2025 09:29:08 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A2B08B763;
	Tue,  5 Aug 2025 09:29:07 +0200 (CEST)
Message-ID: <bc6ef2d1-da06-4b29-a0ec-67549074bc0b@csgroup.eu>
Date: Tue, 5 Aug 2025 09:29:07 +0200
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
Subject: Re: [bpf-next 3/6] bpf,powerpc: Implement bpf_addr_space_cast
 instruction
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
 <20250805062747.3479221-4-skb99@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250805062747.3479221-4-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
> LLVM generates bpf_addr_space_cast instruction while translating
> pointers between native (zero) address space and
> __attribute__((address_space(N))). The addr_space=0 is reserved as
> bpf_arena address space.
> 
> rY = addr_space_cast(rX, 0, 1) is processed by the verifier and
> converted to normal 32-bit move: wX = wY.
> 
> rY = addr_space_cast(rX, 1, 0) : used to convert a bpf arena pointer to
> a pointer in the userspace vma. This has to be converted by the JIT.
> 
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  1 +
>   arch/powerpc/net/bpf_jit_comp.c   |  6 ++++++
>   arch/powerpc/net/bpf_jit_comp64.c | 11 +++++++++++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 2d095a873305..748e30e8b5b4 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -165,6 +165,7 @@ struct codegen_context {
>   	unsigned int exentry_idx;
>   	unsigned int alt_exit_addr;
>   	u64 arena_vm_start;
> +	u64 user_vm_start;
>   };
>   
>   #define bpf_to_ppc(r)	(ctx->b2p[r])
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 35bfdf4d8785..2b3f90930c27 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -205,6 +205,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>   	/* Make sure that the stack is quadword aligned. */
>   	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
>   	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
> +	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
>   
>   	/* Scouting faux-generate pass 0 */
>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
> @@ -441,6 +442,11 @@ bool bpf_jit_supports_kfunc_call(void)
>   	return true;
>   }
>   
> +bool bpf_jit_supports_arena(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> +
>   bool bpf_jit_supports_far_kfunc_call(void)
>   {
>   	return IS_ENABLED(CONFIG_PPC64);
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 16e62766c757..d4fe4dacf2d6 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -812,6 +812,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		 */
>   		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
>   		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
> +
> +			if (insn_is_cast_user(&insn[i])) {
> +				EMIT(PPC_RAW_RLDICL(tmp1_reg, src_reg, 0, 32));

Define and use PPC_RAW_RLDICL_DOT to avoid the CMPDI below.

> +				PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));
> +				EMIT(PPC_RAW_CMPDI(tmp1_reg, 0));
> +				PPC_BCC_SHORT(COND_EQ, (ctx->idx + 2) * 4);
> +				EMIT(PPC_RAW_OR(tmp1_reg, dst_reg, tmp1_reg));
> +				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
> +				break;
> +			}
> +
>   			if (imm == 1) {
>   				/* special mov32 for zext */
>   				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));


