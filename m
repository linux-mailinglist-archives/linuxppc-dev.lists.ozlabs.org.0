Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EA78B9E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 23:03:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hLLEVDFg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M8r6rZBU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZNM700Zqz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 07:03:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hLLEVDFg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M8r6rZBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZNLG2k5fz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 07:02:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
	b=hLLEVDFgmxgxJE3XBMLNTX0qXrQfsl3P0x1GSvZUZXgb17Pjr5BCjE9IMModOyo1bTP7mZ
	4gAlOqtEnvLQ5eLx6ahPzXkIcWHT2q90SwDkldCQ/eBQ5QS3Yr8Ag4x2VUIYuNPbpdW5s2
	MTJ1FjmaK6YPfQehzYcri1vzb3195k4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
	b=M8r6rZBU9LrEhYHADcGLbqegvB5OrT+yqsmTY6nOHKHxLQ1nrGK2/uEQXIXFEHg8Q3driv
	pyAtaFjvSwVxaudrN5ZnqTOU51V4wqVUi6EHEJrsVE8xYRAF+SB0PXX16b4vtbsseUfjlH
	Jwpws3KdZAnsQdz9VaC5nCMkUUToLs8=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-4e-5XipEOPW4lda3c4BL0g-1; Mon, 28 Aug 2023 17:02:42 -0400
X-MC-Unique: 4e-5XipEOPW4lda3c4BL0g-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-44d4b7993c3so1620715137.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256562; x=1693861362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4Hc7lOVUb37Hr8DSGTvFTUMZzvNY/pqjNxxEvyeHyI=;
        b=fHZLImkH9xWSjvl52YaKisB1fy4Pk/LBaCvRCXnZI5diZ4JfpubmlI+AIcaRUT4Zwv
         HEMYF0ESsbcz6G0NouqrTCSDTUewCi62HgF6x2DM8MED9uZBqagSoIV20I4M2ATGQfdy
         XXY35L9bnIxh3RY7zzJcYr0FKTYBMiQTzEDx83B7cNtBJhCwvVT4y0AkpTvH2UvidABE
         4bsKvLsh54uSHpa+GfoPownbMvNaVfPFsYVHHtSZt2O5ITRDTbw1cl26cR9EHXJLoLjw
         0Tm2LEvKrStyjx3VESJ2ULWyH0dAFZJ4gUB1IrjB9MYNGr/QGMWbjb++/ND1Qs3ZXU4c
         7QQw==
X-Gm-Message-State: AOJu0YweV4l4tos5oLArAYkpfPfeM7v6BE3K3H2Vhz3ru/LltD9Vni3+
	iaqI9GZ8i1k3pJkv8ssTXKwKiumrGAlFp2Ac/dl15teLQq9FLxEyZAitUD/BzSJ0uVCB6U48yjL
	TGWRH+wmOUJGGUWBwuLHccM93hQ==
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657380vsl.14.1693256562234;
        Mon, 28 Aug 2023 14:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1O+ulqQs16fLrviLhIDcWj2NFGLF73P8fTFl1IfopkK1Ei1hjIoNJD//dyDhnkd8Fjfj6aA==
X-Received: by 2002:a67:ad1a:0:b0:44d:4196:f374 with SMTP id t26-20020a67ad1a000000b0044d4196f374mr21657332vsl.14.1693256561816;
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cf50a000000b0064f732aa45csm2873129qvm.133.2023.08.28.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:02:41 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:02:40 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 17/24] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ftxla3xdnxqknqg4k6qxwh6nquhdpzfmzyuvkzg7gwjxf42p6w@7ek73gnk5mue>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <17-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:31PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
> ipmmu_utlb_disable()")
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

