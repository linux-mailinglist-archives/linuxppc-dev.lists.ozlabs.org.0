Return-Path: <linuxppc-dev+bounces-9854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427AAEBDFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 19:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTML64pR5z2xgX;
	Sat, 28 Jun 2025 03:02:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751043741;
	cv=none; b=QozgIvyeKPBCFVGedwwJF1YXHHCZbe7th14MRCE50KuB/8BDV+8VDkWUNUlAX49eNCZMy1DEZgOapROV6D9gr8TwEv610sggsqLDKs02upfp6zKng97Q8cmNdPSJOMh7pIT3RQoWkyz9zKzV56HNPZI4DWtf9NiYhP50o5reB+6SCTpnnY2CZABXMYiBrREEeMcMAUQzy2YNyDdbKKCJ30ODlsSMaNmd0kp0qcvhbvY8ZXAe7cxMFIf96sa+1zZUJibq8visJu+KceCpPxPt6WW08f3C4ZNtKWZyEST0M2OhZSjetJQFfoNITT3g1xlx/7zs3iBFGzJHfnJniicQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751043741; c=relaxed/relaxed;
	bh=9bOe/JCswOnU7WdYHYnhxKuhHMqv5b1veFJCuFWhDL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZtnzN2+6lNqnEAeQ5e2XDJba9tPIVhmunrbIfqrEArwWaJ/nATjoXVMarsVo0wOhTlmibmc9VA5MytMFWRSEKlBY/ixx0oTfQ+J4KMwasDSKdd3dvU8kQqaQ96VcWeNqejL2HPfv9rmUGrMsrHsG7Hhfok1RWAnUhQ8SRSga47ZqkMkL+eQzq0dNXemHLWeYRgPF79x1JVSrL/zgLZWjm/GTS8xrrlMoXiWFN8K+HKgpkWPQVfsFZOoya+Ga/2YgmxIJ+qNvth7I6i2yNcO1L4mpjru+BZQWLTHtfIbqblHDTLtn8zbQKeWUvjglkYLsT9qMKrQQxKdl93F3QPvNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvSgedwL; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvSgedwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTML510Y9z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 03:02:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52EEE5C6AAF;
	Fri, 27 Jun 2025 17:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EE2C4CEE3;
	Fri, 27 Jun 2025 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751043738;
	bh=tYzCzCM3VZZF7WSTA7gi5cm/krCk6YzEM9VmpLpknjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvSgedwLkGNl0rMmzrS3+y77Cdl6mvdnS/K1+GmEohvH0tjCCcyHtHpGONE48PbuE
	 klXY+q4z8M1Sr6BMdy5xKLE+7d0yKqmUTsHjPtcmxh4vJJtZd+k3yW/hyDz3WRQrN7
	 9wzjcEy3jjvepJtDybVtHKrX2dD+yzLWynuamatcAKtm3zUP2H46mTYvoCARqj66Pz
	 6UkaSbTPpQWjV9eejBMr9V3CGDdGIUzKXNzrhwjf9KcP57JXzI9oiJZKCpv4d77ArY
	 EG95TYcKm5S2WkFdvbxGcvfwd6s5pEsCWXf4aKpX4Whf3v+9N/L6udSPyAT+368SB1
	 8wWh+cVapuQEw==
Date: Fri, 27 Jun 2025 20:02:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250627170213.GL17401@unreal>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
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
In-Reply-To: <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 27, 2025 at 03:44:10PM +0200, Marek Szyprowski wrote:
> On 25.06.2025 15:18, Leon Romanovsky wrote:
> > This series refactors the DMA mapping to use physical addresses
> > as the primary interface instead of page+offset parameters. This
> > change aligns the DMA API with the underlying hardware reality where
> > DMA operations work with physical addresses, not page structures.
> >
> > The series consists of 8 patches that progressively convert the DMA
> > mapping infrastructure from page-based to physical address-based APIs:
> >
> > The series maintains backward compatibility by keeping the old
> > page-based API as wrapper functions around the new physical
> > address-based implementations.
> 
> Thanks for this rework! I assume that the next step is to add map_phys 
> callback also to the dma_map_ops and teach various dma-mapping providers 
> to use it to avoid more phys-to-page-to-phys conversions.

Probably Christoph will say yes, however I personally don't see any
benefit in this. Maybe I wrong here, but all existing .map_page()
implementation platforms don't support p2p anyway. They won't benefit
from this such conversion.

> 
> I only wonder if this newly introduced dma_map_phys()/dma_unmap_phys() 
> API is also suitable for the recently discussed PCI P2P DMA? While 
> adding a new API maybe we should take this into account?

First, immediate user (not related to p2p) is blk layer:
https://lore.kernel.org/linux-nvme/bcdcb5eb-17ed-412f-bf5c-303079798fe2@nvidia.com/T/#m7e715697d4b2e3997622a3400243477c75cab406

+static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
+		struct blk_dma_iter *iter, struct phys_vec *vec)
+{
+	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
+			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
+	if (dma_mapping_error(dma_dev, iter->addr)) {
+		iter->status = BLK_STS_RESOURCE;
+		return false;
+	}
+	iter->len = vec->len;
+	return true;
+}

Block layer started to store phys addresses instead of struct pages and
this phys_to_page() conversion in data-path will be avoided.

> My main concern is the lack of the source phys addr passed to the dma_unmap_phys() 
> function and I'm aware that this might complicate a bit code conversion 
> from old dma_map/unmap_page() API.
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 

