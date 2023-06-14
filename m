Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98F7300D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 15:55:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TGto5Dvi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh6PV67qlz3bWc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TGto5Dvi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh6MH6R9Jz3bhp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 23:53:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3128961F1E;
	Wed, 14 Jun 2023 13:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36061C433C9;
	Wed, 14 Jun 2023 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750793;
	bh=i+dWwopS2R2pjDCoeERaU9nBu0jCYzS/lwxwHCWXb4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGto5Dvi/HN8fU/LSHI/Xe9mWSqjuoMuAggxIeDsDpSdGjOz+OD5Q61dYnwlfUI2u
	 12eC8JWZkY3dBTcv69CxtYmzohm/TspcjrDl3Zxm+eVFHQ1BuvWvblYU6lS5nHTdB4
	 4jgzdRwk6I0iRkcg+lC5rT6e/+Zoj8O4Z4XMzKkrAI3Xrl//xHCT0oSrSqy8qzE0DR
	 HFjNZU76vrLc90NskBD5ZmADqSbItjU5wL2oiacXptUySDzj5MWQp2048o6t9bgjHk
	 3J9d7i2fEQepFckTIKlCANmHRPvvJQeN1+/+mCtl5JH8j+CkcnEmQVaXh28mzw5CiW
	 A7drC/yoaT/Vw==
Date: Wed, 14 Jun 2023 16:52:36 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Message-ID: <20230614135236.GH52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-10-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-10-vishal.moola@gmail.com>
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

On Mon, Jun 12, 2023 at 02:03:58PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bb934d51390f..daecf1db6cf1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2942,12 +2942,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return ptlock_ptr(pmd_ptdesc(pmd));
>  }
>  
> -static inline bool pmd_ptlock_init(struct page *page)
> +static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	page->pmd_huge_pte = NULL;
> +	ptdesc->pmd_huge_pte = NULL;
>  #endif
> -	return ptlock_init(page);
> +	return ptlock_init(ptdesc_page(ptdesc));
>  }
>  
>  static inline void pmd_ptlock_free(struct page *page)
> @@ -2967,7 +2967,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return &mm->page_table_lock;
>  }
>  
> -static inline bool pmd_ptlock_init(struct page *page) { return true; }
> +static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void pmd_ptlock_free(struct page *page) {}
>  
>  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
> @@ -2983,7 +2983,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  
>  static inline bool pgtable_pmd_page_ctor(struct page *page)
>  {
> -	if (!pmd_ptlock_init(page))
> +	if (!pmd_ptlock_init(page_ptdesc(page)))
>  		return false;
>  	__SetPageTable(page);
>  	inc_lruvec_page_state(page, NR_PAGETABLE);
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
