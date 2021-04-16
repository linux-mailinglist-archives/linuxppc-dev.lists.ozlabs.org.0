Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C598E36265A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 19:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMN3b4v3jz3brV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 03:09:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EBTEYHFC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EBTEYHFC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EBTEYHFC; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EBTEYHFC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMN370PHcz2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 03:08:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618592919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04d/YP/XeREquXdVGX4E7+iWkSvKezEziIy7Br93wNo=;
 b=EBTEYHFC05RVzbHV+IM21itH7EZJjPt3eex0ghXI2GKillFEQ0OzninC3yjJk/sTxFKIT6
 alcn2OeUR9y9Pb5D0IYp2LiyKPB9W/Ogqs3UY6McONsyWYVwFHnkuWKAl3j25rdX8kRpQR
 uuw8elh0SnDqUubr439k3eOhxSwYxDw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618592919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04d/YP/XeREquXdVGX4E7+iWkSvKezEziIy7Br93wNo=;
 b=EBTEYHFC05RVzbHV+IM21itH7EZJjPt3eex0ghXI2GKillFEQ0OzninC3yjJk/sTxFKIT6
 alcn2OeUR9y9Pb5D0IYp2LiyKPB9W/Ogqs3UY6McONsyWYVwFHnkuWKAl3j25rdX8kRpQR
 uuw8elh0SnDqUubr439k3eOhxSwYxDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-t1CdtVGrNiG8scC-Sd9o6A-1; Fri, 16 Apr 2021 13:08:35 -0400
X-MC-Unique: t1CdtVGrNiG8scC-Sd9o6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8AC1874998;
 Fri, 16 Apr 2021 17:08:33 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E9675D749;
 Fri, 16 Apr 2021 17:08:24 +0000 (UTC)
Date: Fri, 16 Apr 2021 19:08:23 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210416190823.3b3aace0@carbon>
In-Reply-To: <20210416152755.GL2531743@casper.infradead.org>
References: <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
 <20210415200832.32796445@carbon>
 <20210416152755.GL2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Laight <David.Laight@aculab.com>, brouer@redhat.com,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 16:27:55 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Thu, Apr 15, 2021 at 08:08:32PM +0200, Jesper Dangaard Brouer wrote:
> > See below patch.  Where I swap32 the dma address to satisfy
> > page->compound having bit zero cleared. (It is the simplest fix I could
> > come up with).  
> 
> I think this is slightly simpler, and as a bonus code that assumes the
> old layout won't compile.

This is clever, I like it!  When reading the code one just have to
remember 'unsigned long' size difference between 64-bit vs 32-bit.
And I assume compiler can optimize the sizeof check out then doable.

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
> index b5b195305346..db7c7020746a 100644
> --- a/include/net/page_pool.h
> +++ b/include/net/page_pool.h
> @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
>  
>  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
>  {
> -	return page->dma_addr;
> +	dma_addr_t ret = page->dma_addr[0];
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		ret |= (dma_addr_t)page->dma_addr[1] << 32;
> +	return ret;
> +}
> +
> +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> +{
> +	page->dma_addr[0] = addr;
> +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> +		page->dma_addr[1] = addr >> 32;
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
> 



-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

