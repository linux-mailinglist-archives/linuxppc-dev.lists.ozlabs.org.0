Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34534E89F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:12:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qc51Qgsz3c9c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:12:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nAM/OfXE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nAM/OfXE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qbf1djXz3bc7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:11:58 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3807E6190A;
 Tue, 30 Mar 2021 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109915;
 bh=E7y/dbAAWo9buKdnhgJzSLhrZuvZjF7e5JPqlaZDmKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nAM/OfXEJ+5P0AOFZGxwgS6k50PSZ6ZL+0SdM34bRXqilkdD1BMlp5kMlv2jKqeXJ
 RFq44I5uncbXNQhliA7OD3QPB8lN5hZkxWoXcop6y/Y1IBJ/rcfxLyHIo2tS0SpYkp
 OrUIMp3MFAVbY8783Qbhv1kqq1hoEVaLylEPRKuYQXQBu5/MlghjYIEFwHWboYdrOO
 pByYsjfgLgrsFLdpXDlg/y+xqfu7E4iOvnHrOCmu5gaK38t1EdeblYuZ40EdwPrZjo
 qX1I0Z4jkjNv3rxdihUqdwy79Vet1JWSllchMLwPrvfbEnP8SACK28FDZ/JTY6Eypo
 iicajwfBXpXWA==
Date: Tue, 30 Mar 2021 14:11:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210330131149.GP5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-17-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-17-hch@lst.de>
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
 linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 04:38:22PM +0100, Christoph Hellwig wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Instead make the global iommu_dma_strict paramete in iommu.c canonical by
> exporting helpers to get and set it and use those directly in the drivers.
> 
> This make sure that the iommu.strict parameter also works for the AMD and
> Intel IOMMU drivers on x86.  As those default to lazy flushing a new
> IOMMU_CMD_LINE_STRICT is used to turn the value into a tristate to
> represent the default if not overriden by an explicit parameter.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>.
> [ported on top of the other iommu_attr changes and added a few small
>  missing bits]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/amd/iommu.c                   | 23 +-------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 50 +---------------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 -
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 27 +--------
>  drivers/iommu/dma-iommu.c                   |  9 +--
>  drivers/iommu/intel/iommu.c                 | 64 ++++-----------------
>  drivers/iommu/iommu.c                       | 27 ++++++---
>  include/linux/iommu.h                       |  4 +-
>  8 files changed, 40 insertions(+), 165 deletions(-)

I really like this cleanup, but I can't help wonder if it's going in the
wrong direction. With SoCs often having multiple IOMMU instances and a
distinction between "trusted" and "untrusted" devices, then having the
flush-queue enabled on a per-IOMMU or per-domain basis doesn't sound
unreasonable to me, but this change makes it a global property.

For example, see the recent patch from Lu Baolu:

https://lore.kernel.org/r/20210225061454.2864009-1-baolu.lu@linux.intel.com

Will
