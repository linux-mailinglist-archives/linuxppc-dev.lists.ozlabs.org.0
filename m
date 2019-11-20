Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85174103890
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:19:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J0Zr5mgFzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 22:19:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J0Wb02THzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 22:16:42 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F64B68B05; Wed, 20 Nov 2019 12:16:37 +0100 (CET)
Date: Wed, 20 Nov 2019 12:16:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: generic DMA bypass flag
Message-ID: <20191120111637.GA4248@lst.de>
References: <20191113133731.20870-1-hch@lst.de>
 <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
 <20191114074105.GC26546@lst.de>
 <9c8f4d7b-43e0-a336-5d93-88aef8aae716@arm.com> <20191116062258.GA8913@lst.de>
 <f2335431-8cd4-e1ab-013d-573d163f4067@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2335431-8cd4-e1ab-013d-573d163f4067@arm.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 19, 2019 at 05:41:58PM +0000, Robin Murphy wrote:
> Is that a problem though? It's not safe in general to rewrite the default 
> domain willy-nilly,

Well.  Can you look at what intel-iommu does right now so that we can
sort that out first?

> so if it's a concern that drivers get stuck having to 
> use a translation domain if they do something dumb like:
>
> 	if (!dma_set_mask(DMA_BIT_MASK(32))
> 		dma_set_mask(DMA_BIT_MASK(64));
>
> then the simple solution is "don't do that" - note that this doesn't affect 
> overriding of the default 32-bit mask, because we don't use the driver API 
> to initialise those.

>>  And we had a couple drivers playing
>> interesting games there.
>
> If the games you're worried about are stuff like:
>
> 	dma_set_mask(dev, DMA_BIT_MASK(64));
> 	high_buf = dma_alloc_coherent(dev, ...);
> 	dma_set_mask(dev, DMA_BIT_MASK(32));
> 	low_buf = dma_alloc_coherent(dev, ...);
>
> then iommu_need_mapping() already ensures that will end spectacularly 
> badly. Unless we can somehow log when a mask has been "committed" by a 
> mapping operation, I don't think any kind of opportunistic bypass mechanism 
> is ever not going to blow up that case.

The prime example I had in mind is sata_nv.c.  This first does
a

	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));

and does a dma_alloc_coherent for buffers that have "legacy" descriptors.
Then does a

	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));

and allocates the other coherent buffers than can be 64-bit capable.
and then actually overrides the streaming dma mask to 32-bit if
there is an ATAPI device attached for which it has some limitations,
or otherwise keeps the 64-bit mask in a somewhat odd way.  But
this device actually can't be used with intel IOMMU as it is integrted
into the nforce chipsets.

But looking through this mess I'm tempted to agree with you that if
anyone is messing with the mask to first set it to 32-bit and then
back they can live with the default domain and iommu overhead..

>>  FYI, this is the current intel-iommu
>> WIP conversion to the dma bypass flag:
>>
>> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-bypass
>
> Having thought a bit more, I guess my idea does end up with one slightly 
> ugly corner wherein dma_direct_supported() has to learn to look for an 
> IOMMU default domain and try iommu_dma_supported() before saying no, even 
> if it's clean everywhere else.

Yes, that actually is my main worry.  The "upgrading" from dma_iommu_ops
to direct / NULL is pretty easy and clean, it is the other way that is
a mess.

> The bypass flag is more 'balanced' in terms 
> of being equally invasive everywhere and preserving abstraction a bit 
> better. Plus I think it might let us bring back the default assignment of 
> dma_dummy_ops, which I do like the thought of :D

I was hoping to get rid of dma_dummy_ops once we've killed off the last
leftovers of allowing DMA with a NULL dma_mask or *dma_mask and just
reject all DMA operations in that case.

> Either way, making sure that the fundamental bypass decision is correct and 
> robust is still far more important than the implementation details.

So maybe we should massage intel-iommu toward that first.  Let me and Lu
know what makes sense to improve.
