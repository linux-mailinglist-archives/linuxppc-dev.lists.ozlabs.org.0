Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA232DD9C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 00:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds6422YSxz3d9j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 10:08:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CjrbQ7en;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=robdclark@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CjrbQ7en; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds63Z75KTz3cJM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 10:08:09 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id l22so63408wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 15:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lQRVhb2fmLqsoyQKjRe8fitm837n7i4zwyHsvEUN5wY=;
 b=CjrbQ7ensaU3nJzPwcF60nDPqPyQwKRA5UV3tDsTfIbOIK3rlvXZsNs103APDKPR76
 JzLJraxoeDzc/nWGwfKg4s12kZrbK3OeYc+SZB+NLUau4dRPfrKzUmkzA5zhd62eO7/A
 00B766rIAtduV/tL7dzB6sPYXyL9ZZHpnwGUQ6wlrkbmj8uwcSVEEBWkYhw66uFk8g0T
 QH8r/nJhs+BatRQIVO3EAkyh9M7OZfJRZ1PSPUuCwWsMy2PNie9AhKp4upVCH2tR7ijY
 Sb+ALvIV7rKcK3nYHb4t6Kgj2RqR7gEvSx6EGrxzWEk+qsjRyTtgE37byGeEoSY0q4bi
 pX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lQRVhb2fmLqsoyQKjRe8fitm837n7i4zwyHsvEUN5wY=;
 b=sCVtb2fD1lTtG+GgDO3q7MyH6EuhlzVFXPuFPldy6oLOeFWCyl8PPVn2CpwWWBzrfu
 LEcRC8ld0OWBVW3DUtI49fReqNjqsu6c3pBrRoUbybiSVSMISDTvB0YUB84qSNuxRGtP
 zmYPlI19THnfPd9V6GL3ugp6yWEI/kgFM/luvi/8D9BEjeBWYX6xN4T9xlqGBnvZDD8P
 C/EpdxnQc/zREfhu2HKTvN+dmio0tWD4zRe7/8qAY/YmcWyTuY491Rr743ZslCrDatK4
 UnsLS9wI6XuuAaM+v8n/6Euq+xu//PazhnyZFir0XDRxN/sZ9azw6Hc+4ewxf+jsvu0N
 pbCA==
X-Gm-Message-State: AOAM533Ki5TDW3cugz2xPYZUo7bDD8KZLj4r76InQXNQ9OXNWKnGpf5T
 MBuMg66gnUfhmMtrbZHaP5eQ2EsG1sB471iXio8=
X-Google-Smtp-Source: ABdhPJxVVQPsgq02I2Ff4zRkoRoPzpsOHVRQGGML6KsK4Xb0ofpQyl7vPhx80DEtc9/2caqtEQQ6e2eh6wtKc9RJyl8=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr6168367wma.94.1614899283195; 
 Thu, 04 Mar 2021 15:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-17-hch@lst.de>
 <d567ad5c-5f89-effa-7260-88c6d86b4695@arm.com>
In-Reply-To: <d567ad5c-5f89-effa-7260-88c6d86b4695@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Mar 2021 15:11:08 -0800
Message-ID: <CAF6AEGtTs-=aO-Ntp0Qn6mYDSv4x0-q3y217QxU7kZ6H1b1fiQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 16/17] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Li Yang <leoyang.li@nxp.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 4, 2021 at 7:48 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-03-01 08:42, Christoph Hellwig wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Moreso than the previous patch, where the feature is at least relatively
> generic (note that there's a bunch of in-flight development around
> DOMAIN_ATTR_NESTING), I'm really not convinced that it's beneficial to
> bloat the generic iommu_ops structure with private driver-specific
> interfaces. The attribute interface is a great compromise for these
> kinds of things, and you can easily add type-checked wrappers around it
> for external callers (maybe even make the actual attributes internal
> between the IOMMU core and drivers) if that's your concern.

I suppose if this is *just* for the GPU we could move it into adreno_smmu_priv..

But one thing I'm not sure about is whether
IO_PGTABLE_QUIRK_ARM_OUTER_WBWA is something that other devices
*should* be using as well, but just haven't gotten around to yet.

BR,
-R

> Robin.
>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c   | 40 +++++++------------------
> >   drivers/iommu/iommu.c                   |  9 ++++++
> >   include/linux/iommu.h                   |  9 +++++-
> >   4 files changed, 29 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 0f184c3dd9d9ec..78d98ab2ee3a68 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -191,7 +191,7 @@ void adreno_set_llc_attributes(struct iommu_domain *iommu)
> >       struct io_pgtable_domain_attr pgtbl_cfg;
> >
> >       pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
> > -     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
> > +     iommu_domain_set_pgtable_attr(iommu, &pgtbl_cfg);
> >   }
> >
> >   struct msm_gem_address_space *
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 2e17d990d04481..2858999c86dfd1 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -1515,40 +1515,22 @@ static int arm_smmu_domain_enable_nesting(struct iommu_domain *domain)
> >       return ret;
> >   }
> >
> > -static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> > -                                 enum iommu_attr attr, void *data)
> > +static int arm_smmu_domain_set_pgtable_attr(struct iommu_domain *domain,
> > +             struct io_pgtable_domain_attr *pgtbl_cfg)
> >   {
> > -     int ret = 0;
> >       struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> > +     int ret = -EPERM;
> >
> > -     mutex_lock(&smmu_domain->init_mutex);
> > -
> > -     switch(domain->type) {
> > -     case IOMMU_DOMAIN_UNMANAGED:
> > -             switch (attr) {
> > -             case DOMAIN_ATTR_IO_PGTABLE_CFG: {
> > -                     struct io_pgtable_domain_attr *pgtbl_cfg = data;
> > -
> > -                     if (smmu_domain->smmu) {
> > -                             ret = -EPERM;
> > -                             goto out_unlock;
> > -                     }
> > +     if (domain->type != IOMMU_DOMAIN_UNMANAGED)
> > +             return -EINVAL;
> >
> > -                     smmu_domain->pgtbl_cfg = *pgtbl_cfg;
> > -                     break;
> > -             }
> > -             default:
> > -                     ret = -ENODEV;
> > -             }
> > -             break;
> > -     case IOMMU_DOMAIN_DMA:
> > -             ret = -ENODEV;
> > -             break;
> > -     default:
> > -             ret = -EINVAL;
> > +     mutex_lock(&smmu_domain->init_mutex);
> > +     if (!smmu_domain->smmu) {
> > +             smmu_domain->pgtbl_cfg = *pgtbl_cfg;
> > +             ret = 0;
> >       }
> > -out_unlock:
> >       mutex_unlock(&smmu_domain->init_mutex);
> > +
> >       return ret;
> >   }
> >
> > @@ -1609,7 +1591,7 @@ static struct iommu_ops arm_smmu_ops = {
> >       .device_group           = arm_smmu_device_group,
> >       .dma_use_flush_queue    = arm_smmu_dma_use_flush_queue,
> >       .dma_enable_flush_queue = arm_smmu_dma_enable_flush_queue,
> > -     .domain_set_attr        = arm_smmu_domain_set_attr,
> > +     .domain_set_pgtable_attr = arm_smmu_domain_set_pgtable_attr,
> >       .domain_enable_nesting  = arm_smmu_domain_enable_nesting,
> >       .of_xlate               = arm_smmu_of_xlate,
> >       .get_resv_regions       = arm_smmu_get_resv_regions,
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 2e9e058501a953..8490aefd4b41f8 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -2693,6 +2693,15 @@ int iommu_domain_enable_nesting(struct iommu_domain *domain)
> >   }
> >   EXPORT_SYMBOL_GPL(iommu_domain_enable_nesting);
> >
> > +int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
> > +             struct io_pgtable_domain_attr *pgtbl_cfg)
> > +{
> > +     if (!domain->ops->domain_set_pgtable_attr)
> > +             return -EINVAL;
> > +     return domain->ops->domain_set_pgtable_attr(domain, pgtbl_cfg);
> > +}
> > +EXPORT_SYMBOL_GPL(iommu_domain_set_pgtable_attr);
> > +
> >   void iommu_get_resv_regions(struct device *dev, struct list_head *list)
> >   {
> >       const struct iommu_ops *ops = dev->bus->iommu_ops;
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index aed88aa3bd3edf..39d3ed4d2700ac 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -40,6 +40,7 @@ struct iommu_domain;
> >   struct notifier_block;
> >   struct iommu_sva;
> >   struct iommu_fault_event;
> > +struct io_pgtable_domain_attr;
> >
> >   /* iommu fault flags */
> >   #define IOMMU_FAULT_READ    0x0
> > @@ -107,7 +108,6 @@ enum iommu_cap {
> >    */
> >
> >   enum iommu_attr {
> > -     DOMAIN_ATTR_IO_PGTABLE_CFG,
> >       DOMAIN_ATTR_MAX,
> >   };
> >
> > @@ -196,6 +196,7 @@ struct iommu_iotlb_gather {
> >    * @dma_enable_flush_queue: Try to enable the DMA flush queue
> >    * @domain_set_attr: Change domain attributes
> >    * @domain_enable_nesting: Enable nesting
> > + * @domain_set_pgtable_attr: Set io page table attributes
> >    * @get_resv_regions: Request list of reserved regions for a device
> >    * @put_resv_regions: Free list of reserved regions for a device
> >    * @apply_resv_region: Temporary helper call-back for iova reserved ranges
> > @@ -249,6 +250,8 @@ struct iommu_ops {
> >       int (*domain_set_attr)(struct iommu_domain *domain,
> >                              enum iommu_attr attr, void *data);
> >       int (*domain_enable_nesting)(struct iommu_domain *domain);
> > +     int (*domain_set_pgtable_attr)(struct iommu_domain *domain,
> > +                     struct io_pgtable_domain_attr *pgtbl_cfg);
> >
> >       /* Request/Free a list of reserved regions for a device */
> >       void (*get_resv_regions)(struct device *dev, struct list_head *list);
> > @@ -493,9 +496,13 @@ extern int iommu_group_id(struct iommu_group *group);
> >   extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
> >
> >   bool iommu_dma_use_flush_queue(struct iommu_domain *domain);
> > +int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
> > +             struct io_pgtable_domain_attr *pgtbl_cfg);
> >   extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
> >                                void *data);
> >   int iommu_domain_enable_nesting(struct iommu_domain *domain);
> > +int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
> > +             struct io_pgtable_domain_attr *pgtbl_cfg);
> >
> >   extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
> >                             unsigned long iova, int flags);
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
