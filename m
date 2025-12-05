Return-Path: <linuxppc-dev+bounces-14651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC3CA7E05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 15:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCjB1bYQz2xrk;
	Sat, 06 Dec 2025 01:01:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764943294;
	cv=none; b=FAb5HOMuo/tnnWMmtAJkCcJQbCnyFqdazUbkj4M2vInFXFq5gBWeIuAPY81FMqIUY0NUIquzCKbh2Wge9RtbbKInI3abD4KHSLr2Oea+c+fNPiRo3uOoLqim9ShYt4X8iFeXetniYZ1Hjxk6Fq2DGzOJjT/F+0dvMaye84eQ0n9umOYQrBUsxaisuyOuoYzbJzxJRiuBq3K3Q7+TzEc1PFzhPpuFyF04rFO5t3o8ibTmtsxluYku2Es5Lx3NkInem+0ec6QwX3mJ8OJP32nkw7THXz3zfPrZslhIw4G2axcWHpjbJZV29L+GlUyld3nf43KuiF/YsAAZ+vmg2H899g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764943294; c=relaxed/relaxed;
	bh=2Ofd1u2v8csF5qiWqr2Ez4YDbmnVD+zIlcrT0RswdoE=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=h7/JJkeQ4dKt7W4FjeWr8DD73+celJ/6UKDihye1u+R6TWyUC9JkNb98M8dAG9jlWsvDAqSrCkw8fDINbaAqcnBNooiKuu9D5hSJa1PxSnRY5zoeVXvFARJ1kioFbEX/fOuwX/pswTS/NPiiW4aHT8sbKnqOaHJZEM1SukhVXUQk4kn/SmO1lxDNaWmhoYCfmz2eJjla2Cz+PKP+Ib2VLFXXYs0jz4cXyF5yJEaQ1G+0KAg8KB0+zeBf3Nqr/JxYjEEoMwiCGyF9zmg9JEL+iGQeNPWTpT3gdOSOCKTrucgx2c5f8FODQfN4/wp4pRD6KVDRJQ1vPR85selNSNfPvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VyDLLfHv; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VyDLLfHv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCj91HYBz2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 01:01:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78A864417E;
	Fri,  5 Dec 2025 14:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C877C4CEF1;
	Fri,  5 Dec 2025 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943289;
	bh=TrAgTSCpSKLsxNjx4lejjyOcT5oTXu93a4+3+YTmZ3w=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=VyDLLfHvRoVuPjT70NTIft3b3xSkl+nI6nikeo3MyRxk6zRaNPXlNBKx6Wz6WBAHc
	 Zkk5yZZCTPhHBbMq6CG/aPlmM14FHSik+eIpZLtil7LtvDc4tNtYkmiR/WsK8xylI6
	 eUQQO6/l5pZQArBOMRHQTaUktho4y8UCpIJdih7wkXBc8Fo5W+/jE2GutZJDp3+6mu
	 kudUyP63pxf42kOpdfCd1o6oiIxP2r9dNiAzxbTV5AoJPYiTBI2OmnZPOMNbAwRZY8
	 e1JgXAEyT/SJ7nAPf5X2oqQFhplzBWf8D8KozHFyV93+IlDFJ1t7CJnhoP/IA3PrDG
	 gypy4Cv4CLZJQ==
Content-Type: multipart/mixed; boundary="===============8834443675323528757=="
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
Message-Id: <cc13dfdbbcdde12aeebc6970e354b8dbbb81454f063a7861e54fbde1b510dc06@mail.kernel.org>
In-Reply-To: <1957532cd4b87b450a2efc0e9d732f448bcf9706.1764930425.git.skb99@linux.ibm.com>
References: <1957532cd4b87b450a2efc0e9d732f448bcf9706.1764930425.git.skb99@linux.ibm.com>
Subject: Re: [PATCH bpf-next v3 1/2] powerpc64/bpf: Support internal-only MOV instruction to resolve per-CPU addrs
From: bot+bpf-ci@kernel.org
To: skb99@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  5 Dec 2025 14:01:27 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============8834443675323528757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 5e976730b2f5..d53e9cd7563f 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 1fe37128c876..816f9d7d9e5d 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -918,6 +918,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  	case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
>  	case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
>
> +		if (insn_is_mov_percpu_addr(&insn[i])) {
> +			if (IS_ENABLED(CONFIG_SMP)) {
> +				EMIT(PPC_RAW_LD(tmp1_reg, _R13, offsetof(struct paca_struct, data_offset)));
> +				EMIT(PPC_RAW_ADD(dst_reg, src_reg, tmp1_reg));
> +			} else if (src_reg != dst_reg) {
> +				EMIT(PPC_RAW_MR(dst_reg, src_reg));
> +			}
> +		}
> +

Does this code need a break statement here? After handling the per-CPU
MOV instruction, execution falls through to the subsequent MOV handling
code. In the common case where dst_reg != src_reg with CONFIG_SMP
enabled, the code first emits ADD to compute the per-CPU address in
dst_reg, but then continues to the final else-if in this case statement
which emits MR dst_reg, src_reg, overwriting the computed address.

Other architectures (x86 and arm64) use break after their per-CPU
instruction handling in bpf_jit_build_body()->BPF_MOV case.

>  		if (insn_is_cast_user(&insn[i])) {
>  			EMIT(PPC_RAW_RLDICL_DOT(tmp1_reg, src_reg, 0, 32));
>  			PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));
>  			PPC_BCC_SHORT(COND_EQ, (ctx->idx + 2) * 4);
>  			EMIT(PPC_RAW_OR(tmp1_reg, dst_reg, tmp1_reg));
>  			EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
>  			break;
>  		}
>
>  		if (imm == 1) {
>  			/* special mov32 for zext */
>  			EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
>  			break;
>  		} else if (off == 8) {
>  			EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
>  		} else if (off == 16) {
>  			EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
>  		} else if (off == 32) {
>  			EMIT(PPC_RAW_EXTSW(dst_reg, src_reg));
>  		} else if (dst_reg != src_reg)
                        ^^^^
			This condition can be true for per-CPU instructions
			(which have off == -1), causing the computed per-CPU
			address to be overwritten with src_reg.

>  			EMIT(PPC_RAW_MR(dst_reg, src_reg));
>  		goto bpf_alu32_trunc;


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19964922727

--===============8834443675323528757==--

