Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE437865ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 05:42:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I4kDFujA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gt3tDjxB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWTRz5yTrz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 13:42:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I4kDFujA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gt3tDjxB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWTR35PY6z2xdl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 13:41:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692848505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
	b=I4kDFujAOgWWAOl0aUYsz5otZMn5Bz4nKwZZ1ysZ3QZDYN4aESBvifOmT2ecq345K2Jw3N
	0QhzFTWfH85QV2HV6MEkDNBk/50VH7m80QmTkYJXprdvrgpCTo8Kv5/bHTku6asZSU5w1c
	eweqoLnMePh71KUIs7LhK+iYjk7VSRY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692848506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
	b=gt3tDjxBKYqegfCGqzYblYYOr3hMcLhMVFcOJc5SEm9I1XwH/zsVc6aLQpSvGqJPrhBr23
	GOTOb6iX1OGRv12mDD6V95Cg+0rpNTc4Eh5nGmKyZSKCYDJq4stUgIuhyET/SSUFGabOxn
	o5ehIm4Q8uEvZMxjfxG6kXi2qtOW7T0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-5exJz-1sOVWNXzXiUL14Eg-1; Wed, 23 Aug 2023 23:41:44 -0400
X-MC-Unique: 5exJz-1sOVWNXzXiUL14Eg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41087c90290so63833071cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 20:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848503; x=1693453303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=jP2OmIpgipfPld68xSwEXpJ9HNOAKieL7tXzlevkyRdU2fm7D3HAxNg+QhM8oeeWbf
         dXraKAk3CV0qQSgKC6aYS7IfUJtKyAh1fQeNjS8nqyvjeBH3ogWGPLKbXdIHT/5w/DWs
         zA/09WJZSaQV5yeFI2LLGxMAeRNiVzBX9Vidb6Ce8dJ6cmyaX9WHnhdGIf4jaluSlAaC
         zcyd6qVk9LDZMhSM+0xp6Ur5de8yN/fdRaLI2PFh9oAAogZXYes5ArAgMz/TYIpBXcBx
         hbJGYo4EOLgtcKIjnV7rCTYru317U1UXH+2GSkVJd3KcQUSo+Hg6u1sXoaasgNfHXDDu
         C4Pg==
X-Gm-Message-State: AOJu0YyKrsDccsvyO13DZnuV0SHCy9ePpMsjbAM26vSPXFnNq1YmI21I
	hA504rllldMaFVNLpllToEUzANRhwHIDyziZeV5KgyAejINyHslLAO9FvesTVOscAxDxtobyfKA
	nOTZqs5pSfXJGNUzz9KSTGJAr+g==
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211968qtb.58.1692848503553;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHjWv1CiL8QEOPMtXQgjOpwEGJSl7biyyoMP2HI5INen9hHlXD9XV1I7hmZP4s4Z/4tJVc6A==
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211932qtb.58.1692848503326;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id s26-20020a0cb31a000000b006375f9fd170sm5116337qve.34.2023.08.23.20.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 20:41:42 -0700 (PDT)
Date: Wed, 23 Aug 2023 20:41:41 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 01/24] iommu: Add iommu_ops->identity_domain
Message-ID: <r362pqn2venwjut7ernpzbxnc72kvknshxeobrvkvp7p5m554e@7jnu4wja663k>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:15PM -0300, Jason Gunthorpe wrote:
> This allows a driver to set a global static to an IDENTITY domain and
> the core code will automatically use it whenever an IDENTITY domain
> is requested.
> 
> By making it always available it means the IDENTITY can be used in error
> handling paths to force the iommu driver into a known state. Devices
> implementing global static identity domains should avoid failing their
> attach_dev ops.
> 
> To make global static domains simpler allow drivers to omit their free
> function and update the iommufd selftest.
> 
> Convert rockchip to use the new mechanism.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

