Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57498351674
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:56:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB78q0Jl2z3cRg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:56:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HFkBoDC2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+78d50c468b85952dbb35+6430+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=HFkBoDC2; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB75F21L8z30GR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F/At/y3YpRYA0xMifJb6WYaRvzw/qWs4U1Utp3fOA3I=; b=HFkBoDC2gQqzR0/BMkABluFzVb
 3gakMZuzB5XR+6BX0Aj1OytKg2i4hAn10GfCqqYygamx5QBLvyvglTO+CwociDtgFFHoBElQl2z9C
 8vSKoiBIAW3F6tqOLYPp5fiGR2bP6vbJGLE7cWb6BixFCeOSNvJ4K1maSU3n4g1Q7mpPZT2T07c35
 IOMTZ0zeIeEGgKA2dxIZ8EK0kU0QMV3JhqqKyPs1AV8kBZN19SvvyFxFLUzRFNH5pIb+XJhARJbkW
 zRtou/lbZms6YtiTWLVyM7tCMX4ldsM7ZmafF6EhBjKGqEfhr9PhwxC99sSvMht8lYVuOOmKk4W3l
 pxTq5pyQ==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzd6-00CiZO-UO; Thu, 01 Apr 2021 15:53:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: cleanup unused or almost unused IOMMU APIs and the FSL PAMU driver v3
Date: Thu,  1 Apr 2021 17:52:36 +0200
Message-Id: <20210401155256.298656-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

there are a bunch of IOMMU APIs that are entirely unused, or only used as
a private communication channel between the FSL PAMU driver and it's only
consumer, the qbman portal driver.

So this series drops a huge chunk of entirely unused FSL PAMU
functionality, then drops all kinds of unused IOMMU APIs, and then
replaces what is left of the iommu_attrs with properly typed, smaller
and easier to use specific APIs.

Changes since v2:
 - remove a comment fragment a little bit earlier
 - fix the aperture end passed to pamu_config_ppaace
 - fix a few trivial typos
 - remove more unused arguments to pamu_config_ppaace
 - do not accidentally enable lazy flushing for non-dma domains

Changes since v1:
 - use a different way to control strict flushing behavior (from Robin)
 - remove the iommu_cmd_line wrappers
 - simplify the pagetbl quirks a little more
 - slightly improved patch ordering
 - better changelogs

Diffstat:
 arch/powerpc/include/asm/fsl_pamu_stash.h   |   12 
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    5 
 drivers/iommu/amd/iommu.c                   |   23 
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   75 ---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |    1 
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  111 +---
 drivers/iommu/arm/arm-smmu/arm-smmu.h       |    2 
 drivers/iommu/dma-iommu.c                   |    9 
 drivers/iommu/fsl_pamu.c                    |  293 -----------
 drivers/iommu/fsl_pamu.h                    |   12 
 drivers/iommu/fsl_pamu_domain.c             |  688 ++--------------------------
 drivers/iommu/fsl_pamu_domain.h             |   46 -
 drivers/iommu/intel/iommu.c                 |   95 ---
 drivers/iommu/iommu.c                       |  118 +---
 drivers/soc/fsl/qbman/qman_portal.c         |   55 --
 drivers/vfio/vfio_iommu_type1.c             |   31 -
 drivers/vhost/vdpa.c                        |   10 
 include/linux/io-pgtable.h                  |    4 
 include/linux/iommu.h                       |   76 ---
 19 files changed, 203 insertions(+), 1463 deletions(-)
