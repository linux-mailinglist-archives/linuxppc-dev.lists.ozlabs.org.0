Return-Path: <linuxppc-dev+bounces-1217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377629738D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 15:42:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X34d85X70z2y6G;
	Tue, 10 Sep 2024 23:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725975740;
	cv=none; b=SZqrtu208XCpfpz+NAjZLjfvWk36/nKsoEXuIPX+TxMaxfXUB9JWkUnH81OnDoVsB0fe7lBIVlV706VjRRmaJgffnUg/eXwg20GdlOjaruj1j2+6zda/XX/xQHLORPTAxC/LgxSL8pmVMMI/nK94DWyupYQvSOC7kvu6APWrE+fTRTlAK4qjmxdAArIprYBjlLa5YUrnfToPXGi+lutwSnT5J/ro3Zj6oYMujMB352iv/uoRlIL4at9+FjGsD3McfR8tH/sY85rV4Xh1iokFamne6GE92MykCYQUKsHScVHDPigYQKbX9zdH8vuhJ+APtMAlFDx4saUj1lLQiUrxew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725975740; c=relaxed/relaxed;
	bh=wxzBgx3kqKVoI3jlEN02U0lcelhmIv1peZoDYksnKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYb0Y9cq38fy1JkyTEVgag79Dubvr5zmUx2Y124EhmZkhvs2sHVFQxWvmU5YDD/cT1rS0yd8PwuDHuRsWz6qHhBplOl3A+b7TbqUUkBJWsWhf2JL0LVb1RMTEiCRUNn9QQUqw3OVes55EIYRpZJaeoDOup9TrHmZyZ1wHsGQNSFJPGFhUQBGRCG5M4d1i/EhOXGIix+O4dwu9BWWPQyaglD1+JMP9maKPPvoJjkVzfUSBQMCGffz2wbJd0VDtHAG6CKH8OSBk0ge4SsWKiHCT2HIgYXN2Sis40JhwgOLvtQOMYMiSlwnqYj69AUJQVHu/SuJU2clNpRF5RZeOY8xvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ql4vqC8b; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ql4vqC8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X34d414fLz2y69
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 23:42:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wxzBgx3kqKVoI3jlEN02U0lcelhmIv1peZoDYksnKQE=; b=Ql4vqC8boH+fZrAUoC8Aa6Psgt
	RErCIrXi9ls6VySEg6mIvd5hNzYoDFZSKEE6w4Arli+Aomfx2k3AURv9IZ3Kq1epkDAwAQjQKn9/i
	bdIHlb6dv6AcFIp5giL3Z44FyGQFNieKtbiAFfOFmYChI7TokimX33nB17CcKexqNaagFgQnuYSUe
	lW6RaJtU/ATEI1WyTW2IeJ6aPH9c/nH6dQWFaPAnTTAVoVCgam2fDn62Bq8/zTH+MXWY717GziaJv
	iT+Smj0GKJzb/HC8YKyB5p9m9J/58ZrBG/Mh9dmVp4oeUm7NI6VzeLt0ZcigAvPv6y+dUCpJf672/
	cPFt8iiQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1so17l-0000000BLwy-1gHR;
	Tue, 10 Sep 2024 13:41:41 +0000
Date: Tue, 10 Sep 2024 14:41:41 +0100
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
Message-ID: <ZuBMlUK-v24-9m3G@casper.infradead.org>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <c7026449473790e2844bb82012216c57047c7639.1725941415.git-series.apopple@nvidia.com>
 <Zt_PbIADa4baLEBw@casper.infradead.org>
 <87v7z4gfi7.fsf@nvdebian.thelocal>
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
In-Reply-To: <87v7z4gfi7.fsf@nvdebian.thelocal>

On Tue, Sep 10, 2024 at 04:57:41PM +1000, Alistair Popple wrote:
> 
> Matthew Wilcox <willy@infradead.org> writes:
> 
> > On Tue, Sep 10, 2024 at 02:14:29PM +1000, Alistair Popple wrote:
> >> @@ -337,6 +341,7 @@ struct folio {
> >>  	/* private: */
> >>  				};
> >>  	/* public: */
> >> +			struct dev_pagemap *pgmap;
> >
> > Shouldn't that be indented by one more tab stop?
> >
> > And for ease of reading, perhaps it should be placed either immediately
> > before or after 'struct list_head lru;'?
> >
> >> +++ b/include/linux/mmzone.h
> >> @@ -1134,6 +1134,12 @@ static inline bool is_zone_device_page(const struct page *page)
> >>  	return page_zonenum(page) == ZONE_DEVICE;
> >>  }
> >>  
> >> +static inline struct dev_pagemap *page_dev_pagemap(const struct page *page)
> >> +{
> >> +	WARN_ON(!is_zone_device_page(page));
> >> +	return page_folio(page)->pgmap;
> >> +}
> >
> > I haven't read to the end yet, but presumably we'll eventually want:
> >
> > static inline struct dev_pagemap *folio_dev_pagemap(const struct folio *folio)
> > {
> > 	WARN_ON(!folio_is_zone_device(folio))
> > 	return folio->pgmap;
> > }
> >
> > and since we'll want it eventually, maybe now is the time to add it,
> > and make page_dev_pagemap() simply call it?
> 
> Sounds reasonable. I had open-coded folio->pgmap where it's needed
> because at those points it's "obviously" a ZONE_DEVICE folio. Will add
> it.

Oh, if it's obvious then just do the dereference.

