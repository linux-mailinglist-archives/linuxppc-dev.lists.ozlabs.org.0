Return-Path: <linuxppc-dev+bounces-10479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE15B16BD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 08:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsz3p2rKHz30Wn;
	Thu, 31 Jul 2025 16:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753941686;
	cv=none; b=cjSd7cJ6H6hNJp4mSYR37SnBuZI8UQU1HR10WdypB90k+vGVputnqxoEbQ1BzEBrK5tybFbzFkUdgiJIcJBnJem1nBI7wz923dX9i6pVYWA2sAyFJZyBqpOZwRPj3Q177zR1bXsh/XLKgUWCmCGRsb3JmBEWEbF71RZWBYHsML83OvCQ/eDQ3GmluFz36FhP8yVWRS9RWluTz+M1J4WL5ssT3YDhliBsgfgxcK+F/oyQ/XIqliDrmTAzQ6KoFlI9t++vZ5xxIajRi9u6y0uCe+1HZHw6Azm21MONt4EKVm/KXzGV7NQsZpsgAp7e+SqJBfDusLyK+F3GpWzrt6xkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753941686; c=relaxed/relaxed;
	bh=IGpAwwv6EOU3J+szo0L/6K6hjZMUC6+znFU4vGOXvqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiMPugdllmszuYOKP33WuM4ZUddPo7FbWy5mEbgwRmqYNJ6U2iBlFpvc13ATlJiKKb13ej/SEyzb/dciTLyKShgFhkLR3nloG65Ne/v2dUEX27ByJS1Z8aW2KFQp+STrj0AjQS0jFU1ewTI8OkYUqjmyTm+bToUUDRB5ErjQa9h1ukNnBIUKOFpGDcMGyZ/WgAiv2X5N1NM6gUpwUeTytkVt70HEHv4qfgZLcZtSboOF8ijvLSrj+5UxjkhE9idbvA5+bZS4S1HZvTe00RpKJvuFaP4re8DQ/pu85B879TdLdVdxg9xkQiBdd2MRX+dOTlc45ZssoHahzXaewUKlbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKKF3Cek; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DKKF3Cek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsz3n4pXjz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 16:01:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3EB15C5A6E;
	Thu, 31 Jul 2025 06:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ED7C4CEEF;
	Thu, 31 Jul 2025 06:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753941682;
	bh=I82Ku1sBUzvQwy4NqAe/XyR//viXY99kTa/2l5/jmhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKKF3Cekf++SZHUOWA04jjlZuOEM8jGgJfAc0aVSPmvXHb//UmelF3TSqVbMPTbIj
	 MP6ZY5kK/EHxFqzZkhJ00XfylribvAhaYrLfaOpKcfokV5B/m/YCRirZ6t18pB4ZsQ
	 bsaI+/poV49jhLpK/ZRr0Q26G8cpUoxT/F6a+V9gIC9BqoNiSkyVuYGzpHG8jsb4gD
	 kIHsaNE1F48jrFXtV51opjZqdV2cVTpPGIvzjcT2MgCfaAhoBQdDME7Z3UNkBRnB9F
	 9X1Zop5ceYd7F2qaq0bvgxU4gZ8+qznN5tM1C/ZQL7YhzeOUqryCvMmIs0/hr+BEoT
	 BFZZ8xU/xu5mA==
Date: Thu, 31 Jul 2025 09:01:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250731060117.GR402218@unreal>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <20250730134026.GQ402218@unreal>
 <20250730142818.GL26511@ziepe.ca>
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
In-Reply-To: <20250730142818.GL26511@ziepe.ca>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 11:28:18AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 30, 2025 at 04:40:26PM +0300, Leon Romanovsky wrote:

<...>

> > The most reasonable way to prevent DMA_ATTR_SKIP_CPU_SYNC leakage is to
> > introduce new DMA attribute (let's call it DMA_ATTR_MMIO for now) and
> > pass it to both dma_map_phys() and dma_iova_link(). This flag will
> > indicate that p2p type is PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and call to
> > right callbacks which will set IOMMU_MMIO flag and skip CPU sync,
> 
> So the idea is if the memory is non-cachable, no-KVA you'd call
> dma_iova_link(phys_addr, DMA_ATTR_MMIO) and dma_map_phys(phys_addr,
> DMA_ATTR_MMIO) ?

Yes

> 
> And then internally the dma_ops and dma_iommu would use the existing
> map_page/map_resource variations based on the flag, thus ensuring that
> MMIO is never kmap'd or cache flushed?
> 
> dma_map_resource is really then just
> dma_map_phys(phys_addr, DMA_ATTR_MMIO)?
> 
> I like this, I think it well addresses the concerns.

Yes, I had this idea and implementation before. :(

> 
> Jason
> 

