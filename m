Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DB18F0FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:39:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m78n2wZtzDqd2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:39:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m76L2MmTzDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:37:12 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 984DB68BEB; Mon, 23 Mar 2020 09:37:05 +0100 (CET)
Date: Mon, 23 Mar 2020 09:37:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200323083705.GA31245@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 12:28:34PM +1100, Alexey Kardashevskiy wrote:

[full quote deleted, please follow proper quoting rules]

> > +static bool dma_alloc_direct(struct device *dev, const struct dma_map_ops *ops)
> > +{
> > +	if (!ops)
> > +		return true;
> > +
> > +	/*
> > +	 * Allows IOMMU drivers to bypass dynamic translations if the DMA mask
> > +	 * is large enough.
> > +	 */
> > +	if (dev->dma_ops_bypass) {
> > +		if (min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit) >=
> > +				dma_direct_get_required_mask(dev))
> > +			return true;
> > +	}
> 
> 
> Why not do this in dma_map_direct() as well?

Mostly beacuse it is a relatively expensive operation, including a
fls64.

> Or simply have just one dma_map_direct()?

What do you mean with that?

> And one more general question - we need a way to use non-direct IOMMU
> for RAM above certain limit.
> 
> Let's say we have a system with:
> 0 .. 0x1.0000.0000
> 0x100.0000.0000 .. 0x101.0000.0000
> 
> 2x4G, each is 1TB aligned. And we can map directly only the first 4GB
> (because of the maximum IOMMU table size) but not the other. And 1:1 on
> that "pseries" is done with offset=0x0800.0000.0000.0000.
> 
> So we want to check every bus address against dev->bus_dma_limit, not
> dev->coherent_dma_mask. In the example above I'd set bus_dma_limit to
> 0x0800.0001.0000.0000 and 1:1 mapping for the second 4GB would not be
> tried. Does this sound reasonable? Thanks,

bus_dma_limit is just another limiting factor applied on top of
coherent_dma_mask or dma_mask respectively.
