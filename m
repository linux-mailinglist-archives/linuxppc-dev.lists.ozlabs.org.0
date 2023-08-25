Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 756AD789048
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 23:16:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dovEQMt/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dovEQMt/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXXnw29TDz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 07:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dovEQMt/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dovEQMt/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXXmz2z2Tz305R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 07:16:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692998158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNGvpBuIiKL3Cl4QX+janawTefek15UWSwqXPvpbHmo=;
	b=dovEQMt/+pcOvJzY0H1jOwKw2vG40WkgMkI0slqOwt8MKT+auJ+WJI8y+G6nPnClzGKDVi
	iVN3yJWyZTsd9wgF3MiP01IWEruYGbxDUt+uf9tiOqyDn7xOMCVVepYPoxUO8kfgGJpc31
	G41E8/5UQwmyadtFAtgXL6Sw8XYYuV0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692998158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNGvpBuIiKL3Cl4QX+janawTefek15UWSwqXPvpbHmo=;
	b=dovEQMt/+pcOvJzY0H1jOwKw2vG40WkgMkI0slqOwt8MKT+auJ+WJI8y+G6nPnClzGKDVi
	iVN3yJWyZTsd9wgF3MiP01IWEruYGbxDUt+uf9tiOqyDn7xOMCVVepYPoxUO8kfgGJpc31
	G41E8/5UQwmyadtFAtgXL6Sw8XYYuV0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-f_2FXV9XO4O02C0s-C6d7g-1; Fri, 25 Aug 2023 17:15:54 -0400
X-MC-Unique: f_2FXV9XO4O02C0s-C6d7g-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-76d9b2b99fbso141436885a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 14:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692998154; x=1693602954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNGvpBuIiKL3Cl4QX+janawTefek15UWSwqXPvpbHmo=;
        b=SEyJxvlTulDmpM6XJSYRR//a3qdIVQnXcv1B1YWPyj5V5AT+gxFAXF8LjGONTjDGa/
         IcBGyA/WNlHpMkRIMCaiD/dx8WWmn/IZUgYM+91kW5mYwBZQD0mJuLCUef/q0UMn1ldj
         5BRITnpS4WFsTilXp4tSGcHj1ZcNDmiatMIMiyR3NgMCkg8JzKJbL/IAxvkrmVG7wt7t
         i5c2hJ2GV/sFsCp2QtpvD+TnSKCHgZdlroR1y6XOvcatDZnwb3g3X2zPk2ZRukR9Mlwh
         TI7w/G3DKe+h6xwgysJjmN+mA/dC8+Qk0Zlx5p/Bo5z87pretmI+wiVg1DxbqGCDXxcf
         rXbw==
X-Gm-Message-State: AOJu0YwJCpbTe/rbjJI1HnkLL06voOjfsh1hY4cMKBlbBivX9ZmJQAvb
	iNACInRoqZYgnTy6wTlYK5Buo/yhDzdNHZxjTulQBRMms7yrS82Wk2quLDvd6WUl04yDecV7qgL
	B3e4vG8QTSNNjgh1otd8JlNT8qg==
X-Received: by 2002:a05:622a:138c:b0:411:fc77:5863 with SMTP id o12-20020a05622a138c00b00411fc775863mr9742865qtk.34.1692998153971;
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGkTdJ1PESb45xmKP1IyMr0VhacrVsFun4AHO5ghG+vkiiDrIbNOg/oEp2bfPugUDBb4fzHQ==
X-Received: by 2002:a05:622a:138c:b0:411:fc77:5863 with SMTP id o12-20020a05622a138c00b00411fc775863mr9742803qtk.34.1692998153629;
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id i3-20020ae9ee03000000b0076745f352adsm759948qkg.59.2023.08.25.14.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:15:53 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:15:51 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 04/24] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Message-ID: <qlgsyftnpb55wn6jcsdx27u3vnc66h5dmtcuelw4y5wgk3vorf@ctgykaa5wp7d>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <4-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <4-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:18PM -0300, Jason Gunthorpe wrote:
> The PLATFORM domain will be set as the default domain and attached as
> normal during probe. The driver will ignore the initial attach from a NULL
> domain to the PLATFORM domain.
> 
> After this, the PLATFORM domain's attach_dev will be called whenever we
> detach from an UNMANAGED domain (eg for VFIO). This is the same time the
> original design would have called op->detach_dev().
> 
> This is temporary until the S390 dma-iommu.c conversion is merged.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

