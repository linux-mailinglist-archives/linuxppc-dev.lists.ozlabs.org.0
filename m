Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736E7B6448
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 10:35:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOUEVKwH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0B2y72jFz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 19:35:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOUEVKwH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0B282gN0z300f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 19:34:24 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-579de633419so7984577b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696322061; x=1696926861; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=tOUEVKwHdnyUK3doa4MQ1pKQvkYv+fQBv45btaJ50kUuM/QR+mj3AaRh2+3AgVPF4W
         LjdES88r8IgY5Gy58oUx/CZz7ieVB/tnb/tlUmAsJN3i69E19HfiAh6UUe9Sc8itdq26
         EOPVVMdVqdQNJeU4gxcKnvxyTsRLdlFB4AzunTqKrQyMJMlwy8rtPGgXX70Ol36oEo0k
         Y7VLuCEko2aWATBc2snsMT4HHIG7/ZRQyiE7XvW6837MtvfozwoxyPlTg9D1lRxsC9OD
         wZ2r53wNXkRwD2SthAToLBQn+K4GBkEpy3ZVSWDrg1oqt8jTprHozAmpjP7WyR5cbo8S
         En5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696322061; x=1696926861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bitTTBesOlX5jNs0WrntjlIVBf0r6k8vUqdJl07s2a4=;
        b=VaDNRwgyyG2+n998U+50/tejSRmDZ1X/rfqLgFm5R48KWoTlX80LZ3QCw6mNSeWY1C
         rEdjQwqXavXPEijbJv1wypdi4N31+BPscf765lr/UlEy4ciItUrkGrOxMTFceJRFpZ8y
         IkVCiZ6gx5JGgiNefKa5GzcGSayXxAs5y/r00RE3O8wa9uQTDjrW/Qig6Q2yGLUUp2o1
         jaq8zHcNpsubXCBjH539L7amlt9WGe6FB/+6kBYZwQaaErEbCMlr7DlIC6CT52L/o+FW
         /f+zFka174XZvOqZ3h1PE8PMtbGnOn18b6I9nhSFC6KvKQBIezOe3dk4LI/shsK0WnDQ
         l2rQ==
X-Gm-Message-State: AOJu0YwopkvA9jgAR+gBNVsq87WrClEW5pO+a2hPCfMHxCxIJWt2BjuW
	dmFRcXg7U6+0yE7RUb6B7djQM6YdDbhd1syp1WpIdA==
X-Google-Smtp-Source: AGHT+IFDzIQLW0laXGE7JKd6lbdhFAMnDeThlxxmtoO8UChMspJgCI8sx/aRikQspuJgbcSRJHW6nrx+DUBW3F7ngjs=
X-Received: by 2002:a0d:f685:0:b0:59e:8f6d:92e with SMTP id
 g127-20020a0df685000000b0059e8f6d092emr14665847ywf.49.1696322060718; Tue, 03
 Oct 2023 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
 <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com> <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
 <20231002230000.GA682044@nvidia.com>
In-Reply-To: <20231002230000.GA682044@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 11:34:08 +0300
Message-ID: <CAA8EJpr-CpgTVipd_t1uj7iHHq6__pj3mrm4Mn-pdZwhpS8aDA@mail.gmail.com>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Kevin Tian
  <kevin.tian@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Oct 2023 at 02:00, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Oct 03, 2023 at 12:21:59AM +0300, Dmitry Baryshkov wrote:
> > On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > At this point every iommu driver will cause a default_domain to be
> > > selected, so we can finally remove this gap from the core code.
> > >
> > > The following table explains what each driver supports and what the
> > > resulting default_domain will be:
> > >
> > >                                         ops->defaut_domain
> > >                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> > > amd/iommu.c             Y       Y                       N/A             either
> > > apple-dart.c            Y       Y                       N/A             either
> > > arm-smmu.c              Y       Y                       IDENTITY        either
> > > qcom_iommu.c            G       Y                       IDENTITY        either
> > > arm-smmu-v3.c           Y       Y                       N/A             either
> > > exynos-iommu.c          G       Y                       IDENTITY        either
> > > fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> > > intel/iommu.c           Y       Y                       N/A             either
> > > ipmmu-vmsa.c            G       Y                       IDENTITY        either
> > > msm_iommu.c             G                               IDENTITY        N/A
> >
> > Unfortunately this patch breaks msm_iommu platforms. This driver
> > doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
> > returns 0, bus_iommu_probe() fails with -ENODEV.
> > If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
> > with -EBUSY.
>
> Oh, OK.
>
> Does this fix it?

It indeed fixes the issue, so could you please post it, adding:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index cdc7b730192a35..f7ef081c33dcb2 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -685,10 +685,16 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
>         return 0;
>  }
>
> +static int msm_iommu_def_domain_type(struct device *dev)
> +{
> +       return IOMMU_DOMAIN_IDENTITY;
> +}
> +
>  static struct iommu_ops msm_iommu_ops = {
>         .identity_domain = &msm_iommu_identity_domain,
>         .domain_alloc_paging = msm_iommu_domain_alloc_paging,
>         .probe_device = msm_iommu_probe_device,
> +       .def_domain_type = msm_iommu_def_domain_type,
>         .device_group = generic_device_group,
>         .pgsize_bitmap = MSM_IOMMU_PGSIZES,
>         .of_xlate = qcom_iommu_of_xlate,

-- 
With best wishes
Dmitry
