Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4285D7B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 13:10:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LN3beWz7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfw8T4hl4z3cGw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 23:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LN3beWz7;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfw7j5p4Kz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 23:09:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708517388;
	bh=PLDtI67f/xui7jHsmCWFGzmJCY6GWA6bDHlnXiY857Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LN3beWz7/pvuDSRvRn77DI/Hme3p4aKDtAhHswqCONrhYqaIbh4nmPvEoPxzT8tCJ
	 8S83csJ/yXkEWtKoJzMY5JUyOavAcBiKRN2bGz6MttMbAtJWaoC66G4SgFCALXKJtw
	 z8l3G4iW/RobmgNITGAdNPVZAwTtFHsTAcWA5kSEWS4rifBIeAv7FdOIANX91B2Wvl
	 vLQUbUwKwfJXXLimfpBRIKXtVz5ejhkmYKOrYVwrNEsQBcIoFk0knvXRjvkOkpZBjQ
	 ErJlzzhyYBhNqyPh4NuamqhPE0hPYarQh4KSGcHkUOdZYn/EQGh8XMyibmKIeZket/
	 xpOop9pvvHT6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tfw7c2P1Tz4wbp;
	Wed, 21 Feb 2024 23:09:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc: Don't ignore errors from set_memory_{n}p()
 in __kernel_map_pages()
In-Reply-To: <20ef75884aa6a636e8298736f3d1056b0793d3d9.1708078640.git.christophe.leroy@csgroup.eu>
References: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
 <20ef75884aa6a636e8298736f3d1056b0793d3d9.1708078640.git.christophe.leroy@csgroup.eu>
Date: Wed, 21 Feb 2024 23:09:43 +1100
Message-ID: <878r3eauig.fsf@mail.lhotse>
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
> set_memory_p() and set_memory_np() can fail.
>
> As mentioned in linux/mm.h:
>
> /*
>  * To support DEBUG_PAGEALLOC architecture must ensure that
>  * __kernel_map_pages() never fails
>  */
>
> So panic in case set_memory_p() or set_memory_np() fail
> in __kernel_map_pages().
>
> Link: https://github.com/KSPP/linux/issues/7
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/hash.h |  2 +-
>  arch/powerpc/mm/book3s64/hash_utils.c     |  3 ++-
>  arch/powerpc/mm/pageattr.c                | 10 +++++++---
>  3 files changed, 10 insertions(+), 5 deletions(-)
>
...
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 16b8d20d6ca8..62b678585878 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -106,17 +106,21 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>  #ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
>  {
> +	int err;
>  	unsigned long addr = (unsigned long)page_address(page);
>  
>  	if (PageHighMem(page))
>  		return;
>  
>  	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
> -		hash__kernel_map_pages(page, numpages, enable);
> +		err = hash__kernel_map_pages(page, numpages, enable);
>  	else if (enable)
> -		set_memory_p(addr, numpages);
> +		err = set_memory_p(addr, numpages);
>  	else
> -		set_memory_np(addr, numpages);
> +		err = set_memory_np(addr, numpages);
> +
> +	if (err)
> +		panic("%s: set_memory_%sp() failed\n", enable ? "" : "n");

This doesn't compile, it's missing __func__ I guess.

Seems like we could keep it simpler though, it should hopefully never
happen anyway, eg:

  panic("%s: changing memory protections failed\n", __func__);


cheers
