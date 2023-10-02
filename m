Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190317B5C74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 23:23:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kV+Au7MU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzv7W0Gstz3vXj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 08:23:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kV+Au7MU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzv6c5jSPz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 08:22:15 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a229ac185aso3292087b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Oct 2023 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696281731; x=1696886531; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KY1yTwg5kkSQ1PPrVUqg1E2GU9pyZpek6FOp/omImxs=;
        b=kV+Au7MUpwXKfZsRSQA7ZyQrojudMDy7WLyelGemfRxb2K9q/vr9SoZV9lqs4ugz3L
         XkxO+hVxOQ/NTXvlEesuihDnXhdK/ue3V35Z4DKBU9Q1m4Gb+eSb9zhA9qgY/e5dLUjt
         KvhUiRxRSK0cwJFrfwhJJeDBdnDXThjAEULO92EabhCY8h9NAIseHpaDsf2SlaQvudXP
         X+mM9X7CJsAYQRQXH6+sIRLbrXaZ6/ZrhV8gynROJyKLIfiRFs+bdMo3ybufoiVNaH+d
         qquGOk/h0OGqqDLDWP1zPLyB1LpaujZnjAPZgbn3A0xv+zEka5f37GcxgsFaOBEjjrht
         QtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696281731; x=1696886531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KY1yTwg5kkSQ1PPrVUqg1E2GU9pyZpek6FOp/omImxs=;
        b=dBy6DTaJNcYMQgUwdfQZb6wj+UoWBVqyztR/I2/MKsgrtYmpRT3SZv+GtWXkqDUDdt
         KlTu1iL5iO6BV/gl8Ts8PdmOuD0QZ/vGeM+ZAPNipdkALb/ScWAUoIi+2xy7dgFiJJTL
         g758iBy63CoaU0NVceenwoNYmHUkk5W679VT1VMfrbwFI1ZZN9JQcJWOSzfuxVWuzCNE
         gRlpGkPwcFultSV7dU+1g16VgCOAVSa/xGrb6S2BwDXgot9aZr4+tojThiwvz4aEn0zK
         6fQcQA9QD9M0gYb+i6AthD0ZBnUCDKMQfvLLu0lQgIVd/MH28ik/iihg5R6JfjwyaDRM
         JnpA==
X-Gm-Message-State: AOJu0Yx6fM9W1dGdiX17FHiw4N/s4yILEu2fsvDAscOD9zz7Y4V15MQ8
	3e3oD4DwKQUcjQAW83BBQ/rUXSDxskx6x0C9DZBqqQ==
X-Google-Smtp-Source: AGHT+IFaRCfqm0SlfcT/sMeXMK7dbF3zxTUUIPxu3awMhgeV/37hJ6olOIew2lBKO7L65qL9ql+xhT0CDDmED9Aaft4=
X-Received: by 2002:a0d:c906:0:b0:595:9135:83c7 with SMTP id
 l6-20020a0dc906000000b00595913583c7mr11373199ywd.47.1696281730897; Mon, 02
 Oct 2023 14:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com> <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 00:21:59 +0300
Message-ID: <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
To: Jason Gunthorpe <jgg@nvidia.com>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, Niklas S
 chnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> At this point every iommu driver will cause a default_domain to be
> selected, so we can finally remove this gap from the core code.
>
> The following table explains what each driver supports and what the
> resulting default_domain will be:
>
>                                         ops->defaut_domain
>                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> amd/iommu.c             Y       Y                       N/A             either
> apple-dart.c            Y       Y                       N/A             either
> arm-smmu.c              Y       Y                       IDENTITY        either
> qcom_iommu.c            G       Y                       IDENTITY        either
> arm-smmu-v3.c           Y       Y                       N/A             either
> exynos-iommu.c          G       Y                       IDENTITY        either
> fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> intel/iommu.c           Y       Y                       N/A             either
> ipmmu-vmsa.c            G       Y                       IDENTITY        either
> msm_iommu.c             G                               IDENTITY        N/A

Unfortunately this patch breaks msm_iommu platforms. This driver
doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
returns 0, bus_iommu_probe() fails with -ENODEV.
If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
with -EBUSY.

> mtk_iommu.c             G       Y                       IDENTITY        either
> mtk_iommu_v1.c          G                               IDENTITY        N/A
> omap-iommu.c            G                               IDENTITY        N/A
> rockchip-iommu.c        G       Y                       IDENTITY        either
> s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
> sprd-iommu.c                    Y                       N/A             DMA
> sun50i-iommu.c          G       Y                       IDENTITY        either
> tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
> virtio-iommu.c          Y       Y                       N/A             either
> spapr                                   Y       Y       N/A             N/A     PLATFORM
>  * G means ops->identity_domain is used
>  * N/A means the driver will not compile in this configuration
>
> ARM32 drivers select an IDENTITY default domain through either the
> ops->identity_domain or directly requesting an IDENTIY domain through
> alloc_domain().
>
> In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
> forces an IDENTITY domain.
>
> S390 uses a PLATFORM domain to represent when the dma_ops are set to the
> s390 iommu code.
>
> fsl_pamu uses an PLATFORM domain.
>
> POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.
>
> The x86 drivers continue unchanged.
>
> After this patch group->default_domain is only NULL for a short period
> during bus iommu probing while all the groups are constituted. Otherwise
> it is always !NULL.
>
> This completes changing the iommu subsystem driver contract to a system
> where the current iommu_domain always represents some form of translation
> and the driver is continuously asserting a definable translation mode.
>
> It resolves the confusion that the original ops->detach_dev() caused
> around what translation, exactly, is the IOMMU performing after
> detach. There were at least three different answers to that question in
> the tree, they are all now clearly named with domain types.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 42a4585dd76da6..cfb597751f5bad 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1865,7 +1865,6 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
>  static int iommu_get_default_domain_type(struct iommu_group *group,
>                                          int target_type)
>  {
> -       const struct iommu_ops *ops = group_iommu_ops(group);
>         struct device *untrusted = NULL;
>         struct group_device *gdev;
>         int driver_type = 0;
> @@ -1876,11 +1875,13 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
>          * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
>          * identity_domain and it will automatically become their default
>          * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> -        * Override the selection to IDENTITY if we are sure the driver supports
> -        * it.
> +        * Override the selection to IDENTITY.
>          */
> -       if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain)
> +       if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> +               static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> +                               IS_ENABLED(CONFIG_IOMMU_DMA)));
>                 driver_type = IOMMU_DOMAIN_IDENTITY;
> +       }
>
>         for_each_group_device(group, gdev) {
>                 driver_type = iommu_get_def_domain_type(group, gdev->dev,
> @@ -3016,18 +3017,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
>         if (req_type < 0)
>                 return -EINVAL;
>
> -       /*
> -        * There are still some drivers which don't support default domains, so
> -        * we ignore the failure and leave group->default_domain NULL.
> -        */
>         dom = iommu_group_alloc_default_domain(group, req_type);
> -       if (!dom) {
> -               /* Once in default_domain mode we never leave */
> -               if (group->default_domain)
> -                       return -ENODEV;
> -               group->default_domain = NULL;
> -               return 0;
> -       }
> +       if (!dom)
> +               return -ENODEV;
>
>         if (group->default_domain == dom)
>                 return 0;
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
