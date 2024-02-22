Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B045585F0F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 06:33:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XTZpY45e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgMHV4Qnlz3dX0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XTZpY45e;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgMGn0WZ0z30f5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 16:32:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708579952;
	bh=6rZVo5FTKhXSv7psKwvcsKt6sXdGaolXZqU702i5vXc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XTZpY45e7Lwj01jfq3e25ZOBFbG475EMb2eVy9dNhJ96a2LA5kUoX35Rur0bQqG/X
	 YkCq1iIm0fBztKObwraCr3LdlbHoPbAz+nDF6rE3Op5daigKdmDhngXzgRJdqka9Ha
	 zms4iuzJv3jsIkG+9gVzpep90X+NlKRUqsvIdV1/iWHEPckjfMsAu7KjW9/zdhKVNg
	 5SSLp8wPxVET5oVttiAARf+L0FMZ6KEg39sU4yi/RUjjGbi5sE2EybKaevZT+QssG/
	 o+f95DmMmlnUaW62cdod/ck0dRWbQIR3Ix82aB6tUyZyHxv6dxzGwf7k8bUE+RG/hc
	 HBrlv+D0DQ1IA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TgMGm5vQgz4wc4;
	Thu, 22 Feb 2024 16:32:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Refactor __kernel_map_pages()
In-Reply-To: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
References: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
Date: Thu, 22 Feb 2024 16:32:31 +1100
Message-ID: <8734tlawsw.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> __kernel_map_pages() is almost identical for PPC32 and RADIX.
>
> Refactor it.
>
> On PPC32 it is not needed for KFENCE, but to keep it simple
> just make it similar to PPC64.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
>  arch/powerpc/include/asm/book3s/64/radix.h   |  2 --
>  arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 --------------
>  arch/powerpc/mm/pageattr.c                   | 19 +++++++++++++++++++
>  arch/powerpc/mm/pgtable_32.c                 | 15 ---------------
>  5 files changed, 19 insertions(+), 41 deletions(-)
>
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 421db7c4f2a4..16b8d20d6ca8 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -101,3 +101,22 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>  	return apply_to_existing_page_range(&init_mm, start, size,
>  					    change_page_attr, (void *)action);
>  }
> +
> +#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
> +#ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
> +void __kernel_map_pages(struct page *page, int numpages, int enable)
> +{
> +	unsigned long addr = (unsigned long)page_address(page);
> +
> +	if (PageHighMem(page))
> +		return;
> +
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
> +		hash__kernel_map_pages(page, numpages, enable);
> +	else if (enable)
> +		set_memory_p(addr, numpages);
> +	else
> +		set_memory_np(addr, numpages);
> +}

This doesn't build on 32-bit, eg. ppc32_allmodconfig:

../arch/powerpc/mm/pageattr.c: In function '__kernel_map_pages':
../arch/powerpc/mm/pageattr.c:116:23: error: implicit declaration of function 'hash__kernel_map_pages' [-Werror=implicit-function-declaration]
  116 |                 err = hash__kernel_map_pages(page, numpages, enable);
      |                       ^~~~~~~~~~~~~~~~~~~~~~

I couldn't see a nice way to get around it, so ended up with:

void __kernel_map_pages(struct page *page, int numpages, int enable)
{
	int err;
	unsigned long addr = (unsigned long)page_address(page);

	if (PageHighMem(page))
		return;

#ifdef CONFIG_PPC_BOOK3S_64
	if (!radix_enabled())
		err = hash__kernel_map_pages(page, numpages, enable);
	else
#endif
	if (enable)
		err = set_memory_p(addr, numpages);
	else
		err = set_memory_np(addr, numpages);



cheers
