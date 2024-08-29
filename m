Return-Path: <linuxppc-dev+bounces-718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E37963963
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 06:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvSy564sBz2ykf;
	Thu, 29 Aug 2024 14:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724905837;
	cv=none; b=Ta/Yag7ZA6U6Wz2nFNrQHSCWpKwi0x6UgtarwTqnrg+L0Hut2KcFIGAJtnU4ntakE6ubr6hkWxZ+E5xDKtIF0dsZrn4afohusLZAlSdGhidDtmbcAfGKAOztfP8X/MkJvcVVG55FjXbnCw/wOHSGphrc96mmRMEIFdCU3WE9Zd6zbnrTvrQJ0Icu6d+PzOIOLisB3HB3nEdpDKC98Voo8wSH3oNvIeWtc//tGY/J+Hk6UHZH/SQWLXpOLWYf6jIWi4sphDRlDtHmvvRoXOh7Z3FGrZ7qJ6itKYT0suBrn4buaKPKsAi3AA+nsPicyKpUqgL06wPlIfRZxubu3Wqi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724905837; c=relaxed/relaxed;
	bh=czuPGofXYXZM4v3cfuOzoQfmBuQh+a7LcKFiZqoC8B8=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent; b=lTrph6GjQ8XmKjlB4uXIZqP8YWii0AU2YhI87LQmuECjIjfOJn+ZFwrpj6IRiSsWzaBM+cppKEWoeGnQIzuTm97Y4T2gooXLJ6k5WerFMApMghb3vd+Wn5ofzuWCXShcpK3AbO8SX9Bj27yzov3UPpqRimIl9v56FXCPUtvhqy7Y2UjiTmizg3tJmAM3WSt7j1bS/zf/hwnmu0Jfk53gtQdd//EZ6Ikaf7uzVQEMnElvd2GPRiWfe274vh3hMi40rJJTpOCQvJBcern7V2CqUANx/wqNS33kpx8UlvdT20T7YQRdUcReutjlxo6KHiWG41XugP3bvbNxbfAP+PRbww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvSy46slwz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 14:30:35 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id F39EA68AFE; Thu, 29 Aug 2024 06:30:27 +0200 (CEST)
Date: Thu, 29 Aug 2024 06:30:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an
 architecture feature
Message-ID: <20240829043027.GA4707@lst.de>
References: <20240828061104.1925127-1-hch@lst.de> <20240828061104.1925127-3-hch@lst.de> <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 28, 2024 at 08:21:14AM +0200, Andreas Larsson wrote:
> On 2024-08-28 08:10, Christoph Hellwig wrote:
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
> >  
> >  config SWIOTLB_XEN
> >  	def_bool y
> > +	depends on ARCH_DMA_OPS
> 
> Rename to ARCH_HAS_DMA_OPS in v2 is missing here

Thanks,

I've fixed this up locally now.

