Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5F788FC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 22:24:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/IiRGuH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/IiRGuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXWdk5g0dz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 06:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/IiRGuH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/IiRGuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXWcq48WSz304l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 06:23:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692995031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBqcsz+qyHMazVNsnwC+GgF7rp1trrk3H8y0CxPC4U=;
	b=h/IiRGuHzZzKuF7AeqrNzrlcYnWBY9ijKnSCsySjI6ejiJL170XTlomgMvf1CPPZLXTPTI
	kTmD/cltb3QDNugiaDR0gmcsCO6WVKHawqHnal+N0NHunjoJWbhdS+bYD8FLKWSnVpAqkA
	EIAdceJGV461QgRB1yxUggtTeTYnntA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692995031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6UBqcsz+qyHMazVNsnwC+GgF7rp1trrk3H8y0CxPC4U=;
	b=h/IiRGuHzZzKuF7AeqrNzrlcYnWBY9ijKnSCsySjI6ejiJL170XTlomgMvf1CPPZLXTPTI
	kTmD/cltb3QDNugiaDR0gmcsCO6WVKHawqHnal+N0NHunjoJWbhdS+bYD8FLKWSnVpAqkA
	EIAdceJGV461QgRB1yxUggtTeTYnntA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-_OwKjAn4OSqsgmSxmiSLtQ-1; Fri, 25 Aug 2023 16:23:50 -0400
X-MC-Unique: _OwKjAn4OSqsgmSxmiSLtQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-64a5f9a165aso15334256d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 13:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995029; x=1693599829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UBqcsz+qyHMazVNsnwC+GgF7rp1trrk3H8y0CxPC4U=;
        b=Flt+gWGAouvQfwY8tprMsOEP5legNbeXiurWNLRAJaDLTSzhwMHUvWkUIVSpFbpEHB
         NEqjctSyP+yFAGoy0VrhgwF3Zh0dhF8v2LDSeLJ6qjxHTiLhm33M1DieCY0ludk+qM8y
         m+mIPnNPOQKJpTfY/zuCwAhp1galUj3UhJLQgsGuOmDuXihwKJRKGaLwpE1WkkBsymkn
         jvE0NO1Ou46fdc7CodX3zER/rB8uFq8LdbD3etLltcBg5Hutayizbi5tM2FR59OuqAqx
         CrALFI2z7pCH8NX4yQsO4SrxvPrBPX6Gw/rb845tai3518bAUAl+D52t3GtfGF1mYxWx
         bAKQ==
X-Gm-Message-State: AOJu0Yw+Kw4Ov4S1nEmmBnuVenSVIgEp/9yXX7Qi99BbBLvGuy7gwiPm
	48+lUY3YzDVXwBEJ5Op8nRLqwKk4112YAwMM5nyT5Bv7TEpBdxxF+aVPJi1i5u0gA17ExsvDEAe
	oqdmybQU1soD2TFfMHmDkCFB0uQ==
X-Received: by 2002:a0c:9c06:0:b0:64f:3e2d:93db with SMTP id v6-20020a0c9c06000000b0064f3e2d93dbmr20305622qve.6.1692995029818;
        Fri, 25 Aug 2023 13:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhcq54IOGRl9sNdHkLdvPnzpjB/PihT5afG6dr52Z2uB4cbUOhKAsFPETyVjj3ta3v5KMJ7g==
X-Received: by 2002:a0c:9c06:0:b0:64f:3e2d:93db with SMTP id v6-20020a0c9c06000000b0064f3e2d93dbmr20305555qve.6.1692995029386;
        Fri, 25 Aug 2023 13:23:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a6-20020a05620a124600b0076c72dad35dsm738410qkl.63.2023.08.25.13.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 13:23:48 -0700 (PDT)
Date: Fri, 25 Aug 2023 13:23:47 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <uwi23vasgop7nrnrvalquu6e4jepyiub7aopj7bcgiaw26zx2x@xslngjsllztb>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <hbmfqpq2oyjjz3loccfbslpalzhlsyr2w3bpx6qasq23kyrfso@e6kry74ifgnt>
 <ZOjneiqLzRRD7ulL@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ZOjneiqLzRRD7ulL@nvidia.com>
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

On Fri, Aug 25, 2023 at 02:40:10PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 24, 2023 at 06:51:48PM -0700, Jerry Snitselaar wrote:
> 
> > > +	/*
> > > +	 * Allow legacy drivers to specify the domain that will be the default
> > > +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> > > +	 * Do not use in new drivers.
> > > +	 */
> > 
> > Would it be worthwhile to mention this in iommu.h for the iommu_ops default_domain?
> 
> I did this:
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 11d47f9ac9b345..7fa53d28feca87 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1757,8 +1757,8 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  
>         /*
>          * Allow legacy drivers to specify the domain that will be the default
> -        * domain. This should always be either an IDENTITY or PLATFORM domain.
> -        * Do not use in new drivers.
> +        * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
> +        * domain. Do not use in new drivers.
>          */
>         if (ops->default_domain) {
>                 if (req_type)
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 7e9d94a56f473e..6f9e0aacc4431a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -267,6 +267,8 @@ struct iommu_iotlb_gather {
>   * @blocked_domain: An always available, always attachable blocking
>   *                  translation.
>   * @default_domain: If not NULL this will always be set as the default domain.
> + *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
> + *                  Do not use in new drivers.
>   */
>  struct iommu_ops {
>         bool (*capable)(struct device *dev, enum iommu_cap);
> 
> Thanks,
> Jason
> 

For all of 02/24

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

