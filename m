Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63784D9CB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 07:12:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HFaz8r46;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVmpw3vGHz3c2G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:12:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HFaz8r46;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVmpB16N3z2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 17:11:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 041F961B0E;
	Thu,  8 Feb 2024 06:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2565C43390;
	Thu,  8 Feb 2024 06:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372684;
	bh=P03Ra6tKJeIfMl5vzZANDer57SEANPUYFQQ4fYeImD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFaz8r46F2yMGhc4eChQ1bdDMIG2SJbZeO1JsISVjZZY5/QxNPEU574sO9dknngXq
	 YVgyAOL6RSp2qvuoFw3QAZnOLGr4cDN/wpbTmNQ58lmjGGeuChQIAye3TRo4TxFy79
	 V7xNv4sfFz+z0Vk0ON1uEn4vvWgR1e3+QhjIlA+1LT/Ifdm5+CkutQDtm79R+RIM1n
	 4OE0Gfs2UAKksR/gYZdixvQn5xW9+A4inVRJwU+VYyn9RWTX93+YzHhWEvbOkcDwIJ
	 h9Gt9Ms2CBz13jyRvnX4bzQn20gjiMAXZmHcQEZQTyBICBjNVu3/zFAWUGyA2x/MG4
	 oI4EjuUTX0bdA==
Date: Thu, 8 Feb 2024 08:10:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 01/15] arm64/mm: Make set_ptes() robust when OAs cross
 48-bit boundary
Message-ID: <ZcRwc2mEDHIXxgGa@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-2-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@d
 avemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 01:46:35PM +0100, David Hildenbrand wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> Since the high bits [51:48] of an OA are not stored contiguously in the
> PTE, there is a theoretical bug in set_ptes(), which just adds PAGE_SIZE
> to the pte to get the pte with the next pfn. This works until the pfn
> crosses the 48-bit boundary, at which point we overflow into the upper
> attributes.
> 
> Of course one could argue (and Matthew Wilcox has :) that we will never
> see a folio cross this boundary because we only allow naturally aligned
> power-of-2 allocation, so this would require a half-petabyte folio. So
> its only a theoretical bug. But its better that the code is robust
> regardless.
> 
> I've implemented pte_next_pfn() as part of the fix, which is an opt-in
> core-mm interface. So that is now available to the core-mm, which will
> be needed shortly to support forthcoming fork()-batching optimizations.
> 
> Link: https://lkml.kernel.org/r/20240125173534.1659317-1-ryan.roberts@arm.com
> Fixes: 4a169d61c2ed ("arm64: implement the new page table range API")
> Closes: https://lore.kernel.org/linux-mm/fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b50270107e2f..9428801c1040 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -341,6 +341,22 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
>  		mte_sync_tags(pte, nr_pages);
>  }
>  
> +/*
> + * Select all bits except the pfn
> + */
> +static inline pgprot_t pte_pgprot(pte_t pte)
> +{
> +	unsigned long pfn = pte_pfn(pte);
> +
> +	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
> +}
> +
> +#define pte_next_pfn pte_next_pfn
> +static inline pte_t pte_next_pfn(pte_t pte)
> +{
> +	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
> +}
> +
>  static inline void set_ptes(struct mm_struct *mm,
>  			    unsigned long __always_unused addr,
>  			    pte_t *ptep, pte_t pte, unsigned int nr)
> @@ -354,7 +370,7 @@ static inline void set_ptes(struct mm_struct *mm,
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> -		pte_val(pte) += PAGE_SIZE;
> +		pte = pte_next_pfn(pte);
>  	}
>  }
>  #define set_ptes set_ptes
> @@ -433,16 +449,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
>  }
>  
> -/*
> - * Select all bits except the pfn
> - */
> -static inline pgprot_t pte_pgprot(pte_t pte)
> -{
> -	unsigned long pfn = pte_pfn(pte);
> -
> -	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
> -}
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  /*
>   * See the comment in include/linux/pgtable.h
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.
