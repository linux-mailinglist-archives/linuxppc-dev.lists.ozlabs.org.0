Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A031078B9CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:54:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0FHN3D7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0FHN3D7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZN8P35nfz3Wts
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0FHN3D7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M0FHN3D7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZN7T2C3Lz2yW1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:53:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qzw/wSjdBQfPlF1y1vWCr8uR+Xbcc5Ojc8ATgenlbFw=;
	b=M0FHN3D7l8ynHyniTatW4TxRpBL+UCo9G3jNOLLE/IQ+3qt6kFG1Cqud2BfzY/9mi9tZiQ
	Pv4VmsWXO6vb27JBt9gG3qrHMo99Oz/LsrNsmDECLjeWCnPf6NDlohnKdBVINH3mDKqfHJ
	Ypk0FaKlh4gUWAsbamiRZ8ouIebxHqI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qzw/wSjdBQfPlF1y1vWCr8uR+Xbcc5Ojc8ATgenlbFw=;
	b=M0FHN3D7l8ynHyniTatW4TxRpBL+UCo9G3jNOLLE/IQ+3qt6kFG1Cqud2BfzY/9mi9tZiQ
	Pv4VmsWXO6vb27JBt9gG3qrHMo99Oz/LsrNsmDECLjeWCnPf6NDlohnKdBVINH3mDKqfHJ
	Ypk0FaKlh4gUWAsbamiRZ8ouIebxHqI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-ID1wNrSTMTK5VFLFVb9bBQ-1; Mon, 28 Aug 2023 16:53:19 -0400
X-MC-Unique: ID1wNrSTMTK5VFLFVb9bBQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40ff67467c9so40565661cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255999; x=1693860799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzw/wSjdBQfPlF1y1vWCr8uR+Xbcc5Ojc8ATgenlbFw=;
        b=TLyto6EkDWW1ZGQ2vVdY++WP+8vb+HRY3hUCvgZ5nfsrkbzcy0po4/2+IW4ws5lt3l
         /p3rz6sU1yhG/C6eM1+Cke+filarnkk3gu/1dbzbArTvU1ocfGzOGZHTNb1YxOCYXUxP
         ZaQmLE9IcFxErSmLOYLW2HIki7qrvew63fSWhyEuPRPcSyUVwut5mYhjHSfk0LBFZKRi
         8rNrNxtN5HnvtGtWHB4nv+9s7kt989sYbDI3DnnZVneFJdsCnrsjn6SNsdmsAHlgdWmu
         HQGukiXhSTTOErKyQsKCVjOIA5ahitwmkO8zDEVGe5MhNEYQLfjnKUSvPOVsYpLvAxLy
         HMtg==
X-Gm-Message-State: AOJu0YxNVdT0HQ8RyOhtGUwWc3ketclsk8z9QNmUxsrikqXUaLxTH3uT
	mwX1okIPOdL3UbI6jMNnbNHY0yQhy9EzPGbVQ2bUecouBisImmL74d1bfsygh5gTucsu+8FrKmZ
	h6vkQA2zvs6ERI/BwSBMbbgalYA==
X-Received: by 2002:a05:622a:13cc:b0:407:fb08:c44c with SMTP id p12-20020a05622a13cc00b00407fb08c44cmr31265792qtk.47.1693255998868;
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1P7U6WABsjNUNOIrt30Nh8s3ysfvweacBVh9WudC6nYyRn08u0phTJIzmGkwySv3sSUL+sw==
X-Received: by 2002:a05:622a:13cc:b0:407:fb08:c44c with SMTP id p12-20020a05622a13cc00b00407fb08c44cmr31265764qtk.47.1693255998660;
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z21-20020ac84555000000b0040ff0590fd2sm2553633qtn.87.2023.08.28.13.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:53:16 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 14/24] iommu/msm: Implement an IDENTITY domain
Message-ID: <37fnmzxe5cqs57gei3i6irsnnybzkbkdjf3nhertw55bb4ke6w@un2o657nczbc>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <14-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <14-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:28PM -0300, Jason Gunthorpe wrote:
> What msm does during msm_iommu_set_platform_dma() is actually putting the
> iommu into identity mode.
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
>  drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

