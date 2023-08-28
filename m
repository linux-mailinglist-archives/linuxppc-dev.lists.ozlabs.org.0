Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919578B9D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:59:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwyTtnes;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwyTtnes;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZNGR3r3Xz30dw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwyTtnes;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwyTtnes;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZNFW1yByz2ygT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
	b=YwyTtnesoTqWDIxeUTe+s9TIjKizXl9FLO7J1stvvXh7hlDgWm2BPbsJb+33U+trc5EtYV
	0XR+I8p3e9nodMkuL/c3r76iXGYS27YskPuikB2rHd6Muzlurh6Os5CdVgSrXES/TTv3C4
	WoaD5V+Wab+agO/lwTxWHrmBSiiVDz4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
	b=YwyTtnesoTqWDIxeUTe+s9TIjKizXl9FLO7J1stvvXh7hlDgWm2BPbsJb+33U+trc5EtYV
	0XR+I8p3e9nodMkuL/c3r76iXGYS27YskPuikB2rHd6Muzlurh6Os5CdVgSrXES/TTv3C4
	WoaD5V+Wab+agO/lwTxWHrmBSiiVDz4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-myGs3aXEOmOqxwFPIrIu1A-1; Mon, 28 Aug 2023 16:58:33 -0400
X-MC-Unique: myGs3aXEOmOqxwFPIrIu1A-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-411fae3127eso45224421cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256313; x=1693861113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
        b=aU7AFnPwX8zNYxrbZFhJCVmID532omDxEqsgY2h2Svi+ZNb5+TddhhnGd+WatVDy8y
         ar11R/4oY42NdUQBA6xc40aNkJs7Eh5p6FhEm070IY6PhfkV+sbqAP9z079sJfS2c/t4
         hjMi0Vh0Tgkt5NR7YUDinmKTXwSEks6tGAUICxQvnkuM+WP78GlTNOQqXBW4B9BKz7rr
         xZM+fPF5INrW9Dq/Qs/gSJ6AmjEOZFxEwgptOxGIa8xiKv9sRJ50sG3GMrKDghNJTDUT
         c2RzHYi2wVpel55B/FUk3uDeTsxjoN+LRwxr3PflDDHfR24tUBoq5auqlNuZ89H08V5g
         Z5Xw==
X-Gm-Message-State: AOJu0YzfcjRz2wnpO2CGAXrJOHaXVgZyiRCwzw2GvYOI4ySMroPLzTzg
	k54/VSBM6YdF7JMEtpiXnlZiFKeTO0VQzUts9186OrDIT8ABEhX2KNaEc2WmPnpnHyH5IgHBEAn
	A466htN+AlZwk406bW5VB1lg2Kw==
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754135qtw.30.1693256313523;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqzxLWZK4Sb4/58FxlbaHsUgrMjm1Fc7pMUPbHePKpRNp9fWsIa9/KWnDi5jm+4pqQWfwb1w==
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754084qtw.30.1693256313282;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a11-20020a05620a102b00b0076cf49bcb50sm2613298qkk.37.2023.08.28.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:58:32 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:58:31 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 15/24] iommu: Remove ops->set_platform_dma_ops()
Message-ID: <6thxe2cqyfs6czmd63a7ompjpvkv2c2aestp7almmk725r5ivd@2lmwtzyfylmp>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:29PM -0300, Jason Gunthorpe wrote:
> All drivers are now using IDENTITY or PLATFORM domains for what this did,
> we can remove it now. It is no longer possible to attach to a NULL domain.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 30 +++++-------------------------
>  include/linux/iommu.h |  4 ----
>  2 files changed, 5 insertions(+), 29 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

