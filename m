Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A83631DA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 20:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN1sT1vXVz3c01
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 04:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e9wLqXqu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=ilias.apalodimas@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e9wLqXqu; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN1s25pDcz301K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 04:32:19 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id u20so11419995wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rXzu2aaQG3S7cGTxRDcxeH5itwSf5UHiBbc+Mfp3iik=;
 b=e9wLqXquNQTYWhXjUdKEFxVNM3EcZvI8CB4v0ovhwe/yevYVGVmzrbaHhE02CX0UKZ
 iAQ9XXHX1nTA8YswubW58TmD3iYRX4RADm9tE2JivkSsjiH4tHL6PevgUD+Q8o0lj13M
 Wh4WQNLWESeMTaegmO+swRQWtdK95e3TtBPFPjyoSMZO3m6jYk3AFl+7UJTVlzhYvukt
 kZIWWQL5KZN7mSFoC/bQUNXGH+80MdOC3b07Am6Bil612+h6z0k+ywWcIjHl/qR1rea2
 iA5ItEuiIMldPKGr3Y9PSZWyZuR7p/rmUen+WySDnuz9aNuJAQg+hrIjwxVrU28R2S8P
 JYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rXzu2aaQG3S7cGTxRDcxeH5itwSf5UHiBbc+Mfp3iik=;
 b=DTXwkEdrWkPYqPH7sFt0m4NjGIeBk12enuEP/Ynv2fGdBI1kM5HN5MNIomwVlqkkey
 MCXY2mVBFofMBBq5ArxtUSNx7DhaIdUZP3CD82GnlBem01ClRip5UguFJcQ1y7rDmec+
 sxP1IM7FICNOjef8OOfjhascb+gliJBqnIkeiunNzIWWRHJ61i4XOV/42Ml9xnueKZX9
 dZ5bixsS7Qf1yWRaYF3CH039yoqyH1f3geRIcvFsGZVfbZjkMorGt5/BCRRwbThH1KwH
 I1zmVVfz9Lka2MZ4D5cFK/sFz5Aarng0ZRB2Z84DT+oGbbZHQPHNv0ZcP2aHDsFfDZEo
 aT/g==
X-Gm-Message-State: AOAM531pTp3x+Taz1FQdt6tklRWVzFKTYF1quC0CvPmyIn9XjAH6izzy
 VhQtz60YhsOeGAdt0SNrRvhYLg==
X-Google-Smtp-Source: ABdhPJy8eVPGkCEVOqcITHVxTpCMYxsxuxYGe77mR9W540Za15SuA9f3s8LvAfJ6EElZzxF5pnQVxQ==
X-Received: by 2002:a1c:770a:: with SMTP id t10mr13782514wmi.49.1618684329574; 
 Sat, 17 Apr 2021 11:32:09 -0700 (PDT)
Received: from apalos.home (ppp-94-65-92-88.home.otenet.gr. [94.65.92.88])
 by smtp.gmail.com with ESMTPSA id a22sm15043900wrc.59.2021.04.17.11.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 11:32:09 -0700 (PDT)
Date: Sat, 17 Apr 2021 21:32:06 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <YHspptFx+T588KcG@apalos.home>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417024522.GP2531743@casper.infradead.org>
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, mhocko@kernel.org,
 linux-mm@kvack.org, mgorman@suse.de, brouer@redhat.com,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Matthew,

On Sat, Apr 17, 2021 at 03:45:22AM +0100, Matthew Wilcox wrote:
> 
> Replacement patch to fix compiler warning.
> 
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Fri, 16 Apr 2021 16:34:55 -0400
> Subject: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
> To: brouer@redhat.com
> Cc: linux-kernel@vger.kernel.org,
>     linux-mm@kvack.org,
>     netdev@vger.kernel.org,
>     linuxppc-dev@lists.ozlabs.org,
>     linux-arm-kernel@lists.infradead.org,
>     linux-mips@vger.kernel.org,
>     ilias.apalodimas@linaro.org,
>     mcroce@linux.microsoft.com,
>     grygorii.strashko@ti.com,
>     arnd@kernel.org,
>     hch@lst.de,
>     linux-snps-arc@lists.infradead.org,
>     mhocko@kernel.org,
>     mgorman@suse.de
> 
> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.  When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
> 
> Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> This restores the alignment to that of an unsigned long, and also fixes a
> potential problem where (on a big endian platform), the bit used to denote
> PageTail could inadvertently get set, and a racing get_user_pages_fast()
> could dereference a bogus compound_head().
> 
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/mm_types.h |  4 ++--
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..5aacc1c10a45 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>  		};
>  		struct {	/* page_pool used by netstack */
>  			/**
> -			 * @dma_addr: might require a 64-bit value even on
> +			 * @dma_addr: might require a 64-bit value on
>  			 * 32-bit architectures.
>  			 */
> -			dma_addr_t dma_addr;
> +			unsigned long dma_addr[2];
>  		};
>  		struct {	/* slab, slob and slub */
>  			union {
> diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> index b5b195305346..ad6154dc206c 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>  
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -	return page->dma_addr;
> +	dma_addr_t ret = page->dma_addr[0];
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		ret |= (dma_addr_t)page->dma_addr[1] << 16 << 16;
> +	return ret;
> +}
> +
> +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> +{
> +	page->dma_addr[0] = addr;
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		page->dma_addr[1] = addr >> 16 >> 16;


The 'error' that was reported will never trigger right?
I assume this was compiled with dma_addr_t as 32bits (so it triggered the
compilation error), but the if check will never allow this codepath to run.
If so can we add a comment explaining this, since none of us will remember why
in 6 months from now?

>  }
>  
>  static inline bool is_page_pool_compiled_in(void)
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index ad8b0707af04..f014fd8c19a6 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -174,8 +174,10 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
>  					  struct page *page,
>  					  unsigned int dma_sync_size)
>  {
> +	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
> +
>  	dma_sync_size = min(dma_sync_size, pool->p.max_len);
> -	dma_sync_single_range_for_device(pool->p.dev, page->dma_addr,
> +	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
>  					 pool->p.offset, dma_sync_size,
>  					 pool->p.dma_dir);
>  }
> @@ -226,7 +228,7 @@ static struct page *__page_pool_alloc_pages_slow(struct page_pool *pool,
>  		put_page(page);
>  		return NULL;
>  	}
> -	page->dma_addr = dma;
> +	page_pool_set_dma_addr(page, dma);
>  
>  	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
>  		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);
> @@ -294,13 +296,13 @@ void page_pool_release_page(struct page_pool *pool, struct page *page)
>  		 */
>  		goto skip_dma_unmap;
>  
> -	dma = page->dma_addr;
> +	dma = page_pool_get_dma_addr(page);
>  
> -	/* When page is unmapped, it cannot be returned our pool */
> +	/* When page is unmapped, it cannot be returned to our pool */
>  	dma_unmap_page_attrs(pool->p.dev, dma,
>  			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
>  			     DMA_ATTR_SKIP_CPU_SYNC);
> -	page->dma_addr = 0;
> +	page_pool_set_dma_addr(page, 0);
>  skip_dma_unmap:
>  	/* This may be the last page returned, releasing the pool, so
>  	 * it is not safe to reference pool afterwards.
> -- 
> 2.30.2
> 

Thanks
/Ilias
