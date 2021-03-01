Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA532797E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 09:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpv1X3kVpz3ckJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=joVg0CWz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+bce9324c41c3486454c7+6399+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=joVg0CWz; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dpv172gX5z30N1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 19:43:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ek5kJL1ujiFKFtGeUxZiZdEhbkWQuXJzNlrMDDHSiZY=; b=joVg0CWz6LOS4vHGAG6rOh1CYA
 VoKirvya1vx0R653IThlzzolk/FLpUhL1sfQ311khwX7z/Y43KLMfWX94+SNy22cIQB9BdyFuAnQq
 IoESLZejtT4K9+4i0pIIOti8gNZuSmcQfsYrSZL27OtRB+I8Pf2Kkmln+CTiCHMDQZ88+j1BsOmul
 RhmH18HUErxq1FhyH/4E+cdIw5COFzr+KOLMCExHYYaWgF0opImqih4Xjo+VFEsu5KGe1IcPVB4uv
 +H7eXnnD3AUfP/Dpzfr0KWPnYguG3RnGj3C0sVTTJc+REBlm1iIODwrEywoe80ldRgW7psNaNhJS1
 yEk9uS6A==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGe8q-00FUUo-TU; Mon, 01 Mar 2021 08:43:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: cleanup unused or almost unused IOMMU APIs and the FSL PAMU driver
Date: Mon,  1 Mar 2021 09:42:40 +0100
Message-Id: <20210301084257.945454-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Diffstat:
 arch/powerpc/include/asm/fsl_pamu_stash.h   |   12 
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    2 
 drivers/iommu/amd/iommu.c                   |   23 
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   85 ---
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  122 +---
 drivers/iommu/dma-iommu.c                   |    8 
 drivers/iommu/fsl_pamu.c                    |  264 ----------
 drivers/iommu/fsl_pamu.h                    |   10 
 drivers/iommu/fsl_pamu_domain.c             |  694 ++--------------------------
 drivers/iommu/fsl_pamu_domain.h             |   46 -
 drivers/iommu/intel/iommu.c                 |   55 --
 drivers/iommu/iommu.c                       |   75 ---
 drivers/soc/fsl/qbman/qman_portal.c         |   56 --
 drivers/vfio/vfio_iommu_type1.c             |   31 -
 drivers/vhost/vdpa.c                        |   10 
 include/linux/iommu.h                       |   81 ---
 16 files changed, 214 insertions(+), 1360 deletions(-)
