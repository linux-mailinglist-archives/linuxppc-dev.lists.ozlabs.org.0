Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D2602429
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 08:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms3Np4PyDz3chb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 17:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NMsal1Yi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+d635785a9d1969ab94fa+6995+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms3Mm4B5Lz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 17:08:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HIIqJurEb074qhwvVI9BKHwutRkdsD9nGqA3qOa/1t0=; b=NMsal1YijVUZQbS9PlVs3C2ko1
	Ph/ka7cZ/2Uk5CQ/xFzTjrL5G+mP5Q5JSctZEW8lZtBC0sfjp7YJIHXLDvbN46hTQNmoB4XpizT6u
	rzs4bEXGWAJBuhgSn3e6m1uVqgrBSY6UBJ1YquLYMOsyoAjtfPUTN8B/vLVQAwBB6HD3ww5tp9mO3
	3QRBle1s9AmExNdd4SA+ujfpY/IBpVVLGgT+X6mMMNnR8BFAwy/p8qE/WN4ybAwIHSXr9L0S6wP5h
	9Snkg1ne05X+JuOqTUYLummNMXL4cbYPaldh8MixI+0q25kgBi8+71To5y7wV6Q0eN5zcPbiORXy2
	R9xUmBCQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfmF-003DSd-IU; Tue, 18 Oct 2022 06:08:35 +0000
Date: Mon, 17 Oct 2022 23:08:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Russell Currey <ruscur@russell.cc>,
	Oliver O'Halloran <oohall@gmail.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v3 4/5] vfio: Remove CONFIG_VFIO_SPAPR_EEH
Message-ID: <Y05C4xT7r+Tz9Jn3@infradead.org>
References: <0-v3-8db96837cdf9+784-vfio_modules_jgg@nvidia.com>
 <4-v3-8db96837cdf9+784-vfio_modules_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v3-8db96837cdf9+784-vfio_modules_jgg@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +#if IS_ENABLED(CONFIG_EEH) && IS_ENABLED(CONFIG_VFIO_IOMMU_SPAPR_TCE)
>  #include <asm/eeh.h>
>  #endif
>  
> @@ -689,7 +689,7 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>  		vdev->sriov_pf_core_dev->vf_token->users--;
>  		mutex_unlock(&vdev->sriov_pf_core_dev->vf_token->lock);
>  	}
> -#if IS_ENABLED(CONFIG_VFIO_SPAPR_EEH)
> +#if IS_ENABLED(CONFIG_EEH) && IS_ENABLED(CONFIG_VFIO_IOMMU_SPAPR_TCE)

So while this preserves the existing behavior, I wonder if checking
CONFIG_EEH only would make more sense here.

