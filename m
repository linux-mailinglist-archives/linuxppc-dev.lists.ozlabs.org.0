Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424441352C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 16:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDNmL03trz305b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 00:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDNlt53Rmz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 00:16:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HDNlp2lz1z9sTH;
 Tue, 21 Sep 2021 16:16:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9v6jz2QoEtml; Tue, 21 Sep 2021 16:16:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HDNlp173dz9sT9;
 Tue, 21 Sep 2021 16:16:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC6688B765;
 Tue, 21 Sep 2021 16:16:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3Ybwe-PqMqd9; Tue, 21 Sep 2021 16:16:53 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.127])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EEB68B763;
 Tue, 21 Sep 2021 16:16:51 +0200 (CEST)
Subject: Re: [PATCH v3 3/8] bpf powerpc: refactor JIT compiler code
To: Hari Bathini <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
References: <20210921132943.489732-1-hbathini@linux.ibm.com>
 <20210921132943.489732-4-hbathini@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <177ed95d-6c83-948a-81a7-4592aeb52080@csgroup.eu>
Date: Tue, 21 Sep 2021 16:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921132943.489732-4-hbathini@linux.ibm.com>
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
> Refactor powerpc LDX JITing code to simplify adding BPF_PROBE_MEM
> support.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v3:
> * Dropped ST(X) JITing coderefactoring and ensured the changes are
>    minimal and relevant to BPF_PROBE_MEM support.
> * Added a default for size switch case to ensure compiler would
>    not complain.
> 
> 
>   arch/powerpc/net/bpf_jit_comp32.c | 42 ++++++++++++++++++++-----------
>   arch/powerpc/net/bpf_jit_comp64.c | 40 +++++++++++++++++++----------
>   2 files changed, 55 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index b60b59426a24..6e4956cd52e7 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -282,6 +282,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		u32 src_reg = bpf_to_ppc(ctx, insn[i].src_reg);
>   		u32 src_reg_h = src_reg - 1;
>   		u32 tmp_reg = bpf_to_ppc(ctx, TMP_REG);
> +		u32 size = BPF_SIZE(code);
>   		s16 off = insn[i].off;
>   		s32 imm = insn[i].imm;
>   		bool func_addr_fixed;
> @@ -810,23 +811,36 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		 * BPF_LDX
>   		 */
>   		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
> -			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> -			if (!fp->aux->verifier_zext)
> -				EMIT(PPC_RAW_LI(dst_reg_h, 0));
> -			break;
> +			fallthrough;

I know I commented to add 'fallthrough' ... In fact I missinterpreted 
what I saw.


fallthrough is required only if you have code inbetween two 'case'.

When you have two following 'case' without code, you don't need 
'fallthrough' I think.

>   		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
> -			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
> -			if (!fp->aux->verifier_zext)
> -				EMIT(PPC_RAW_LI(dst_reg_h, 0));
> -			break;
> +			fallthrough;
>   		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
> -			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
> -			if (!fp->aux->verifier_zext)
> -				EMIT(PPC_RAW_LI(dst_reg_h, 0));
> -			break;
> +			fallthrough;
>   		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
> -			EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
> -			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
> +			switch (size) {
> +			case BPF_B:
> +				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_H:
> +				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_W:
> +				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_DW:
> +				EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
> +				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
> +				break;
> +			/*
> +			 * With size not being an enum and BPF_B/H/W/DW being macros, ensure no
> +			 * compiler warning/error by adding a default case that never reaches.
> +			 */
> +			default:
> +				break;
> +			}
> +
> +			if (size != BPF_DW && !fp->aux->verifier_zext)
> +				EMIT(PPC_RAW_LI(dst_reg_h, 0));
>   			break;
>   
>   		/*
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 2a87da50d9a4..991eb43d4cd2 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -285,6 +285,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		u32 code = insn[i].code;
>   		u32 dst_reg = b2p[insn[i].dst_reg];
>   		u32 src_reg = b2p[insn[i].src_reg];
> +		u32 size = BPF_SIZE(code);
>   		s16 off = insn[i].off;
>   		s32 imm = insn[i].imm;
>   		bool func_addr_fixed;
> @@ -716,25 +717,38 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>   		 */
>   		/* dst = *(u8 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_B:
> -			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> -			if (insn_is_zext(&insn[i + 1]))
> -				addrs[++i] = ctx->idx * 4;
> -			break;
> +			fallthrough;
>   		/* dst = *(u16 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_H:
> -			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
> -			if (insn_is_zext(&insn[i + 1]))
> -				addrs[++i] = ctx->idx * 4;
> -			break;
> +			fallthrough;
>   		/* dst = *(u32 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_W:
> -			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
> -			if (insn_is_zext(&insn[i + 1]))
> -				addrs[++i] = ctx->idx * 4;
> -			break;
> +			fallthrough;
>   		/* dst = *(u64 *)(ul) (src + off) */
>   		case BPF_LDX | BPF_MEM | BPF_DW:
> -			PPC_BPF_LL(dst_reg, src_reg, off);
> +			switch (size) {
> +			case BPF_B:
> +				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_H:
> +				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_W:
> +				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
> +				break;
> +			case BPF_DW:
> +				PPC_BPF_LL(dst_reg, src_reg, off);
> +				break;
> +			/*
> +			 * With size not being an enum and BPF_B/H/W/DW being macros, ensure no
> +			 * compiler warning/error by adding a default case that never reaches.
> +			 */
> +			default:
> +				break;
> +			}
> +
> +			if (size != BPF_DW && insn_is_zext(&insn[i + 1]))
> +				addrs[++i] = ctx->idx * 4;
>   			break;
>   
>   		/*
> 
