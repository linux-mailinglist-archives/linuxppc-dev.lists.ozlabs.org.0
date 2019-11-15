Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F8FE4BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 19:15:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F63G0F75zF7Zh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 05:15:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47F6084cJszF597
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 05:12:54 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D89830E;
 Fri, 15 Nov 2019 10:12:50 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B52B93F534;
 Fri, 15 Nov 2019 10:12:49 -0800 (PST)
Subject: Re: generic DMA bypass flag
To: Christoph Hellwig <hch@lst.de>
References: <20191113133731.20870-1-hch@lst.de>
 <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
 <20191114074105.GC26546@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9c8f4d7b-43e0-a336-5d93-88aef8aae716@arm.com>
Date: Fri, 15 Nov 2019 18:12:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114074105.GC26546@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/11/2019 7:41 am, Christoph Hellwig wrote:
> On Wed, Nov 13, 2019 at 02:45:15PM +0000, Robin Murphy wrote:
>> In all honesty, this seems silly. If we can set a per-device flag to say
>> "oh, bypass these ops and use some other ops instead", then we can just as
>> easily simply give the device the appropriate ops in the first place.
>> Because, y'know, the name of the game is "per-device ops".
> 
> Except that we can't do it _that_ easily.  The problem is that for both
> the powerpc and intel case the selection is dynamic.  If a device is in
> the identify domain with intel-iommu (or the equivalent on powerpc which
> doesn't use the normal iommu framework), we still want to use the iommu
> to be able to map memory for devices with a too small dma mask using
> the iommu instead of using swiotlb bouncing.  So to "just" use the
> per-device dma ops we'd need:
> 
>    a) a hook in dma_direct_supported to pick another set of ops for
>       small dma masks
>    b) a hook in the IOMMU ops to propagate to the direct ops for full
>       64-bit masks

And is that any different from where you would choose to "just" set a 
generic bypass flag?


diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d658c7c6a2ab..40e096d3dbc5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2242,12 +2242,14 @@ request_default_domain_for_dev(struct device 
*dev, unsigned long type)
  /* Request that a device is direct mapped by the IOMMU */
  int iommu_request_dm_for_dev(struct device *dev)
  {
+	set_dma_ops(dev, NULL);
  	return request_default_domain_for_dev(dev, IOMMU_DOMAIN_IDENTITY);
  }

  /* Request that a device can't be direct mapped by the IOMMU */
  int iommu_request_dma_domain_for_dev(struct device *dev)
  {
+	set_dma_ops(dev, &iommu_dma_ops);
  	return request_default_domain_for_dev(dev, IOMMU_DOMAIN_DMA);
  }


If intel-iommu gets fully converted such that everyone using default 
domains is also using iommu-dma, that should be it as far as the generic 
DMA ops are concerned (ultimately we might even be able to do it in 
__iommu_attach_device() based on the domain type). Like I said, the hard 
part is deciding when to make *these* calls, but apparently intel-iommu 
can already do that.

> I looked into that for powerpc a while ago and it wasn't pretty at all.
> Compared to that just checking another flag for the DMA direct calls
> is relatively clean and trivial as seens in the diffstat for this series
> alone.
> 
>> I don't see a great benefit to pulling legacy cruft out into common code
>> instead of just working to get rid of it in-place, when said cruft pulls in
>> the opposite direction to where we're taking the common code (i.e. it's
>> inherently based on the premise of global ops).
> 
> I'm not sure what legacy cruft it pull in.  I think it actually fits very
> much into a mental model of "direct mapping is the default, to be overriden
> if needed" which is pretty close to what we have at the moment.  Just
> with a slightly more complicated processing of the override.

Because the specific "slightly more complicated" currently used by the 
existing powerpc code will AFAICS continue to be needed only by the 
existing powerpc code, thus I don't see any benefit to cluttering up the 
common code with it today. You may as well just refactor powerpc to 
swizzle its own ops to obviate archdata.iommu_bypass, and delete a fair 
chunk of old code.

Robin.
