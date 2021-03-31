Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CB34FFBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 13:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Pl56FChz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 22:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kMlovUr/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kMlovUr/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9PkY2W6Zz303J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 22:49:57 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC88860249;
 Wed, 31 Mar 2021 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617191393;
 bh=9Tvk8pMagcUqHlxEfpmAq3P1z5xVSb6AxBC9iuF3UAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kMlovUr/+JWR2ZHUYmDPMJ2ndHmdrz5lm7unGTt4nXLsAYiYuNHKr5e0oMkxx6fDz
 QR2rHHP5l9HS5rEud3McAg/yhn1jEjy25vdtAyZhr/OaEDrBLA51RShgMt6ADFGgKk
 uQaFZLkdzt19pPW2qgqzcDG9l8DRiLheZZlrvUgMDXhydKLRJqDVIU4Tnw+ks2cwPl
 dKj97SK7OA1MiDUHwOiBDXkDUo1pSJ37y/5yx0ulUHqGh/GEBy/gsrfNl6Wm5GhbkI
 DEukmD+vjCBTbLqtDliJ10g6+dV8RwrdEMhaaSt1c6K7yQWHZYOPwwIVQ8ExC6hyFf
 jZwkG9F4BmZKw==
Date: Wed, 31 Mar 2021 12:49:47 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210331114947.GA7626@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-17-hch@lst.de>
 <20210330131149.GP5908@willie-the-truck>
 <a6952aa7-4d7e-54f0-339e-e15f88596dcc@arm.com>
 <20210330135801.GA6187@willie-the-truck>
 <578d6aa5-4239-f5d7-2e9f-686b18e52bba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578d6aa5-4239-f5d7-2e9f-686b18e52bba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 05:28:19PM +0100, Robin Murphy wrote:
> On 2021-03-30 14:58, Will Deacon wrote:
> > On Tue, Mar 30, 2021 at 02:19:38PM +0100, Robin Murphy wrote:
> > > On 2021-03-30 14:11, Will Deacon wrote:
> > > > On Tue, Mar 16, 2021 at 04:38:22PM +0100, Christoph Hellwig wrote:
> > > > > From: Robin Murphy <robin.murphy@arm.com>
> > > > > 
> > > > > Instead make the global iommu_dma_strict paramete in iommu.c canonical by
> > > > > exporting helpers to get and set it and use those directly in the drivers.
> > > > > 
> > > > > This make sure that the iommu.strict parameter also works for the AMD and
> > > > > Intel IOMMU drivers on x86.  As those default to lazy flushing a new
> > > > > IOMMU_CMD_LINE_STRICT is used to turn the value into a tristate to
> > > > > represent the default if not overriden by an explicit parameter.
> > > > > 
> > > > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>.
> > > > > [ported on top of the other iommu_attr changes and added a few small
> > > > >    missing bits]
> > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > ---
> > > > >    drivers/iommu/amd/iommu.c                   | 23 +-------
> > > > >    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 50 +---------------
> > > > >    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 -
> > > > >    drivers/iommu/arm/arm-smmu/arm-smmu.c       | 27 +--------
> > > > >    drivers/iommu/dma-iommu.c                   |  9 +--
> > > > >    drivers/iommu/intel/iommu.c                 | 64 ++++-----------------
> > > > >    drivers/iommu/iommu.c                       | 27 ++++++---
> > > > >    include/linux/iommu.h                       |  4 +-
> > > > >    8 files changed, 40 insertions(+), 165 deletions(-)
> > > > 
> > > > I really like this cleanup, but I can't help wonder if it's going in the
> > > > wrong direction. With SoCs often having multiple IOMMU instances and a
> > > > distinction between "trusted" and "untrusted" devices, then having the
> > > > flush-queue enabled on a per-IOMMU or per-domain basis doesn't sound
> > > > unreasonable to me, but this change makes it a global property.
> > > 
> > > The intent here was just to streamline the existing behaviour of stuffing a
> > > global property into a domain attribute then pulling it out again in the
> > > illusion that it was in any way per-domain. We're still checking
> > > dev_is_untrusted() before making an actual decision, and it's not like we
> > > can't add more factors at that point if we want to.
> > 
> > Like I say, the cleanup is great. I'm just wondering whether there's a
> > better way to express the complicated logic to decide whether or not to use
> > the flush queue than what we end up with:
> > 
> > 	if (!cookie->fq_domain && (!dev || !dev_is_untrusted(dev)) &&
> > 	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict())
> > 
> > which is mixing up globals, device properties and domain properties. The
> > result is that the driver code ends up just using the global to determine
> > whether or not to pass IO_PGTABLE_QUIRK_NON_STRICT to the page-table code,
> > which is a departure from the current way of doing things.
> 
> But previously, SMMU only ever saw the global policy piped through the
> domain attribute by iommu_group_alloc_default_domain(), so there's no
> functional change there.

For DMA domains sure, but I don't think that's the case for unmanaged
domains such as those used by VFIO.

> Obviously some of the above checks could be factored out into some kind of
> iommu_use_flush_queue() helper that IOMMU drivers can also call if they need
> to keep in sync. Or maybe we just allow iommu-dma to set
> IO_PGTABLE_QUIRK_NON_STRICT directly via iommu_set_pgtable_quirks() if we're
> treating that as a generic thing now.

I think a helper that takes a domain would be a good starting point.

Will
