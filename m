Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70277300BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:52:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UEIirlFb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6LY4CcCz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UEIirlFb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6Kh6XqFz30ds
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:51:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0F86371D;
	Wed, 14 Jun 2023 13:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7653EC433C0;
	Wed, 14 Jun 2023 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750710;
	bh=MAYhMoo3f8WL6wMqKE5pm7ocfhsiks+frK6iH2blioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEIirlFbT/jXJvHUAqdydA59j1RgDZUUfgyOKgwNndXqGOEHUHhZfOzL8/NQgVHWq
	 /q8XC8zbUoWUdbEY52nA6n3QMoY+5uT3nVSo46hX3ckloa8Tsk20nvsFk+nFyI69rq
	 kqHKU2qNg4cLDxDKYqW/CF0jwV3eWOULQ1qERJP4E28CBFcj6QUn7snwpsx+9K+Qu2
	 POIbcaK1ERRHtrayBYsdhpVVMqCnIj3U/FswN9W3HiA4Vsg6KhJEbi7yWjCVgy7Bim
	 qkQ5e6uOUhmZCAZAp2Mldqm52UMAWsfOcJWE7Vw1mqKjcEoYqpl1pq42H9ff1U9Ztz
	 NxXUpOfWIJH1g==
Date: Wed, 14 Jun 2023 16:51:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Message-ID: <20230614135112.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-7-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-7-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:03:55PM -0700, Vishal Moola (Oracle) wrote:
> Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
> removes some direct accesses to struct page, working towards splitting
> out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f184f1eba85d..088b7664f897 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
>  
>  #if USE_SPLIT_PMD_PTLOCKS
>  
> -static inline struct page *pmd_pgtable_page(pmd_t *pmd)
> +static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  {
>  	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
> -	return virt_to_page((void *)((unsigned long) pmd & mask));
> +	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
>  }
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_pgtable_page(pmd));
> +	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> @@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
>  	ptlock_free(page);
>  }
>  
> -#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
> +#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
>  
>  #else
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
