Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7898C02A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 19:09:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/97oIyG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZM7T0jcXz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 03:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/97oIyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZM6j1gBYz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 03:08:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8933261CBF;
	Wed,  8 May 2024 17:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EB2C113CC;
	Wed,  8 May 2024 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715188106;
	bh=YQRZPYaCXuEct0KhtKlB1VbKYC/PdpRAyC+rY6nTboo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/97oIyGXnyHRIpjOSRt/dlWmEADUv0KWyfCU1OQsq/uY5BfiGa97FVH1KF2zm267
	 q/aQH9lwzmEmP7yR1ItHdSUx9riCFbyv+mD7XZr9Yi29G2Pnsn8q7B8FnQXAWvstbT
	 VWWhui77WaQXzE+ONkfuIoj+c7geqwH3nTM0u6rzKPSAh7KWrIoeiKihdfhhRtjOGZ
	 vDVgRYpj+GnzMm8+P4XQn1Uaks6aOe6O9nqMosogzVG0YklpSxUrFtu4qNEStCxXCn
	 xVY25FP006Nfh2kTJf0IxvUxYea0KK44u2cRljjBciWrxg+lfEs2YusVY64Y/ivp6i
	 jvfsRvjq0jU/w==
Date: Wed, 8 May 2024 22:32:26 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH bpf v2] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Message-ID: <koaryr5vyb2in2tdnrm4pds5yahfa63chcsgxgoqbudlv45alu@pi6cfiznzvjl>
References: <20240508115404.74823-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508115404.74823-1-puranjay@kernel.org>
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
Cc: Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, paulmck@kernel.org, Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>, puranjay12@gmail.com, Martin KaFai Lau <martin.lau@linux.dev>, linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 08, 2024 at 11:54:04AM GMT, Puranjay Mohan wrote:
> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
> return value to be fully ordered.
> 
> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
> BPF_CMPXCHG) return a value back so they need to be JITed to fully
> ordered operations. POWERPC currently emits relaxed operations for
> these.
> 
> We can show this by running the following litmus-test:
> 
> PPC SB+atomic_add+fetch
> 
> {
> 0:r0=x;  (* dst reg assuming offset is 0 *)
> 0:r1=2;  (* src reg *)
> 0:r2=1;
> 0:r4=y;  (* P0 writes to this, P1 reads this *)
> 0:r5=z;  (* P1 writes to this, P0 reads this *)
> 0:r6=0;
> 
> 1:r2=1;
> 1:r4=y;
> 1:r5=z;
> }
> 
> P0                      | P1            ;
> stw         r2, 0(r4)   | stw  r2,0(r5) ;
>                         |               ;
> loop:lwarx  r3, r6, r0  |               ;
> mr          r8, r3      |               ;
> add         r3, r3, r1  | sync          ;
> stwcx.      r3, r6, r0  |               ;
> bne         loop        |               ;
> mr          r1, r8      |               ;
>                         |               ;
> lwa         r7, 0(r5)   | lwa  r7,0(r4) ;
> 
> ~exists(0:r7=0 /\ 1:r7=0)
> 
> Witnesses
> Positive: 9 Negative: 3
> Condition ~exists (0:r7=0 /\ 1:r7=0)
> Observation SB+atomic_add+fetch Sometimes 3 9
> 
> This test shows that the older store in P0 is reordered with a newer
> load to a different address. Although there is a RMW operation with
> fetch between them. Adding a sync before and after RMW fixes the issue:
> 
> Witnesses
> Positive: 9 Negative: 0
> Condition ~exists (0:r7=0 /\ 1:r7=0)
> Observation SB+atomic_add+fetch Never 0 9
> 
> [1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
> [2] https://www.kernel.org/doc/Documentation/atomic_t.txt
> 
> Fixes: 65112709115f ("powerpc/bpf/64: add support for BPF_ATOMIC bitwise operations")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Thanks for reporting and fixing this.

There are actually four commits that this fixes across ppc32/ppc64:
Fixes: aea7ef8a82c0 ("powerpc/bpf/32: add support for BPF_ATOMIC bitwise operations")
Fixes: 2d9206b22743 ("powerpc/bpf/32: Add instructions for atomic_[cmp]xchg")
Fixes: dbe6e2456fb0 ("powerpc/bpf/64: add support for atomic fetch operations")
Fixes: 1e82dfaa7819 ("powerpc/bpf/64: Add instructions for atomic_[cmp]xchg")

> ---
> Changes in v1 -> v2:
> v1: https://lore.kernel.org/all/20240507175439.119467-1-puranjay@kernel.org/
> - Don't emit `sync` for non-SMP kernels as that adds unessential overhead.
> ---
>  arch/powerpc/net/bpf_jit_comp32.c | 12 ++++++++++++
>  arch/powerpc/net/bpf_jit_comp64.c | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 2f39c50ca729..0318b83f2e6a 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -853,6 +853,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  			/* Get offset into TMP_REG */
>  			EMIT(PPC_RAW_LI(tmp_reg, off));
>  			tmp_idx = ctx->idx * 4;
> +			/*
> +			 * Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
> +			 * before and after the operation.
> +			 *
> +			 * This is a requirement in the Linux Kernel Memory Model.
> +			 * See __cmpxchg_u64() in asm/cmpxchg.h as an example.
					 ^^^
Nit...					 u32

> +			 */
> +			if (imm & BPF_FETCH && IS_ENABLED(CONFIG_SMP))
> +				EMIT(PPC_RAW_SYNC());

I think this block should go before the previous two instructions. We 
use tmp_idx as a label to retry the ll/sc sequence, so we will end up 
executing the 'sync' operation on a retry here.

>  			/* load value from memory into r0 */
>  			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
>  
> @@ -905,6 +914,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  
>  			/* For the BPF_FETCH variant, get old data into src_reg */
>  			if (imm & BPF_FETCH) {
> +				/* Emit 'sync' to enforce full ordering */
> +				if (IS_ENABLED(CONFIG_SMP))
> +					EMIT(PPC_RAW_SYNC());
>  				EMIT(PPC_RAW_MR(ret_reg, ax_reg));
>  				if (!fp->aux->verifier_zext)
>  					EMIT(PPC_RAW_LI(ret_reg - 1, 0)); /* higher 32-bit */
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 79f23974a320..9a077f8acf7b 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -804,6 +804,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  			/* Get offset into TMP_REG_1 */
>  			EMIT(PPC_RAW_LI(tmp1_reg, off));
>  			tmp_idx = ctx->idx * 4;
> +			/*
> +			 * Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
> +			 * before and after the operation.
> +			 *
> +			 * This is a requirement in the Linux Kernel Memory Model.
> +			 * See __cmpxchg_u64() in asm/cmpxchg.h as an example.
> +			 */
> +			if (imm & BPF_FETCH && IS_ENABLED(CONFIG_SMP))
> +				EMIT(PPC_RAW_SYNC());

Same here.

I'll try and give this a test tomorrow.


- Naveen

