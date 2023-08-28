Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729578B911
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:08:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YGOnYDIW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YGOnYDIW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZM7W2qXhz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YGOnYDIW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YGOnYDIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZM6c2PlMz2xsY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:07:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693253252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
	b=YGOnYDIW+yI7I2EMs9J510zzvl/tghf/dHYsnvpwX8lEdtyp9baXzbsb2Ccnoeg8pd0KxG
	x4n0fKQGVAa9UWncbnBSc2cbn3A4m7fh/ZGXy/m3gPLEfr/pXBwnRm3fEVH6XhLZ5hVUQp
	xinP2Tng5hEq+WgHpcyuTZ6CHxlYtSQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693253252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
	b=YGOnYDIW+yI7I2EMs9J510zzvl/tghf/dHYsnvpwX8lEdtyp9baXzbsb2Ccnoeg8pd0KxG
	x4n0fKQGVAa9UWncbnBSc2cbn3A4m7fh/ZGXy/m3gPLEfr/pXBwnRm3fEVH6XhLZ5hVUQp
	xinP2Tng5hEq+WgHpcyuTZ6CHxlYtSQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-nlaWcbQkOdmLWnYAU_EK5Q-1; Mon, 28 Aug 2023 16:07:30 -0400
X-MC-Unique: nlaWcbQkOdmLWnYAU_EK5Q-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-44d46b22e9eso1564915137.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693253250; x=1693858050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
        b=EpNEwcKgYNwBMRFGPvvCMx8k+bWlmkDCt+D6wtTajZFd2l0kr8Oh5xGdknmGvPx5ju
         lurpTg/2Y3f2r+eiVzhpOHZ/UF+y3kpUTuHDWpCQu662swV4z8pmX3I+fqP7UIYS1SSS
         vZGZOFhXll14e/nTc/yojnvTpqdIehjSTJKJbp9/oM3q6kbETx65uXIHhfM4U+PpCCK6
         kF6npuL5LuDbcGH53m8V2YUnBwpqsuZ9AH86k7/lNIteoGY+znqI4runlT31M4e9eTBy
         wEm7dR7XGr1o+exn+JDdekMchxKJqyyKyPB9SD/rEsHaUma+1UYfqBBk5EcProLZICrP
         5T2Q==
X-Gm-Message-State: AOJu0YyqMFCHVcBviiD2vL8efz53Psr4PntUesz/PfN0+jz8T0QyWl5p
	sHcNxIv7PGoj1tTpVObDf1qXcc2c1qCT6SVIKbnC3EaV1JgHBjBy+lrrybVPWT2QI46eu0HT4Ts
	SCAHXDA1dcwfAV+YU+PoTZb6y0w==
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899814vst.3.1693253250443;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvQrHN5P8TUioFwnH2DuKJFINn3O8GiLCiK+L04RR+CJ1jziXQavUqdv+merrihDaRe7h1tw==
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899781vst.3.1693253250162;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id y3-20020a37e303000000b0076c8fd39407sm2344737qki.113.2023.08.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:07:29 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:07:28 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 09/24] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <qovs7txfhvtbfvc6un6albkxy6x6ytmnowqcgh6wt2fgbmvhto@2unjmfnnbqfh>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 23, 2023 at 01:47:23PM -0300, Jason Gunthorpe wrote:
> Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
> same stuff, the way they relate to the IOMMU core is quiet different.
> 
> dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
> IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
> becomes the default_domain for the group.
> 
> ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
> allocates an UNMANAGED domain and operates it just like an external
> driver. In this case group->default_domain is NULL.
> 
> If the driver provides a global static identity_domain then automatically
> use it as the default_domain when in ARM_DMA_USE_IOMMU mode.
> 
> This allows drivers that implemented default_domain == NULL as an IDENTITY
> translation to trivially get a properly labeled non-NULL default_domain on
> ARM32 configs.
> 
> With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
> device the normal detach_domain flow will restore the IDENTITY domain as
> the default domain. Overall this makes attach_dev() of the IDENTITY domain
> called in the same places as detach_dev().
> 
> This effectively migrates these drivers to default_domain mode. For
> drivers that support ARM64 they will gain support for the IDENTITY
> translation mode for the dma_api and behave in a uniform way.
> 
> Drivers use this by setting ops->identity_domain to a static singleton
> iommu_domain that implements the identity attach. If the core detects
> ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
> during probe.
> 
> Drivers can continue to prevent the use of DMA translation by returning
> IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
> IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.
> 
> This allows removing the set_platform_dma_ops() from every remaining
> driver.
> 
> Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
> is set an existing global static identity domain. mkt_v1 does not support
> IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
> is safe.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c          | 21 ++++++++++++++++++++-
>  drivers/iommu/mtk_iommu_v1.c   | 12 ------------
>  drivers/iommu/rockchip-iommu.c | 10 ----------
>  3 files changed, 20 insertions(+), 23 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

