Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E834E8AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qgY2GrQz3c1v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:15:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H6MULnqd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H6MULnqd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8qg45c22z2xfQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:14:56 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC5561969;
 Tue, 30 Mar 2021 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110094;
 bh=/N2/wqR7fHjSlaXvMJl1cBMXpKNT/xsesoTMSv6L4kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6MULnqd9QB+NK7wZgljGNSyugWhqntzuA7hl6JZlcXm+z2v3zoJChkrFgo2shzTp
 7kWpdutfdv00Me8uRq6k4CXKfRgdJaXG0FfA9YbsG7wlg+Z7r07gTIgQWxT1LkYSkp
 DWVbOk8SbfrQM2yIud8rcAqs2GuTEOcAwOUAIWj8VuZr3tlHjGMQxciGj89GTcsI+6
 wA3QIpJx15k5zaCAI2i0QTwhK5h7hVXzLMWRdWcVoJrrjF7aHn1fmW9gVtnH0wdl2V
 3tX5hH0qrjR/RU13f5CzrPtpxHRIDR3ndCSVxdrE0CM6hBMj0APadZ/nh/M/gdHzKH
 JgeNVk/teVZHA==
Date: Tue, 30 Mar 2021 14:14:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/18] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210330131448.GQ5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-18-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-18-hch@lst.de>
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
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 04:38:23PM +0100, Christoph Hellwig wrote:
> Use an explicit set_pgtable_quirks method instead that just passes
> the actual quirk bitmask instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c   | 64 +++++--------------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h   |  2 +-
>  drivers/iommu/iommu.c                   | 11 +++++
>  include/linux/io-pgtable.h              |  4 --
>  include/linux/iommu.h                   | 12 ++++-
>  6 files changed, 35 insertions(+), 63 deletions(-)

I'm fine with this for now, although there has been talk about passing
things other than boolean flags as page-table quirks. We can cross that
bridge when we get there, so:

Acked-by: Will Deacon <will@kernel.org>

Will
