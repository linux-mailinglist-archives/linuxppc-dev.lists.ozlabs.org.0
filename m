Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71566362D29
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 05:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMdc72Z49z3c5v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 13:19:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eLkRpqM9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=eLkRpqM9; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMdbj2SnBz30DL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 13:19:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GyfHo5X+9TYxXDQBPsebhce873z4IO94hxWr4yFJsxk=; b=eLkRpqM9nVcIRoyRLRDTRb+BGw
 8Awo1hTN6pG0fPX4ENPtHTgJ48U/u51Nl9T7MLyFIioyj8ndHPm3xgvLjM9WDUKO5myVwtcj1L/tA
 vxyewxTVxm2oJidWu97Sn26XMpfCR94JhZaH1KmJvz8URVQ+vtrELkUHkUpY25zznz8ZZsxrr1F4C
 jZFWtzr1IDbg8asen9M5hZEr8pqF5z+i2kZWHrwxjbtCtUXLIA2GHxtapiozrml/Zzh4A0tEnLKFb
 ZThBj+SmcItxXjZ5LILeRy9iqYUuhHuFH2RjpdGU724ns0j//tKwz/QkauIH43rk3hZw41DH66Nr6
 qRM5Tlkw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXbUA-00AmRw-8N; Sat, 17 Apr 2021 03:19:10 +0000
Date: Sat, 17 Apr 2021 04:19:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210417031906.GQ2531743@casper.infradead.org>
References: <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
 <20210415200832.32796445@carbon>
 <20210416152755.GL2531743@casper.infradead.org>
 <20210416190823.3b3aace0@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416190823.3b3aace0@carbon>
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
 David Laight <David.Laight@aculab.com>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 07:08:23PM +0200, Jesper Dangaard Brouer wrote:
> On Fri, 16 Apr 2021 16:27:55 +0100
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > On Thu, Apr 15, 2021 at 08:08:32PM +0200, Jesper Dangaard Brouer wrote:
> > > See below patch.  Where I swap32 the dma address to satisfy
> > > page->compound having bit zero cleared. (It is the simplest fix I could
> > > come up with).  
> > 
> > I think this is slightly simpler, and as a bonus code that assumes the
> > old layout won't compile.
> 
> This is clever, I like it!  When reading the code one just have to
> remember 'unsigned long' size difference between 64-bit vs 32-bit.
> And I assume compiler can optimize the sizeof check out then doable.

I checked before/after with the replacement patch that doesn't
have compiler warnings.  On x86, there is zero codegen difference
(objdump -dr before/after matches exactly) for both x86-32 with 32-bit
dma_addr_t and x86-64.  For x86-32 with 64-bit dma_addr_t, the compiler
makes some different inlining decisions in page_pool_empty_ring(),
page_pool_put_page() and page_pool_put_page_bulk(), but it's not clear
to me that they're wrong.

Function                                     old     new   delta
page_pool_empty_ring                         387     307     -80
page_pool_put_page                           604     516     -88
page_pool_put_page_bulk                      690     517    -173

