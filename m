Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CD78B9E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 23:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZ2KnHzC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZ2KnHzC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZNK24DhXz3c2k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 07:01:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZ2KnHzC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZ2KnHzC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZNJ96PWmz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 07:00:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mPucHT4vAUhtQdeHUtkBDDGaES5ThoGt/JYy///1HlU=;
	b=TZ2KnHzCUmGx4VVoYFqWvCwVP/o7ndUtswgq7IDvOh6qBJ3EWc8VKlOxU8Wp2hg58C/WpN
	3OC/NXxjW9kQ8qbIY//TtyVX3ZIvqeV281uLJp3rx3f1pr0MP1vT9reQV49GF+CRjbX6dZ
	jfnpzN2FaXFysuAE3B06azJogASgnuY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mPucHT4vAUhtQdeHUtkBDDGaES5ThoGt/JYy///1HlU=;
	b=TZ2KnHzCUmGx4VVoYFqWvCwVP/o7ndUtswgq7IDvOh6qBJ3EWc8VKlOxU8Wp2hg58C/WpN
	3OC/NXxjW9kQ8qbIY//TtyVX3ZIvqeV281uLJp3rx3f1pr0MP1vT9reQV49GF+CRjbX6dZ
	jfnpzN2FaXFysuAE3B06azJogASgnuY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-uscY4rWtPNekzQYivSEhhQ-1; Mon, 28 Aug 2023 17:00:52 -0400
X-MC-Unique: uscY4rWtPNekzQYivSEhhQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76eccbec8daso512604685a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 14:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256452; x=1693861252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPucHT4vAUhtQdeHUtkBDDGaES5ThoGt/JYy///1HlU=;
        b=JW+T2cK5G6hp8XI+5BdDuwbM46yOAWa3l2eiGH/wK3WVamxOr9SJnX57YDxjErKdNn
         NeDcPxuU+uaY03HKSl9H02wEY9PYPpHgFlGwS4h9IS+pf05Nyj2LCLjW4zK9qdUXAClV
         lh7o1fELoZL8E8RYc6fXhraT0KchYrXycxYenrp+PZx+W1F4a3iKhtxPGszpLbpaPEBE
         L4GsVzQ5G5kw8ZybgN5+dfHOQFz1h3IvajdakeLJAmjO3Rm2IKubHqnwpxkja4reUJxi
         MSqs0zJ53bouES1lJdo01D4ERj6z7d6F9QTg2C6N0Smd7WDcI2/z+gg5txcYMRN0cL24
         1jKg==
X-Gm-Message-State: AOJu0YwVZuZkLYpqLU8V2aS79agn5nJNnjssh3LZ/Knr75G41Uzhcgqh
	NVf2uferMISnGi1pVg6P35y2MWFy9byelhG3O9iIfVRNEGx+LCMLaV9Hlnr+XzLSJnMO+ObP5L1
	69JbhoxZdZTFMGovDNAlMh9CA9w==
X-Received: by 2002:a05:620a:254e:b0:767:dd2c:9a1 with SMTP id s14-20020a05620a254e00b00767dd2c09a1mr32435868qko.20.1693256452101;
        Mon, 28 Aug 2023 14:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc76gVDSQjoSi7VzVoCzv2VufWTRTR2JHknan7WgS/aaS2xw9REImaP5+SJVlVkj2Kooggog==
X-Received: by 2002:a05:620a:254e:b0:767:dd2c:9a1 with SMTP id s14-20020a05620a254e00b00767dd2c09a1mr32435844qko.20.1693256451852;
        Mon, 28 Aug 2023 14:00:51 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b00767d2870e39sm2642220qkf.41.2023.08.28.14.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:00:51 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:00:50 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 16/24] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <cfl4ixqvcradllxpjzbmyikl6jtr5q53tipn4p3bka7obavxjj@novxolxpv7sr>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <16-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <16-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:30PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

