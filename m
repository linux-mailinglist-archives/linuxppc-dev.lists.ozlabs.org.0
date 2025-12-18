Return-Path: <linuxppc-dev+bounces-14887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BACCCD2CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 19:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXK3D3Zq7z2xrM;
	Fri, 19 Dec 2025 05:30:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766082616;
	cv=none; b=nXL+vq8Nfgf5AOyD4xIVCl2ZZWA5fpyzJKrQ6g4uj9dh5mIm88y0idir4QjDqOYOxqYVYr04Kx84WZz3B7kNcDNr/JVTl2LnllyW5Gp6uhUB9ZgseliVXuQRBJVIukgmLfn1ana9THbush4lkAZxWe/W5pfPEasX64c1OdaCNOzq4MQgwt6yl/22Ol04uZb08XcSCA3S2JuNZqFeF5X+kh+Vkdl5+9dXQ3ONcmMrCKi/aeFQN28fBNT+usSakOA/y5wyqlsmpSJA9kCUUAge+9dOxz42I05b0hKsKFcTgk0zqVMmmosptwXknpQuwLpUOlHY+Q1/91faE3/bgv71pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766082616; c=relaxed/relaxed;
	bh=M6TPqQs1Ewkm5e3A0oEahNyrrkVyyYEQ0io6xTIMF0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oaF7lBORDU/NxdEm96RQhB4QxeVYJh4YBHFFMzGyHckftM939j1pYUQhSb/8cI9U8ATlvZ0w9/N18pxLkUYjCpU6UkQkdDk/UEa0THsNBgAyfgpfRYKZOSiUEUgK+1ukIZqe2u0N+TH5aJZpIex0SE1ls/MIy19RC+tQKT4BlErUnXYnRgSd/jDj4uDpAA1IwiU11A01Nd64i4x7pLKo6yS+J5ETjjqnJats++owHUpxLgsnG8qw9a1Te6xFWzjY4sWT/XkTxoa5GC3+sCcf5APlkXv34pr58hvvwMtD0Bqfv0Tf/vHmzFwcrqilrqDsufD8aPCTc9TTpN3gOrmT1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D95qJ/uS; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D95qJ/uS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXK3C5FFHz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 05:30:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A8F660055;
	Thu, 18 Dec 2025 18:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63623C4CEFB;
	Thu, 18 Dec 2025 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766082583;
	bh=TjBcGwW4a9QOJ3BdOoSuXFyGMXz0Im1VV4W7/QtXkIk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=D95qJ/uSD8if8jZbBlp8YhG/CuxaSReXnHgs1jHXsNQ/ljXjoFRi1XYxX2j+pSjEs
	 yex82vI/6qZ3Yiakv4L+Zl0kcxCpIMZs3dLlcCl7fXVmsHV9vIR0KCb0H1garXem8b
	 Mfkgz5p5H/qYoBEawEDZrCPlzNDqpCb9Mc/3iBfIKqMLcQ+5L9PZ8kTrro0CzrEwK2
	 Xg2NSj5eJrzbwscEqQfySuR1zzaKAjZtmrwCpUdlZNhSprPywFEdTQeqPGnfvdrEe3
	 2Ii+x59UF3g/W/F640VvTzb6DyjUxTQ9lQGdMSedIapMiRNOYKFC89/2sBUo4qI+wC
	 nbQ9q+PDk4TLA==
Message-ID: <2462a770-7da3-4b42-99ed-6ffd4d44b4f4@kernel.org>
Date: Thu, 18 Dec 2025 19:29:39 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm: Use pte_advance_pfn() in set_huge_pte_at()
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20251219-set_huge_pte_at_pte_advance_pfn-v1-1-e3378845af7d@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251219-set_huge_pte_at_pte_advance_pfn-v1-1-e3378845af7d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew,

Le 18/12/2025 à 17:21, Andrew Donnellan a écrit :
> In set_huge_pte_at(), replace the existing open coded pte value
> calculation with the new helper pte_advance_pfn().
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>   arch/powerpc/mm/pgtable.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 56d7e8960e77d877390d6bcbf0d8a305cc222101..9073e373e1e8a88f904cae592e1e8c34707545e6 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -365,7 +365,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>   
>   	for (i = 0; i < sz / pdsize; i++, ptep++, addr += pdsize) {
>   		__set_pte_at(mm, addr, ptep, pte, 0);
> -		pte = __pte(pte_val(pte) + ((unsigned long long)pdsize / PAGE_SIZE << PFN_PTE_SHIFT));
> +		pte = pte_advance_pfn(pte, pdsize / PAGE_SIZE);

How can this work ?

pdsize is 4M, PAGE_SIZE is 4k so pdsize/PAGE_SIZE is 0x400.

PFN_PTE_SHIFT is 24.

0x400 << 24 is more than what an unsigned long can contain in 
pte_advance_pfn()

Christophe

>   	}
>   }
>   #endif
> 
> ---
> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
> change-id: 20251219-set_huge_pte_at_pte_advance_pfn-0ae18078fcca
> 
> 
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
> 


