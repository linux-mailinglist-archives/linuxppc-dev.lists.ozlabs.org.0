Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B078BB76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 01:25:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T7S8Elai;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOfXsuej;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZRVd2CB0z2yVd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 09:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T7S8Elai;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOfXsuej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZRTV3l8Vz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 09:24:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693265050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=;
	b=T7S8Elai61ys1oWHJjvGYV9rCDgvUnw/qKzSn7VRd2bohwHLbtzo8ywvTqKqa0MqDD7z7w
	jiB1nCxzRKzfJCVXb4Xl9xivyWv1PKce6lq9e6Sbw0DFZT8g3BOvdDmSzzghGffPOAevDq
	RfdQxZtVgrb82D4SXo6XIRMYG1gKMlw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693265051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=;
	b=cOfXsuejhrMaatdgt/Biy3qQv1zWborSJ4UGoc31sYouabrvZexEVMnKW5IGjyzox62qUC
	q6eRvEbQOdhToyG/r6ooYsszL4CTS30PvF8ZtgA+Kv1SZovasTkBL5P62p1p+ZckeJjUg5
	pFsh/frmGle6gJ72P/Y9y5Ut5ehSHHI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-PT1_LDpBOJabceiZMEbXTA-1; Mon, 28 Aug 2023 19:24:06 -0400
X-MC-Unique: PT1_LDpBOJabceiZMEbXTA-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-57013c62b3dso1180110a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 16:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693265046; x=1693869846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=;
        b=BUeSEWoXEYoT8K0Vj7UWsXdWyaXFtalV65QvOG41Jd1lPmsDEaJEmAF4iKwFnBgsD/
         FQHzEZiEECU+y3HOishmustUhXyCwEkX7uRj91cJ9L1zJ/gDXdZqhJrG+PyhAMFSzhB9
         bAJr/tlc/n5HgxhX+JqRijYNJ2i99yaW7vMfLzxUvRQ/f6K8kWIzxfJeGuTKckqhZBQn
         EIS0TuP9Iu91THq4qVuD8B1WgLhN/5mjv+ZAb2Isq2+08hd8dnUvOi6lrYRFMLqRhSQi
         dzQkf06A5y0pLzdxaG1aocoV/zUlCzdK4+8ZQQvF2ZcbHjsx1s8JyFRT9V9oRXhKI/os
         +QHg==
X-Gm-Message-State: AOJu0YxV53Y+AetrgM/vhuyiU38x0ojwYdvwEIAOk+zH6Pgi8O2nkl/b
	2AtA9xIbOIMwuHhnHDIKG2edmoWXIPpIiCvgnoZylQ106qFmFTD8LlclQcG9hnt/Zhjn2lEGI7A
	2uCw2doxafZR7ZHnf3psFIoVCUw==
X-Received: by 2002:a05:6a20:138f:b0:10c:7c72:bdf9 with SMTP id hn15-20020a056a20138f00b0010c7c72bdf9mr18329554pzc.29.1693265045860;
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Ty56TNbGFuBUAvk0gJFhf9IoSXDvKLMofXm6bHW4BVTeieXHXsUmxMoZ3DKq2KwFtbABPg==
X-Received: by 2002:a05:6a20:138f:b0:10c:7c72:bdf9 with SMTP id hn15-20020a056a20138f00b0010c7c72bdf9mr18329511pzc.29.1693265045554;
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902b7cc00b001993a1fce7bsm7913930plz.196.2023.08.28.16.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:24:04 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 24/24] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
Message-ID: <4pidxw6zc2sk2sypjdobusdrdbpwa7gddifxwnm2c2sdtfsp7t@yg3hup2mhpbr>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <24-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <24-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:38PM -0300, Jason Gunthorpe wrote:
> These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
> allows them to support that mode.
> 
> The prior work to require default_domains makes this safe because every
> one of these drivers is either compilation incompatible with dma-iommu.c,
> or already establishing a default_domain. In both cases alloc_domain()
> will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
> to drop the test.
> 
> Removing these tests clarifies that the domain allocation path is only
> about the functionality of a paging domain and has nothing to do with
> policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.
> 
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/msm_iommu.c    | 7 ++-----
>  drivers/iommu/mtk_iommu_v1.c | 7 ++-----
>  drivers/iommu/omap-iommu.c   | 7 ++-----
>  drivers/iommu/s390-iommu.c   | 7 ++-----
>  4 files changed, 8 insertions(+), 20 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

