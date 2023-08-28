Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA278B9B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:48:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iazrZORR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iazrZORR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZN1P0WVGz3bNm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iazrZORR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iazrZORR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZN0S6KT0z2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:47:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693255637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
	b=iazrZORRX/UhsxIjGLXrcxD1xUvPI250w5LYintdwMBb/dKL6kA9hIsH8mUFxLtdTumpE8
	ox3FaubQT50lAoVbCAB+3mndN5NavIN/NgMA71VBua/c5AAdlhXlNuoi80WQ0t/rnj73OH
	hT5yGbaDF4bmfbinBJoiUsvndFACPfo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693255637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
	b=iazrZORRX/UhsxIjGLXrcxD1xUvPI250w5LYintdwMBb/dKL6kA9hIsH8mUFxLtdTumpE8
	ox3FaubQT50lAoVbCAB+3mndN5NavIN/NgMA71VBua/c5AAdlhXlNuoi80WQ0t/rnj73OH
	hT5yGbaDF4bmfbinBJoiUsvndFACPfo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681--IoPVlDQMOq1nE9scjLtHQ-1; Mon, 28 Aug 2023 16:47:14 -0400
X-MC-Unique: -IoPVlDQMOq1nE9scjLtHQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76de9c09746so458930585a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255633; x=1693860433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
        b=USVQs7E48/hkbugky+c/c0unC2X68e4hKQKuTlVpdawO66q6S1Ii74lTTW1qIfg4J4
         Ba5LbCv+WB1ilEwljm+zk7XEcsCF1sAJOkpaOZbVnlT4vRzzBygfJOFwiGlZxWfpWKWQ
         SJEFAuny+SZS/zhrqdWu5EY7QXNRnCNFEH273dtER+kFbHWSyV307X5mShvz18Fg/HxQ
         E6lzgfuYFLlovmvBII7xEA2PsCHpgi2f9JPPQpyJR2rO0igauawIygRJqjCvHL0/A0l5
         dttKuR/qhHnggeRmhRfvdCMdSbGx/LySB1NMX4QN+WklZ4H3HsAsGCrEooLhlZAxixEz
         zHFA==
X-Gm-Message-State: AOJu0YzRlMAi/uLEdP7TYJ1Qm+czkyKUnA66GS2uxr5tF9aOcidWL4UL
	raMOmJpA0PtmCQALnneHzEIuiC7R+jwbvpKAtnMyn5eECWZkSa0wa+TOMis0v10x6G3l993WuZ3
	6XC2R6r2DUWpLOxAdEX/0HicPEg==
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655274qkb.46.1693255633392;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwVuI8ZPuQEBsqBHLA4mM96XswCj3GuW2ha49h3MQX3EuB7tqhbB8UeA/K6lT7Jvy4c0Wwkw==
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655228qkb.46.1693255633141;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id g9-20020a05620a13c900b0076db1caab16sm2631338qkl.22.2023.08.28.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:47:12 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:47:11 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 13/24] iommu/omap: Implement an IDENTITY domain
Message-ID: <242a7ntgcvqofkvw2aapftr3pgczpueam3beyr4qey5mgx2rh4@odjyxtbbscfz>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:27PM -0300, Jason Gunthorpe wrote:
> What omap does during omap_iommu_set_platform_dma() is actually putting
> the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
> compiled on ARM64 either. Most likely it is fine to support dma-iommu.c
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

