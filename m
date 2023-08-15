Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E013177C891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:31:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cpr2h286;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ2y85nhkz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:31:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cpr2h286;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ2xK59lCz2yVH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:30:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692084645;
	bh=XiXX9eU/s/AkSjfJm9DwVrwntmLvwo4y7VDo0VRqfqw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cpr2h286rbQ9ZWA7sIJpieEEunosIMnHIlpuAHRa9sZE8MabuVXAmlJlUtBRr1yar
	 IOyhe1OBFhP8Pi60NS60najNtcw9Sgyfrt6gBpX/YisA9UK7cfOXuy0/pQX9w6s8As
	 r5sR07G+emd4A9HK+8h1Nh6FsveFmjVmpqxUP0orFHTqdRoLatEzucsXjPmv2Jw628
	 aM8/xb6e5beQ4RTtnkfEszZCHauoBHz5drU74sVo0G/im0RywT3ncWqdiN//qhTISa
	 jLIH5smjeKm2+e0N0MLLa7zAAnDnDEWhMGL74bOiDj1IT9D35NOz73L89+1wZ3gkZl
	 qfW7n4aWihFyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ2xK3MyFz4wqX;
	Tue, 15 Aug 2023 17:30:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Walleij <linus.walleij@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
In-Reply-To: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
Date: Tue, 15 Aug 2023 17:30:45 +1000
Message-ID: <87y1icdaoq.fsf@mail.lhotse>
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
>
> Move the virt_to_pfn() and related functions below the
> declaration of __pa() so it compiles.
>
> For symmetry do the same with pfn_to_kaddr().
>
> As the file is included right into the linker file, we need
> to surround the functions with ifndef __ASSEMBLY__ so we
> don't cause compilation errors.
>
> The conversion moreover exposes the fact that pmd_page_vaddr()
> was returning an unsigned long rather than a const void * as
> could be expected, so all the sites defining pmd_page_vaddr()
> had to be augmented as well.
...
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 6a88bfdaa69b..a9515d3d7831 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -60,9 +60,9 @@ static inline pgprot_t pte_pgprot(pte_t pte)
>  }
>  
>  #ifndef pmd_page_vaddr
> -static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> +static inline const void *pmd_page_vaddr(pmd_t pmd)
>  {
> -	return ((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));
> +	return (const void *)((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));

This can also just be:

	return __va(pmd_val(pmd) & ~PMD_MASKED_BITS);

I've squashed that in.

cheers
