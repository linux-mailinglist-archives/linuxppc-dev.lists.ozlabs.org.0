Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 540261167B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 08:56:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wb9Q33vdzDqQP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 18:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cdeQwFjY"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wb7Q1XgZzDqDD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 18:54:25 +1100 (AEDT)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EAA2206D3;
 Mon,  9 Dec 2019 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575878063;
 bh=l5RNIqY71fgRQ4gflWGJ6VKGFQXsfgVwTeBzBRWCnmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdeQwFjYFMVzFUr+WBxPM2UoXcUM34dHDHDlXse6W6pGhUNw4fXvyRJZsZxwoSt7e
 /90E+MSe4ehpwRUS2sdbf77ubqB8d1DrkO2CSKEuGO9YsT9AvJPnhG7JbgbZEksY6H
 qnqAaymyoD4xlJ8PxUL70giW5qfYCn6C8GYHBKGs=
Date: Mon, 9 Dec 2019 09:54:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: ensure that swiotlb buffer is allocated from
 low memory
Message-ID: <20191209075413.GA4137@rapoport-lnx>
References: <20191204123524.22919-1-rppt@kernel.org>
 <87h82aqcju.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h82aqcju.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-arch@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 09, 2019 at 04:43:17PM +1100, Michael Ellerman wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Some powerpc platforms (e.g. 85xx) limit DMA-able memory way below 4G. If a
> > system has more physical memory than this limit, the swiotlb buffer is not
> > addressable because it is allocated from memblock using top-down mode.
> >
> > Force memblock to bottom-up mode before calling swiotlb_init() to ensure
> > that the swiotlb buffer is DMA-able.
> >
> > Link: https://lkml.kernel.org/r/F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de
> 
> This wasn't bisected, but I thought it was a regression. Do we know what
> commit caused it?
> 
> Was it 25078dc1f74b ("powerpc: use mm zones more sensibly") ?

swiotlb buffer is initialized before zones are actually used, so probably
not :)
 
> Or was that a red herring?
> 
> cheers
> 
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Darren Stevens <darren@stevens-zone.net>
> > Cc: mad skateman <madskateman@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  arch/powerpc/mm/mem.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index be941d382c8d..14c2c53e3f9e 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -260,6 +260,14 @@ void __init mem_init(void)
> >  	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
> >  
> >  #ifdef CONFIG_SWIOTLB
> > +	/*
> > +	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
> > +	 * 4G. We force memblock to bottom-up mode to ensure that the
> > +	 * memory allocated in swiotlb_init() is DMA-able.
> > +	 * As it's the last memblock allocation, no need to reset it
> > +	 * back to to-down.
> > +	 */
> > +	memblock_set_bottom_up(true);
> >  	swiotlb_init(0);
> >  #endif
> >  
> > -- 
> > 2.24.0

-- 
Sincerely yours,
Mike.
