Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4AA78B98D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 22:28:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSL7Meid;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSL7Meid;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZMZW4kM9z3c09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 06:28:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSL7Meid;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSL7Meid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZMYd190Bz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:27:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
	b=BSL7MeidQvLgjmnXbgs3GQgzV2ClCCa0RnY+VmcbciUFUxnaPFGPgEoU7VxhlnnjiSsba/
	l+kE4QURtP9MTNNO7i6CpcRFgjedhJfms6Qvh67Vgxau06b0IM1+ye9Au0TZ0t3y/BMeym
	zy2juSBOhW+JzdeVZMN72nuubui/B2U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
	b=BSL7MeidQvLgjmnXbgs3GQgzV2ClCCa0RnY+VmcbciUFUxnaPFGPgEoU7VxhlnnjiSsba/
	l+kE4QURtP9MTNNO7i6CpcRFgjedhJfms6Qvh67Vgxau06b0IM1+ye9Au0TZ0t3y/BMeym
	zy2juSBOhW+JzdeVZMN72nuubui/B2U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-ZFn3ZrLMMVSNc7Z7_uwDjA-1; Mon, 28 Aug 2023 16:27:28 -0400
X-MC-Unique: ZFn3ZrLMMVSNc7Z7_uwDjA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-649fac91500so41015866d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254448; x=1693859248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
        b=gR+ZROTXD50C1BGVXNzQ1I/qT1Q+h2AKMuBbwNdJ7G69VZuQkZkfiWdlmfsY75QMKg
         irPaCQtJ9t+IggPeJ1bz5V85tN7Tx+9WJUF92sjjZcZ0L3/3eKimD457rC0pCHW4SBf1
         WABuj7jYiLKJf5L6xFHg+wBLP5GguJcnKk6iB/8FRGx4oFyudWO1rhqemnUhb88KuZCv
         DnlVfrAF9iBO5ac2TEHlE/5vMrvN3tDX0ED0UKmW9BZMNET/y1IVwxeIWcL7s59EnXRF
         IguUeiQbKPdvLVK/dsEg78pzxgFkUv0zYnffxdZxNUqOBx3yrJumKh7X9MS64MNd5hfc
         p44g==
X-Gm-Message-State: AOJu0YwwMy5emBPfIGnXCeh+CtP1iwdkj2PVPr2GlXPMg/Jg1yTK/Wax
	YOZfVS8sWPEgZwn0ykDa/T785gZhKE9kAHJ1H0nVnYgFEFOI0/8jdkISDWguuo9KhSgzPu/q291
	st5t+JBCAJH8PDf9ENe4P0/UrZQ==
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021356qvk.21.1693254448529;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFPUIE0VD3pPuJr6SEA/sCAWUcKffhBaA+0iqWdlm0BRzVqkbCdfoX5jw79sJViEhNnh3nw==
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021306qvk.21.1693254448284;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x10-20020a0ce24a000000b006263a9e7c63sm2767781qvl.104.2023.08.28.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:27:27 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:27:26 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 12/24] iommu/tegra-smmu: Support DMA domains in tegra
Message-ID: <pqocyap65uirlogtdy6fw6gb5qc24zrk6r235krllqj3qrcv3f@4xcew7khwydt>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:26PM -0300, Jason Gunthorpe wrote:
> All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
> dma-iommu.c.
> 
> tegra is blocking dma-iommu usage, and also default_domain's, because it
> wants an identity translation. This is needed for some device quirk. The
> correct way to do this is to support IDENTITY domains and use
> ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
> devices.
> 
> Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
> everything so no behavior changes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

