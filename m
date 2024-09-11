Return-Path: <linuxppc-dev+bounces-1230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282799747CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 03:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3NLg5mQlz2yYq;
	Wed, 11 Sep 2024 11:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726017954;
	cv=none; b=blMM9261stkf/G0qs4wVw6mfxFZAmAl2GJfkx6kZMhtOIoJhUH49AwTEG0+UaMIgIscxaNPFsuurDh10MaSA+1+BmAsa8Qbq2FY1cpVDUG+38kr5SpVO2xwWyU+t/JARqXo132Fz2iAQSeROSDW9IGVT4kESrwQURd/chkzjsDsw+8hX5bBmiJbf7qejiSa28NvW3EKJnntP2hltsfO4A4n+ssyC4YCb+/l2v2c7JXOAFFEBJD2mp4TG1YFlO4qX5fPp6O5iL7aci3SDp9r4rj69sbJ71DsFhlgt+2K/6RpeCxuAQJqLTVtjlDO6Rs+gMUttgmIOi1ipbYg2mPmM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726017954; c=relaxed/relaxed;
	bh=nTtMb9H3dXUpUSnSef+Be8oMvAgnwIOToyszkwVy8e4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=CGCJG+jP4CI0+KDvMYysAU8ngfW9M9OzmeFLx3+GpTiuA59PwmIpZLh1gsaNVlxIe3jEFpsmJK+PS/1cMpZ9zKeSje0I1vr525R+Es2oxk5/AXE+yv34WA4H0PSYjwQpoVSsfjnlP09XgyV8O4v/3Shb7EnYFV3zAWJTGnGCH8/t0imzzhhlxNlMnNmo6JiHc+OPOhmYyEuENq8Y10mrVG+liVdm/IuZQOEMFuaOSk11eGWsJKiHN6WeIWSEU91O5ZjV85U7+8M5c9FGcaz9Yop2oMp+VIx+K7ths7ncaP/4tgNyit3ghDdLSTfYb+Xx2NPNWTSw6GX5PJTe9xVRlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=PfU+CRym; dkim-atps=neutral; spf=pass (client-ip=204.191.154.188; helo=ale.deltatee.com; envelope-from=logang@deltatee.com; receiver=lists.ozlabs.org) smtp.mailfrom=deltatee.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=PfU+CRym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com; envelope-from=logang@deltatee.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2167 seconds by postgrey-1.37 at boromir; Wed, 11 Sep 2024 11:25:53 AEST
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3NDx0hn4z2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 11:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=nTtMb9H3dXUpUSnSef+Be8oMvAgnwIOToyszkwVy8e4=; b=PfU+CRymWcXZGU8mYwkDuJY5Nt
	KxhnN6hTdnUpKK6c3FLfnreXMcwDl5uXgI0f+QVr9IAL/a7U4alJzvox0Hu/jx8FdVvfCvk6K23RF
	lK8vn7f2TcsKwePi8XAAm+Do+v3+uwGtpS1ailTPFQB4bfs203NzQnnCCUXb/sMVlet5HU1E6m9vy
	zcwHt8C4DgCDQe3olE14BG0oSvKMkpTZrdceJIxDReKKpwni+aYI+Z20uWIsMZDYZ8HVFkh+hCtJv
	YV4oSurTolqbMlZJN15P2PVDkvC2Zg5xnEPszFLT8tR9OOrTm8xYZG/nJd2oKo02MXEmzvmD9xZuB
	l6TfHBVA==;
Received: from d104-157-31-28.abhsia.telus.net ([104.157.31.28] helo=[192.168.1.250])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <logang@deltatee.com>)
	id 1soBXi-000ozM-2O;
	Tue, 10 Sep 2024 18:49:11 -0600
Message-ID: <6f3402ae-01ad-4764-8941-f88bc77f5227@deltatee.com>
Date: Tue, 10 Sep 2024 18:48:48 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
 linux-mm@kvack.org
Cc: vishal.l.verma@intel.com, dave.jiang@intel.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <4f8326d9d9e81f1cb893c2bd6f17878b138cf93d.1725941415.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: apopple@nvidia.com, dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com, dave.jiang@intel.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 02/12] pci/p2pdma: Don't initialise page refcount to one
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2024-09-09 22:14, Alistair Popple wrote:
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
> +
> +	/*
>  	 * vm_insert_page() can sleep, so a reference is taken to mapping
>  	 * such that rcu_read_unlock() can be done before inserting the
>  	 * pages
This seems to only set reference count to the first page, when there can
be more than one page referenced by kaddr.

I suspect the page count adjustment should be done in the for loop
that's a few lines lower than this.

I think a similar mistake was made by other recent changes.

Thanks,

Logan

