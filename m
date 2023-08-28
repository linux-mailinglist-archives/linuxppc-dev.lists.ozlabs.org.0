Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442C78B9FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 23:12:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie88gz2C;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie88gz2C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZNXv3Tnjz3btq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 07:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie88gz2C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ie88gz2C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsnitsel@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZNWz0z88z2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 07:11:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693257067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=;
	b=ie88gz2CuhiSKePrUcrp9baCJ7bmKnVkC/usWeX0348swswwAzf1VvaSwgH+f509Q8juVV
	4PMYVvQs7QS7eFK+rE/uC32MnzcMNVxRFB6xV2Nta5WaSzv/mJ3x/xTwqPy7mQ+dzx6x84
	DnnukLZu0jSdIyzooQq/WdwmNUypE48=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693257067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=;
	b=ie88gz2CuhiSKePrUcrp9baCJ7bmKnVkC/usWeX0348swswwAzf1VvaSwgH+f509Q8juVV
	4PMYVvQs7QS7eFK+rE/uC32MnzcMNVxRFB6xV2Nta5WaSzv/mJ3x/xTwqPy7mQ+dzx6x84
	DnnukLZu0jSdIyzooQq/WdwmNUypE48=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-bQ7GnDKSNia9R0OBUeTIlQ-1; Mon, 28 Aug 2023 17:11:06 -0400
X-MC-Unique: bQ7GnDKSNia9R0OBUeTIlQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-64c249e158cso43678856d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 14:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693257065; x=1693861865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBbEp84s+rto5I+fSYwjc/z0wqe0V4QeOMyByDhCicY=;
        b=ZHOzFRM+CjWdQvWcMF9esOS6SZuC9jI9KvJDXDkUXmPmqoJu6DJm8bsLXB9YqjWDrs
         38RhDkspfNUeCHOztoaMl9WYS54p69x6JpmWppFGoLNB1y+66FTDe2joulLV817i7HaE
         Fa7xmoUwhzaCwNIJL4ygnYgFmsu8j6r6wzmOt/XqsievbwuL2g+QSNHqKPcesw07AwDn
         1MnD0duxQGYWTPqsRnNsNScVFswa7MBLv7N9sUAM0rqrRlZZe2mJyZInWWxFEQ21jyLY
         lKIlaMMX39GSiLydZaAL18ILL+BTZ3p4CIZTg2PYndSCL1aoMjPb5bHJVNmh3N2j7qsr
         IBRA==
X-Gm-Message-State: AOJu0YwzgXF5pEdVrrsnNFDaffasADIkgMcX337/cR9o82dNI49dIZmZ
	kHCRBuPxyVlFgC/PEuB5PeRsVS2BKq1zqTp02tYQ1ZeEv9jnVAkZgDWHZZEjFZqkl6SHqPuVNww
	75aR2GbVFywbXXM7QkzQ2awgtHA==
X-Received: by 2002:a0c:b415:0:b0:621:48be:baa8 with SMTP id u21-20020a0cb415000000b0062148bebaa8mr24439919qve.48.1693257065502;
        Mon, 28 Aug 2023 14:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP3ObHCetgbEOQmvjiokpWFivwzRctOVNKCOPRfRNFNHOYTdYfD3DjqX8LobUdneBowBMyfw==
X-Received: by 2002:a0c:b415:0:b0:621:48be:baa8 with SMTP id u21-20020a0cb415000000b0062148bebaa8mr24439881qve.48.1693257065270;
        Mon, 28 Aug 2023 14:11:05 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020a0cf00a000000b0064c107c9679sm2854215qvk.125.2023.08.28.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:11:04 -0700 (PDT)
Date: Mon, 28 Aug 2023 14:11:03 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 19/24] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ufjped2r4se2d6whnglrwwbrjma2ufmswtjzsa2pguseya7fqb@5rnxgcwzk5zz>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <19-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <19-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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

On Wed, Aug 23, 2023 at 01:47:33PM -0300, Jason Gunthorpe wrote:
> Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
> sun50i_iommu_detach_device() function was being called by
> ops->detach_dev().
> 
> This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
> sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
> back up the same was as the old ops->detach_dev().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

