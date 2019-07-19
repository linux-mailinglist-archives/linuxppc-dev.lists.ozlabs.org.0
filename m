Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8AB6E160
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:08:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhtV5p0RzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhrp3P0vzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 17:07:04 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C11CF68BFE; Fri, 19 Jul 2019 09:06:59 +0200 (CEST)
Date: Fri, 19 Jul 2019 09:06:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Shawn Anastasio <shawn@anastas.io>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
Message-ID: <20190719070659.GA19555@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
 <2da4fafe-93f2-4bf1-62e1-180a3ac800fa@anastas.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da4fafe-93f2-4bf1-62e1-180a3ac800fa@anastas.io>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 02:46:00PM -0500, Shawn Anastasio wrote:
> Personally, I'm not a huge fan of an implicit default for something
> inherently architecture-dependent like this at all.

What is inherently architecture specific here over the fact that
the pgprot_* expand to architecture specific bits?

> What I'd like to
> see is a mechanism that forces architecture code to explicitly
> opt in to the default pgprot settings if they don't provide an
> implementation of arch_dma_mmap_pgprot. This could perhaps be done
> by reversing ARCH_HAS_DMA_MMAP_PGPROT to something like
> ARCH_USE_DEFAULT_DMA_MMAP_PGPROT.

I'd rather not create boilerplate code where we don't have to it.  Note
that arch_dma_mmap_pgprot is a little misnamed now, as we also use it
for the in-kernel remapping in kernel/dma/remap.c, which I'm slowly
switching a lot of architectures to.  powerpc will follow soon once
I get the ppc44x that was given to me to actually boot with a recent
kernel (not that I've tried much so far).

>
> This way as more systems are moved to use the common mmap code instead
> of their ops->mmap, the people doing the refactoring have to make an
> explicit decision about the pgprot settings to use. Such a configuration
> would have likely prevented this situation with powerpc from happening.

Every arch except for arm32 now uses dma direct for the direct mapping,
and thus the common code without the indeed odd default.  I also have
a series to remove the default fallback, which is inherently a bad idea:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-no-defaults

> That being said, if the default behavior doesn't make sense in the
> general case it should probably be fixed as well.
>
> Curious to hear some thoughts on this.

I think your patch that started this thread is fine for 5.3 and -stable:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But going forward I'd rather have a sane default.
