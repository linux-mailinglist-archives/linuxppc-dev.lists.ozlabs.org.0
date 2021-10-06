Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9956423747
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 06:56:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPMbl5Dcbz2yPV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 15:56:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPMbK5LVwz2yKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 15:55:40 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPMbG03prz9sVL;
 Wed,  6 Oct 2021 06:55:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDM3FMpnLmzo; Wed,  6 Oct 2021 06:55:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPMbF6MC4z9sVK;
 Wed,  6 Oct 2021 06:55:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C2DA78B765;
 Wed,  6 Oct 2021 06:55:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MB898tySZN-z; Wed,  6 Oct 2021 06:55:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F202F8B763;
 Wed,  6 Oct 2021 06:55:36 +0200 (CEST)
Subject: Re: [PATCH v2 04/10] powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Song Liu <songliubraving@fb.com>
References: <cover.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
 <fc4b1276eb10761fd7ce0814c8dd089da2815251.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <90494652-7551-7ecb-e44d-a2adbb6a1afe@csgroup.eu>
Date: Wed, 6 Oct 2021 06:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc4b1276eb10761fd7ce0814c8dd089da2815251.1633464148.git.naveen.n.rao@linux.vnet.ibm.com>
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



Le 05/10/2021 à 22:25, Naveen N. Rao a écrit :
> We aren't handling subtraction involving an immediate value of
> 0x80000000 properly. Fix the same.
> 
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> Changelog:
> - Split up BPF_ADD and BPF_SUB cases per Christophe's comments
> 
>   arch/powerpc/net/bpf_jit_comp64.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index d67f6d62e2e1ff..6626e6c17d4ed2 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -330,18 +330,25 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));
>   			goto bpf_alu32_trunc;
>   		case BPF_ALU | BPF_ADD | BPF_K: /* (u32) dst += (u32) imm */
> -		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
>   		case BPF_ALU64 | BPF_ADD | BPF_K: /* dst += imm */
> +			if (!imm) {
> +				goto bpf_alu32_trunc;
> +			} else if (imm >= -32768 && imm < 32768) {
> +				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
> +			} else {
> +				PPC_LI32(b2p[TMP_REG_1], imm);
> +				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
> +			}
> +			goto bpf_alu32_trunc;
> +		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
>   		case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -= imm */
> -			if (BPF_OP(code) == BPF_SUB)
> -				imm = -imm;
> -			if (imm) {
> -				if (imm >= -32768 && imm < 32768)
> -					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
> -				else {
> -					PPC_LI32(b2p[TMP_REG_1], imm);
> -					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
> -				}
> +			if (!imm) {
> +				goto bpf_alu32_trunc;
> +			} else if (imm > -32768 && imm < 32768) {

Why do you exclude imm == 32768 ?


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> +				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(-imm)));
> +			} else {
> +				PPC_LI32(b2p[TMP_REG_1], imm);
> +				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
>   			}
>   			goto bpf_alu32_trunc;
>   		case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
> 
