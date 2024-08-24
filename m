Return-Path: <linuxppc-dev+bounces-484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7595DEA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 17:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrgGf5Blxz2y1b;
	Sun, 25 Aug 2024 01:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724486368;
	cv=none; b=OPoX6ZQVUZo1lcHM73bWsVkuPc8pVFz+V+dQv3Y3njk7uHBcChNB3ShVwbjuYYRztAXhJ9vF3KXBgyEHmcpigQX2jig2vH0/5QwW0iX1eniRot3M///gptj39g1sBDrEbP2FDUTKrLdb+eChq3FHU6t+2Y/chrEmW3YCKfoM4Dqw5cRooyKBhIW+BXidrUTUUT7Pta+tnGElZk5enwbEaCg1oF/5NnxHToDTjAS7zeAoZekaO5smqW0xAJRUJI0QRnxnu5O7j8jpdnm8hSUilMXMBcgw2TpBBe6aE3/BrJVZzmE8FPTrYa/p/PE5glO4LLcb6dio/n2F3TrJnPXPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724486368; c=relaxed/relaxed;
	bh=xXLsaIuCFGnLaueWcTFQo0nR02b8LSsV1PTbGXin5pk=;
	h=X-Greylist:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LHs8vIGQ8MgPe6X/ACz0ArcPf5l4N0gDsXdSqsq+JUZJ6fBRuEehD0t0iExnt9WxleTiJ2r6HNpWcKKnCU4mAvTupTBQFiL+C7jv9MWQkncGfH8/NKQxzMH5yV9xquiZSaGaQWVelOYNNzyBZmO9P7J3cK0prFoy5FxrMPq/Ryz6cLf3GzfpG5deDjF04FwrQ4ex0sVh4AhBo1ohwcF2QNPbWiZaoxMy4D8IZPgDQRtk8xRonXGUu5viB95WkvTQ3XaS5oyfMl5IwaiUZ7HGSi5SpTWE0PXKYzJQEBm+gp35g+2acNRuxBeA8k9zT6SpnMKAy7PahFKGw2XYe5GL6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bk/re3DU; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bk/re3DU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 24 Aug 2024 17:59:26 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WrTqL2KGGz2xPb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 17:59:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724486367; x=1756022367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MuJabAXZNXC3PzKmb+ctuTHQcVD5uw07JOm0cukiHM=;
  b=Bk/re3DUsa1X0gvYaXveQn+TbjnbfxcdxGgdSzhN7vU6oY7wOSinxnlU
   gCXNyuDsRdCdl3rdP/o5BSwP5cjFlLR/1sHVUNLujsKbSTndKIBkmcWdP
   unjo0t0tw1Ci2+Qfdj+UZGfJAzvQ7FK73z0jdb67B3krByMPd9aUdWlXQ
   ACDAJURoraVcvEfJsvvIfOnEcOxlovZKv12s5W9hZXP51S9P1/Hq6PQLi
   IAjUduboeCjtacDuxRq6IGMuDdKKPYx1rlyATy61876LcAut/NGvs39cZ
   w00XQtdGHbB49FtaM52NkI/VRyMNC60lRLecEPvTnSdnZ88M/4tuA9q/G
   w==;
X-CSE-ConnectionGUID: HQA6mZhhTtiSRMKrSq5cUA==
X-CSE-MsgGUID: goJobgjiTCeMqjLrtM0rMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23126434"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="23126434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:58:17 -0700
X-CSE-ConnectionGUID: xNO1WY6SQfimIDbJMyQklA==
X-CSE-MsgGUID: Re7yuOLNQLu2fGkmVM310w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="99531438"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:58:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF4D411F95D;
	Sat, 24 Aug 2024 10:58:07 +0300 (EEST)
Date: Sat, 24 Aug 2024 07:58:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] dma-mapping: clear mark DMA ops as an architecture
 feature
Message-ID: <ZsmSj6ZBZqBtjALU@kekkonen.localdomain>
References: <20240824035817.1163502-1-hch@lst.de>
 <20240824035817.1163502-2-hch@lst.de>
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
In-Reply-To: <20240824035817.1163502-2-hch@lst.de>

Hi Christoph,

On Sat, Aug 24, 2024 at 05:57:58AM +0200, Christoph Hellwig wrote:
> DMA ops are a helper for architectures and not for drivers to override
> the DMA implementation.  Unfortunately driver authors keep ignoring
> this.  Make this more clear by renaming the symbol to ARCH_DMA_OPS,
> have the three drivers overriding it depend on that.  They should
> probably also be marked broken, but we can give them a bit of a grace
> period for that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> # for IPU6

We'll address this for IPU6 but I can't give a timeline for that right now.

-- 
Kind regards,

Sakari Ailus

