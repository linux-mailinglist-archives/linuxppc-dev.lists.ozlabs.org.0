Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58D361210
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:23:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLnlT5tQhz3c0N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 04:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wG2nyDBr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=wG2nyDBr; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLnkz1grrz2yjL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 04:22:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gKCpPVH0zLH7350hew5abAqhtVNiLjtRV76fLbYYb+0=; b=wG2nyDBrfmLZ4TcBpx88r9PWVl
 3U4kADELcVjuOPtZ5l8fWM5FpiPi0MvBChU6z4pigm+4d3/IyA/rykcPa6Ez2VigbwsC3UPnAkc+W
 vmN6atSs4SENxN5qvX557Ool3O69b3V6wSZcG/sJdVonl+UIoHK4kJPxespkgvCzKBL4WcPuyLpsq
 dViYcOw65GEk5Yxkc7RgzTl1+mj9yvOsC/RM+WdC+denGdvUNnPA+IkH0/brZB3SoO7Z69nF0JFbG
 amnxq8lvQoXIjmGnk8OMhvVLPob0uEI+l0LEm5vy67THKuFe7CM62OBgG/ON01RHKhpOZ7BZZS/fQ
 ZY8+hw0g==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lX6cl-008vZa-Uh; Thu, 15 Apr 2021 18:22:01 +0000
Date: Thu, 15 Apr 2021 19:21:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210415182155.GD2531743@casper.infradead.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415200832.32796445@carbon>
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

On Thu, Apr 15, 2021 at 08:08:32PM +0200, Jesper Dangaard Brouer wrote:
> +static inline
> +dma_addr_t page_pool_dma_addr_read(dma_addr_t dma_addr)
> +{
> +	/* Workaround for storing 64-bit DMA-addr on 32-bit machines in struct
> +	 * page.  The page->dma_addr share area with page->compound_head which
> +	 * use bit zero to mark compound pages. This is okay, as DMA-addr are
> +	 * aligned pointers which have bit zero cleared.
> +	 *
> +	 * In the 32-bit case, page->compound_head is 32-bit.  Thus, when
> +	 * dma_addr_t is 64-bit it will be located in top 32-bit.  Solve by
> +	 * swapping dma_addr 32-bit segments.
> +	 */
> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT

#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT) && defined(__BIG_ENDIAN)
otherwise you'll create the problem on ARM that you're avoiding on PPC ...

I think you want to delete the word '_read' from this function name because
you're using it for both read and write.

