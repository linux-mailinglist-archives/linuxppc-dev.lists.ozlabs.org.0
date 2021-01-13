Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D62F4B48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 13:30:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG6H607YtzDrWZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 23:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=RIeWKwdC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG6D32k2kzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 23:28:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45BAB2313E;
 Wed, 13 Jan 2021 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610540878;
 bh=DMT/14eqvz5zf53FuIMip/3tOpUYx9AeGju+aNpk6Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RIeWKwdCzel81a5/+igwlQa7a96S4uuDSVMhO/TwoBeDkIRVbX+C6VT/zl3DHzGuy
 TN7OjM0+Zieesb8xP+RgbKU5rKX0cUd7nzCdBCw4R29wCGdqUIBnkZaVV1OJ6+Cnca
 DxODljnCCEJbvE8Rkq5e8BMdF1IFL/e9Km/FCSDg=
Date: Wed, 13 Jan 2021 13:29:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <X/7nkb/YDpKlakRO@kroah.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <X/VrqxcaAMi65CF0@kroah.com> <20210113115126.GB29376@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113115126.GB29376@lst.de>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, frowand.list@gmail.com, mingo@kernel.org,
 m.szyprowski@samsung.com, sstabellini@kernel.org, saravanak@google.com,
 xypron.glpk@gmx.de, joro@8bytes.org, rafael.j.wysocki@intel.com,
 bgolaszewski@baylibre.com, xen-devel@lists.xenproject.org, treding@nvidia.com,
 devicetree@vger.kernel.org, will@kernel.org, konrad.wilk@oracle.com,
 dan.j.williams@intel.com, robh+dt@kernel.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 andriy.shevchenko@linux.intel.com, jgross@suse.com, drinkcat@chromium.org,
 linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 12:51:26PM +0100, Christoph Hellwig wrote:
> On Wed, Jan 06, 2021 at 08:50:03AM +0100, Greg KH wrote:
> > > --- a/include/linux/device.h
> > > +++ b/include/linux/device.h
> > > @@ -413,6 +413,7 @@ struct dev_links_info {
> > >   * @dma_pools:	Dma pools (if dma'ble device).
> > >   * @dma_mem:	Internal for coherent mem override.
> > >   * @cma_area:	Contiguous memory area for dma allocations
> > > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> > 
> > Why does this have to be added here?  Shouldn't the platform-specific
> > code handle it instead?
> 
> The whole code added here is pretty generic.  What we need to eventually
> do, though is to add a separate dma_device instead of adding more and more
> bloat to struct device.

I have no objections for that happening!
