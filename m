Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C747D7DD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 09:50:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=tapF8GD3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGHyt2TLHz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 18:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=tapF8GD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=8bytes.org (client-ip=85.214.250.239; helo=mail.8bytes.org; envelope-from=joro@8bytes.org; receiver=lists.ozlabs.org)
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGHxz6Ld7z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 18:49:43 +1100 (AEDT)
Received: from 8bytes.org (p4ffe149c.dip0.t-ipconnect.de [79.254.20.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 566D31A663A;
	Thu, 26 Oct 2023 09:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1698306576;
	bh=i7ZjTaBmY1sC5SUeWRmnofKfHXCddva3S4eBDSTodEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tapF8GD3HQ4Wed+B8GY/o/P+rrAMU17bExhQfh5suz7bCpESnVowO8oj8tfRZLkY5
	 QY6bUj36IjXcP15wP+t+yDnAVIgUHyKNSQxO/+jw8Krv/k3+x13d1Y27P6OSuip7Ki
	 QiGbrf54L3YpZyNtzS0qHccWTQ5vKmdgBKV9mCqJCeEk1FKDxnDdXQe2BARVDzlYl3
	 likKrGSVp2safmT1DtwkR1HF6vkRD/g/bE0FSsiFmvxbOGsCwVca5ABLsBNLOLlTiJ
	 iq7tQrQ8xvNUPwFfiRS3VaneSJXyAyQsOkpn/UDih1ZEYR/XwwXZy5hwjE/MTVxkpR
	 kaehl2RRKF1ow==
Date: Thu, 26 Oct 2023 09:49:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new
 domain_alloc_paging()
Message-ID: <ZToaD1tuNJ7tra-g@8bytes.org>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 08:47:30PM -0300, Jason Gunthorpe wrote:
> Jason Gunthorpe (9):
>   iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
>   iommu/vt-d: Update the definition of the blocking domain
>   iommu/vt-d: Use ops->blocked_domain
>   iommufd: Convert to alloc_domain_paging()

Applied these 4, the dart patches need reviewed-by/tested-by/acked-by
from one of the Dart maintainers.

Regards,

	Joerg
