Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD240FE43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 18:58:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HB0Wy0fyWz2ywd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 02:58:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HB0WW5knGz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 02:57:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HB0WS0Bk0z9sTL;
 Fri, 17 Sep 2021 18:57:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-t8XLaWNuNY; Fri, 17 Sep 2021 18:57:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HB0WR6B2dz9sT0;
 Fri, 17 Sep 2021 18:57:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB3DE8B799;
 Fri, 17 Sep 2021 18:57:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TA_mV7fAT1MU; Fri, 17 Sep 2021 18:57:55 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 975A58B768;
 Fri, 17 Sep 2021 18:57:54 +0200 (CEST)
Subject: Re: [PATCH v2 8/8] bpf ppc32: Add addr > TASK_SIZE_MAX explicit check
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210917153047.177141-1-hbathini@linux.ibm.com>
 <20210917153047.177141-9-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cc61ff09-dd94-64d1-7c8b-4b628c1e8de2@csgroup.eu>
Date: Fri, 17 Sep 2021 18:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917153047.177141-9-hbathini@linux.ibm.com>
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/09/2021 à 17:30, Hari Bathini a écrit :
> With KUAP enabled, any kernel code which wants to access userspace
> needs to be surrounded by disable-enable KUAP. But that is not
> happening for BPF_PROBE_MEM load instruction. Though PPC32 does not
> support read protection, considering the fact that PTR_TO_BTF_ID
> (which uses BPF_PROBE_MEM mode) could either be a valid kernel pointer
> or NULL but should never be a pointer to userspace address, execute
> BPF_PROBE_MEM load only if addr > TASK_SIZE_MAX, otherwise set
> dst_reg=0 and move on.

Same comment as patch 6.

> 
> This will catch NULL, valid or invalid userspace pointers. Only bad
> kernel pointer will be handled by BPF exception table.
> 
> [Alexei suggested for x86]
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v2:
> * New patch to handle bad userspace pointers on PPC32.
> 
> 
>   arch/powerpc/net/bpf_jit_comp32.c | 39 +++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index c6262289dcc4..faa8047fcf4a 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -821,6 +821,45 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u64 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_DW:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
> +			/*
> +			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
> +			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
> +			 * load only if addr > TASK_SIZE_MAX, otherwise set dst_reg=0 and move on.
> +			 */
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				bool extra_insn_needed = false;
> +				unsigned int adjusted_idx;
> +
> +				/*
> +				 * For BPF_DW case, "li reg_h,0" would be needed when
> +				 * !fp->aux->verifier_zext. Adjust conditional branch'ing
> +				 * address accordingly.
> +				 */
> +				if ((size == BPF_DW) && !fp->aux->verifier_zext)
> +					extra_insn_needed = true;

Don't make it too complicated. That's a fallback that should never 
happen, no need to optimise. You can put that instruction all the time 
(or put a NOP) and keep the jumps always the same.

> +
> +				/*
> +				 * Need to jump two instructions instead of one for BPF_DW case
> +				 * as there are two load instructions for dst_reg_h & dst_reg
> +				 * respectively.
> +				 */
> +				adjusted_idx = (size == BPF_DW) ? 1 : 0;

Same comment as patch 6, drop adjusted_idx and do an if/else directly 
for the PPC_JMP.

> +
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG], src_reg, off));
> +				PPC_LI32(_R0, TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLW(b2p[TMP_REG], _R0));
> +				PPC_BCC(COND_GT, (ctx->idx + 4 + (extra_insn_needed ? 1 : 0)) * 4);
> +				EMIT(PPC_RAW_LI(dst_reg, 0));
> +				/*
> +				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
> +				 * if necessary. So, jump there insted of emitting an
> +				 * additional "li reg_h,0" instruction.
> +				 */
> +				if (extra_insn_needed)
> +					EMIT(PPC_RAW_LI(dst_reg_h, 0));
> +				PPC_JMP((ctx->idx + 2 + adjusted_idx) * 4);
> +			}
> +
>   			switch (size) {
>   			case BPF_B:
>   				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> 
