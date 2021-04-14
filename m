Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13235EF1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 10:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKwD06Cv5z3bVF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMolz8eO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMolz8eO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=brouer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HMolz8eO; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMolz8eO; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKwCY40Ygz2y88
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 18:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618387859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwYB5nz8yfF5tg561fCrH5gbdVVTxmjpf7rPCaT4AzE=;
 b=HMolz8eOSdDUm58k+BoSjmoFt0Pc0ZpSkL1VXLQfbNEn5GFrY30WkJLFtY7yCuigxk9VJe
 Z1xb9i3LO1EzSQWGA77V0xFV3Af7539rv5i9fXbrDG8HOsmWtVAam8q9s4QdR754CjM4nC
 f3jNj0CWtz94qD3lrH/a2mXXg5yr4jY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618387859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwYB5nz8yfF5tg561fCrH5gbdVVTxmjpf7rPCaT4AzE=;
 b=HMolz8eOSdDUm58k+BoSjmoFt0Pc0ZpSkL1VXLQfbNEn5GFrY30WkJLFtY7yCuigxk9VJe
 Z1xb9i3LO1EzSQWGA77V0xFV3Af7539rv5i9fXbrDG8HOsmWtVAam8q9s4QdR754CjM4nC
 f3jNj0CWtz94qD3lrH/a2mXXg5yr4jY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-uxPR0e8iMvqotYdo8VKEqQ-1; Wed, 14 Apr 2021 04:10:54 -0400
X-MC-Unique: uxPR0e8iMvqotYdo8VKEqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E40087504F;
 Wed, 14 Apr 2021 08:10:52 +0000 (UTC)
Received: from carbon (unknown [10.36.110.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4FFE5D9CA;
 Wed, 14 Apr 2021 08:10:45 +0000 (UTC)
Date: Wed, 14 Apr 2021 10:10:44 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210414101044.19da09df@carbon>
In-Reply-To: <20210412011532.GG2531743@casper.infradead.org>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
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
 Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, brouer@redhat.com,
 Matteo Croce <mcroce@linux.microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 02:15:32 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Sun, Apr 11, 2021 at 11:33:18AM +0100, Matthew Wilcox wrote:
> > Basically, we have three aligned dwords here.  We can either alias with
> > @flags and the first word of @lru, or the second word of @lru and @mapping,
> > or @index and @private.  @flags is a non-starter.  If we use @mapping,
> > then you have to set it to NULL before you free it, and I'm not sure
> > how easy that will be for you.  If that's trivial, then we could use
> > the layout:
> > 
> > 	unsigned long _pp_flags;
> > 	unsigned long pp_magic;
> > 	union {
> > 		dma_addr_t dma_addr;    /* might be one or two words */
> > 		unsigned long _pp_align[2];
> > 	};
> > 	unsigned long pp_pfmemalloc;
> > 	unsigned long xmi;  
> 
> I forgot about the munmap path.  That calls zap_page_range() which calls
> set_page_dirty() which calls page_mapping().  If we use page->mapping,
> that's going to get interpreted as an address_space pointer.
> 
> *sigh*.  Foiled at every turn.

Yes, indeed! - And very frustrating.  It's keeping me up at night.
I'm dreaming about 32 vs 64 bit data structures. My fitbit stats tell
me that I don't sleep well with these kind of dreams ;-)

> I'm kind of inclined towards using two (or more) bits for PageSlab as
> we discussed here:
> 
> https://lore.kernel.org/linux-mm/01000163efe179fe-d6270c58-eaba-482f-a6bd-334667250ef7-000000@email.amazonses.com/
> 
> so we have PageKAlloc that's true for PageSlab, PagePool, PageDMAPool,
> PageVMalloc, PageFrag and maybe a few other kernel-internal allocations.

I actually like this idea a lot.  I also think it will solve or remove
Matteo/Ilias'es[2] need to introduce the pp_magic signature.  Ilias do
say[1] that page_pool pages could be used for TCP RX zerocopy, but I
don't think we should "allow" that (meaning page_pool should drop the
DMA-mapping and give up recycling).  I should argue why in that thread.

That said, I think we need to have a quicker fix for the immediate
issue with 64-bit bit dma_addr on 32-bit arch and the misalignment hole
it leaves[3] in struct page.  In[3] you mention ppc32, does it only
happens on certain 32-bit archs?

I'm seriously considering removing page_pool's support for doing/keeping
DMA-mappings on 32-bit arch's.  AFAIK only a single driver use this.

> (see also here:)
> https://lore.kernel.org/linux-mm/20180518194519.3820-18-willy@infradead.org/

[1] https://lore.kernel.org/netdev/YHHuE7g73mZNrMV4@enceladus/
[2] https://patchwork.kernel.org/project/netdevbpf/patch/20210409223801.104657-3-mcroce@linux.microsoft.com/
[3] https://lore.kernel.org/linux-mm/20210410024313.GX2531743@casper.infradead.org/
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

