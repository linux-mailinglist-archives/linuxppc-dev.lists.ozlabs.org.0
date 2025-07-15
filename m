Return-Path: <linuxppc-dev+bounces-10253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A96ACB05BE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 15:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhKfp0XqVz3c95;
	Tue, 15 Jul 2025 23:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752585890;
	cv=none; b=SdagljclBM/toeFeaMa/eb2vObNNnZkVGRWZaoXt757zdsvFC1xkpny1DNRmPKhGnt37Jw+34oogX+RtvSWgJkoX9ceUooSjBW2E5Drj06fDOT4hDr5nrQeoYh976oSV3XE//XHcej09t5eBBhtfRa0IrDePGn/hhK9m30m15MvCHk2Vu21BV7ASRSzLcJaLEXdNSNSQMOGtWGmFDYhnIv6OoFrW0wOAFHV8+NBrEM+9rBlbx1gQIxRuVmxNOySh+EbuEYzGyztIMv8TRItu4f26yILHyBn52RA795zf9iILcBlFzqst0k3cCJ5zztMwM9lzL+RB8Ek3SFK8X+Qe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752585890; c=relaxed/relaxed;
	bh=EMDbadNseXzpLJnPf5nVCnaV4nsb0WAVNLIP5V+z6VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOzDlJjNmTTKDqDTN7sltN8ZYQBySnfNlI3cmzc6zwFSY9yGK6TmblsOnbho1vIF8Dx2u3WQKNNhTEhJb1IB2oKGsTZIQx/zg/uQqIDO5PhjqJjK9KWFJ4nNAuoXPHpQYdymO/WXN6M5jNi8uNNkZdkwvCtTyzJMCe9LYMQ1f/m85r9FZnxeqlQert7jds+0+K+aABAxYOfHF0ux00BdXnUu4L3oT9QAXTGUgQiBBC+6zaD3lEnnKgG1ktxRj5AU2UutazuO75gHl7frjBOUgqTIs8KAhQgjcv/nPFyLrnQI9E2LTMfxBifrRJK1TvexNQxIsmeJ54IPmYLtRfBJvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SPFgiCbm; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SPFgiCbm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhKfn0tNQz3c91
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 23:24:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A02F44C91;
	Tue, 15 Jul 2025 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FF9C4CEE3;
	Tue, 15 Jul 2025 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752585886;
	bh=LACQRLoYbwjDJR7B8kKiL5kegf3U3j4BP+gzpY0KEsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPFgiCbmTjPFJKl5cs0OZMbXGYUAhCKvFG7enaVLf+cqb6iwHU56DujED+FM/4W/z
	 x1RFbZALiY/TbT/W30fFBxkD8Jx9QNZX2NnEp4ykPrhBMKuw2rRwvdmcmNGluj1hOg
	 6tgI9ehvM68n26LyiCkDWSHUv6WuUZnpewUtqClNHOxa3hJ8NDtd/CdbNCsmqAn0uD
	 uxUKdhsRJ0TyQKFVjUOEqMvirCzGFjGwTpkys/3DVBlMb7BMr8eOEPqJTWXx98VQWI
	 N5zqWCYnndaF/OJVGgy7A0rFygzVh8S7ElMNVCp22I186H186bp8d1LBrKVm3ZjrfS
	 x8/h4CKze7ZVw==
Date: Tue, 15 Jul 2025 14:24:38 +0100
From: Will Deacon <will@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
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
Subject: Re: [PATCH 8/8] mm/hmm: migrate to physical address-based DMA
 mapping API
Message-ID: <aHZWlu7Td9ijFhhh@willie-the-truck>
References: <cover.1750854543.git.leon@kernel.org>
 <8a85f4450905fcb6b17d146cc86c11410d522de4.1750854543.git.leon@kernel.org>
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
In-Reply-To: <8a85f4450905fcb6b17d146cc86c11410d522de4.1750854543.git.leon@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Leon,

On Wed, Jun 25, 2025 at 04:19:05PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Convert HMM DMA operations from the legacy page-based API to the new
> physical address-based dma_map_phys() and dma_unmap_phys() functions.
> This demonstrates the preferred approach for new code that should use
> physical addresses directly rather than page+offset parameters.
> 
> The change replaces dma_map_page() and dma_unmap_page() calls with
> dma_map_phys() and dma_unmap_phys() respectively, using the physical
> address that was already available in the code. This eliminates the
> redundant page-to-physical address conversion and aligns with the
> DMA subsystem's move toward physical address-centric interfaces.
> 
> This serves as an example of how new code should be written to leverage
> the more efficient physical address API, which provides cleaner interfaces
> for drivers that already have access to physical addresses.

I'm struggling a little to see how this is cleaner or more efficient
than the old code.

From what I can tell, dma_map_page_attrs() takes a 'struct page *' and
converts it to a physical address using page_to_phys() whilst your new
dma_map_phys() interface takes a physical address and converts it to
a 'struct page *' using phys_to_page(). In both cases, hmm_dma_map_pfn()
still needs the page for other reasons. If anything, existing users of
dma_map_page_attrs() now end up with a redundant page-to-phys-to-page
conversion which hopefully the compiler folds away.

I'm assuming there's future work which builds on top of the new API
and removes the reliance on 'struct page' entirely, is that right? If
so, it would've been nicer to be clearer about that as, on its own, I'm
not really sure this patch series achieves an awful lot and the
efficiency argument looks quite weak to me.

Cheers,

Will

