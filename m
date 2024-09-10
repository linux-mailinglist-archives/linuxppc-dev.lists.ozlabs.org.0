Return-Path: <linuxppc-dev+bounces-1209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91897288C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 06:48:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2rmt2sTsz2xdY;
	Tue, 10 Sep 2024 14:48:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725943694;
	cv=none; b=IJupV/Hu+7UGYxyLwQoRohUzd9D8KLGRgUUjmeqWh2cHXZ0Pmx425X28S+GjweZPVHART4WFANrVoi+ikxys7Lf8cA2TE7a7A+qyNefDpYN65V+u3fISTw6dPm+sVqc87Sfp4W53nUiEwd3nrEt1LZCwaJKHJX2JOqT7OMQknxXuOxu9G00eun5voBKDe02nDt5kuEQ6XhkHmDVdb9iaAwL4BL9KBBT/NlU9Y/otXpOA772MV2din+0n7H1A2viL8kz7+GuXKiyL8jGXGgWMHodUP8Fcr5Nq2WRm/WOOfMu2INlUAq3lmxRZ5cFATV0T/Je66YFBKX/QcHxnVWNfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725943694; c=relaxed/relaxed;
	bh=c0/KMxGI62d39aIfqydXbjcfGL/DQ5/n5haroblqj80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjNLvP5Li6UCBKECEN8qdVM3/r5VoidwQ1r5RGocmD98ZwYqzrlVxI2rNFDH1dkBPUQw/e267U9hnUi1SLSyxFNqpaafWTF0/wkq3QX8bBoaBws9XAA7zrjBpX1n9GtmsuGLryp0GXvaizsJedhBI96vT7j0TOdD2AqThqdIqMlaHq4O+gfc763B0VXPgYnhU0mOs8zlRz47qdth/dCS/4V1c+M9DwqWY3BTG6mBP8LijZqpe+ruSs9WsC1KsOt50EHCrwzPXV+xJRNu84ldwR3KvQf0QAuRkWhlFhbudOQ88m7CKwxOzyNS5CdnUY7SrGxt/BdbY7OKGoypdxs1HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LCK1EnCF; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=LCK1EnCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2rmr3NMtz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 14:48:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c0/KMxGI62d39aIfqydXbjcfGL/DQ5/n5haroblqj80=; b=LCK1EnCFN8sE7ipvGAc8UQ2cYA
	x0qquDQQJXVrrzzdKi4N4M+3xPY367t9udRzgrjwbuaaV/t/EOPA18CtPCtGpeg5g2S6mq9UPTVMY
	qOorwFK7L+qbEqWzmGd/ADQLtdWzdM2yuTGiVya3mW7Rp1LoTyT26SLecZAa3jYEcBVscKOsE6wjS
	3fh454fYf5iaCmgBbCxWSvcTMiKeJDd3OLFSSuDCieAc/LX0nhmzj4323V7hPCPHpQUcm57lRkjir
	ysN1fMLF0KDjVx20FCu9CZ7wGsfxPB18U67jSno24eKa7XBE1NVWnSD08C0xQoywBYznZ7D5X/VkY
	OG0n4GAQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1snsmy-000000050uo-2esU;
	Tue, 10 Sep 2024 04:47:40 +0000
Date: Tue, 10 Sep 2024 05:47:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com, djwong@kernel.org,
	tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
	peterx@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/12] mm: Allow compound zone device pages
Message-ID: <Zt_PbIADa4baLEBw@casper.infradead.org>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <c7026449473790e2844bb82012216c57047c7639.1725941415.git-series.apopple@nvidia.com>
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
In-Reply-To: <c7026449473790e2844bb82012216c57047c7639.1725941415.git-series.apopple@nvidia.com>

On Tue, Sep 10, 2024 at 02:14:29PM +1000, Alistair Popple wrote:
> @@ -337,6 +341,7 @@ struct folio {
>  	/* private: */
>  				};
>  	/* public: */
> +			struct dev_pagemap *pgmap;

Shouldn't that be indented by one more tab stop?

And for ease of reading, perhaps it should be placed either immediately
before or after 'struct list_head lru;'?

> +++ b/include/linux/mmzone.h
> @@ -1134,6 +1134,12 @@ static inline bool is_zone_device_page(const struct page *page)
>  	return page_zonenum(page) == ZONE_DEVICE;
>  }
>  
> +static inline struct dev_pagemap *page_dev_pagemap(const struct page *page)
> +{
> +	WARN_ON(!is_zone_device_page(page));
> +	return page_folio(page)->pgmap;
> +}

I haven't read to the end yet, but presumably we'll eventually want:

static inline struct dev_pagemap *folio_dev_pagemap(const struct folio *folio)
{
	WARN_ON(!folio_is_zone_device(folio))
	return folio->pgmap;
}

and since we'll want it eventually, maybe now is the time to add it,
and make page_dev_pagemap() simply call it?


