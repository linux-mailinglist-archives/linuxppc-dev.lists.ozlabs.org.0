Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE335FD5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 23:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLG572wnbz3brp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 07:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NsnSuNJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=NsnSuNJy; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLG4h3kQ9z2yRR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 07:36:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tiw0DSloQ939N1jQWOHUVqWakm9NGqZcvctG7ish7wk=; b=NsnSuNJytEImhL0Wo1cnKZ+7p9
 hHDLgKAJmuc/sHV7PxTbuuD4fJJ/J45u+/OMxBTS22YR7iIa+UYkqxN/gw8DmaU/dhnYxfek0WAl/
 EbqdwP8/2gdyPo96cf2wgNpsRvCy2X2e0tY8tuXdetX5UUk2RVgLrDNfo1FCPU5d0nU+b2vDEXV+F
 R5rW9JgGm8/SUwNGZuq+2tWKp47J0pTlUAu56KYCGGg4qlZ9MsL9iwJxxGMhITMU3iNjoYQVhtdH1
 huQUgK3Omj03NxN1K8suu9wQDUZb56zB4+gYivQGVkqHlCi/oYqL/F+XGVdyzo4j22SCP0GWB3riv
 tV58OZWw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lWnAy-007fMW-F1; Wed, 14 Apr 2021 21:36:00 +0000
Date: Wed, 14 Apr 2021 22:35:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210414213556.GY2531743@casper.infradead.org>
References: <20210410205246.507048-1-willy@infradead.org>
 <20210410205246.507048-2-willy@infradead.org>
 <20210411114307.5087f958@carbon>
 <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414211322.3799afd4@carbon>
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Matteo Croce <mcroce@linux.microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 14, 2021 at 09:13:22PM +0200, Jesper Dangaard Brouer wrote:
> (If others want to reproduce).  First I could not reproduce on ARM32.
> Then I found out that enabling CONFIG_XEN on ARCH=arm was needed to
> cause the issue by enabling CONFIG_ARCH_DMA_ADDR_T_64BIT.

hmmm ... you should be able to provoke it by enabling ARM_LPAE,
which selects PHYS_ADDR_T_64BIT, and

config ARCH_DMA_ADDR_T_64BIT
        def_bool 64BIT || PHYS_ADDR_T_64BIT

>  struct page {
>         long unsigned int          flags;                /*     0     4 */
> 
>         /* XXX 4 bytes hole, try to pack */
> 
>         union {
>                 struct {
>                         struct list_head lru;            /*     8     8 */
>                         struct address_space * mapping;  /*    16     4 */
>                         long unsigned int index;         /*    20     4 */
>                         long unsigned int private;       /*    24     4 */
>                 };                                       /*     8    20 */
>                 struct {
>                         dma_addr_t dma_addr;             /*     8     8 */
>                 };                                       /*     8     8 */
[...]
>         } __attribute__((__aligned__(8)));               /*     8    24 */
>         union {
>                 atomic_t           _mapcount;            /*    32     4 */
>                 unsigned int       page_type;            /*    32     4 */
>                 unsigned int       active;               /*    32     4 */
>                 int                units;                /*    32     4 */
>         };                                               /*    32     4 */
>         atomic_t                   _refcount;            /*    36     4 */
> 
>         /* size: 40, cachelines: 1, members: 4 */
>         /* sum members: 36, holes: 1, sum holes: 4 */
>         /* forced alignments: 1, forced holes: 1, sum forced holes: 4 */
>         /* last cacheline: 40 bytes */
> } __attribute__((__aligned__(8)));

If you also enable CONFIG_MEMCG or enough options to make
LAST_CPUPID_NOT_IN_PAGE_FLAGS true, you'll end up with another 4-byte
hole at the end.
