Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0177B8C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 14:37:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AyQtOYZ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPYpB3Yr3z3cB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 22:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AyQtOYZ0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPYnM2f3Xz30N2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 22:37:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692016627;
	bh=sJ1XfdJ8koVOpLPFh5lgGOWx8nQ+9eqY27+qcXXvzaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AyQtOYZ0fJ2oyt3zcRf92PdYESgUvJqcbG7m4mh6cpaXYGCmf5P0Wli7vr8PB3Ybw
	 5g8Uvmu+S0YIo2KQMSTHPdjnod3sCd3Lbs8Ao2exiIqAq7fcy3/nrvCr48CdTGqXRw
	 qMbFT6gCgpljE4unS9Hsb4k1rhL76Qb/7Cuu3lbgE0Dz7LzfA8gWTDTXEHkolTVPSN
	 4HX9tj+fsr50VXJ6nAAsPLbTSAPM28CxTHpp3aC1fe5A1YxZY7CW1Xv9hToSYy386C
	 1fqMx1xtKpA9oAaE/nww8WtYJwEyZzDEmZsIy7Y/EPVNyANuZ2jlMumSFYoAWgM/vS
	 DwlQminVcd0Jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RPYnH5xwHz4wZJ;
	Mon, 14 Aug 2023 22:37:07 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Walleij <linus.walleij@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
In-Reply-To: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
Date: Mon, 14 Aug 2023 22:37:07 +1000
Message-ID: <87a5uter64.fsf@mail.lhotse>
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Walleij <linus.walleij@linaro.org> writes:
> Making virt_to_pfn() a static inline taking a strongly typed
> (const void *) makes the contract of a passing a pointer of that
> type to the function explicit and exposes any misuse of the
> macro virt_to_pfn() acting polymorphic and accepting many types
> such as (void *), (unitptr_t) or (unsigned long) as arguments
> without warnings.
...
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index f2b6bf5687d0..9ee4b6d4a82a 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -9,6 +9,7 @@
>  #ifndef __ASSEMBLY__
>  #include <linux/types.h>
>  #include <linux/kernel.h>
> +#include <linux/bug.h>
>  #else
>  #include <asm/types.h>
>  #endif
> @@ -119,16 +120,6 @@ extern long long virt_phys_offset;
>  #define ARCH_PFN_OFFSET		((unsigned long)(MEMORY_START >> PAGE_SHIFT))
>  #endif
>  
> -#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
> -#define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
> -#define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
> -
> -#define virt_addr_valid(vaddr)	({					\
> -	unsigned long _addr = (unsigned long)vaddr;			\
> -	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
> -	pfn_valid(virt_to_pfn(_addr));					\
> -})
> -
>  /*
>   * On Book-E parts we need __va to parse the device tree and we can't
>   * determine MEMORY_START until then.  However we can determine PHYSICAL_START
> @@ -233,6 +224,25 @@ extern long long virt_phys_offset;
>  #endif
>  #endif
>  
> +#ifndef __ASSEMBLY__
> +static inline unsigned long virt_to_pfn(const void *kaddr)
> +{
> +	return __pa(kaddr) >> PAGE_SHIFT;
> +}
> +
> +static inline const void *pfn_to_kaddr(unsigned long pfn)
> +{
> +	return (const void *)(((unsigned long)__va(pfn)) << PAGE_SHIFT);

Any reason to do it this way rather than:

+       return __va(pfn << PAGE_SHIFT);

Seems to be equivalent and much cleaner?

cheers
