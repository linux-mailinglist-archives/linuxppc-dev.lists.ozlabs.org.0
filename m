Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B829BE08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 17:52:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLHmz6TxMzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 03:52:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLHjK6XYZzDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 03:49:08 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5CA9967373; Tue, 27 Oct 2020 17:48:58 +0100 (CET)
Date: Tue, 27 Oct 2020 17:48:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal
 IOMMU operation
Message-ID: <20201027164858.GA30651@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027101841.96056-2-aik@ozlabs.ru>
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
Cc: iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static inline bool dma_handle_direct(struct device *dev, dma_addr_t dma_handle)
> +{
> +       return dma_handle >= dev->archdata.dma_offset;
> +}

This won't compile except for powerpc, and directly accesing arch members
in common code is a bad idea.  Maybe both your helpers need to be
supplied by arch code to better abstract this out.

>  	if (dma_map_direct(dev, ops))
>  		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit &&
> +		 can_map_direct(dev, (phys_addr_t) page_to_phys(page) + offset + size))
> +		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> +#endif

I don't think page_to_phys needs a phys_addr_t on the return value.
I'd also much prefer if we make this a little more beautiful, here
are a few suggestions:

 - hide the bus_dma_limit check inside can_map_direct, and provide a
   stub so that we can avoid the ifdef
 - use a better name for can_map_direct, and maybe also a better calling
   convention by passing the page (the sg code also has the page), and
   maybe even hide the dma_map_direct inside it.

	if (dma_map_direct(dev, ops) ||
	    arch_dma_map_page_direct(dev, page, offset, size))
		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);

>  	BUG_ON(!valid_dma_direction(dir));
>  	if (dma_map_direct(dev, ops))
>  		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit && dma_handle_direct(dev, addr + size))
> +		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> +#endif

Same here.

>  	if (dma_map_direct(dev, ops))
>  		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	else if (dev->bus_dma_limit) {
> +		struct scatterlist *s;
> +		bool direct = true;
> +		int i;
> +
> +		for_each_sg(sg, s, nents, i) {
> +			direct = can_map_direct(dev, sg_phys(s) + s->offset + s->length);
> +			if (!direct)
> +				break;
> +		}
> +		if (direct)
> +			ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
> +		else
> +			ents = ops->map_sg(dev, sg, nents, dir, attrs);
> +	}
> +#endif

This needs to go into a helper as well.  I think the same style as
above would work pretty nicely as well:

 	if (dma_map_direct(dev, ops) ||
	    arch_dma_map_sg_direct(dev, sg, nents))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);

> +#ifdef CONFIG_DMA_OPS_BYPASS_BUS_LIMIT
> +	if (dev->bus_dma_limit) {
> +		struct scatterlist *s;
> +		bool direct = true;
> +		int i;
> +
> +		for_each_sg(sg, s, nents, i) {
> +			direct = dma_handle_direct(dev, s->dma_address + s->length);
> +			if (!direct)
> +				break;
> +		}
> +		if (direct) {
> +			dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
> +			return;
> +		}
> +	}
> +#endif

One more time here..
