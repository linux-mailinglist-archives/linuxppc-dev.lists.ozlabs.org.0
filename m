Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF33BC8E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJykS57v2z3bXP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJyk65w07z2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:01:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GJyk209BMzBBw2;
 Tue,  6 Jul 2021 12:00:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHKQQz_Am4dH; Tue,  6 Jul 2021 12:00:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GJyk16G08zBBv0;
 Tue,  6 Jul 2021 12:00:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76A2E8B79C;
 Tue,  6 Jul 2021 12:00:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JB5RtjTJp_qu; Tue,  6 Jul 2021 12:00:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 48C198B794;
 Tue,  6 Jul 2021 12:00:51 +0200 (CEST)
Subject: Re: [PATCH 4/4] bpf powerpc: Add addr > TASK_SIZE_MAX explicit check
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210706073211.349889-1-ravi.bangoria@linux.ibm.com>
 <20210706073211.349889-5-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <74f55f12-c7da-a06d-c3a5-6869b907e3f6@csgroup.eu>
Date: Tue, 6 Jul 2021 12:00:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706073211.349889-5-ravi.bangoria@linux.ibm.com>
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/07/2021 à 09:32, Ravi Bangoria a écrit :
> On PowerPC with KUAP enabled, any kernel code which wants to
> access userspace needs to be surrounded by disable-enable KUAP.
> But that is not happening for BPF_PROBE_MEM load instruction.
> So, when BPF program tries to access invalid userspace address,
> page-fault handler considers it as bad KUAP fault:
> 
>    Kernel attempted to read user page (d0000000) - exploit attempt? (uid: 0)
> 
> Considering the fact that PTR_TO_BTF_ID (which uses BPF_PROBE_MEM
> mode) could either be a valid kernel pointer or NULL but should
> never be a pointer to userspace address, execute BPF_PROBE_MEM load
> only if addr > TASK_SIZE_MAX, otherwise set dst_reg=0 and move on.
> 
> This will catch NULL, valid or invalid userspace pointers. Only bad
> kernel pointer will be handled by BPF exception table.
> 
> [Alexei suggested for x86]
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 38 +++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 1884c6dca89a..46becae76210 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -753,6 +753,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u8 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_B:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));

Prefered way to clear a register is to do 'li reg, 0'

> +				PPC_JMP((ctx->idx + 2) * 4);
> +			}
>   			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
>   			if (insn_is_zext(&insn[i + 1]))
>   				addrs[++i] = ctx->idx * 4;
> @@ -763,6 +771,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u16 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_H:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
> +				PPC_JMP((ctx->idx + 2) * 4);
> +			}

That code seems strictly identical to the previous one and the next one.
Can you refactor in a function ?

>   			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
>   			if (insn_is_zext(&insn[i + 1]))
>   				addrs[++i] = ctx->idx * 4;
> @@ -773,6 +789,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u32 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_W:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
> +				PPC_JMP((ctx->idx + 2) * 4);
> +			}
>   			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
>   			if (insn_is_zext(&insn[i + 1]))
>   				addrs[++i] = ctx->idx * 4;
> @@ -783,6 +807,20 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		/* dst = *(u64 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_DW:
>   		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
> +				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
> +				PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
> +				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
> +				if (off % 4)

That test is worth a comment.

And I'd prefer

	if (off & 3) {
		PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
		EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
		PPC_JMP((ctx->idx + 3) * 4);
	} else {
		PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
		EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
		PPC_JMP((ctx->idx + 2) * 4);
	}

> +					PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
> +				else
> +					PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
> +				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));

Use PPC_RAW_LI(dst_reg, 0);

> +				if (off % 4)
> +					PPC_JMP((ctx->idx + 3) * 4);
> +				else
> +					PPC_JMP((ctx->idx + 2) * 4);
> +			}
>   			PPC_BPF_LL(dst_reg, src_reg, off);
>   			ret = add_extable_entry(fp, image, pass, code, ctx, dst_reg);
>   			if (ret)
> 
