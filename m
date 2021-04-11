Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3923735B2D5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 11:43:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ6Q50p4Nz3c0j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 19:43:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gnL8fzn4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bt/+IqnG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=gnL8fzn4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bt/+IqnG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ6Pd3xkkz2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 19:43:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618134205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOqiznYAiRVy/Amk28LrMWkmWtJUIVRZ/la5M97wHQ8=;
 b=gnL8fzn44HblNBVNKZ58Y5hTQXxVh0N0VTRFISRDAjd28pTFFoeH1KjT/Ex/gpXZwfwyOr
 wn4N60pWuHCpsTVobj4XL5nfNHgmjB4hddNmOAVqRnVS7EzH3t89WkxC6TY/Z96H/z/dbG
 oD89jmoJqqOO/dEAAqoK4043XNlNXeU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618134206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOqiznYAiRVy/Amk28LrMWkmWtJUIVRZ/la5M97wHQ8=;
 b=bt/+IqnGtxeH9Hil71V0OdHqglMeowwrIbjcjDnEXTsG+u39Hd++JzylnxkZmHQbtq61YP
 ZMst7uo4B1U2TQ5nLxTCCqfsbcU4d3yxz1EVPx4Apy0k+NwbV11mo6jbVxuXlObDJtYMX6
 qcKi2nUChBWPu4PL4Qa81rrrjMIkO3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-iowazDUgNc61YX-AnGHs-A-1; Sun, 11 Apr 2021 05:43:21 -0400
X-MC-Unique: iowazDUgNc61YX-AnGHs-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92CFA501FB;
 Sun, 11 Apr 2021 09:43:18 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B66045D9D3;
 Sun, 11 Apr 2021 09:43:10 +0000 (UTC)
Date: Sun, 11 Apr 2021 11:43:07 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210411114307.5087f958@carbon>
In-Reply-To: <20210410205246.507048-2-willy@infradead.org>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, brouer@redhat.com,
 Matteo Croce <mcroce@linux.microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 10 Apr 2021 21:52:45 +0100
"Matthew Wilcox (Oracle)" <willy@infradead.org> wrote:

> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.  When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
> 
> We could fix this by telling the compiler to use a smaller alignment
> for the dma_addr, but that seems a little fragile.  Instead, move the
> 'flags' into the union.  That causes dma_addr to shift into the same
> bits as 'mapping', so it would have to be cleared on free.  To avoid
> this, insert three words of padding and use the same bits as ->index
> and ->private, neither of which have to be cleared on free.
> 
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/mm_types.h | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..45c563e9b50e 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -68,16 +68,22 @@ struct mem_cgroup;
>  #endif
>  
>  struct page {
> -	unsigned long flags;		/* Atomic flags, some possibly
> -					 * updated asynchronously */
>  	/*
> -	 * Five words (20/40 bytes) are available in this union.
> -	 * WARNING: bit 0 of the first word is used for PageTail(). That
> -	 * means the other users of this union MUST NOT use the bit to
> +	 * This union is six words (24 / 48 bytes) in size.
> +	 * The first word is reserved for atomic flags, often updated
> +	 * asynchronously.  Use the PageFoo() macros to access it.  Some
> +	 * of the flags can be reused for your own purposes, but the
> +	 * word as a whole often contains other information and overwriting
> +	 * it will cause functions like page_zone() and page_node() to stop
> +	 * working correctly.
> +	 *
> +	 * Bit 0 of the second word is used for PageTail(). That
> +	 * means the other users of this union MUST leave the bit zero to
>  	 * avoid collision and false-positive PageTail().
>  	 */
>  	union {
>  		struct {	/* Page cache and anonymous pages */
> +			unsigned long flags;
>  			/**
>  			 * @lru: Pageout list, eg. active_list protected by
>  			 * lruvec->lru_lock.  Sometimes used as a generic list
> @@ -96,13 +102,14 @@ struct page {
>  			unsigned long private;
>  		};
>  		struct {	/* page_pool used by netstack */
> -			/**
> -			 * @dma_addr: might require a 64-bit value even on
> -			 * 32-bit architectures.
> -			 */
> -			dma_addr_t dma_addr;

The original intend of placing member @dma_addr here is that it overlap
with @LRU (type struct list_head) which contains two pointers.  Thus, in
case of CONFIG_ARCH_DMA_ADDR_T_64BIT=y on 32-bit architectures it would
use both pointers.

Thinking more about this, this design is flawed as bit 0 of the first
word is used for compound pages (see PageTail and @compound_head), is
reserved.  We knew DMA addresses were aligned, thus we though this
satisfied that need.  BUT for DMA_ADDR_T_64BIT=y on 32-bit arch the
first word will contain the "upper" part of the DMA addr, which I don't
think gives this guarantee.

I guess, nobody are using this combination?!?  I though we added this
to satisfy TI (Texas Instrument) driver cpsw (code in
drivers/net/ethernet/ti/cpsw*).  Thus, I assumed it was in use?


> +			unsigned long _pp_flags;
> +			unsigned long pp_magic;
> +			unsigned long xmi;

Matteo notice, I think intent is we can store xdp_mem_info in @xmi.

> +			unsigned long _pp_mapping_pad;
> +			dma_addr_t dma_addr;	/* might be one or two words */
>  		};

Could you explain your intent here?
I worry about @index.

As I mentioned in other thread[1] netstack use page_is_pfmemalloc()
(code copy-pasted below signature) which imply that the member @index
have to be kept intact. In above, I'm unsure @index is untouched.

[1] https://lore.kernel.org/lkml/20210410082158.79ad09a6@carbon/
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

/*
 * Return true only if the page has been allocated with
 * ALLOC_NO_WATERMARKS and the low watermark was not
 * met implying that the system is under some pressure.
 */
static inline bool page_is_pfmemalloc(const struct page *page)
{
	/*
	 * Page index cannot be this large so this must be
	 * a pfmemalloc page.
	 */
	return page->index == -1UL;
}

/*
 * Only to be called by the page allocator on a freshly allocated
 * page.
 */
static inline void set_page_pfmemalloc(struct page *page)
{
	page->index = -1UL;
}

static inline void clear_page_pfmemalloc(struct page *page)
{
	page->index = 0;
}

