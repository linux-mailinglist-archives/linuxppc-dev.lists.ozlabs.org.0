Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3087890B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 23:50:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PktTfmCA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PktTfmCA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXYXz1BF3z3cCx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 07:50:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PktTfmCA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PktTfmCA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXYX31JVfz303l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 07:49:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693000191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
	b=PktTfmCAa9jpJJdknKjV3DmkCMZTFGtZITtUKAd0y0JPi87wGMhBZdFw+KtpL4STQd20XZ
	OUNDO/ARMBYpUBbhL2vjMTaCPYozfQVFXE2H7UDibChL5ZwqLpYDBZCkvAKROIM26akmGS
	U/T160GKWjp2hkqgdqQTDGJ1ecC8IRg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693000191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
	b=PktTfmCAa9jpJJdknKjV3DmkCMZTFGtZITtUKAd0y0JPi87wGMhBZdFw+KtpL4STQd20XZ
	OUNDO/ARMBYpUBbhL2vjMTaCPYozfQVFXE2H7UDibChL5ZwqLpYDBZCkvAKROIM26akmGS
	U/T160GKWjp2hkqgdqQTDGJ1ecC8IRg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-0CbdVEcwP_Glgna5hlGGUQ-1; Fri, 25 Aug 2023 17:49:47 -0400
X-MC-Unique: 0CbdVEcwP_Glgna5hlGGUQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-591138c0978so20281677b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000187; x=1693604987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
        b=KT/h9ldDRWc/eiwSVlNFuOc2ns8I9GiSHFJYPPHBSuk7ww2TiuaQ9OP948fqu+fzQP
         g9VmGTCAlFknYF0DBb1+xGq3OAkPEvGtjt1ZSgmtTIICSUzi+9vFIM/0nbsm0m5uXgJp
         JfMa6Oy/W9bUECZCSzGpsR5B8Mup6uM+YlLzQoqr2KOeFbtbyechUi2BR4PfLJdcymXu
         z6EfDUjvg35C2fjJZ5Csd4uY1iyB8ATFBIAXgX5XhGZ4+fuD9lgGzQ2ukSoCu/mhTepb
         jBKkNY4ysKXRtCJ0lh2qd2Wi7Hep7oCwh9ujVenpyA5o8v+Tmx2VvLmQz7XnDL4V3Phr
         PO9g==
X-Gm-Message-State: AOJu0YzWz///o3ZQVdn6Fxq8caOT5GTlRjs/iMOyns59xnlSUKMQU3ZH
	remjxXWjPHD+RF5X9sJ5ZL2lovmRQfSVExu5ednLQDV7v9znxX/aoLBYOu6+Qtw5zF5u9PZdDDb
	ESWgxz0fvi7xCfnUnHqqeL4IrhA==
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495333ybg.21.1693000187283;
        Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgZnJ6x3Khmaw73UVVO8ipGtpfGFEkJnwrK/gjpvrarbZH5j/AtFZ9PMl7lOmV6YAsTBEFgw==
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495280ybg.21.1693000186913;
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id ki6-20020a05622a770600b0040ff0e520besm770523qtb.35.2023.08.25.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:49:07 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 06/24] iommu/tegra-gart: Remove tegra-gart
Message-ID: <stzz6hsyx25u5bbkgwftde2jdtjxgb5ghofwfymv2ny4vfbpch@nuli2d2mthaq>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:20PM -0300, Jason Gunthorpe wrote:
> Thierry says this is not used anymore, and doesn't think it makes sense as
> an iommu driver. The HW it supports is about 10 years old now and newer HW
> uses different IOMMU drivers.
> 
> As this is the only driver with a GART approach, and it doesn't really
> meet the driver expectations from the IOMMU core, let's just remove it
> so we don't have to think about how to make it fit in.
> 
> It has a number of identified problems:
>  - The assignment of iommu_groups doesn't match the HW behavior
> 
>  - It claims to have an UNMANAGED domain but it is really an IDENTITY
>    domain with a translation aperture. This is inconsistent with the core
>    expectation for security sensitive operations
> 
>  - It doesn't implement a SW page table under struct iommu_domain so
>    * It can't accept a map until the domain is attached
>    * It forgets about all maps after the domain is detached
>    * It doesn't clear the HW of maps once the domain is detached
>      (made worse by having the wrong groups)
> 
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

