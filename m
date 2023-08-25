Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9917787D56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 03:52:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqRT/ORQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqRT/ORQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX2yg4gZtz3cCw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 11:52:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqRT/ORQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqRT/ORQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX2xm4ZJDz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692928312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DWLhpWKTuJ/+RpYHbnTOi50aZ6LnaGdh4R08Ifp1NrU=;
	b=RqRT/ORQBbwwT6Ay4VCYEG5Un3Um36dcB7OOb44eagUoW8+Ba8Pwq5eVsRnzoYY7iotCYM
	T+qsDQ5YmeGp9u4BF8TBxmedtSCOUejHPwaCphHuoOpqfS5soRw38UDLVTaWFLT9kSOrZ1
	vDogYTMr4nMQkLN5fKoi20qULf2wQ5M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692928312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DWLhpWKTuJ/+RpYHbnTOi50aZ6LnaGdh4R08Ifp1NrU=;
	b=RqRT/ORQBbwwT6Ay4VCYEG5Un3Um36dcB7OOb44eagUoW8+Ba8Pwq5eVsRnzoYY7iotCYM
	T+qsDQ5YmeGp9u4BF8TBxmedtSCOUejHPwaCphHuoOpqfS5soRw38UDLVTaWFLT9kSOrZ1
	vDogYTMr4nMQkLN5fKoi20qULf2wQ5M=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-BBNONuwbOfea4Ced71JItQ-1; Thu, 24 Aug 2023 21:51:51 -0400
X-MC-Unique: BBNONuwbOfea4Ced71JItQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41044a474f6so13635161cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692928310; x=1693533110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLhpWKTuJ/+RpYHbnTOi50aZ6LnaGdh4R08Ifp1NrU=;
        b=G2BfgRw5q8wxVnEkFCYs89iPQYwrrAD7s8NRKUHo7tSNLHoyGBeaawo/elkxwolnZL
         x0cRxnV0CYBQk0WK1sYkjsykif8+BrPE4MGUdtrPED6IJnZ4jjZ8ukYT8UwWCN4uaoEo
         Lry+jGLmKzA85yhtBIGdt02fnrfPc3yWEdXjHt6bFKpobU9VmYvQEJyZqqXCbkmIzphK
         bGlzTHnn+C7Wt4ZeptXMN8z41+tSutWNxjmh2yRCmYq3KEk106ZYLMftG6O41oTsGiP8
         CvP2b+uy5w6O2mJY5F+c6daXhDv+l1wdgv08VXLvuYISd9/QOhKZe9Ec5PPUhREQNj7g
         Dl3A==
X-Gm-Message-State: AOJu0YzaZfx4ZHzMS4s/bW78Gg//euxgiRZonLFRrHI3KGj1i7nlha09
	t7Jr2YvjF6W5/F+BaouIRucrBaXG2HQpmyJosg21Glcb7h0AutCTBBFaxwjjg4k0uetEAKc6TFO
	fNdtMkkRbgsvwM+H78m/ryq1IXw==
X-Received: by 2002:ac8:59d6:0:b0:400:8613:5378 with SMTP id f22-20020ac859d6000000b0040086135378mr20752379qtf.20.1692928310658;
        Thu, 24 Aug 2023 18:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSb6TqK3YZra5FavtOfFBMuLIN1bj8qAZDBsTSTbyHb3Qk54OyKXOKpdirNK5+OZKcbYX2cg==
X-Received: by 2002:ac8:59d6:0:b0:400:8613:5378 with SMTP id f22-20020ac859d6000000b0040086135378mr20752335qtf.20.1692928310369;
        Thu, 24 Aug 2023 18:51:50 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id i17-20020ac860d1000000b00405447ee5e8sm224859qtm.55.2023.08.24.18.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 18:51:49 -0700 (PDT)
Date: Thu, 24 Aug 2023 18:51:48 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <hbmfqpq2oyjjz3loccfbslpalzhlsyr2w3bpx6qasq23kyrfso@e6kry74ifgnt>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:16PM -0300, Jason Gunthorpe wrote:
> This is used when the iommu driver is taking control of the dma_ops,
> currently only on S390 and power spapr. It is designed to preserve the
> original ops->detach_dev() semantic that these S390 was built around.
> 
> Provide an opaque domain type and a 'default_domain' ops value that allows
> the driver to trivially force any single domain as the default domain.
> 
> Update iommufd selftest to use this instead of set_platform_dma_ops
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c            | 13 +++++++++++++
>  drivers/iommu/iommufd/selftest.c | 14 +++++---------
>  include/linux/iommu.h            |  6 ++++++
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 33bd1107090720..7cedb0640290c8 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -184,6 +184,8 @@ static const char *iommu_domain_type_str(unsigned int t)
>  	case IOMMU_DOMAIN_DMA:
>  	case IOMMU_DOMAIN_DMA_FQ:
>  		return "Translated";
> +	case IOMMU_DOMAIN_PLATFORM:
> +		return "Platform";
>  	default:
>  		return "Unknown";
>  	}
> @@ -1752,6 +1754,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  
>  	lockdep_assert_held(&group->mutex);
>  
> +	/*
> +	 * Allow legacy drivers to specify the domain that will be the default
> +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> +	 * Do not use in new drivers.
> +	 */

Would it be worthwhile to mention this in iommu.h for the iommu_ops default_domain?

> +	if (bus->iommu_ops->default_domain) {
> +		if (req_type)
> +			return ERR_PTR(-EINVAL);
> +		return bus->iommu_ops->default_domain;
> +	}
> +
>  	if (req_type)
>  		return __iommu_group_alloc_default_domain(bus, group, req_type);
>  
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index d48a202a7c3b81..fb981ba97c4e87 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -281,14 +281,6 @@ static bool mock_domain_capable(struct device *dev, enum iommu_cap cap)
>  	return cap == IOMMU_CAP_CACHE_COHERENCY;
>  }
>  
> -static void mock_domain_set_plaform_dma_ops(struct device *dev)
> -{
> -	/*
> -	 * mock doesn't setup default domains because we can't hook into the
> -	 * normal probe path
> -	 */
> -}
> -
>  static struct iommu_device mock_iommu_device = {
>  };
>  
> @@ -298,12 +290,16 @@ static struct iommu_device *mock_probe_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops mock_ops = {
> +	/*
> +	 * IOMMU_DOMAIN_BLOCKED cannot be returned from def_domain_type()
> +	 * because it is zero.
> +	 */
> +	.default_domain = &mock_blocking_domain,
>  	.owner = THIS_MODULE,
>  	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
>  	.hw_info = mock_domain_hw_info,
>  	.domain_alloc = mock_domain_alloc,
>  	.capable = mock_domain_capable,
> -	.set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
>  	.device_group = generic_device_group,
>  	.probe_device = mock_probe_device,
>  	.default_domain_ops =
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d0920b2a9f1c0e..48a18b6e07abff 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -64,6 +64,7 @@ struct iommu_domain_geometry {
>  #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
>  
>  #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
> +#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
>  
>  #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
>  /*
> @@ -81,6 +82,8 @@ struct iommu_domain_geometry {
>   *				  invalidation.
>   *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
>   *				  represented by mm_struct's.
> + *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
> + *				  dma_api stuff. Do not use in new drivers.
>   */
>  #define IOMMU_DOMAIN_BLOCKED	(0U)
>  #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> @@ -91,6 +94,7 @@ struct iommu_domain_geometry {
>  				 __IOMMU_DOMAIN_DMA_API |	\
>  				 __IOMMU_DOMAIN_DMA_FQ)
>  #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
> +#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
>  
>  struct iommu_domain {
>  	unsigned type;
> @@ -262,6 +266,7 @@ struct iommu_iotlb_gather {
>   * @owner: Driver module providing these ops
>   * @identity_domain: An always available, always attachable identity
>   *                   translation.
> + * @default_domain: If not NULL this will always be set as the default domain.
>   */
>  struct iommu_ops {
>  	bool (*capable)(struct device *dev, enum iommu_cap);
> @@ -297,6 +302,7 @@ struct iommu_ops {
>  	unsigned long pgsize_bitmap;
>  	struct module *owner;
>  	struct iommu_domain *identity_domain;
> +	struct iommu_domain *default_domain;
>  };
>  
>  /**
> -- 
> 2.41.0
> 

