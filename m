Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1A34FE2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9N764pCyz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 21:37:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TTaqi7Yh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TTaqi7Yh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9N6j5R0Wz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 21:37:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9N6c6lfTz9sWK;
 Wed, 31 Mar 2021 21:37:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617187035;
 bh=VTiOGrrVoq0IDF+lHleeVf//X5BP+Y44WtToIrf4/gw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TTaqi7YhLTCJ5QF+Ksat0/xAygaQ29us49FRrLFNh4Q537qnPqNh167x4izzJrNlh
 ELLUimCB+1VU4GaLqpxNff8gbZ97Wu0oYHFoFQloo2cSeyS2oTNlsCvoo+r3KMcmMb
 7YIs3HZ9rpRezAMWODq+8E+xk5geW/DUXpqW3fjbsQlmk06OmXwyn6vLdyMxGa56LZ
 Km9QPMVrNRaOHlK/7jdw+04sZM+h8X9CTRO8OW5k9DMAdw1lo24S280Ppg35Gn4IdT
 /ZmegM716Jrmgg0XIz95Q0y7k4wuVEHHPtxpYDt8sea0C6bct6gb0rkSRTA7EF2Qk1
 BkhT0FYszGnFg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v10 05/10] powerpc/bpf: Write protect JIT code
In-Reply-To: <20210330045132.722243-6-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-6-jniethe5@gmail.com>
Date: Wed, 31 Mar 2021 21:37:10 +1100
Message-ID: <87wntnwqw9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, cmr@codefail.de,
 npiggin@gmail.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:

> Once CONFIG_STRICT_MODULE_RWX is enabled there will be no need to
> override bpf_jit_free() because it is now possible to set images
> read-only. So use the default implementation.
>
> Also add the necessary call to bpf_jit_binary_lock_ro() which will
> remove write protection and add exec protection to the JIT image after
> it has finished being written.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: New to series
> ---
>  arch/powerpc/net/bpf_jit_comp.c   | 5 ++++-
>  arch/powerpc/net/bpf_jit_comp64.c | 4 ++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index e809cb5a1631..8015e4a7d2d4 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -659,12 +659,15 @@ void bpf_jit_compile(struct bpf_prog *fp)
>  		bpf_jit_dump(flen, proglen, pass, code_base);
>  
>  	bpf_flush_icache(code_base, code_base + (proglen/4));
> -
>  #ifdef CONFIG_PPC64
>  	/* Function descriptor nastiness: Address + TOC */
>  	((u64 *)image)[0] = (u64)code_base;
>  	((u64 *)image)[1] = local_paca->kernel_toc;
>  #endif
> +	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
> +		set_memory_ro((unsigned long)image, alloclen >> PAGE_SHIFT);
> +		set_memory_x((unsigned long)image, alloclen >> PAGE_SHIFT);
> +	}

You don't need to check the ifdef in a caller, there are stubs that
compile to nothing when CONFIG_ARCH_HAS_SET_MEMORY=n.

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index aaf1a887f653..1484ad588685 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -1240,6 +1240,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>  	fp->jited_len = alloclen;
>  
>  	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_SIZE));
> +	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +		bpf_jit_binary_lock_ro(bpf_hdr);

Do we need the ifdef here either? Looks like it should be safe to call
due to the stubs.

> @@ -1262,6 +1264,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>  }
>  
>  /* Overriding bpf_jit_free() as we don't set images read-only. */
> +#ifndef CONFIG_STRICT_MODULE_RWX

Did you test without this and notice something broken?

Looking at the generic version I can't tell why we need to override
this. Maybe we don't (anymore?) ?

cheers

>  void bpf_jit_free(struct bpf_prog *fp)
>  {
>  	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
> @@ -1272,3 +1275,4 @@ void bpf_jit_free(struct bpf_prog *fp)
>  
>  	bpf_prog_unlock_free(fp);
>  }
> +#endif
> -- 
> 2.25.1
