Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 926021AF8A1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:12:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jGl5LR7zDr0d
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:11:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 494j2B0D39zDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:01:04 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7C63E68BEB; Sun, 19 Apr 2020 10:00:58 +0200 (CEST)
Date: Sun, 19 Apr 2020 10:00:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 3/4] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200419080058.GB12222@lst.de>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-4-hch@lst.de> <20200418124205.GD6113@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418124205.GD6113@8bytes.org>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 18, 2020 at 02:42:05PM +0200, Joerg Roedel wrote:
> Hi Christoph,
> 
> On Tue, Apr 14, 2020 at 02:25:05PM +0200, Christoph Hellwig wrote:
> > +static inline bool dma_map_direct(struct device *dev,
> > +		const struct dma_map_ops *ops)
> > +{
> > +	if (likely(!ops))
> > +		return true;
> > +	if (!dev->dma_ops_bypass)
> > +		return false;
> > +
> > +	return min_not_zero(*dev->dma_mask, dev->bus_dma_limit) >=
> > +			    dma_direct_get_required_mask(dev);
> 
> Why is the dma-mask check done here? The dma-direct code handles memory
> outside of the devices dma-mask with swiotlb, no?
> 
> I also don't quite get what the difference between setting the
> dma_ops_bypass flag non-zero and setting ops to NULL is.

The difference is that NULL ops mean imply the direct mapping is always
used, dma_ops_bypass means a direct mapping is used if no bounce buffering
using swiotlb is needed, which should also answer your first question.
The idea is to consolidate code in the core to use an opportunistic
direct mapping instead of the dynamic iommu mapping.  I though the cover
letter and commit log explained this well enough, but maybe I need to
do a better job.
