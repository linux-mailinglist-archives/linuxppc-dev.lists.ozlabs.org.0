Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44E41354A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 16:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDP0K4yqJz303F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 00:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDNzv1GC6z2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 00:27:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HDNzn6y2Kz9sT9;
 Tue, 21 Sep 2021 16:27:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEkzd5toiTVu; Tue, 21 Sep 2021 16:27:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HDNzl2k51z9sTR;
 Tue, 21 Sep 2021 16:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48CC18B765;
 Tue, 21 Sep 2021 16:27:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KS9e_7RDtzCp; Tue, 21 Sep 2021 16:27:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.127])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2715B8B763;
 Tue, 21 Sep 2021 16:27:14 +0200 (CEST)
Subject: Re: [PATCH v3 8/8] bpf ppc32: Access only if addr is kernel address
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210921132943.489732-1-hbathini@linux.ibm.com>
 <20210921132943.489732-9-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f35f8859-5c6d-47ca-72ce-c1710171aafa@csgroup.eu>
Date: Tue, 21 Sep 2021 16:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921132943.489732-9-hbathini@linux.ibm.com>
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



Le 21/09/2021 à 15:29, Hari Bathini a écrit :
> With KUAP enabled, any kernel code which wants to access userspace
> needs to be surrounded by disable-enable KUAP. But that is not
> happening for BPF_PROBE_MEM load instruction. Though PPC32 does not
> support read protection, considering the fact that PTR_TO_BTF_ID
> (which uses BPF_PROBE_MEM mode) could either be a valid kernel pointer
> or NULL but should never be a pointer to userspace address, execute
> BPF_PROBE_MEM load only if addr is kernel address, otherwise set
> dst_reg=0 and move on.
> 
> This will catch NULL, valid or invalid userspace pointers. Only bad
> kernel pointer will be handled by BPF exception table.
> 
> [Alexei suggested for x86]
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v3:
> * Updated jump for PPC_BCC to always be the same while emitting
>    a NOP instruction when needed.
> 
> 
>   arch/powerpc/net/bpf_jit_comp32.c | 35 +++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 1239643f532c..59849e1230d2 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -825,6 +825,41 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
>   			fallthrough;
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
> +			/*
> +			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
> +			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
> +			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
> +			 * set dst_reg=0 and move on.
> +			 */
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG], src_reg, off));
> +				PPC_LI32(_R0, TASK_SIZE);
> +				EMIT(PPC_RAW_CMPLW(b2p[TMP_REG], _R0));

You may drop the ADDI and do:

			PPC_LI32(_R0, TASK_SIZE - off);
			EMIT(PPC_RAW_CMPLW(src_reg, _R0));


It will likely be the same number of instructions because now the 
PPC_LI32 will generate two instruction, but it avoids the use of TMP_REG.


> +				PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
> +				EMIT(PPC_RAW_LI(dst_reg, 0));
> +				/*
> +				 * For BPF_DW case, "li reg_h,0" would be needed when
> +				 * !fp->aux->verifier_zext. Emit NOP otherwise.
> +				 *
> +				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
> +				 * if necessary. So, jump there insted of emitting an
> +				 * additional "li reg_h,0" instruction.
> +				 */
> +				if (size == BPF_DW && !fp->aux->verifier_zext)
> +					EMIT(PPC_RAW_LI(dst_reg_h, 0));
> +				else
> +					EMIT(PPC_RAW_NOP());
> +				/*
> +				 * Need to jump two instructions instead of one for BPF_DW case
> +				 * as there are two load instructions for dst_reg_h & dst_reg
> +				 * respectively.
> +				 */
> +				if (size == BPF_DW)
> +					PPC_JMP((ctx->idx + 3) * 4);
> +				else
> +					PPC_JMP((ctx->idx + 2) * 4);
> +			}
> +
>   			switch (size) {
>   			case BPF_B:
>   				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> 
