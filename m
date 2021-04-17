Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4836307E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 15:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMvmW5rDNz3byF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SZN1IHMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=SZN1IHMP; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMvm40xjfz2yhl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 23:57:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xqgFJlR+jU3BMFPCC8NQxTzbFxfigD7vTUNnUGq4vIY=; b=SZN1IHMPzUuDEQpeH8U5/v7rff
 H6wrF1LIVDWRSRtlMXzSRwuAre+050GPjLA2iogcsGTXqqfEDGxaC4rXfUbOM25eg0E50CHt5+SJL
 1DjWYV0FM+08rQ1DpvQpoRCUX1YJJPp0dedZYxJ9aY2NaXbG+K3aifWyE0y411QrrJCRsyswU33Sa
 YbZV2+Q8TcIZK7v5N7lFZg8nXNefltcXpFfCGcJzW2rxXoRzVgIZbtuchtRjCKjJct4ZvMbIHXCjN
 otbSGYMAGgTgXFZOZWNCv3haV2wRKBJOwIRzHCU6S+6H0uqypx9YY5LVvS6Yy/6PQ424wGJ7CYdGm
 5eCR6yHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXlRC-00BJyr-Q7; Sat, 17 Apr 2021 13:56:47 +0000
Date: Sat, 17 Apr 2021 14:56:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210417135642.GR2531743@casper.infradead.org>
References: <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
 <20210415200832.32796445@carbon>
 <20210416152755.GL2531743@casper.infradead.org>
 <CAK8P3a2dekzohOrHpLq6yyuaoyC4UOxxucu6kX2oddeq5Jdqfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2dekzohOrHpLq6yyuaoyC4UOxxucu6kX2oddeq5Jdqfg@mail.gmail.com>
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Laight <David.Laight@aculab.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 12:31:37PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 16, 2021 at 5:27 PM Matthew Wilcox <willy@infradead.org> wrote:
> > diff --git a/include/net/page_pool.h b/include/net/page_pool.h
> > index b5b195305346..db7c7020746a 100644
> > --- a/include/net/page_pool.h
> > +++ b/include/net/page_pool.h
> > @@ -198,7 +198,17 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
> >
> >  static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
> >  {
> > -       return page->dma_addr;
> > +       dma_addr_t ret = page->dma_addr[0];
> > +       if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +               ret |= (dma_addr_t)page->dma_addr[1] << 32;
> > +       return ret;
> > +}
> 
> Have you considered using a PFN type address here? I suspect you
> can prove that shifting the DMA address by PAGE_BITS would
> make it fit into an 'unsigned long' on all 32-bit architectures with
> 64-bit dma_addr_t. This requires that page->dma_addr to be
> page aligned, as well as fit into 44 bits. I recently went through the
> maximum address space per architecture to define a
> MAX_POSSIBLE_PHYSMEM_BITS, and none of them have more than
> 40 here, presumably the same is true for dma address space.

I wouldn't like to make that assumption.  I've come across IOMMUs (maybe
on parisc?  powerpc?) that like to encode fun information in the top
few bits.  So we could get it down to 52 bits, but I don't think we can
get all the way down to 32 bits.  Also, we need to keep the bottom bit
clear for PageTail, so that further constrains us.

Anyway, I like the "two unsigned longs" approach I posted yesterday,
but thanks for the suggestion.
