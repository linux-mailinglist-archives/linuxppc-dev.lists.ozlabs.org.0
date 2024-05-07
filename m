Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D28BE01A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 12:49:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOAwqzzB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYZlb1VjRz3fSj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 20:49:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOAwqzzB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYZkr0vJgz3cZx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 20:48:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 69E50CE10C5;
	Tue,  7 May 2024 10:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A0EC2BBFC;
	Tue,  7 May 2024 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715078912;
	bh=wHy9en/As03N1zh8IZ4ouvHe4kFf6ummlv20ZpEe0hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOAwqzzBH5PKhzKNzZnw3UWJMDn+/rEJ5HYu+otCd8UbJzW4ogeSTLypLKVj/W94t
	 6i5DTQAfiaDf2NNwLiZ+XCTO5iWCSRbQLcTE9w8+2C1lBdN0KD3a19BnYNYWUzkdY7
	 QORzHW72t0fI9WYH/jcqLXxEcRTq4C43TGGy1h/IWvq4mN1ppdDAs+NCyjAZyYZhSl
	 gYBNYzkrcykYgJUGrR2PVwZPDHnjSZU0Dwtl9CusIvP/45tqvyqpW5zoL4nM9JOrrC
	 8rOqW6cD3zfh29OLGtz98vBvEnYzJEkrHavgeCQJ1PLO3U2IQClKj0o1AtvJBwYWHw
	 rmS3dX5FwaoZQ==
Date: Tue, 7 May 2024 16:10:51 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] powerpc/bpf: enable kfunc call
Message-ID: <hhdzfgivl6e6xkuj23srokm23n2kn3lx42a3f54hzsurvmil5e@ssylns6n7uh6>
References: <20240502173205.142794-1-hbathini@linux.ibm.com>
 <20240502173205.142794-2-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502173205.142794-2-hbathini@linux.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2024 at 11:02:05PM GMT, Hari Bathini wrote:
> Currently, bpf jit code on powerpc assumes all the bpf functions and
> helpers to be part of core kernel text. This is false for kfunc case,
> as function addresses may not be part of core kernel text area. So,
> add support for addresses that are not within core kernel text area
> too, to enable kfunc support. Emit instructions based on whether the
> function address is within core kernel text address or not, to retain
> optimized instruction sequence where possible.
> 
> In case of PCREL, as a bpf function that is not within core kernel
> text area is likely to go out of range with relative addressing on
> kernel base, use PC relative addressing. If that goes out of range,
> load the full address with PPC_LI64().
> 
> With addresses that are not within core kernel text area supported,
> override bpf_jit_supports_kfunc_call() to enable kfunc support. Also,
> override bpf_jit_supports_far_kfunc_call() to enable 64-bit pointers,
> as an address offset can be more than 32-bit long on PPC64.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> * Changes in v4:
>   - Use either kernelbase or PC for relative addressing. Also, fallback
>     to PPC_LI64(), if both are out of range.
>   - Update r2 with kernel TOC for elfv1 too as elfv1 also uses the
>     optimization sequence, that expects r2 to be kernel TOC, when
>     function address is within core kernel text.
> 
> * Changes in v3:
>   - Retained optimized instruction sequence when function address is
>     a core kernel address as suggested by Naveen.
>   - Used unoptimized instruction sequence for PCREL addressing to
>     avoid out of range errors for core kernel function addresses.
>   - Folded patch that adds support for kfunc calls with patch that
>     enables/advertises this support as suggested by Naveen.
> 
> 
>  arch/powerpc/net/bpf_jit_comp.c   | 10 +++++
>  arch/powerpc/net/bpf_jit_comp64.c | 61 ++++++++++++++++++++++++++-----
>  2 files changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 0f9a21783329..984655419da5 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -359,3 +359,13 @@ void bpf_jit_free(struct bpf_prog *fp)
>  
>  	bpf_prog_unlock_free(fp);
>  }
> +
> +bool bpf_jit_supports_kfunc_call(void)
> +{
> +	return true;
> +}
> +
> +bool bpf_jit_supports_far_kfunc_call(void)
> +{
> +	return IS_ENABLED(CONFIG_PPC64);
> +}
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 4de08e35e284..8afc14a4a125 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -208,17 +208,13 @@ bpf_jit_emit_func_call_hlp(u32 *image, u32 *fimage, struct codegen_context *ctx,
>  	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
>  	long reladdr;
>  
> -	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
> +	if (WARN_ON_ONCE(!kernel_text_address(func_addr)))
>  		return -EINVAL;
>  
> -	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
> -		reladdr = func_addr - local_paca->kernelbase;
> +#ifdef CONFIG_PPC_KERNEL_PCREL

Would be good to retain use of IS_ENABLED().
Reviewed-by: Naveen N Rao <naveen@kernel.org>


- Naveen

