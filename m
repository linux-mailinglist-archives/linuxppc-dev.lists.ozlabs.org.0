Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7078BDFE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 12:39:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PvUm8W89;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYZX26rkPz3fTK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 20:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PvUm8W89;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYZWJ0JlFz3cX4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 20:38:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC61061629;
	Tue,  7 May 2024 10:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0249C2BBFC;
	Tue,  7 May 2024 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715078311;
	bh=f6wbMbCLTQCjpEEEl/TaVKzRMwt6S9ZGL8N+Xi6Q5NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvUm8W89kxquA0pPXEj7m6Sd2oIh4lI5FGDMNvoptYIx/XRYpMxtD8o+6YrYqq/Ls
	 4OXkLIvASechkYU8LDUHw0gdDxWZupzv7UN5e4Gr7E84MBiWFNbti2V3IBtEAuZJ4V
	 HwGg38stsWj7M6N17msxiReG5UZfbGB7lggvjFtrc/nL8t0nFtF9hUXkmw6bmQba9l
	 0Gh2bheNmsXZv78rcoHimombn83Z52GMonaYxsFWsFnOvh3MX2gS+BiH/Yde+dKeSZ
	 DFKBRbLSyi3G6pnvSu/ATxG/x79AYJP9erE1+82rCgCuZO52V/kUkscXKLrCZ561Vb
	 3SwthMUU1d68g==
Date: Tue, 7 May 2024 16:02:04 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc64/bpf: fix tail calls for PCREL addressing
Message-ID: <ziidl5jisk3szmhoe6ncs52gtftp45juyq2zn72fisdprlazyg@dy5wmue7q4i6>
References: <20240502173205.142794-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502173205.142794-1-hbathini@linux.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Andrii Nakryiko <andrii@kernel.org>, stable@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2024 at 11:02:04PM GMT, Hari Bathini wrote:
> With PCREL addressing, there is no kernel TOC. So, it is not setup in
> prologue when PCREL addressing is used. But the number of instructions
> to skip on a tail call was not adjusted accordingly. That resulted in
> not so obvious failures while using tailcalls. 'tailcalls' selftest
> crashed the system with the below call trace:
> 
>   bpf_test_run+0xe8/0x3cc (unreliable)
>   bpf_prog_test_run_skb+0x348/0x778
>   __sys_bpf+0xb04/0x2b00
>   sys_bpf+0x28/0x38
>   system_call_exception+0x168/0x340
>   system_call_vectored_common+0x15c/0x2ec
> 
> Also, as bpf programs are always module addresses and a bpf helper in
> general is a core kernel text address, using PC relative addressing
> often fails with "out of range of pcrel address" error. Switch to
> using kernel base for relative addressing to handle this better.
> 
> Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> * Changes in v4:
>   - Fix out of range errors by switching to kernelbase instead of PC
>     for relative addressing.
> 
> * Changes in v3:
>   - New patch to fix tailcall issues with PCREL addressing.
> 
> 
>  arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 79f23974a320..4de08e35e284 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -202,7 +202,8 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
>  	EMIT(PPC_RAW_BLR());
>  }
>  
> -static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
> +static int
> +bpf_jit_emit_func_call_hlp(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
>  {
>  	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
>  	long reladdr;
> @@ -211,19 +212,20 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
>  		return -EINVAL;
>  
>  	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
> -		reladdr = func_addr - CTX_NIA(ctx);
> +		reladdr = func_addr - local_paca->kernelbase;
>  
>  		if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
> -			pr_err("eBPF: address of %ps out of range of pcrel address.\n",
> -				(void *)func);
> +			pr_err("eBPF: address of %ps out of range of 34-bit relative address.\n",
> +			       (void *)func);
>  			return -ERANGE;
>  		}
> -		/* pla r12,addr */
> -		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(1) | IMM_H18(reladdr));
> -		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | IMM_L(reladdr));
> -		EMIT(PPC_RAW_MTCTR(_R12));
> -		EMIT(PPC_RAW_BCTR());
> -
> +		EMIT(PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernelbase)));
> +		/* Align for subsequent prefix instruction */
> +		if (!IS_ALIGNED((unsigned long)fimage + CTX_NIA(ctx), 8))
> +			EMIT(PPC_RAW_NOP());

We don't need the prefix instruction to be aligned to a doubleword 
boundary - it just shouldn't cross a 64-byte boundary. Since we know the 
exact address of the instruction here, we should be able to check for 
that case.

> +		/* paddi r12,r12,addr */
> +		EMIT(PPC_PREFIX_MLS | __PPC_PRFX_R(0) | IMM_H18(reladdr));
> +		EMIT(PPC_INST_PADDI | ___PPC_RT(_R12) | ___PPC_RA(_R12) | IMM_L(reladdr));
>  	} else {
>  		reladdr = func_addr - kernel_toc_addr();
>  		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
> @@ -233,9 +235,9 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
>  
>  		EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
>  		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
> -		EMIT(PPC_RAW_MTCTR(_R12));
> -		EMIT(PPC_RAW_BCTRL());
>  	}
> +	EMIT(PPC_RAW_MTCTR(_R12));
> +	EMIT(PPC_RAW_BCTRL());

This change shouldn't be necessary since these instructions are moved 
back into the conditional in the next patch.

Other than those minor comments:
Reviewed-by: Naveen N Rao <naveen@kernel.org>


- Naveen

