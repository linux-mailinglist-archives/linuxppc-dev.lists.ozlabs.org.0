Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9876CC5B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 11:53:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q8bl1DwYzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 19:53:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q8Yg4nPCzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:52:05 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2EDA768B05; Thu, 18 Jul 2019 11:52:01 +0200 (CEST)
Date: Thu, 18 Jul 2019 11:52:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
Message-ID: <20190718095200.GA25744@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718084934.GF24562@lst.de>
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
Cc: Shawn Anastasio <shawn@anastas.io>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Sam Bobroff <sbobroff@linux.ibm.com>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 10:49:34AM +0200, Christoph Hellwig wrote:
> On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
> > > Other than m68k, mips, and arm64, everybody else that doesn't have
> > > ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
> > > I assume this behavior is acceptable on those architectures.
> > 
> > It might be acceptable, but there's no reason to use pgport_noncached
> > if the platform supports cache-coherent DMA.
> > 
> > Christoph (+cc) made the change so maybe he saw something we're missing.
> 
> I always found the forcing of noncached access even for coherent
> devices a little odd, but this was inherited from the previous
> implementation, which surprised me a bit as the different attributes
> are usually problematic even on x86.  Let me dig into the history a
> bit more, but I suspect the righ fix is to default to cached mappings
> for coherent devices.

Ok, some history:

The generic dma mmap implementation, which we are effectively still
using today was added by:

commit 64ccc9c033c6089b2d426dad3c56477ab066c999
Author: Marek Szyprowski <m.szyprowski@samsung.com>
Date:   Thu Jun 14 13:03:04 2012 +0200

    common: dma-mapping: add support for generic dma_mmap_* calls

and unconditionally uses pgprot_noncached in dma_common_mmap, which is
then used as the fallback by dma_mmap_attrs if no ->mmap method is
present.  At that point we already had the powerpc implementation
that only uses pgprot_noncached for non-coherent mappings, and
the arm one, which uses pgprot_writecombine if DMA_ATTR_WRITE_COMBINE
is set and otherwise pgprot_dmacoherent, which seems to be uncached.
Arm did support coherent platforms at that time, but they might have
been an afterthought and not handled properly.

So it migt have been that we were all wrong for that time and might
have to fix it up.
