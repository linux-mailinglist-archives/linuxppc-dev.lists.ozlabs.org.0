Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCF78B8CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 21:58:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F6eWE2Xf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F6eWE2Xf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZLvn6FFZz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 05:58:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F6eWE2Xf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F6eWE2Xf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZLsw48BBz2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 05:56:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693252592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+aPLP5Dvqf88CiJMFQl9Auucq47ZaEdR+LnhUOVMwHI=;
	b=F6eWE2XfSec0Gf/5CMCgTQkpFPmrbGAwyzJg2PfLzbTfAJ9TOOutp1kw8w/aVdJLXPJv8p
	Aow5GyiUoW96lSj2GUazw5bL4FBboc/qvsrESVcd4qL8HUVO/gK8e5v9Xvl1J8i8rbvArz
	IxYUTKOTxcCfKYojjdotUqLfCtEYofM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693252592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+aPLP5Dvqf88CiJMFQl9Auucq47ZaEdR+LnhUOVMwHI=;
	b=F6eWE2XfSec0Gf/5CMCgTQkpFPmrbGAwyzJg2PfLzbTfAJ9TOOutp1kw8w/aVdJLXPJv8p
	Aow5GyiUoW96lSj2GUazw5bL4FBboc/qvsrESVcd4qL8HUVO/gK8e5v9Xvl1J8i8rbvArz
	IxYUTKOTxcCfKYojjdotUqLfCtEYofM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-4JHV7e79M3GY4P-LvyZG8Q-1; Mon, 28 Aug 2023 15:56:30 -0400
X-MC-Unique: 4JHV7e79M3GY4P-LvyZG8Q-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64a5264b91eso38334726d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 12:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252590; x=1693857390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aPLP5Dvqf88CiJMFQl9Auucq47ZaEdR+LnhUOVMwHI=;
        b=BM+ZX/4zYfnIVSc423xiwYcYChKdJYh9IWy8k/+5mik/PIxvcH3VvVehJ0t9TSbSr+
         iN8d+qnaUEMjhs7xDaMUUc6+JZfQj54A8168P/fgW9CauvXALl95azBpEV/dFF6SrSLg
         MWVKwAK9gEZu+X1YxwhldR5ckdFZ7gPouqsZeUcvBxyTuEoQV4YH5RnIEfM8vKpCs8yC
         18w4lXZvV3asz2DPV/cOYRUEJvCf3fd9w/fJwswYV5nVvLyYCm+Gf9+8OHWjp/W6vKui
         n4DNWY950AFRk9QCVEFBoKMuNgVSgEzVJToK4Rd62btmkBXPNwxeOEkG5Cy+7zWCmpw+
         bGtw==
X-Gm-Message-State: AOJu0Yy9L7hFLtjsxHIuP6X4TQUbptaac9keCwHI6rZWfSIG9kz8IzV1
	o3lajwQvLOQFi87Zkb75zx+IoZxmK3eSW1ewkNzIckB/sARvTzt4GOV58cs7n2K70UsFDol80/c
	BerVPWFIDKlOwSws4y1801iDLkw==
X-Received: by 2002:a05:622a:1b92:b0:403:fd62:ce75 with SMTP id bp18-20020a05622a1b9200b00403fd62ce75mr28216022qtb.5.1693252590268;
        Mon, 28 Aug 2023 12:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsYP9ZZ2CsJhUv0f/7ePOTXR8lCjq1Is30niybYFTHi0Enn8YltRs8yVE4tVH5Ow+UhbE98A==
X-Received: by 2002:a05:622a:1b92:b0:403:fd62:ce75 with SMTP id bp18-20020a05622a1b9200b00403fd62ce75mr28215977qtb.5.1693252589954;
        Mon, 28 Aug 2023 12:56:29 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id d4-20020ac86144000000b0040ff25d8712sm2559692qtm.18.2023.08.28.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:56:29 -0700 (PDT)
Date: Mon, 28 Aug 2023 12:56:28 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 08/24] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Message-ID: <3pxd6d44iejlvlijiyd65ze3wfsvvjtgrvstwhgp423uwutrz6@dak5ytcxcspv>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <8-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <8-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:22PM -0300, Jason Gunthorpe wrote:
> Except for dart (which forces IOMMU_DOMAIN_DMA) every driver returns 0 or
> IDENTITY from ops->def_domain_type().
> 
> The drivers that return IDENTITY have some kind of good reason, typically
> that quirky hardware really can't support anything other than IDENTITY.
> 
> Arrange things so that if the driver says it needs IDENTITY then
> iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
> not ignore the driver's override to IDENTITY.
> 
> Split the function into two steps, reducing the group device list to the
> driver's def_domain_type() and the untrusted flag.
> 
> Then compute the result based on those two reduced variables. Fully reject
> combining untrusted with IDENTITY.
> 
> Remove the debugging print on the iommu_group_store_type() failure path,
> userspace should not be able to trigger kernel prints.
> 
> This makes the next patch cleaner that wants to force IDENTITY always for
> ARM_IOMMU because there is no support for DMA.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 117 ++++++++++++++++++++++++++++--------------
>  1 file changed, 79 insertions(+), 38 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

