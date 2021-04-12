Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B005335B7FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJW6B4m0Yz3bwh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:16:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sJNR212k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=sJNR212k; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJW5k5QLhz2yyG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:16:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=T0Zq9EStO1wC7R34W+g3UOBErmBYCTh0458TpX7pzAM=; b=sJNR212kfJE88C8nTxg0l1UoXm
 Cbal0fqU992DQHm3N5P+Ml/9N9Nv8acJ4+M9c61cLDw5tVx1vo3l6fZZROGO3u3JvlmQVNt4MgFBF
 g/LmZnGbLw61COtglVjylsbOp2kznKGio6cRT0PAyvdOG++3HcY0Qj2N4YAZR7/Ongh3aFzuLqR8m
 XpLj86Ky06EguyRTY9VLPmpIBLI0SVSSf/qM7da3I6iIUxLPkRa6HQGofx88BF7zq2UCvMpdlkUh2
 BFDTkwUVNukJv24on8dSKLRot4g8EsOusTp5QhTE7Rt9RCw1g68fuBAJPJZZ1YyczV5CDfiii3KiL
 qrpu7ngQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lVlAq-003fOL-Tu; Mon, 12 Apr 2021 01:15:34 +0000
Date: Mon, 12 Apr 2021 02:15:32 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210412011532.GG2531743@casper.infradead.org>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411103318.GC2531743@casper.infradead.org>
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Matteo Croce <mcroce@linux.microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 11, 2021 at 11:33:18AM +0100, Matthew Wilcox wrote:
> Basically, we have three aligned dwords here.  We can either alias with
> @flags and the first word of @lru, or the second word of @lru and @mapping,
> or @index and @private.  @flags is a non-starter.  If we use @mapping,
> then you have to set it to NULL before you free it, and I'm not sure
> how easy that will be for you.  If that's trivial, then we could use
> the layout:
> 
> 	unsigned long _pp_flags;
> 	unsigned long pp_magic;
> 	union {
> 		dma_addr_t dma_addr;    /* might be one or two words */
> 		unsigned long _pp_align[2];
> 	};
> 	unsigned long pp_pfmemalloc;
> 	unsigned long xmi;

I forgot about the munmap path.  That calls zap_page_range() which calls
set_page_dirty() which calls page_mapping().  If we use page->mapping,
that's going to get interpreted as an address_space pointer.

*sigh*.  Foiled at every turn.

I'm kind of inclined towards using two (or more) bits for PageSlab as
we discussed here:

https://lore.kernel.org/linux-mm/01000163efe179fe-d6270c58-eaba-482f-a6bd-334667250ef7-000000@email.amazonses.com/

so we have PageKAlloc that's true for PageSlab, PagePool, PageDMAPool,
PageVMalloc, PageFrag and maybe a few other kernel-internal allocations.

(see also here:)
https://lore.kernel.org/linux-mm/20180518194519.3820-18-willy@infradead.org/
