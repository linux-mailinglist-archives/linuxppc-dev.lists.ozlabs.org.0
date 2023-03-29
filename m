Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB16CD0A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 05:28:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmX884Fsgz3f51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 14:28:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SAWjgkM8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmX7F0t9Kz3cM6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 14:27:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SAWjgkM8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmX735qqJz4whh;
	Wed, 29 Mar 2023 14:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680060467;
	bh=NWEC9L1N6Gkm8hPWtsZhECzqXf6jCt48G2Nqg5hBXvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SAWjgkM8buDl+QGSlnMNlFfgO8XDbaheTTxegHJeT8I9RxjC69eo0Kqm5o7HhOfVq
	 pdBn9kfpreHiPsYCcnDs7VUFT5T5A83HBfyuowLBZ5r3UmbbZmIkUBTXHb8C/zYUTl
	 hEO+2u3JYAO36dtGtL+VJUYzZ9mK+Xi5sEx0ybcukCmpGSIjRCWOZe4a8fkVYXmck4
	 bDLJ9L25893BDL64x2oUJStfo7XSuIQ5SU0FzQTwRLDJ2/IgX3oTpc0qH07mLM08Tf
	 uybEEoCv8kc9mlfe/94vD2n7j+eArEJqBCLtujEMR6lxKa+vMrtKuif6ZsQgKmuXdM
	 3m1++1phqhrYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 4/4] of: address: Always use dma_default_coherent for
 default coherency
In-Reply-To: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230321110813.26808-5-jiaxun.yang@flygoat.com>
Date: Wed, 29 Mar 2023 14:27:39 +1100
Message-ID: <877cv0ck44.fsf@mpe.ellerman.id.au>
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
Cc: tsbogend@alpha.franken.de, robin.murphy@arm.com, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
> As for now all arches have dma_default_coherent reflecting default
> DMA coherency for of devices, so there is no need to have a standalone
> config option.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Squash setting ARCH_DMA_DEFAULT_COHERENT into this patch.
> ---
>  arch/powerpc/Kconfig |  2 +-
>  arch/riscv/Kconfig   |  2 +-
>  drivers/of/Kconfig   |  4 ----
>  drivers/of/address.c | 10 +---------
>  4 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 57f5d2f53d06..824e00a1277b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -113,6 +113,7 @@ config PPC
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
>  	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
> +	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_HAS_COPY_MC			if PPC64
> @@ -273,7 +274,6 @@ config PPC
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
>  	select NEED_SG_DMA_LENGTH
>  	select OF
> -	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
>  	select OF_EARLY_FLATTREE
>  	select OLD_SIGACTION			if PPC32
>  	select OLD_SIGSUSPEND

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
