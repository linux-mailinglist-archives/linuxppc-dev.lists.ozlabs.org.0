Return-Path: <linuxppc-dev+bounces-11643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1FB40FB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 23:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGfmJ5lWKz3050;
	Wed,  3 Sep 2025 07:59:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756850384;
	cv=none; b=f9lntfg9bG4l/pjDvwS5OROtyAghraqz4i8Zr97EMe2EwD25id5Ulp4iSuADiQ4NLVfBKtgXkd8xVI+t+ykqKWjdlyeKh/ly+GABO/GxszBAHd/hVOSDYt0WZVr1zPmehUJp0isEpuNdM1AlbyiF4rNdbZ1BoYpkhFZD1JoEO40WI5mZ2rhCozMR0pgesTrH2J51jDUbskf2t/2JXgsc0blcn5x0ejrPP6glRkgf8gSiaf3FzzyhDy87m9G6OAdd9lSSk1MnwDV2EjiWICBfs4NDkuQ0iEKVGIlFge6+rjWOZV7qFZQyH5b36EdkBWPM6rOhaPFvjvJDN4y2Lttu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756850384; c=relaxed/relaxed;
	bh=wxLWaOMzyFn1TCsduloGVD+a0ZYJgwe6TduwxzO1EKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbBrvG9CQVSsU+7n0GyMWWe+TSScisG/ofl1jdyViNnXxk8buiWkjSGwwtZn2l5s/jYHTxy+uKOv2BKXrUcaLdkp0lTnJ3Ie8OedqlLSwf/wVrN/otTVUjVh7Cn7GAKaaqPiThJZcTTrNXO3QEbyz8OsZw+z+5/MvRhZUNfgf36fHJJhPPifjVQtA/fXZre59mD85cmFdKgbhU1ayyILJD54nXbc1CNeJFS9R6ordeNWy2/WOAgVEEwOel4b/ayIyehLZciC88Z1EX38Vm6abMrMI4qJY7TO3tXGQlDETjLxXNx8rRoTnDo6ydSQYgomqcsOnI1cqv4cswYFOiBjDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t/Eu3Rve; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t/Eu3Rve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGfmH32bgz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 07:59:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E3F405D0;
	Tue,  2 Sep 2025 21:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15CEC4CEED;
	Tue,  2 Sep 2025 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756850381;
	bh=zUOixGI5e23gDVx/zmq/5QWAYGpvZZ1gzj0irhRA2AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/Eu3RveeWFJ7QPQZS0HMJnJ18RJisbVk4Pk4B2mkUogsXCsDnOh5nmkT6QJ4KkpV
	 WAD5v3cszsJls2vJneW0RL/RKpho+ZzAZhFpATDVsn7wwLvJDFu6zSx6RUEKSctSsY
	 MYZrvd5dFbrPEZmkILy8ZxDbNlA6Ej38GRHuRquE0I86IxDtV1kdU0Sm1EDnwtGqEF
	 c1keYzFalxZPfGjORlUbEIAtFrtMdhOixv+lPDaKzXO5a+aOyNEdMKgtKZcG+wqmef
	 IRgJjgP6zlr77O2RCDhrfy6xxK73ZGX0o3JyM4rB09vZuyTewz4+/r6JUDL31Kg2Mp
	 O1zPH9rjxq5Aw==
Date: Tue, 2 Sep 2025 15:59:37 -0600
From: Keith Busch <kbusch@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
Message-ID: <aLdoyWevrQMQUGyz@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250819173845eucas1p221cd6842839f5e7130f131cd341df566@eucas1p2.samsung.com>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
 <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 02, 2025 at 10:49:48PM +0200, Marek Szyprowski wrote:
> On 19.08.2025 19:36, Leon Romanovsky wrote:
> > @@ -87,8 +87,8 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
> >   static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
> >   		struct blk_dma_iter *iter, struct phys_vec *vec)
> >   {
> > -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> > -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> > +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> > +			rq_dma_dir(req), 0);
> >   	if (dma_mapping_error(dma_dev, iter->addr)) {
> >   		iter->status = BLK_STS_RESOURCE;
> >   		return false;
> 
> I wonder where is the corresponding dma_unmap_page() call and its change 
> to dma_unmap_phys()...

You can't do that in the generic layer, so it's up to the caller. The
dma addrs that blk_dma_iter yield are used in a caller specific
structure. For example, for NVMe, it goes into an NVMe PRP. The generic
layer doesn't know what that is, so the driver has to provide the
unmapping.

