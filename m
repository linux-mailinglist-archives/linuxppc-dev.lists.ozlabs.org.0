Return-Path: <linuxppc-dev+bounces-1218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D194973905
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 15:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X34lX1Hzlz2xGC;
	Tue, 10 Sep 2024 23:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725976072;
	cv=none; b=ijEkj3ewC5hmsYxgz3WHPJp0/xuheGHsQfMFyv7rwaWapZw4FkAl2SbMX/dkPkPkeu8n2b1uRcBlRdJCgbhHux7jqp1DXYrRyu9GTsopj+r9/0fuuS8UzXfnDZW2ZLwikYj+dWHi+iuQThow2w1YaDESw1gaeDiim5RUWCt3JVa95YUQxdUCgrkcmbYmFigqgiQ1QkJADH4X7q9Mu/FodDd3xZ9TloPMfyRGW51MkErPPcdjs731vzZlPXaHuVImALPRtFBMRGo1HiWhQaKYOK71qXNbydLZw44cz0FirWjlaWiQOtcdMiRmu2A5EGaHlL0wXvFVTOE/Wwf43v6iTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725976072; c=relaxed/relaxed;
	bh=Wg/cH+2RcgFDN1mTjbwYncl/wcwKDf0twqiwDnUR1W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a7qawGNp1PmpV2svXK61nmvhC9JYtjMxvKXY09tTrYnNC3gCELePwzpuDo7NBeVrwPwIRZhXuDpzwiAlr3QziFkyZapc+4e7Zzt9MZtC8PrSAMbfvwu1sZP7yaJglCMIxxN4y32Fpr+EBXQbFuNHfEwThhIVeDpXygWNHR/e8ZCaQReDCKND1nIWiuShveVs4MoVU1z6iYJigoPbIAAOAA2xqkwX3RRUBmtHGDtfQs4sjMob8oRCNHwTUlfB81J13qTvl/nsiOpu5ACYY2w+IuJEuCjZO0TKEwWSB+9P193BlAmXefNSUEhebgwu4rwJNlen22g+uEWtd9ywd7dcCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IEY2rbqH; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IEY2rbqH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X34lW5w17z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 23:47:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC9DDA44828;
	Tue, 10 Sep 2024 13:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D511CC4CEC3;
	Tue, 10 Sep 2024 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725976067;
	bh=5BIOwvLP7xQQalA/sz2+3hW69BzQPTxbRY8bNFFdbAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IEY2rbqH3w3QWrZlffkEMhj/SAK8BlbPxQf4rRb1zSHKyK4xF+Srv+UDY+zHbUHzs
	 JA0DvU5f0DbgBMr3Sb5NitOnO2l6OHERxru8WQxOi/fJE6CW+QLpPt6O5/ESc2+/r+
	 nEyp+8CDZog+NSU2TE5LTInkxU2EuSK5CR0ndMZpCY+3IMEwxr53HALAeZLU8Bi7l/
	 cUTwVYBmS/QHkMC1jDttI9VWJbTdhB+eeTr/YItiNqDBT0HATyT6n3eyy5pPwSbLn2
	 iHAiH4D62eBGk+h2r6ea7QlTKFYhvpIXWUtNZ+ZEIM4X00o83BFiF+6ZPyxS5I2Qe6
	 0pct/bThNgVEA==
Date: Tue, 10 Sep 2024 08:47:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com
Subject: Re: [PATCH 02/12] pci/p2pdma: Don't initialise page refcount to one
Message-ID: <20240910134745.GA577955@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>

In subject:

  PCI/P2PDMA: ...

would match previous history.

On Tue, Sep 10, 2024 at 02:14:27PM +1000, Alistair Popple wrote:
> The reference counts for ZONE_DEVICE private pages should be
> initialised by the driver when the page is actually allocated by the
> driver allocator, not when they are first created. This is currently
> the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
> but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/pci/p2pdma.c |  6 ++++++
>  mm/memremap.c        | 17 +++++++++++++----
>  mm/mm_init.c         | 22 ++++++++++++++++++----
>  3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 4f47a13..210b9f4 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -129,6 +129,12 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>  	}
>  
>  	/*
> +	 * Initialise the refcount for the freshly allocated page. As we have
> +	 * just allocated the page no one else should be using it.
> +	 */
> +	set_page_count(virt_to_page(kaddr), 1);

No doubt the subject line is true in some overall context, but it does
seem to say the opposite of what happens here.

Bjorn

