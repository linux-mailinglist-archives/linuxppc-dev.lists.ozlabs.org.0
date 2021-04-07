Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9B35675C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 10:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFdZb4l8Xz3btV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 18:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=8bytes.org (client-ip=81.169.241.247; helo=theia.8bytes.org;
 envelope-from=joro@8bytes.org; receiver=<UNKNOWN>)
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFdZG6gDDz2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 18:57:26 +1000 (AEST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 29AFC418; Wed,  7 Apr 2021 10:57:21 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:57:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: cleanup unused or almost unused IOMMU APIs and the FSL PAMU
 driver v3
Message-ID: <YG1z7/b0i8WYOMHA@8bytes.org>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
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
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 05:52:36PM +0200, Christoph Hellwig wrote:
> Diffstat:
>  arch/powerpc/include/asm/fsl_pamu_stash.h   |   12 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    5 
>  drivers/iommu/amd/iommu.c                   |   23 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   75 ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |    1 
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  111 +---
>  drivers/iommu/arm/arm-smmu/arm-smmu.h       |    2 
>  drivers/iommu/dma-iommu.c                   |    9 
>  drivers/iommu/fsl_pamu.c                    |  293 -----------
>  drivers/iommu/fsl_pamu.h                    |   12 
>  drivers/iommu/fsl_pamu_domain.c             |  688 ++--------------------------
>  drivers/iommu/fsl_pamu_domain.h             |   46 -
>  drivers/iommu/intel/iommu.c                 |   95 ---
>  drivers/iommu/iommu.c                       |  118 +---
>  drivers/soc/fsl/qbman/qman_portal.c         |   55 --
>  drivers/vfio/vfio_iommu_type1.c             |   31 -
>  drivers/vhost/vdpa.c                        |   10 
>  include/linux/io-pgtable.h                  |    4 
>  include/linux/iommu.h                       |   76 ---
>  19 files changed, 203 insertions(+), 1463 deletions(-)

Applied, thanks.
